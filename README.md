
# terraform-angle

This will deploy the docker ngnix latest version to the Azure App service.

The ngnix web app is accessed only from a local ip and egrees ip . Rest all the connections are blocked

https://az-nginx-angle-dockerapp.azurewebsites.net/
or 
http://az-nginx-angle-dockerapp.azurewebsites.net/

Discuss briefly the pros an cons of the chosen solution. What benefits does it have? What kind of limitations or tradeoffs?

- The solution can easily spinup the ngnix docker Azure app service with dns mapping achieving easily public internet access.
- The providers used are deprecated in the next future release.
- It is a static nginx index.html webpage . 
- No data volumes are presisted for the docker
- No specific application is deployed.
- scm access of app service is not restricted


How would you expand this solution to a real world production deployment, taking into consideration the sensitive nature of healthcare sector and its strict compliance and data security requirements?

- Limit the access to specific IPS or subnets within azure or block according to the needs
- Enhanced to scale-in/scale-out depending on traffic ,usage
- Application Load balancer can be spined up for secure access  and traffic routing
- zone redunency can be achieved to make it available 24/7
- For GDPR , the user data (PI ) data can be restricted by encryption to avoid middle man attacts
- layer caching can be achieved for faster access of application
