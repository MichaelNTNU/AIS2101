%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB Code Generated with Fuzzy Logic Designer App                     %
%                                                                         %
% Date: 21-Mar-2025 12:30:14                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Construct FIS
mamdanitype1 = mamfis(Name="mamdanitype1");
% Input 1
mamdanitype1 = addInput(mamdanitype1,[0 0.7],Name="MD");
mamdanitype1 = addMF(mamdanitype1,"MD","trapmf",[0 0 0.1 0.3], ...
    Name="VS",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"MD","trimf",[0.1 0.3 0.5], ...
    Name="S",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"MD","trapmf",[0.4 0.55 0.7 0.7], ...
    Name="M",VariableType="input");
% Input 2
mamdanitype1 = addInput(mamdanitype1,[0 1],Name="NoS");
mamdanitype1 = addMF(mamdanitype1,"NoS","trapmf",[0 0 0.15 0.35], ...
    Name="S",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"NoS","trimf",[0.15 0.3 0.45], ...
    Name="RS",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"NoS","trimf",[0.3 0.5 0.7], ...
    Name="M",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"NoS","trimf",[0.55 0.7 0.85], ...
    Name="RL",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"NoS","trapmf",[0.6 0.8 1 1], ...
    Name="L",VariableType="input");
% Input 3
mamdanitype1 = addInput(mamdanitype1,[0 1],Name="RUF");
mamdanitype1 = addMF(mamdanitype1,"RUF","trapmf",[0 0 0.4 0.6], ...
    Name="L",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"RUF","trimf",[0.4 0.6 0.8], ...
    Name="M",VariableType="input");
mamdanitype1 = addMF(mamdanitype1,"RUF","trapmf",[0.6 0.8 1 1], ...
    Name="H",VariableType="input");
% Output 1
mamdanitype1 = addOutput(mamdanitype1,[0 1],Name="NoSpares");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trapmf",[0 0 0.1 0.3], ...
    Name="VS",VariableType="output");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trimf",[0 0.2 0.4], ...
    Name="S",VariableType="output");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trimf",[0.25 0.35 0.45], ...
    Name="RS",VariableType="output");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trimf",[0.3 0.5 0.7], ...
    Name="M",VariableType="output");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trimf",[0.55 0.65 0.75], ...
    Name="RL",VariableType="output");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trimf",[0.6 0.8 1], ...
    Name="L",VariableType="output");
mamdanitype1 = addMF(mamdanitype1,"NoSpares","trapmf",[0.7 0.9 1 1], ...
    Name="VL",VariableType="output");
% Rules
mamdanitype1 = addRule(mamdanitype1,[1 1 1 1 1 1; ...
    2 1 1 1 1 1; ...
    3 1 1 1 1 1; ...
    1 2 1 1 1 1; ...
    2 2 1 1 1 1; ...
    3 2 1 1 1 1; ...
    1 3 1 1 1 1; ...
    2 3 1 1 1 1; ...
    3 3 1 1 1 1; ...
    1 4 1 2 1 1; ...
    2 4 1 2 1 1; ...
    3 4 1 1 1 1; ...
    1 5 1 2 1 1; ...
    2 5 1 2 1 1; ...
    3 5 1 1 1 1; ...
    1 1 2 2 1 1; ...
    2 1 2 1 1 1; ...
    3 1 2 1 1 1; ...
    1 2 2 2 1 1; ...
    2 2 2 1 1 1; ...
    3 2 2 1 1 1; ...
    1 3 2 3 1 1; ...
    2 3 2 2 1 1; ...
    3 3 2 1 1 1; ...
    1 4 2 4 1 1; ...
    2 4 2 3 1 1; ...
    3 4 2 2 1 1; ...
    1 5 2 4 1 1; ...
    2 5 2 3 1 1; ...
    3 5 2 2 1 1; ...
    1 1 3 7 1 1; ...
    2 1 3 6 1 1; ...
    3 1 3 4 1 1; ...
    1 2 3 7 1 1; ...
    2 2 3 5 1 1; ...
    3 2 3 3 1 1; ...
    1 3 3 4 1 1; ...
    2 3 3 4 1 1; ...
    3 3 3 2 1 1; ...
    1 4 3 5 1 1; ...
    2 4 3 4 1 1; ...
    3 4 3 3 1 1; ...
    1 5 3 6 1 1; ...
    2 5 3 4 1 1; ...
    3 5 3 3 1 1]);

%%
% Viser FIS i en grafisk editor
fuzzy(mamdanitype1)
%%
% Viser Surfaceview grafisk
surfview(mamdanitype1)
%%
%Viser Ruleviewer
ruleview(mamdanitype1)