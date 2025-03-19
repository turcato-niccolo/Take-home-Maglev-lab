load_parameters;
k=1;
W=tf(params.b_s/params.z_eq,[params.m params.d params.b_m/params.z_eq^2]);

[r,k] = rlocus(W)

