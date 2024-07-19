%% Output: A vector of z-coordinates of laminate's surfaces
%%	t: Thickness of a ply

function	z = get_coordinates(t)
	arguments
		t {mustBeNumeric}
	end
	z = zeros(length(t) + 1, 1);
	z(1) = -(sum(t) / 2);
	i = 1;
	while (i < length(t) + 1)
		z(i + 1) =  z(i) + t(i);
		i = i + 1;
	end
end
