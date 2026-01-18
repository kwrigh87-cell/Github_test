head(mtcars)

plot(y = mtcars$mpg, x = mtcars$disp, xlab = "Engine Size (cubi inches)",
     ylab = "Fuel Efficiency (Miles per Gallon)")

model <- lm(mtcars$mpg ~ mtcars$disp)
coef(model)

###Call coefficients from the model###
coef(model)[2] * 200 + coef(model)[1]
mtcars$disp


###Testing and Training Data###
summary (model)
split_size = 0.8
sample_size = floor(split_size * nrow(mtcars))

###Reproducability and defines rows for training data###
set.seed(123)
train_indices <- sample(seq_len(nrow(mtcars)), size=sample_size)

###Splits data###
train <- mtcars[train_indices,]
test <- mtcars[-train_indices,]

###A practice regression, compute RMSE###
model2 <- lm(mpg ~ disp, data = train)
new.data <- data.frame(disp = test$disp)
test$output <- predict(model2, new.data)
sqrt(sum(test$mpg - test$output)^2/nrow(test))



