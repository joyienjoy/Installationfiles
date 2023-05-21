def jobName = "Pipeline-stage-3"    #Use the pipeline name here

def job = Jenkins.instance.getItem(jobName)

job.getBuilds().each { it.delete() }  

job.nextBuildNumber = 1   

job.save()
