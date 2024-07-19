function	NM = get_NM(Q, data, flag)
	if (strcmp(flag, "actual"))
			NM = data.N;
			return;
	end
	if (length(find(data.coeff == 0)) == length(data.coeff))
		NM_T = zeros(6, 1);
		NM_C = zeros(6, 1);
	else
		z = get_coordinates(data.t);
		NT = zeros(3, 1);
		MT = zeros(3, 1);
		NC = zeros(3, 1);
		MC = zeros(3, 1);
		for i = 1:length(data.t)
			tmp1 =  transformation(data.angles(i))^-1 * data.coeff(1:3);
			tmp2 =  transformation(data.angles(i))^-1 * data.coeff(4:6);
			coeffsGlobal = [tmp1; tmp2];
			Q_bar = get_Qbar(Q, data.angles(i));
			NT = NT + (Q_bar * coeffsGlobal(1:3) * data.dT * (z(i + 1) - z(i)));
			MT = MT + (0.5 * Q_bar * coeffsGlobal(1:3) * data.dT * (z(i + 1) ^ 2 - z(i) ^ 2));
			NC = NC + (Q_bar * coeffsGlobal(4:6) * data.dC *  (z(i + 1) - z(i)));
			MC = MC + (0.5 * Q_bar * coeffsGlobal(4:6) * data.dC * (z(i + 1) ^ 2 - z(i) ^ 2));
		end
		NM_T = [NT; MT];
		NM_C = [NC; MC];
	end
	if (strcmp(flag, "thermal"))
		NM = NM_T + NM_C;
	end
end
