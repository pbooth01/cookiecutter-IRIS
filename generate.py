import os
import sys
from pick import pick
from cookiecutter.main import cookiecutter

def getIRISSelection():
    title = 'Please choose the type of project you want to generate: '
    options = ['IRIS-DB', 'IRIS-INT']
    return pick(options, title, multiselect=False, min_selection_count=1)

def getAction():
    title = 'Welcome to the InterSystems Project generator, what would you like to do?'
    options = ['Generate Project', 'Exit']
    return pick(options, title, multiselect=False, min_selection_count=1)

def createProject(projectType: str) -> None:
    cwd = os.getcwd()
    try: 
        os.chdir('generated_projects')
        Template = "../Templates/{projectType}".format(projectType = projectType)
        cookiecutter(Template) 
        
    # Caching the exception     
    except: 
        print("Something wrong with specified directory. Exception- ", sys.exc_info()) 
                
    # handling with finally           
    finally:  
        os.chdir(cwd) 

def generate():
    isActive = True
    projectType = ""

    curActionOption, curActionIndex = getAction()
    if curActionOption != 'Exit':
        print("Starting Project Generation Process")
        projectType, curProjectIndex = getIRISSelection()
        createProject(projectType)
             
def main():
    generate()

if __name__ == "__main__":
    main()
