clc
clear all 

%% Input data
% Gravitational constant 
G = 6.674e-11;  % m3⋅kg−1⋅s−2
gSL = 9.81;     % m⋅s-2
% Sun
Sun.M = 1.98847e30;
Sun.mu = GravPar(G,Sun.M);
% Earth
Earth.M  = 5.972e24;
Earth.D  = 1.496e11;
Earth.R  = 6.378.*10^6;
Earth.mu = GravPar(G,Earth.M);
% Measurement units
UA = Earth.D;

%% Heliocentric Transfer Orbit
% Aphelion and perihelion
Ra  = 3*UA;     Rp  = 1*UA;
% Elliptical Orbit parameters
[a,e] = SMaxis_eccent(Ra,Rp);



% b) Representación órbita de transferencia:
    
    % Órbita de transferencia de Hohhman:
    theta = linspace(0, 2.*pi, 1000);
    rho_trans = (a*(1-e^2)./(1+e.*cos(theta)))./UA;
    polarplot(theta,rho_trans);
    hold on;

    % Órbita heliocéntrica de la Tierra:
    sigma = linspace(0, 2.*pi, 1000);
    rho_earth = linspace(Rot./UA, Rot./UA, 1000);
    polarplot(sigma,rho_earth);
    
%%

% definir constantes
G = 6.67.*10^-11;
Mt = 5.976.*10^24;
Ms = 1.989.*10^30;
Rt = 6.378.*10^6;
UA = 1.496.*10^11;
Rot = UA;
uT = G.*Mt; 
uS = G.*Ms;

% Apartado 1)

% Semieje mayor de la órbita heliocéntrica
    a = 299200000000; 

% c) Determinación de la velocidad de la sonda en el perihelio:
    vperi = sqrt (uS.*((2./Rot)-(1./a)));

% d) Determinación del incremento de velocidad necesario:

    % Variable independiente H = altura aparcamiento:
    H = 0:1000:400000005;

    % Variable dependiente y = incremento de Vo:
    INC_Vo = sqrt((vperi - sqrt(uS./Rot))^2 + 2.*(uT./(H+Rt))) - sqrt(uT./(Rt+H));

% e) Representación de incremento de V en función de H y minimización de la función

    % Imprimir con plot (H, INC_Vo):
    plot (H, INC_Vo);
    
    % Imprimir con plot (H, INC_Vo)
    TF = islocalmin(INC_Vo);
    plot (H, INC_Vo, H(TF), INC_Vo(TF),'r*');

    % Minimizamos la funcion:
    TF = islocalmin(INC_Vo);
    Hmin = H(TF)
    INC_Vo_min = INC_Vo(TF);
%%
% definir constantes
G = 6.67.*10^-11;
Mt = 5.976.*10^24;
Ms = 1.989.*10^30;
Rt = 6.378.*10^6;
UA = 1.496.*10^11;
Rot = UA;
uT = G.*Mt; 
uS = G.*Ms;

% Apartado 1)
% Parámetros de la hipérbola de salida:
    H = 11419000;
    vperi = 36472.0472;

% f) Determinamos los parámetros de la hipérbola:
    % Semieje major:
        a = uT./(vperi - sqrt (uS./Rot))^2
    % Excentricidad:
        e = 1 + (Rt+H)./a
    % Ángulo de giro:
        delta = 2.* asin(1./e)

% g) Gráfica salida terrestre:
    % Órbita hiperbólica:
        theta = linspace(-1.96, 1.3, 1000);
        rho_hiperb = (a*(e^2-1)./(1+e.*cos(theta+0.339845)));
        polarplot(theta,rho_hiperb);
        hold on;
    % Órbita aparcamiento terrestre:
        sigma = linspace(0, 2.*pi, 1000);
        rho_aparc = linspace(Rt+H, Rt+H, 1000);
        polarplot(sigma,rho_aparc);
    % Superfície terrestre:
        alfa = linspace(0, 2.*pi, 1000);
        rho_sup = linspace(Rt, Rt, 1000);
        polarplot(alfa,rho_sup);
    
    % Asímptota vertical:
        beta = linspace(-1, 1.3, 1000);
        rho_av = 24013000.*sec(beta);
        polarplot(beta,rho_av);
    % Asímptota obliqua:
        tita = linspace(1.2, 3.5, 1000);
        rho_ob = -24013000./cos(tita-2.461902654);
        polarplot(tita, rho_ob);
    % Asímptota central:
        betha = linspace(0,7.5,1000);
        rho_cen = 100000./cos(betha-1.2309513);
        polarplot(betha, rho_cen);
 
 %%
 clc; clear all; close all;
% definir constantes
G = 6.67.*10^-11;
Mt = 5.976.*10^24;
Ms = 1.989.*10^30;
Rt = 6.378.*10^6;
UA = 1.496.*10^11;
Rot = UA;
uT = G.*Mt; 
uS = G.*Ms;

% Apartado 2)
% Constantes previas de la Órbita 1
    Ra = 3.*UA;
    H = 11419000;
    vperi = 36472.0472;
    a = 299200000000;
    e = 0.5;
% Condición Órbita 2:
    Rp = 0.8.*UA;

% a) Parámetros de la nueva órbita heliocéntrica elíptica:
    % semieje mayor
    a2 = (Rp+Ra)./2;
    % excentricidad
    e2 = (a2-Rp)./a2;

% b) Incremento de velocidad necesario:
INC_V= sqrt (uS.*((2./Ra)-1./a2)) - sqrt (uS.*((2./Ra)-1./a));
    
% c) Representación de la secuencia de órbitas seguidas y cruce con la Tierra:
    
    % Ángulo de encuentro:
    anomal= acos((a2*(1-e2^2)./UA-1)./e2)
    
    % Órbita elíptica 1 de la sonda:
    theta = linspace(0, pi, 1000);
    rho_1 = (a*(1-e^2)./(1+e.*cos(theta)))./UA;
    polarplot(theta,rho_1);
    hold on;

    % Órbita heliocéntrica de la Tierra:
    sigma = linspace(0, 2.*pi, 1000);
    rho_earth = linspace(Rot./UA, Rot./UA, 1000);
    polarplot(sigma,rho_earth);
    
    % Órbita elíptica 2 de la sonda:
    betha = linspace(pi, 2*pi+1.0989, 1000); % anomal=1.0989 
    rho_2 = (a2*(1-e2^2)./(1+e2.*cos(betha)))./UA;
    polarplot(betha,rho_2);
   %%
   % definir constantes
G = 6.67.*10^-11;
Mt = 5.976.*10^24;
Ms = 1.989.*10^30;
Rt = 6.378.*10^6;
UA = 1.496.*10^11;
Rot = UA;
uT = G.*Mt; 
uS = G.*Ms;

% Apartado 3)
% Parámetros de la órbita de entrada:
    ax=284240000000;
    ex=0.57895;
% Dadas:
    H = 3000000;

% a) Anomalía verdadera en el encuentro (calculado en el apartado anterior):
anomal=1.0989

% b) Velocidad heliocéntrica en el punto de encuentro:
    v_modulo = sqrt (uS.*((2./UA)-(1./ax)))
    v_rad = sqrt (uS./(ax.*(1-ex^2))) .*ex.*sin(anomal)
    v_tan = sqrt (uS./(ax.*(1-ex^2))) .*(1+ex.*cos(anomal))

% c) Exceso de velocidad con el que la sonda entra en la SOI:
    % Velocidad de la Tierra (tangencial):
        v_tierra = sqrt (uS./Rot);
    % Velocidad en el infinito:
        vr_inf = v_rad
        vt_inf = v_tan - v_tierra
        v_inf= sqrt( vt_inf^2 + vr_inf^2)

% d) Determinación del ángulo de giro al realizar el sobrevuelo:
    % Excentricidad hiperbola flyby:
        ef = 1 + v_inf^2.*(H+Rt)./uT;
    % Ángulo de giro:
        delta = 2 .* (asin (1./ef))
    % Semieje mayor de la hipérbola:
        af = (H+Rt).*(1+ef)./(ef^2-1);

% e) Exceso de velocidad de salida
    vr_salida= vr_inf.*cos(delta)-vt_inf.*sin(delta)
    vt_salida=vr_inf.*sin(delta)+vt_inf.*cos(delta) 

% f) Parámetros de la hipérbola de sobrevuelo:
ef 
af 
delta

% h) Velocidad heliocéntrica de salida:
    vr_h=vr_salida
    vt_h=vt_salida+v_tierra
    v_h=sqrt(vr_h.^2+vt_h.^2)

% i) Calculo de los parámetros de la elipse resultante:
    % Energía total tras el encuentro:
        epsilon=v_h^2./2-uS./Rot;
    % Momento angular normalizado:
        h=Rot.*vt_h;
    % Eje mayor y excentricidad:
        a=-uS./(2*epsilon)
        e= sqrt(1-h^2./(a*uS))
    % Anomalía verdadera y inclinación de la elipse:
        anomal2=acos(1./e .*(h^2./(Rot.*uS)-1));
        inclin=anomal-anomal2
%%
% definir constantes
G = 6.67.*10^-11;
Mt = 5.976.*10^24;
Ms = 1.989.*10^30;
Rt = 6.378.*10^6;
UA = 1.496.*10^11;
Rot = UA;
uT = G.*Mt; 
uS = G.*Ms;

% Apartado 3)
% Parámetros de la órbita de entrada:
    ax=284240000000;
    ex=0.57895;
% Dadas:
    H = 3000000;

% a) Anomalía verdadera en el encuentro (calculado en el apartado anterior):
anomal=1.0989

% b) Velocidad heliocéntrica en el punto de encuentro:
    v_modulo = sqrt (uS.*((2./UA)-(1./ax)))
    v_rad = sqrt (uS./(ax.*(1-ex^2))) .*ex.*sin(anomal)
    v_tan = sqrt (uS./(ax.*(1-ex^2))) .*(1+ex.*cos(anomal))

% c) Exceso de velocidad con el que la sonda entra en la SOI:
    % Velocidad de la Tierra (tangencial):
        v_tierra = sqrt (uS./Rot);
    % Velocidad en el infinito:
        vr_inf = v_rad
        vt_inf = v_tan - v_tierra
        v_inf= sqrt( vt_inf^2 + vr_inf^2)

% d) Determinación del ángulo de giro al realizar el sobrevuelo:
    % Excentricidad hiperbola flyby:
        ef = 1 + v_inf^2.*(H+Rt)./uT;
    % Ángulo de giro:
        delta = 2 .* (asin (1./ef))
    % Semieje mayor de la hipérbola:
        af = (H+Rt).*(1+ef)./(ef^2-1);

% e) Exceso de velocidad de salida
    vr_salida= vr_inf.*cos(delta)-vt_inf.*sin(delta)
    vt_salida=vr_inf.*sin(delta)+vt_inf.*cos(delta) 

% f) Parámetros de la hipérbola de sobrevuelo:
ef 
af 
delta

% h) Velocidad heliocéntrica de salida:
    vr_h=vr_salida
    vt_h=vt_salida+v_tierra
    v_h=sqrt(vr_h.^2+vt_h.^2)

% i) Calculo de los parámetros de la elipse resultante:
    % Energía total tras el encuentro:
        epsilon=v_h^2./2-uS./Rot;
    % Momento angular normalizado:
        h=Rot.*vt_h;
    % Eje mayor y excentricidad:
        a=-uS./(2*epsilon)
        e= sqrt(1-h^2./(a*uS))
    % Anomalía verdadera y inclinación de la elipse:
        anomal2=acos(1./e .*(h^2./(Rot.*uS)-1));
        inclin=anomal-anomal2
%%

% definir constantes
G = 6.67.*10^-11;
Mt = 5.976.*10^24;
Ms = 1.989.*10^30;
Rt = 6.378.*10^6;
UA = 1.496.*10^11;
Rot = UA;
uT = G.*Mt; 
uS = G.*Ms;

% Apartado 3)g)
% Parámetros de la hipérbole:
    e=5.712;
    a=1990300;
    delta=0.352;
    H = 3000000;

% Inclinación de la asímptota de entrada en la SOI:
    vr_inf=13662;
    vt_inf=3690.3;
    betha=atan(vt_inf./vr_inf)

% Graficamos:
    % Órbita hiperbólica del flyby:
        sigma = linspace(3.5, 6.8, 1000);
        rho_h=a*(e^2-1)./(1+e*cos(sigma-delta./2+pi./2-betha));
        polarplot(sigma, rho_h);
        hold on;
    % Superfície terrestre:
        alfa = linspace(0, 2.*pi, 1000);
        rho_sup = linspace(Rt, Rt, 1000);
        polarplot(alfa,rho_sup);
    % Órbita aparcamiento terrestre:
        sigma = linspace(0, 2.*pi, 1000);
        rho_aparc = linspace(Rt+H, Rt+H, 1000);
        polarplot(sigma,rho_aparc);