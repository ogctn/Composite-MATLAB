%%	Calculates extensional [A], coupling [B] and bending [D] stiffness matrix
%%	Output:  [A, B; B, D] matrix

function	[ABD, inv_ABD] = get_ABD(Q, angles, t)
	z = get_coordinates(t);
	A = zeros(3, 3);
	B = zeros(3, 3);
	D = zeros(3, 3);
	i = 1;
	while i < length(angles) + 1
		Q_bar = get_Qbar(Q, angles(i));
		A = A + Q_bar * (z(i + 1) - z(i));
		B = B + (1 / 2) * Q_bar * (z(i + 1) ^ 2 - z(i) ^ 2);
		D = D + (1 / 3) * Q_bar * (z(i + 1) ^ 3 - z(i) ^ 3);
		i = i + 1;
	end
	ABD = [A, B; B, D];
	inv_ABD = ABD^-1;
end
