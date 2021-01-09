## 2D Perceptron in Molecular Programming Language CRN++ 
This project contains the implementation of a 2D Perceptron using
CRN++, a programming language which employs generic chemical reactions (CRNs), which have been shown to be Turing complete, to perform computation. We use a [compiler](https://www.dna.caltech.edu/courses/cs191/paperscs191/Vasic_2018_CRN_Programming_Language.pdf) which translates CRN++ programs into chemical reactions, allowing us to implement simple machine learning algorithms like the perceptron.

### How to deploy
The program can be run using Mathematica version 11.2 or higher with the CRNSimulator Mathematica Pakcage developed by David Soloveichik. You can install the packages from [here](https://github.com/marko-vasic/crnPlusPlus). After downloading the repository, open Mathematica, go to file menu, click on install and choose the package 'CRNSimulator.m' to install. To run a program, simply download and save it to the same directory as your packages and open it using Mathematica. 

### Limitations
As the programs are computed by manipulating the concentrations of chemical species in CRNs, CRN++ comes with its unique set of limitations. One of it being that chemical concentrations have to be positive, as such they do not represent negative weights in perceptrons well. Errors in computation also arise due to the fact that CRNs converge asymptotically. As such, the correct value is never reached in a finite time.

### Testing
We did a simple testing and error evaluation with a set of five datapoints. The weights (wx,wy) were initialised to (0,0) and their alteration when 'trained' with datapoints are tracked. Each datapoint consist of (x vector, y vector, label). 

dp: (0,1,1)
![data1](https://user-images.githubusercontent.com/66665467/104083880-3b0c8d00-527d-11eb-9cbc-0072b7e55fc1.png)
dp: (0,1,1), (1,2,1)
![data2](https://user-images.githubusercontent.com/66665467/104083882-3fd14100-527d-11eb-8d44-46ba02844de1.png)
dp: (0,1,1), (1,2,1), (2,3,1)
![data3](https://user-images.githubusercontent.com/66665467/104083884-4364c800-527d-11eb-9cc3-5fe996915d30.png)
dp: (0,1,1), (1,2,1), (2,3,1), (0,-1,-1), (1,0,-1)
![data5](https://user-images.githubusercontent.com/66665467/104083886-465fb880-527d-11eb-8547-7f0d85bc6d5c.png)
