# Automatic_Modulation_classification
This is a project which is built using Matlab and Tensorflow for classifying the Modulation scheme of received signal.
The dataset has been generated using MATLAB for 6 different modulation schemes. The model has been built to classify the signal in 3 stages.
Each model is built using the transfer learning of Resnet-50 architecture.
Various masks are applied on constellation diagrams to classify at each stage.
Finally an accuracy of 85% is obtained for an SNR of 10 and 100% for SNR ranging above 15.
