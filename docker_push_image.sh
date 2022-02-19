# Build the Image
docker build -t stratos-delegation-tropos01 .

# Tag it 
docker tag stratos-delegation-tropos01:latest cyberguy85/stratos-delegation-tropos01:latest

# Push it
docker push cyberguy85/stratos-delegation-tropos01:latest