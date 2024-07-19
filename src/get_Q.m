%%	Outputs: compliance matrix [S] and reduced stiffness matrix [Q]

function	[Q, S] = get_Q(E1, E2, v12, G12)
	S = zeros(3,3);
	S(1,1) = 1 / E1;
	S(1,2) = -v12 / E1;
	S(2,1) = S(1,2);
	S(2,2) = 1 / E2;
	S(3,3) = 1 / G12;
	Q = inv(S);
end
