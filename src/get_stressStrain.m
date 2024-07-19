function	[e_g, s_g, e_l, s_l] = get_stressStrain(e0, z, kappa, theta, Q_bar)
	e_g = e0 + z * kappa;
	s_g = Q_bar * e_g;
	e_l = Reuter * transformation(theta) * Reuter^-1 * e_g;
	s_l =  transformation(theta) * s_g;
end
