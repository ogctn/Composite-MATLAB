function	N_max = iterator(data, stepSize)
	r = calculate_all(data);
	tsai = tsai_hill(r.stress.local(:,:,:,3), data);
	while ~any(tsai > 1)
		data.N(1) = data.N(1) + stepSize;
		r = calculate_all(data);
		tsai = tsai_hill(r.stress.local(:,:,:,3), data);
	end
	N_max = data.N(1) - stepSize;
end
