function	r = calculate_all(d)
	r.angles = d.angles;
	r.tt = d.t;
	z = get_coordinates(d.t);
	Q = get_Q(d.E1, d.E2, d.v12, d.G12);
	% [e0_thermal, kappa_thermal] =  solve_abdNM(Q, d, 'thermal');
	[e0_actual, kappa_actual] =  solve_abdNM(Q, d, 'actual');
	strain.global = zeros(3, 1, length(d.t));	% actual
	stress.global = zeros(3, 1, length(d.t));
	strain.local = zeros(3, 1, length(d.t));
	stress.local = zeros(3, 1, length(d.t));
	% strain.thermal = zeros(3, 1, length(d.t));
	% stress.thermal = zeros(3, 1, length(d.t));
	% strain.mech = zeros(3, 1, length(d.t));		% actual - thermal
	% stress.mech = zeros(3, 1, length(d.t));
	for i = 1:length(d.t)
		Q_bar = get_Qbar(Q, d.angles(i));
		j = 1;
		for zz = z(i):d.t(i)/2:z(i+1)
			[ strain.global(:, :, i, j), stress.global(:, :, i, j),...
				strain.local(:, :, i, j), stress.local(:, :, i, j)] = ...
				get_stressStrain(e0_actual, zz, kappa_actual, d.angles(i), Q_bar);
			% strain.thermal(:, :, i, j) = e0_thermal + zz * kappa_thermal;
			% stress.thermal(:, :, i, j) = Q_bar * strain.thermal(:, :, i, j);
			% strain.mech(:, :, i, j) = strain.global(:, :, i, j) - strain.thermal(:, :, i, j);
			% stress.mech(:, :, i, j) = Q_bar * strain.mech(:, :, i, j);
			% e_free_expansion = transformation(d.angles(i))^-1 * d.coeff(1:3) * d.dT;
			j = j + 1;
		end
	end
	r.strain = strain;
	r.stress = stress;
end
