1. Create a project with the following files in the folder "proton-validations" -
   - inputs
     - rule.guard
     - sample.yaml 
   - buildspec.yml
2. Navigate to "proton-validations" folder and zip the files to upload to S3
   `zip -r proton-validations.zip .`
3. Create S3 bucket with name "proton-validations-codebuild"
3. Create a codebuild project with following details -
   - Source Provider = S3
   - Bucket = proton-validations-codebuild
   - S3 object key or S3 folder = proton-validations.zip (this is the name you've given in step [2])
4. Start build from CodeBuild Console