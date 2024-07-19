%/* ************************************************************************** */%
%/*                                                                            */%
%/*   Oguzalp Cetin                                                            */%
%/*   <oguzalpcetin@gmail.com>                                                 */%
%/*                                                                            */%
%/*   Created: 2023/08/22 13:15    by ogcetin                                  */%
%/*                                                                            */%
%/* ************************************************************************** */%
%				Terminal command to print results:								/%
%				>>	run main.m													/%
%				Input all the angles of plies one by one !						/%
%/* ************************************************************************** */%

clear;clc;

data.E1 = 53.78 * 10^9;
data.E2 = 17.93 * 10^9;
data.v12 = 0.25;
data.G12 = 8.62 * 10^9;
data.coeff = [6.3e-6; 20.52e-6; 0; 0; 0; 0];		% alfa_1, alfa_2, alfa_12, beta_1, beta_2, beta_12
data.strengths = [1035e6; 1035e6; 27.6e6; 138e6; 41.4e6];	% X_t, X_c, Y_t, Y_c, S
data.angles = [0, 90, 0];
t = 0.127;
data.t = [t; 10 * t; t];
clear t;
data.N = zeros(6, 1);
max_Nx = iterator(data, 1000);
data.N = [max_Nx; 0; 0; 0; 0; 0];	% N_x N_y N_xy M_x M_y M_xy
r = calculate_all(data);
printer(r);
