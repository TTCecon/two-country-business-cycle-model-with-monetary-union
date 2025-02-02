# Two-Country Business Cycle Model with Monetary Union

## Overview

This repository provides a **Dynare implementation** of an advanced two-country business cycle model tailored to capture the macroeconomic dynamics of European Union (EU) countries. The model introduces a **monetary union**, where two countries share a common monetary policy, while each maintains its own **independent fiscal authority**. This framework allows for an in-depth analysis of the interactions between monetary and fiscal policies and their effects on cross-border economic fluctuations.

## Methodology

Building upon the foundational work of **Matteo Iacoviello and Raoul Minetti (2006)**, who examined international business cycles in the context of domestic and foreign lenders ([matteoiacoviello.com](https://www.matteoiacoviello.com/research_files/JME_2006.pdf)), this model incorporates several key features:

- **Monetary Union**: A shared central bank governs monetary policy across both countries, reflecting the structure of the Eurozone.
- **Independent Fiscal Authorities**: Each country retains autonomy over its fiscal policy, enabling the study of asymmetric fiscal shocks and policy responses.
- **Financial Frictions**: The model accounts for borrowing constraints and credit market imperfections, aligning with real-world conditions in European economies.
- **Trade and Capital Flows**: Explicit modeling of cross-border trade and investment dynamics facilitates the examination of international transmission mechanisms.
- **Nominal and Real Rigidities**: Incorporation of sticky prices and wages, along with other frictions, enhances the model’s empirical relevance.

The model is solved and simulated using **Dynare**, a powerful tool for Dynamic Stochastic General Equilibrium (DSGE) modeling within **MATLAB/Octave**.

## Applications

This extended model is suitable for:

- **Monetary and Fiscal Policy Analysis**: Investigating the joint conduct of fiscal and monetary policy within a currency union, as explored by Beetsma and Jensen (2005) ([ecb.europa.eu](https://www.ecb.europa.eu/pub/pdf/scpwps/ecbwp502.pdf)).
- **Understanding Asymmetric Shocks**: Assessing the role of national fiscal policies as automatic stabilizers in a monetary union, building on the work of Galí and Monacelli (2008) ([ifo.de](https://www.ifo.de/DocDL/cesifo1_wp1682.pdf)).
- **Evaluating Financial Frictions**: Analyzing the impact of credit market imperfections on international business cycle transmission, following the framework of Iacoviello and Minetti (2006) ([matteoiacoviello.com](https://www.matteoiacoviello.com/research_files/JME_2006.pdf)).
- **Policy Simulation and Welfare Analysis**: Conducting counterfactual simulations to evaluate different policy scenarios and their welfare implications, as demonstrated by Poutineau and Vermandel (2015) ([imf.org](https://www.imf.org/-/media/Files/Publications/WP/2019/WPIEA2019123.ashx)).

## Citation and Contact

If you find this model useful for your research, please cite it appropriately. For any questions regarding the model’s theoretical foundations, implementation, or potential extensions, feel free to reach out. I am open to discussions and collaborations to further explore the intricacies of this model.
