function [gear_out, clutch]  = F0015_transmissionControlUnit(gear_ref,time)
%#codegen
% Transmission control unit
persistent previous_gear incoming_gear last_state
persistent state t_start last_call
t_declutch=0.1;
t_speed_sync=0.2;
t_onclutch=0.1;


% run initialization
if isempty(state)
  % Initial state
  state=0;
  % Need to set varibles (some to dummy) so that codegen gets to know the size of the
  % persistent variables
  previous_gear=2;
  incoming_gear=2;
  t_start=0;
  previous_gear=gear_ref;
  last_call=time;
  last_state=state;
end
  
% Check if Simulink is restarting with smaller step reduction
if time < last_call,
  if state > 0,
    % disp(['Time reversed during gearchange']);
    if time - t_start < t_declutch,
      state=1;
    elseif time - t_start < t_declutch+t_speed_sync,
      state=2;
    elseif time - t_start < t_declutch+t_speed_sync+t_onclutch
      % backing state_machine
      state=3;
    else
      state=0;
    end
  end
end

last_call=time;
last_state=state;

% Run the state machine
switch state,
  case 0, % 'normal'
    if (gear_ref~=previous_gear)
      t_start=time;
      incoming_gear=gear_ref;
      state=1;
    end
    clutch=1;
    gear_out=previous_gear;
  case 1, % 'ramp_down',
    if ((time-t_start)>t_declutch)
      state=2;
      clutch=0;
    else
      clutch=1-(time-t_start)/t_declutch;
    end    
    gear_out=previous_gear;
  case 2, % 'change_gear',
    if (time>(t_start+t_declutch+t_speed_sync))
      state=3; % 'ramp_up';
      clutch=(time-(t_start+t_declutch+t_speed_sync))/t_onclutch;
    else
      clutch=0;
    end
    gear_out=incoming_gear;
  case 3, % 'ramp_up',
    if (time>(t_start+t_declutch+t_speed_sync+t_onclutch))
      state=0; %'normal';
      clutch=1;
    else
      clutch=(time-(t_start+t_declutch+t_speed_sync))/t_onclutch;
    end
    gear_out=incoming_gear;
    previous_gear=incoming_gear;
  otherwise
    error('Unknown state');
end