%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB Code Generated with Fuzzy Logic Designer App                     %
%                                                                         %
% Date: 20-Mar-2025 14:30:02                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Construct FIS
Oppgave1 = mamfis(Name="Oppgave1");

% Input 1: Sepal-Length (range [4,8])
Oppgave1 = addInput(Oppgave1, [4 8], Name="Sepal-Length");
Oppgave1 = addMF(Oppgave1, "Sepal-Length", "trimf", [0 4 5.5], ...
    Name="Small", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Sepal-Length", "trimf", [4 5.5 6.75], ...
    Name="SmallMedium", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Sepal-Length", "trimf", [5.5 6.75 8], ...
    Name="MediumLarge", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Sepal-Length", "trimf", [6.75 8 8], ...
    Name="Large", VariableType="input");

% Input 2: Sepal-Width (range [2,4.5])
Oppgave1 = addInput(Oppgave1, [2 4.5], Name="Sepal-Width");
Oppgave1 = addMF(Oppgave1, "Sepal-Width", "trimf", [2 2 2.75], ...
    Name="Small", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Sepal-Width", "trimf", [2 2.75 3.6], ...
    Name="SmallMedium", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Sepal-Width", "trimf", [2.75 3.6 4.5], ...
    Name="MediumLarge", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Sepal-Width", "trimf", [3.6 4.5 4.5], ...
    Name="Large", VariableType="input");

% Input 3: Petal-Length (range [1,7])
Oppgave1 = addInput(Oppgave1, [1 7], Name="Petal-Length");
Oppgave1 = addMF(Oppgave1, "Petal-Length", "trimf", [1 1 3], ...
    Name="Small", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Petal-Length", "trimf", [1 3 5], ...
    Name="SmallMedium", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Petal-Length", "trimf", [3 5 7], ...
    Name="MediumLarge", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Petal-Length", "trimf", [5 7 7], ...
    Name="Large", VariableType="input");

% Input 4: Petal-Width (range [0,2.5])
Oppgave1 = addInput(Oppgave1, [0 2.5], Name="Petal-Width");
Oppgave1 = addMF(Oppgave1, "Petal-Width", "trimf", [0 0 0.9], ...
    Name="Small", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Petal-Width", "trimf", [0 0.9 1.6], ...
    Name="SmallMedium", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Petal-Width", "trimf", [0.9 1.6 2.5], ...
    Name="MediumLarge", VariableType="input");
Oppgave1 = addMF(Oppgave1, "Petal-Width", "trimf", [1.6 2.5 2.5], ...
    Name="Large", VariableType="input");

% Output: output1 (range [0,4])
Oppgave1 = addOutput(Oppgave1, [0 4], Name="output1");
Oppgave1 = addMF(Oppgave1, "output1", "trimf", [0.5 1 1.5], ...
    Name="Iris-Setosa", VariableType="output");
Oppgave1 = addMF(Oppgave1, "output1", "trimf", [1.5 2 2.5], ...
    Name="Iris-Vesicolour", VariableType="output");
Oppgave1 = addMF(Oppgave1, "output1", "trimf", [2.5 3 3.5], ...
    Name="Iris-Virginica", VariableType="output");

% Rules
% Regelmatrise: [Sepal-Length, Sepal-Width, Petal-Length, Petal-Width, Output, Vekt, Operator]
Oppgave1 = addRule(Oppgave1, [4 0 4 0 3 1 1; ...
    4 0 2 4 3 1 1; ...
    1 3 1 0 1 1 1; ...
    1 0 0 0 1 1 1; ...
    3 0 4 2 3 1 1; ...
    3 1 3 4 3 1 1; ...
    1 2 4 3 3 1 1; ...
    0 3 3 4 2 1 1]);

% Les iris.csv-filen
Data = readtable('iris.csv');

% Antall datapunkter
numSamples = height(Data);

% FIS-input rekkefølge: [Sepal-Length, Sepal-Width, Petal-Length, Petal-Width]
inputs = [Data.sepal_length, Data.sepal_width, Data.petal_length, Data.petal_width];

% Evaluer FIS for hvert datapunkt og konverter output til art
predictedSpecies = strings(numSamples, 1);
for i = 1:numSamples
    sampleInputs = inputs(i, :);
    fuzzyOutput = evalfis(Oppgave1, sampleInputs);
    if fuzzyOutput < 1.5
        predictedSpecies(i) = "setosa";
    elseif fuzzyOutput < 2.5
        predictedSpecies(i) = "versicolor";
    else
        predictedSpecies(i) = "virginica";
    end
end

% Sammenlign predikerte arter med de faktiske
actualSpecies = lower(string(Data.species));
accuracy = sum(predictedSpecies == actualSpecies) / numSamples * 100;
fprintf('Klassifiseringsnøyaktighet: %.2f%%\n', accuracy);

% Viser FIS i en grafisk editor
fuzzy(Oppgave1)

% Viser Surfaceview grafisk
surfview(Oppgave1)