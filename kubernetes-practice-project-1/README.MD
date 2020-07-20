# Project Sentiment Analyzer  

The application has one functionality.  
It takes one sentence as input. Using Text Analysis, calculates the emotion of the sentence.  

From the technical perspective, the application consists of three microservices.  
Each has one specific functionality:

SA-Frontend: a Nginx web server that serves ReactJS static files.  
SA-WebApp: a Java Web Application that handles requests from the frontend.  
SA-Logic: a python application that performs Sentiment Analysis. 

To run SA-Frontend:

kubectl apply -f sa-frontend-deployment.yaml

To run SA-Frontend service:

kubectl apply -f service-sa-frontend-lb.yaml 

To run SA-WebApp:

kubectl apply -f sa-web-app-deployment.yaml

To run SA-WebApp service:

kubectl apply -f service-sa-web-app-lb.yaml 

To run SA-Logic:

kubectl apply -f sa-logic-deployment.yaml

To run SA-Logic service:

kubectl apply -f service-sa-logic.yaml 