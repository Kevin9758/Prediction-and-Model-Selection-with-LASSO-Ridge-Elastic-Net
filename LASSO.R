library(glmnet)
set.seed(444)

pen = 0.135


X <- model.matrix(Fat_Modelling$brozek ~ . , data = Fat_Modelling)[,-1]

Y <- Fat_Modelling[,"brozek"]



lasso <- glmnet(x = X, y = Y, alpha = 1, lambda = pen)


lasso.coef <- predict(lasso, type = "coefficients",
                      s = pen)[1:15, ]

lasso.coef