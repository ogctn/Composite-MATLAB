%%	Outputs: compliance matrix [S] and reduced stiffness matrix [Q]
%%	detaills at page 95 of book-Jones

function	Q_bar = get_Qbar(Q, theta)
	R = Reuter;
	T = transformation(theta);
	Q_bar = inv(T) * Q * R * T * inv(R);
end
