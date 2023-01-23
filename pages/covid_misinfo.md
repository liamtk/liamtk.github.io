# Classifying and visualizing COVID-19 misinformation

> **View the Github repo [here](https://github.com/ltk2118/covid_misinformation).**

**This repo also contains the code we used to [train a Bidirectional Encoder Representations from Transformers (BERT) model](https://github.com/ltk2118/covid_misinformation/blob/main/AI_Modelshare_Competition_Code.ipynb) in Tensorflow, which won the 2021 Columbia University AI Modelshare machine learning competition.** 

The outbreak of COVID-19 was accompanied by fake news and misleading posts on social media platforms around the world. That misinformation hinders epidemic prevention and control, foments xenophobia, and exacerbates the damage caused by the virus itself. 

In order to better understand the underlying characteristics and trends in COVID-19 misinformation I developed the following interactive **[Tableau dashboard](https://public.tableau.com/app/profile/liamtaykearney/viz/TrackingCOVID-19misinformation/Dashboard)** using data published by the [ESOC](https://esoc.princeton.edu/publications/esoc-covid-19-misinformation-dataset) lab at Princeton.

I then trained eight binary classifiers using various algorithms including logistic regression, naïve bayes, random forest, support vector machine, AdaBoost, and a simple sequential neural network. The final part of the repo contains code used to train a fine-tuned BERT model with added dense and dropout layers which won the the 2021 Columbia University AI Modelshare Competition. The model (details below) predicted fake COVID tweets with a 97.4% F1 score.

| **accuracy** | **f1** | **precision** | **recall** | **framework** | optimizer | loss rate |
| ------------ | ------ | ------------- | ---------- | ------------- | --------- | --------- |
| 97.4%        | 97.4%  | 97.4%         | 97.4%      | keras         | Adam      | 1e-5      |

*Thanks to Joy Zhang (Goldman Sachs) who also contributed to the project.*
