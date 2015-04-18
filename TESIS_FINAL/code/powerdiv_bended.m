clear all;
close all;
% clear figures;
clc;
% Cristian Duguet S�ez. 2009-09-12
% Algoritmo para el c�lclo de altura de steps en un divisor de potencia squintless
% 20 elementos
% Distribuci�n, como vector A.
% Recordar que se realiza la distribuci�n de potencia para la mitad del
% arreglo (arreglo final tiene 40 elementos)
%freq: 12GHz;
%lambda = 25 %mm;

el=20;

%%%%%%%%%%%%-----VALORES IMPORTADOS DE DIST. TAYLOR-----------%%%%%%%%%%%%%
%n=7, SLL=30dB
A=[40.0173   39.6844   39.0521   38.1584   37.0171   35.6173   33.9545   32.0634   30.0176   27.8902   25.7070   23.4396   21.0569   18.6039   16.2431   14.2140   12.7217   11.8276   11.4199   11.2941]
%%%%%%%%%%%%--------------------------------------------------%%%%%%%%%%%%%

P=A.^2; P=P/sum(P);

Ptot=sum(P);
% P=0.995*P;

N=length(P) %nro de elementos

%% ---------------------Algoritmo de Potencias ------------------------- %%
%correccion1
P=P-[-0.0171251292826020,-0.00143750155408756,-0.000620342805139687,0.000272357306311422,0.00135663524698268,0.00251649179597321,0.00315998908320211,0.00347218967929941,0.00320868230829512,0.00296559121089881,0.00246542071915242,0.00204891257661037,0.00154295939198814,0.000968453520189275,0.000268547843438473,-0.000429784673302779,-0.000957050569550727,-0.00130987650473384,-0.00142099666507059,-0.00137573424570286;];
P=P-[0.0228130254494288,-0.00324636592076200,-0.00463520986089473,-0.00234560261230657,-0.00118516119946133,-0.00232419969424526,-0.00156674786827761,-0.00253317692862878,-0.00172654049412993,-0.00206365306791859,-0.00152425137161466,-0.00141143581768854,-0.00100151769169605,-0.000965085360767611,-0.000620433719929838,-0.000651302564072148,-0.000232597786400770,-0.000368813970540973,0.000138504841077983,-0.000603585002080292;];


br=1; %mm

b1min=br*(Ptot-P(1))/(P(1));
b1max=br*(Ptot-P(1))/(P(1)-P(N));
b(1)=b1min;
b0=b(1)+br

%-------------------- DETERMINACION DE b() -------------------------------%
for i=2:N
    b(i) = P(i-1)/P(i)*b(i-1);
    b(i) = b(i)-br;
end

%---------------------- NO   CRECIMIENTO DE B ----------------------------%
%  figure(1)
%  limit(1)=Ptot*br/(br+b(1));
%  for i=[2:N]
%      b(i) = min([b(i) b(i-1)]);
%      limit(i)=  (Ptot- sum(P(1:i-1))) * br/(br+b(i));
%  end
%     
% % C�mo se ve afectada la distribuci�n por esta restricci�n:
%  figure(1)
%  semilogy([1:20],P,'b',[1:20],limit,'r');
%  title('Distribucion de Potencia'); legend('Distrib. de Taylor','Sin decrecimiento de steps');
% 
% clear a,i;
clear P;
%% -------------------Algoritmo de Impedancias ------------------------- %%
%normalizaci�n de potencia distribu�da
P=A.^2; P=P/sum(P);
clear br;
br=0.85371; %br4.20
br=0.5953108246; %br3.25
% ls = 0.795492119137066; % p�rdida de acoplamiento obtenida de ajuste de curvas.
% ls=0.8;
% ls=0.95
% lm=1/1.01;
%-------- energ�a hacia la carga----%

%Correcciones br=4.20
% P=P-[-0.00167390704287004,0.0122926729965020,0.00968424489491526,0.00896722481979920,0.00584092318949581,0.00492810771681750,0.00186238174665668,0.000760048557017584,-0.00174733064878765,-0.00263490962878613,-0.00411829700575426,-0.00438499266589870,-0.00465997786271776,-0.00430044970454929,-0.00386130238644837,-0.00375133745689973,-0.00323785993500908,-0.00382542647572315,-0.00338255689197706,-0.00413692233738164;];
% P=P-[0.00584030439228975,0.00216330170170742,-0.00628715726301882,-0.00287670874018110,-0.000720581779734261,-0.000114791682463228,0.000282251954231899,0.000932006095018895,0.000749367954534445,0.00105229454681696,0.000946576423995177,0.000787507815562062,0.000632068125434777,0.000174635893072858,0.000250106437205352,-0.000577287330254179,-0.000187939216809744,-0.00136357513691205,-0.000570353168035242,-0.00230805105720752;];
% P=P-[-0.00340758769395762,-0.00504434120364311,0.000784436011778120,0.00423781313711724,0.000905556955798373,0.000402332341913170,0.000391014587228206,0.000640195369840724,0.000351900209542955,0.000566772088909241,0.000226969117495826,2.76615497867005e-06,0.000473033690706778,0.000123494616190985,0.000396724190668264,-0.000233662187934974,0.000306783481847126,-0.000676026513826275,0.000340972615976579,-0.00171483741646420;];
% P=P-[0.000875456628320795,0.00240354601111631,0.00345921503938594,-0.000967277295228775,-0.00236768589261362,-0.000900000566626688,-1.85446443184689e-05,-0.00106869110646091,-0.000554271346317373,-0.000648761070439333,-5.46341854076107e-05,-3.43310088453327e-05,0.000115172967032662,-0.000312642592100794,0.000217636260301565,-0.000238683324098571,0.000313447698606389,-0.000490767230192106,0.000503604241218711,-0.00143318536029558;];
% P=P-[0.000641723938789446,0.000763076449712144,-0.00234057681836904,-0.00256745846919142,0.000376363510719915,0.00125365501348884,0.000445235747874306,0.000395585449483232,0.000635822304531776,-2.03729380447298e-05,0.000243551095391079,0.000137158589318828,0.000211549103395492,9.11825865643201e-06,0.000148533872206730,-0.000230188058165659,0.000211081199891080,-0.000472158287549622,0.000536846968580839,-0.00147567076839786;];
% P=P-[-0.00110806598731278,-0.00207852891905609,-0.000746408575430652,0.00160215982667709,0.00218745170232387,-0.000438652892246622,-0.000387800602078950,-0.000527245792801057,0.000604395852545486,0.000199063628405376,0.000285587000202744,3.28820193329846e-05,0.000146350002934642,-0.000339487543278234,0.000250898950886726,-0.000198275242218566,0.000371421848978539,-0.000252712026030989,0.000647860153633662,-0.00130208264989303;];
% %Correcciones br=3.25 <- la MEJOR*
P=P-[0.00928113914156448,0.0101158863772977,0.00952082788132980,0.00798333898833950,0.00526116459955513,0.00377994258977005,0.00168047359445865,7.08248885797347e-06,-0.00195025983487032,-0.00295783188706195,-0.00434820898685766,-0.00457775418870136,-0.00516907522957432,-0.00462019530290919,-0.00457594049291904,-0.00388259674098436,-0.00390684898072900,-0.00364632128546178,-0.00410659060418486,-0.00451951963811799;];
P=P-[-0.00221552464214550,-0.000536396391952812,-0.000897511276259366,-0.000628590854102301,-0.000168654487795600,0.000698217274014881,0.000966161021697998,0.00144121849853170,0.00165425265146384,0.00161059695544825,0.00128246233546731,0.000960352400192967,0.000408185787840819,0.000419313520650774,-6.94755924230822e-05,-0.000383022941158702,-0.000608575381071353,-0.000924597596282384,-0.00117699436395075,-0.00228090713594472;];
P=P-[0.000939207995689084,0.000293087632213182,-0.000461985984150121,6.63003814439234e-05,0.000578580805770362,-3.72830865674884e-05,6.46908661037227e-05,0.000392870849737825,-0.000247096782016926,-0.000419909772183195,2.51380707064902e-05,2.66219119480146e-05,0.000204476340041750,-2.14003805464394e-05,8.92722610199674e-05,-1.36268271098850e-05,-5.43624398341366e-05,-0.000271175408725635,-0.000334131668875535,-0.00133192523349454;];
P=P-[-0.000543540083819377,0.000253875450356489,0.000171382679361648,0.000153509249833039,-2.47155916663355e-07,-4.72568739648682e-05,3.97407253415333e-05,-6.02918657409135e-05,-0.000331836691080431,0.000112286923617734,0.000152832173839497,-0.000153652270428878,0.000171793174446062,0.000107669007922161,0.000234420100907604,-2.46369898313486e-05,0.000175375332149197,-9.88460715735193e-05,0.000136653393046960,-0.000902542277093370;];
%Correcciones Power 99.9%
% P=0.999*P; %Para dejar un remanente a la carga
%----------------------------------%
cumP=cumsum(P);
%Vector de acoplamientos:
for i=1:N
    if (i==1) S2(i) = P(i); 
    else      S2(i) = P(i) / (1 - cumP(i-1));
    end
end
%  S2 =S2-correccion-correccion2;

% b2=zeros(size(P)); %se inicializa vector de alturas  para el nuevo algoritmo

for i=[1:1:N-1]
    b2(i) = br* sqrt((1-S2(i))/(S2(i)*S2(i+1)));
end
b2(N) = br* sqrt((1-S2(N))/(S2(N))) ;    %Se considera que S2(N+1)=1 = full absorci�n por la carga

b02=br/S2(1);
 
%RESULTADOS ARNDT
ARNDT=1e3*[0.0165487878173164,0.0153978770396513,0.0143305129211123,0.0133800579892415,0.0124991858255087,0.0116765179805423,0.0109275072336703,0.0102328200886909,0.00959265652681797,0.00896890601397655,0.00834292308054726,0.00771249574176216,0.00708556643697299,0.00648006612970983,0.00589966905183740,0.00531085259444016,0.00464091737627374,0.00379902585716515,0.00272613426905429,0.00142638452377978,1.88451286189225e-05;];
  
%% Gr�fico
figure(1);
step1 = -[b0 b0  b b(N)];
step2 = -[b02 b02 b2 b2(N)];
step3 = -[ARNDT(1) ARNDT ARNDT(length(ARNDT))];
stairs([-1:21],[step1 ; step2]');
legend('Algoritmo de Potencias','Algoritmo de Impedancias');hold on;
plot([-1:21],zeros(length(step1)),'r');
ax=axis; ax(1:2) =[0 21]; ax(4)=1;
axis(ax);
title('Comparaci�n de algoritmos');
ylabel('Altura de step (mm)');
xlabel('step');
% 

%% --------------------------------------------------------------------- %%
%% --------------------------------------------------------------------- %%


% fout = fopen('completedist_results/steps_cambiar_12GHz.vbs','wt');
fout = fopen('completedist_results/steps_cambiar_12GHz_inclinado.vbs','wt');

fprintf(fout,''' ---------------------------------------------- \n');
fprintf(fout,''' Script Recorded by Cristian Duguet S. \n');
fprintf(fout,''' using MATLAB. Run it in Ansoft HFSS \n');
fprintf(fout,''' ---------------------------------------------- \n');
fprintf(fout,'Dim oAnsoftApp \n');
fprintf(fout,'Dim oDesktop \n');
fprintf(fout,'Dim oProject \n');
fprintf(fout,'Dim oDesign \n');
fprintf(fout,'Dim oEditor \n');
fprintf(fout,'Dim oModule \n');
fprintf(fout,'Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface") \n');
fprintf(fout,'Set oDesktop = oAnsoftApp.GetAppDesktop() \n');
fprintf(fout,'oDesktop.RestoreWindow \n');
fprintf(fout,'Set oProject = oDesktop.SetActiveProject("TEM_divider2") \n');
fprintf(fout,'Set oDesign = oProject.SetActiveDesign("steps 12GHz_squinted") \n');
fprintf(fout,'oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", Array("NAME:PropServers",  _ \n');
fprintf(fout,'  "LocalVariables"), Array("NAME:ChangedProps", _ \n');
fprintf(fout,' Array("NAME:b1", "Value:=", "%3.6gmm"), _ \n',b2(1));
fprintf(fout,' Array("NAME:b2", "Value:=", "%3.6gmm"), _ \n',b2(2));
fprintf(fout,' Array("NAME:b3", "Value:=", "%3.6gmm"), _ \n',b2(3));
fprintf(fout,' Array("NAME:b4", "Value:=", "%3.6gmm"), _ \n',b2(4));
fprintf(fout,' Array("NAME:b5", "Value:=", "%3.6gmm"), _ \n',b2(5));
fprintf(fout,' Array("NAME:b6", "Value:=", "%3.6gmm"), _ \n',b2(6));
fprintf(fout,' Array("NAME:b7", "Value:=", "%3.6gmm"), _ \n',b2(7));
fprintf(fout,' Array("NAME:b8", "Value:=", "%3.6gmm"), _ \n',b2(8));
fprintf(fout,' Array("NAME:b9", "Value:=", "%3.6gmm"), _ \n',b2(9));
fprintf(fout,'Array("NAME:b10", "Value:=", "%3.6gmm"), _ \n',b2(10));
fprintf(fout,'Array("NAME:b11", "Value:=", "%3.6gmm"), _ \n',b2(11));
fprintf(fout,'Array("NAME:b12", "Value:=", "%3.6gmm"), _ \n',b2(12));
fprintf(fout,'Array("NAME:b13", "Value:=", "%3.6gmm"), _ \n',b2(13));
fprintf(fout,'Array("NAME:b14", "Value:=", "%3.6gmm"), _ \n',b2(14));
fprintf(fout,'Array("NAME:b15", "Value:=", "%3.6gmm"), _ \n',b2(15));
fprintf(fout,'Array("NAME:b16", "Value:=", "%3.6gmm"), _ \n',b2(16));
fprintf(fout,'Array("NAME:b17", "Value:=", "%3.6gmm"), _ \n',b2(17));
fprintf(fout,'Array("NAME:b18", "Value:=", "%3.6gmm"), _ \n',b2(18));
fprintf(fout,'Array("NAME:b19", "Value:=", "%3.6gmm"), _ \n',b2(19));
fprintf(fout,'Array("NAME:b20", "Value:=", "%3.6gmm"), _ \n',b2(20));
fprintf(fout,'  Array("NAME:B", "Value:=", "%3.6gmm")))) ',b02);
fclose(fout);