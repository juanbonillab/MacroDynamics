%Macroeconomía 2 - UTDT
%Juan Bonilla

% Parámetros

z = 0.33;
zigma = 1;
b_fi = 0.697;
b_cb = 0.303;
gama = 0.0846;
zeta = 2.4925;
betta = 0.995;
chi = 1;
phi_pi = 1.5;
phi_x = 0;
ro_r  = 0.8;
ro_q  = 0.8;
ro_a  = 0.8;
ro_th = 0.8;
ro_v  = 0;

sd_q  = 0.01;
sd_th = 0.01;
sd_r  = 0.01;
sd_a  = 0.0125;


% Variables

VARNAMES = ['x     '   
            'r_s   ' 
            'pi    ' 
            'r_ast '
            'y_ast '
            'y     '
            'qe    '  
            'a     '
            'theta '
            'v     '];

% Matrices


% Brute Force, por lo que estas matrices no se usan.
AA = [];

BB = [];

CC = [];

DD = []; % zeros(11,0); 

% Matriz F

FF = [ 1, 0, (1-z)/zigma, 0, 0, 0
       0, 0,       betta, 0, 0, 0
       0, 0,           0, 0, 0, 0
       0, 0,           0, 0, 0, 0
       0, 0,           0, 0, 0, 0
       0, 0,           0, 0, 0, 0];
   
% Matriz G

GG = [            -1, -(1-z)/zigma,               0, (1-z)/zigma,  0,  0
           gama*zeta,            0,              -1,           0,  0,  0
      (1-ro_r)*phi_x,           -1, (1-ro_r)*phi_pi,           0,  0,  0
                   0,            0,               0,          -1,  0,  0
                   0,            0,               0,           0, -1,  0
                   1,            0,               0,           0,  1, -1];

% Matriz H
   
HH = [ 0 , 0    , 0 , 0 , 0 , 0
       0 , 0    , 0 , 0 , 0 , 0
       0 , ro_r , 0 , 0 , 0 , 0
       0 , 0    , 0 , 0 , 0 , 0
       0 , 0    , 0 , 0 , 0 , 0
       0 , 0    , 0 , 0 , 0 , 0];
   
% Matrices J

JJ = zeros(6,6);

% Matrices K

KK = zeros(6,6);

% Matriz L

LL = [ -(z*b_cb),  0, -(z*b_fi), 0
                0, 0,         0, 0
                0, 0,         0, 0
                0, 0,         0, 0
                0, 0,         0, 0
                0, 0,         0, 0 ];

% Matriz M

MM4a = -1*(1-ro_a)*(1+chi)*zigma/(zigma + (1-z)*chi);
MM5a = (1-z)*(1+chi)/(zigma+(1-z)*chi);

MM = [                       z*b_cb,    0,                       z*b_fi, 0
       -1*(z*gama*zigma)/(1-z)*b_cb,    0, -1*(z*gama*zigma)/(1-z)*b_fi, 0
                                  0,    0,                            0, 1
                                  0, MM4a,                            0, 0 
                                  0, MM5a,                            0, 0
                                  0,    0,                            0, 0];

   
% Matriz N

NN = [ ro_q,    0,     0,    0
          0, ro_a,     0,    0
          0,    0, ro_th,    0
          0,    0,     0, ro_v];
   
% Matriz de varianzas y covarianzas de shocks
Sigma = [sd_q^2,      0,        0,      0
              0, sd_a^2,        0,      0
              0,      0,  sd_th^2,      0
              0,      0,        0, sd_r ^2];

%% SETTING OPTIONS FOR TOOLKIT 

l_equ = 0;
q_expectational_equ = 6;
m_states = 6;
n_endog = 0;
k_exog = 4;

% Opciones 
PERIOD = 4;
GNP_INDEX = 8;

DO_PLOTS = 1;
DO_IMPRESP = 1;
DO_SHOCK_RESP = 1;
SELECT_SHOCKS = 1 : k_exog;
IMP_SELECT = 1:(m_states+n_endog+k_exog);
IMP_SUBPLOT = 1;
IMP_SINGLE = 0;
IMP_JOINT = 0;
HORIZON = 50;     
   
 % CALCULATIONS
                               
do_it;
