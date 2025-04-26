# Welcome to Your New Website/Portfolio Powered By Jupyterbook!

If you're on the Repo You can see the pinned link on the right to a preview of the website.

## Directions 

 ### Enable Write Permissions for GITHUB_TOKEN
 - Go to your GitHub repository
 - Click Settings (you'll need to be an admin).
 - On the left sidebar, go to Actions → General
 - Scroll down to Workflow permissions
 - Select ✅ Read and write permissions
 - Click Save

### Deploy Website from Branch
- Go to settings and find pages on the left
- Under Build and Deployment make the source "deploy from branch"
- set the source to gh-pages in the root
- If the gh-pages does does not exist you must make a commit to main and the workflow should create it automatically
- save and make some sort of commit
- Your website link is now in pages after you make a commit

### Files in the Root
- _toc.yml is for setting file locations and captions
- _config.yml is for author names and logos
- See the docs [here](https://jupyterbook.org/en/stable/intro.html) for more info on customization
- Note you may want to make this Repo **Private!** Your website will still be **public**.

**I did not create Jupyterbook I simply made this template!**
