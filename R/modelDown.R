# https://github.com/MI2DataLab/modelDown
# https://github.com/MI2DataLab/modelDown_example
# https://mi2datalab.github.io/modelDown/getting-started
# https://github.com/pbiecek/DALEX
# https://github.com/pbiecek/archivist


# devtools::install_github("MI2DataLab/modelDown")
# install_dependencies()

library(modelDown) # Make Static HTML Website for Predictive Models # [github::MI2DataLab/modelDown]
library(DALEX) # Descriptive mAchine Learning EXplanations # [CRAN]
library(breakdown) # Model Agnostic Explainers for Individual Predictions # [CRAN]

View(HR_data)

glm(left ~ salary + satisfaction_level + last_evaluation + number_project + average_montly_hours + time_spend_company + Work_accident + promotion_last_5years + sales, data = HR_data)

explainer_glm <- DALEX::explain(glm_model, data=HR_data, y=HR_data$left)


modelDown::modelDown(explainer_glm)

