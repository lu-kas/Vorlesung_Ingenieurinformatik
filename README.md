# Vorlesung_Ingenieurinformatik

## Docker
1. Build  
`docker build -t jupyterbook_img .`

2. Run Container  
`docker run -d -p 4000:4000 --name jupyter_book jupyterbook_img`

3. Access jupyter_book  
Browser URL: 0.0.0.0:4000
