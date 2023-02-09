1. Clone this repo to a folder "proton-validation-lambda" that has the following files
   - Dockerfile
   - app
     - app.py
     - test.sh
   - inputs
     - rule.guard
     - sample.yaml
2. Create an ECR repository from AWS Console
3. Follow the "Push Commands" in console to push the docker image to ECR
   - We will use this image in Lambda
4. Create a lambda function that points to this ECR image
5. Click test



