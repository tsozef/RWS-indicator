clc,clear
%% Rivierengebied
Huidig = [666 318 705 292;
    601 1029 452 159;
    962 1812 949 402;
    369 0 692 232;
    1342 0 395 482;
    0 2899 0 0;
    35 232 151 69;
    51 24 162 5;
    3277 2970 1205 239]; 
% Huidige oppervlaktes aan ecotopen
% Kolommen geven hotspots weer en rijen ecotopen
% waardes zijn oppervlakte in hectare

Streef = [4037 795 3324 1204;
    2552 245 414 0;
    2083 4554 2540 488;
    348 1E-5 1170 88;
    2075 1E-5 1746 2200;
    1E-5 5523 1E-5 1E-5;
    17 409 718 478;
    518 2393 747 160;
    3802 1445 645 206];
% Streef oppervlaktes aan ecotopen
% Kolommen geven hotspots weer en rijen ecotopen
% waardes zijn oppervlakte in hectare
Indicator = zeros(1,4); %Lege array voor berekeningen en computatiesnelheid
Gewicht = sqrt(Streef); %Door vierkantswortelmethode is gewicht vierkantwortel van streef oppervlakte
for i = 1:size(Huidig,1) %Gaat door alle kolommen van de oppervlakte waardes heen
    for j = 1:size(Huidig,2) %Gaat door alle rijen van de oppervlakte waardes heen
        I(i,j) = Huidig(i,j)/Streef(i,j) *100 ;% dat huidig oppervlakte is van streefoppervlakte
        if I(i,j) > 100
            I(i,j) = 100; %Als score hoger is dan 100% wordt het gelijk aan 100%
        end
        Indicator(j) = Indicator(j) + I(i,j)*Gewicht(i,j); 
    end
    if j == size(Huidig,2) & i ==size(Huidig,1)           %Indicator van elke hotspot wordt berekend
        Indicator = Indicator./ (sum(Gewicht,1)); 
    end
end

Tot_Opp = sqrt(sum(Streef,1)); %Gewicht van elke hotspot wordt berekend
Mean_indicator = 0; %Initialisatie parameter
for k = 1:size(Huidig,2) %Gaat over elke hotspot
Mean_indicator = Mean_indicator+ Tot_Opp(k) *Indicator(k);
end
Mean_indicator = Mean_indicator/(sum(Tot_Opp)); %Indicator rivierengebied berekening
%% IJsselmeergebied
Huidig2 = [523 149 101 189 98 308;
    733 227 715 302 441 92];

Streef2 = [5804 212 3566 384 236 112;
    5804 212 3566 384 236 112];
Indicator2 = zeros(1,6);
Gewicht2 = sqrt(Streef2);
for i = 1:size(Huidig2,1)
    for j = 1:size(Huidig2,2)
        I2(i,j) = Huidig2(i,j)/Streef2(i,j) *100 ;% %
        if I2(i,j) > 100
            I2(i,j) = 100;
        end
        Indicator2(j) = Indicator2(j) + I2(i,j)*Gewicht2(i,j);
    end
    if j == size(Huidig2,2) & i ==size(Huidig2,1)
        Indicator2 = Indicator2./ (sum(Gewicht2,1));
    end
end

Tot_Opp2 = sqrt(sum(Streef2,1));
Mean_indicator2 = 0;
for k = 1:size(Huidig2,2)
Mean_indicator2 = Mean_indicator2+ Tot_Opp2(k) *Indicator2(k);
end
Mean_indicator2 = Mean_indicator2/(sum(Tot_Opp2));