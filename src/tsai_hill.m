function	eqn = tsai_hill(sig_l, d)
	X = d.strengths(1);	% X_t
	Y = d.strengths(3);	% Y_t		All strengths are in MPa
	S = d.strengths(5);
	eqn = zeros(length(d.angles), 1);
	for	i = 1:length(d.angles)
		eqn(i) = ((sig_l(1,:,i) / X) ^2) + ((sig_l(2,:,i) / Y) ^2) ...
				+ ((sig_l(3,:,i) / S) ^2) - ((sig_l(1,:,i) * sig_l(2,:,i) / X^2));
	end
end
