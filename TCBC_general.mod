// Institute of Economics, NSYSU 
// Kuan Lun Chen (2025.1)
// This model include money union into two country business model
// i repersent Household
//endogeneous alpha case 

var c ci cf cif h hi hf hif bb bH bF bHf bFf bG bGf q qf R pi y yf alp alpf m mf mi mif ma T lam lamf lami lamif lamH lamHf lamF lamFf lamm lammf lammi lammif G A Af p; 
varexo  e_Af ;

parameters b g mH mF j nu eta tau psi alps alpsf Rs bHsy bFsy bHsfy bFsfy bbs cisy cisfy ys ysf qs qsf qshs qsfhsf bHs bFs bHsf bFsf cis cs csf cisf hs hsf his hisf As Asf rho_A rho_Af rho_G tau_A tau_Af lams lamsf lamis lamisf lamHs lamHsf lamFs lamFsf lamms lammsf lammis lammisf ms msf mis misf mas  pis pisf Gs Ts;
b           = 0.99; //*beta*
g           = 0.98; //*gamma*
mH          = 0.9;  
mF          = 0.8;
j           = 0.1;
nu          = 0.1;
eta         = 21;
tau         = 0.156;//不確定
rho_A       = 0;
rho_Af      = 0.9;
rho_G       = 0.8;//kjset 0.2,euro set 0.8
psi         = 0;
As          =1;
Asf         =1;
tau_A       =0;
tau_Af      =0;

//steady-state
    Gs   =0;
    Ts   =0;
    pis  =1;
    pisf =pis;
    alps = 1-((1-mH)/(2*(1-mF))); // alpha
    alpsf = 1-((1-mH)/(2*(1-mF))); //domestic and foreign are symmetric 
    Rs = pis/b; //interest rate between two countries are equal

    bHsy = (pis*mH*alps*g*nu)/(Rs*(1-(b-g)*mH-g));//bHsy means bH over y
    bFsy = (1-alps)*(1-(1-mF)*(1-alps))*(bHsy)/(alps*mH);//bFsy means bF over y
    bHsfy = bHsy;//domestic and foreign are symmetric 
    bFsfy = bFsy;//domestic and foreign are symmetric 
    bbs = 0;//Maybe 0.00001

    cisy = (1-b)*Rs*(bHsy+bFsy)+(1-nu);//(1-b)*Rs*(bHsy+bFsy)+(1-nu)
    cisfy = cisy;//domestic and foreign are symmetric 
    hs = (1-b)*g*nu/(j*Rs*(1-g-(b-g)*mH)*cisy+(1-b)*g*nu);//(1-b)*g*nu*Rs/(j*(1-g-(b-g)*mH)*cisy+(1-b)*g*nu*Rs)
    hsf = hs; //ok
    ys = (hs^nu)*((1-nu)*b/(tau*cisy))^((1-nu)/(eta)); //ok
    ysf = ys; //ok

    bHs = bHsy*ys;//ok
    bFs = bFsy*ys;//ok
    bHsf = bHs;
    bFsf = bFs;
    qs = g*nu*ys/(hs*(1-(b-g)*mH*pis-g)); // ok bHs/alp*b*mH*hs
    qsf = qs; //ok
    qshs = qs*hs; //ok
    qsfhsf = qshs; //ok
    
    cs = nu*ys+(1-Rs)*(bHs+bFs)*(1/pis);//ok
    cis = cisy*ys;//ok
    csf = cs;
    cisf = cis;

    his = 1-hs; //ok
    hisf = 1-hsf; //ok

    lams = g/(pis*cs);
    lamsf = lams;
    lamis = b/(pis*cis);//j/(his*(1-b)*qs)
    lamisf = lamis;
    lamHs = (1/Rs-g/pis)*lams;//(1/Rs-g/pis)*lams;
    lamHsf = lamHs;
    lamFs = (1/Rs-g/pis)*lams;
    lamFsf = lamFs;
    
    ms = cs*pis;
    msf = ms;
    mis = cis*pis;
    misf = mis;
    mas = ms+mis+msf+misf;
    

    //shadow prices of money

    lamms   = ((1/g)-1)*lams;
    lammis  = (Rs-1)*lamis;
    lammsf  = lamms;
    lammisf = lammis;

    //his = (j*cis)/((1-b)*qs); //ok
    //hisf = his; //ok
   //hs備選：1-(j*cis)/((1-b)*qs)
   //hsf備選：1-(j*cisf)/((1-b)*qsf)
   //hs備選2:(g*nu*(1-b)*ys)/(j*(1-g-(b-g)*mH*cis))/(1+(g*nu*(1-b)*ys)/(j*(1-g-(b-g)*mH*cis)))

model;

///Home


nu*y+bH+bF+m(-1)/p+T=
(bH(-1)*R(-1)+bF(-1)*R(-1))/pi+q*(h-h(-1))+c+m/p;

y=A*h(-1)^nu*((1-nu)*y*lami/(tau))^((1-nu)/(eta));

bH=(alp*mH*q(+1)*h*pi(+1))/R;

bF=(q(+1)*pi(+1)*(1-alp)*h*(1-(1-mF)*(1-alp)*pi(+1)*q(+1)*h/qshs))/R;

1/c=lam+lamm;

lam*q=lamH*mH*q(+1)*pi(+1)+(g*lam(+1))*((nu*y(+1)/h)+q(+1));

lam=(lam(+1)*g*R)/pi(+1)+lamH*R;

lamH=lamF;

lam=(g/pi(+1))*(lam(+1)+lamm(+1));

m(-1)=c*p;

ci+bH+bFf+bb+q*(hi-hi(-1))+mi/p+bG=
(1/pi)*(bH(-1)*R(-1)+bFf(-1)*R(-1)+R(-1)*bb(-1)+bG(-1)*R(-1))+(1-nu)*y+mi(-1)/p+T;//家戶的預算限制式，wl已被一階最適汰換ci+bH+bFf+bb+q*(hi-hi(-1))+psi*(bb-bbs)^2/2

lami=b*(lami(+1)*R/pi(+1));//扣除投資調整成本(1/ci)*(1+psi*(bb-bbs))，將psi設為0可去除

q=(j/(hi*lami))+b*q(+1)*lami(+1)/lami;

mH=1-(2*(1-mF)*(1-alp)*q(+1)*pi(+1)*h)/qshs;

1/ci=lami+lammi;

h=1-hi;

mi(-1)=ci*p;

lami=(b/pi(+1))*(lami(+1)+lammi(+1));//(18)


///Foreign


nu*yf+bHf+bFf+mf(-1)/p+T=
(bHf(-1)*R(-1)+bFf(-1)*R(-1))/pi+qf*(hf-hf(-1))+cf+mf/p;

yf=Af*(hf(-1)^nu)*((1-nu)*yf*lamif/(tau))^((1-nu)/(eta));

bHf=alpf*mH*pi(+1)*qf(+1)*hf/R;

bFf=(qf(+1)*pi(+1)*(1-alpf)*hf*(1-(1-mF)*(1-alpf)*qf(+1)*pi(+1)*hf/qsfhsf))/R;

1/cf=lamf+lammf;

lamf*qf=lamHf*mH*qf(+1)*pi(+1)+(g*lamf(+1))*((nu*yf(+1)/hf)+qf(+1));

lamf=(lamf(+1)*g*R)/pi(+1)+lamHf*R;

lamHf=lamFf;

lamf=(g/pi(+1))*(lamf(+1)+lammf(+1));

mf(-1)=cf*p;

cif+bHf+bF+bGf-bb+qf*(hif-hif(-1))+mif/p=
(1/pi)*(bHf(-1)*R(-1)+bF(-1)*R(-1)-R(-1)*bb(-1)+bGf(-1)*R(-1))+(1-nu)*yf+mif(-1)/p+T;

lamif=b*(lamif(+1)*R/pi(+1));

qf=(j/(hif*lamif))+b*qf(+1)*lamif(+1)/lamif;

mH=1-(2*(1-mF)*(1-alpf)*qf(+1)*pi(+1)*hf)/qsfhsf;

1/cif=lamif+lammif;

hf=1-hif; 

mif(-1)=cif*p;

lamif=(b/pi(+1))*(lamif(+1)+lammif(+1));


///Government&CentralBank


pi = p/p(-1);

ma=mi+m+mif+mf;

bG-R(-1)*bG(-1)+bGf-R(-1)*bGf(-1)+(ma-ma(-1))/p=4*T;//央行限制式

bG=bGf;

-2*T=0.02*bG(-1);//kj set 0.02

//mb-mb(-1)/pi=2*T;//央行限制式

//mb=mif+mf;


///shock


G=(ma-ma(-1))/ma(-1);//同乘pi

log(A)=rho_A*log(A(-1))+tau_Af*log(Af(-1));   //log(A)=rho_A*log(A(-1))+tau_Af*Af(-1)

log(Af)=rho_Af*log(Af(-1))+tau_A*log(A(-1));   //log(Af)=rho_Af*log(Af(-1))+tau_A*log(A(-1))+e_Af

G=rho_G*G(-1)+e_Af;   //log(G)=rho_G*log(G(-1))+e_G


end;

initval;
c=cs;
ci=cis;
cf=csf;
cif=cisf;
y=ys;
yf=ysf;
q=qs;
qf=qsf;
h=hs;
hi=his;
hf=hsf;
hif=hisf;
bH=bHs;
bF=bFs;
bHf=bHsf;
bFf=bFsf;
R=Rs;
bb=bbs;
alp=alps;
alpf=alpsf;
A=As;
Af=Asf;
lam=lams;
lami=lamis;
lamf=lamsf;
lamif=lamisf;
lamH=lamHs;
lamF=lamFs;
lamHf=lamHsf;
lamFf=lamFsf;
lamm=lamms;
lammi=lammis;
lammf=lammsf;
lammif=lammisf;
pi=pis;
m=ms;
mi=mis;
mf=msf;
mif=misf;
ma=mas;
p=1;
G=Gs;
bG=0;
bGf=0;
end;

resid;
check;steady;

shocks;

var e_Af; stderr 0.01;


end;

stoch_simul(order=1,periods=200000,irf=10);

//stoch_simul(order=1,hp_filter=1600,irf=10,nograph);



