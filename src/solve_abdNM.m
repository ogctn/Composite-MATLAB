function	[e0, kappa] = solve_abdNM(Q, d, flag)
	[~, abd] = get_ABD(Q, d.angles, d.t);
	NM = get_NM(Q, d, flag);
	temp = abd * NM;
	e0 = temp(1:3);
	kappa = temp(4:6);
end
