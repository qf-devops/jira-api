    import requests      
    url = "https://devopsmar12019.atlassian.net/rest/api/latest/issue/QUIC-3/transitions" 
    user = "devops.mar1.2019@gmail.com"
    passwd = "wlhokM24ZGIjjYwNXxKXDC67" 
     
    # Make a request to the endpoint using the correct auth values 
    auth_values = (user, passwd) 
    response = requests.get(url, auth=auth_values) 
     
    # Convert JSON to dict and print 
    print(response.json()) 
