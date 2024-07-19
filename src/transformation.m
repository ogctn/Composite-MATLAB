%% Output: Transformation matrix [T] of angle theta

function	T = transformation(a)
	T = [cosd(a)^2,         sind(a)^2,          2*sind(a)*cosd(a);
     	sind(a)^2,         cosd(a)^2,          -2*sind(a)*cosd(a);
     	-sind(a)*cosd(a),  sind(a)*cosd(a),    cosd(a)^2-sind(a)^2];
end
