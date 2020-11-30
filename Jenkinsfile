node { 
stage('Code Checkout') { 
cleanWs() 
checkout scm 

env.branch_name = scm.branches[0].name 
if ( env.branch_name == 'master' ){ 
env.environment = 'prod' 
} 
else if ( env.branch_name == 'release' ){ 
env.environment = 'test' 
} 
else if ( env.branch_name == 'develop' ){ 
env.environment = 'dev' 
} 
else { 
echo "Branch Not Matched " 
} 
} 
stage('Jira Update') { 
 withCredentials([usernamePassword(credentialsId: 'jira_cred', passwordVariable: 'jpassword', usernameVariable: 'jusername')]) {
	    sh 'sh jirav1.sh "$jusername" "$jpassword"'
	    }
} 
}
