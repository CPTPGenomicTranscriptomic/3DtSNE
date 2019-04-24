3DtSNE
========
A Shiny app to explore t-SNE representation.

*****

Launch R3DtSNE directly from R and GitHub (preferred approach)

User can choose to run 3DtSNE installed locally for a more preferable experience.

**Step 1: Install R and RStudio**

Before running the app you will need to have R and RStudio installed (tested with R 3.5.3 and RStudio 1.1.463).  
Please check CRAN (<a href="https://cran.r-project.org/" target="_blank">https://cran.r-project.org/</a>) for the installation of R.  
Please check <a href="https://www.rstudio.com/" target="_blank">https://www.rstudio.com/</a> for the installation of RStudio.  

**Step 2: Install the R Shiny package and other packages required by 3DtSNE**

Start an R session using RStudio and run this line:  
```
if (!require("shiny")){install.packages("shiny")}  
```

**Step 3: Start the app**  

Start an R session using RStudio and run this line:  
```
shiny::runGitHub("3DtSNE", "mlebeur")
```
This command will download the code of 3DtSNE from GitHub to a temporary directory of your computer and then launch the 3DtSNE app in the web browser. Once the web browser was closed, the downloaded code of 3DtSNE would be deleted from your computer. Next time when you run this command in RStudio, it will download the source code of 3DtSNE from GitHub to a temporary directory again. 


## Step 4: Choose your analysis set up  

**1. Upload your txt file:**

You can upload only one *.txt files using tabultations as separator.

The file must contain a header aka column names. One of theses names should be "label" and refers to the clustering result.

The files must have the .txt extension to appear in the selection browser.

Be aware that The application is limited to 500Mo of RAM.

The blue progress bar should move until the message \"upload complete\" appears.


**2. Have fun:**

Nice!
