function	printer(r)	
	function print(m, angles)
		for i = 1:length(angles)
			j = 1;
			for k = 1:3
				if (j == 1)
					fprintf("%4.0f°%7s%16.3e%12.3e%13.3e\n", angles(i),"Top" ,m(1,1,i,j), m(2,1,i,j), m(3,1,i,j));
				elseif (j == 2)
					fprintf("%15s%13.3e%12.3e%13.3e\n", "Middle", m(1,1,i,j), m(2,1,i,j), m(3,1,i,j));
				elseif	(j == 3)
					fprintf("%15s%13.3e%12.3e%13.3e\n", "Bottom", m(1,1,i,j), m(2,1,i,j), m(3,1,i,j));
				end
				j = j + 1;
			end
			fprintf("------------------------------------------------------\n");
		end
		fprintf("######################################################\n");
	end
	function	strain_global(r)
		fprintf("------------------------------------------------------\n");
		fprintf("-%33s%20s\n", "GLOBAL STRAINS", "-");
		fprintf("-%29s%24s\n", "(m/m)", "-");
		fprintf("------------------------------------------------------\n");
		fprintf("%5s%12s%9s%12s%14s\n", "Ply", "Position", "eps_x", "eps_y", "gamma_xy");
		fprintf("------------------------------------------------------\n");
		print(r.strain.global, r.angles);
	end
	function	strain_local(r)
		fprintf("------------------------------------------------------\n");
		fprintf("-%33s%20s\n", "LOCAL STRAINS", "-");
		fprintf("-%29s%24s\n", "(m/m)", "-");
		fprintf("------------------------------------------------------\n");
		fprintf("%5s%12s%9s%12s%14s\n", "Ply", "Position", "eps_1", "eps_2", "gamma_12");
		fprintf("------------------------------------------------------\n");
		print(r.strain.local, r.angles);
	end
	function	stress_global(r)
		fprintf("------------------------------------------------------\n");
		fprintf("-%34s%19s\n", "GLOBAL STRESSES", "-");
		fprintf("-%29s%24s\n", "(Pa)", "-");
		fprintf("------------------------------------------------------\n");
		fprintf("%5s%12s%9s%12s%14s\n", "Ply", "Position", "sig_x", "sig_y", "tau_xy");
		fprintf("------------------------------------------------------\n");
		print(r.stress.global, r.angles);
	end
	function	stress_local(r)
		fprintf("------------------------------------------------------\n");
		fprintf("-%34s%19s\n", "LOCAL STRESSES", "-");
		fprintf("-%29s%24s\n", "(Pa)", "-");
		fprintf("------------------------------------------------------\n");
		fprintf("%5s%12s%9s%12s%13s\n", "Ply", "Position", "sig_1", "sig_2", "tau_12");
		fprintf("------------------------------------------------------\n");
		print(r.stress.local, r.angles);
	end
	strain_global(r);
	stress_global(r);
	strain_local(r);
	stress_local(r);
	fprintf("------------------------------------------------------\n");
end
