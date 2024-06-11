function H = plotBaseRealistic(params,modelName)
H = gobjects(0);

% Colors
gray = [0.5,0.5,0.5];
copper = [0.72,0.45,0.2];
black = [0,0,0];

% Plot permanent magnets
for i = 1:length(params.permanent.r)
    switch modelName
        case {'accurate', 'filament'}
            Htemp = plotCylinder( ...
                params.permanent.x(i), ...
                params.permanent.y(i), ...
                params.permanent.z(i), ...
                0,0,0, ...
                params.permanent.r(i), ...
                params.permanent.l(i), ...
                gray,0,1);
        otherwise % fast is default
            Htemp = plotWireLoop( ...
                params.permanent.x(i), ...
                params.permanent.y(i), ...
                params.permanent.z(i), ...
                0,0,0, ...
                params.permanent.r(i), ...
                100, ...
                gray,0);
    end
    H = [H,Htemp];
end

% Plot solenoids
for i = 1:length(params.solenoids.r)
    switch modelName
        case 'filament'
            % Computing number of windings in axial and radial directions of solenoids
            ratio = sqrt(params.solenoids.nw/(params.solenoids.l(i)*params.solenoids.r(i)));
            nwAxial  = floor(params.solenoids.l(i)*ratio);
            nwRadial = round(params.solenoids.nw/nwAxial);
        
            Htemp = plotWireFrame( ...
                params.solenoids.x(i), ...
                params.solenoids.y(i), ...
                params.solenoids.z(i), ...
                0,0,0, ...
                params.solenoids.r(i), ...
                params.solenoids.l(i), ...
                ceil(nwAxial), ...
                ceil(nwRadial), ...
                copper,0,1,0);
        case 'accurate'
            Htemp = plotCylinder( ...
                params.solenoids.x(i), ...
                params.solenoids.y(i), ...
                params.solenoids.z(i), ...
                0,0,0, ...
                0.55*params.solenoids.r(i), ... % Illustrates the radius correction
                params.solenoids.l(i), ...
                copper,0,1);

        otherwise % fast is default
            Htemp = plotWireLoop( ...
                params.solenoids.x(i), ...
                params.solenoids.y(i), ...
                params.solenoids.z(i), ...
                0,0,0, ...
                0.55*params.solenoids.r(i), ... % Illustrates the radius correction
                100, ...
                copper,0);
    end
    H = [H,Htemp];
end

% Plot sensors
for i = 1:length(params.sensors.x)
    Htemp = plot3(params.sensors.x(i),params.sensors.y(i),params.sensors.z(i),'.','markersize',12,'color',0.9*black+0.1*gray);
end
