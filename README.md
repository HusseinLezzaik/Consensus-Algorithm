# Consensus Algorithm

## Introduction
Consensus is an important problem in cooperative control, where several agents have to be synchronized to a common value. In the case of multi-robots systems, it can be interesting for the robots to achieve a consensus on positions, like a rendez-vous point , to reach an objective at the same instant. After studying the concepts of Systems of Systems in the course of "Automatic Robotic Systems", we’ve choosen to implement the ” Rendez-Vous with target case”, where we assume the case of five robots with which we can directly control their speeds.

The purpose of our project is to propose a consensus-based control law that lets the agents meet in the specified location (0,0), study the behavior of our system and simplify our graphical model.

## Methodology
1.  We plot the graph of the system.
2.  We propose a consensus-based control law that let the agents meet in the specified location.
3.  We implement the control system in MATLAB Simulink and analyze the results function of the controllers gains.
4.  We proposed another simplified graph with less connections, adapted the proposed controller and analyzed the simulation results.

## Overview of the Repository
In this repo, you'll find :
* `Code`: Folder that contains all code for our algorithms and simulation.
* `Documentation`: Folder that contains our final report and presentation.

You can find more details about our approach, equations, and results in `Documentation/report.pdf'.

## Getting Started
1.  Clone our repo: `git clone https://github.com/HusseinLezzaik/Consensus-Algorithm.git`
2.  Install [MATLAB](https://fr.mathworks.com/products/matlab-online.html)
3.  Run `Code/method.md` to replicate our experiments.


## Maintainers
* [Hussein Lezzaik](www.husseinlezzaik.com)
* [Hasan Kassem](https://www.linkedin.com/in/hasan-kassem-02625119b/)
* [Ahmad Shour](https://www.linkedin.com/in/ahmad-shour-1531371a8/)
