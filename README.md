# processing-pipe
A Docker image that can help you create image processing pipelines or file processing pipelines

## What this image can do for me
This image can help you create automated image or generic file processing pipelines with ease, it can automatically detect new files in the "input" directory, pass the filenames to a script for processing and then place the results to the "output" directory

## How it works
The Dockerfile installs two packages, imagemagick for image processing tools and inotify-tools to monitor the "input" directory for new files,if a new file detected then passes the filename to the script located to ./configuration/conf.sh script as first argument, feel free to modify this script or the packages installed with the image to match your needs, in this example i resize the file by 50% and move the file to the "output" directory
```
convert /app/input/$1 -resize 50% /app/output/resize_50_$1
```
## building image
```
Docker build . -t image_processing
```
## Running example

This example uses the conf.sh file that allready exists in the ./configuration directory
```
docker run --rm --name mycontainer -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output -v $(pwd)/configuration:/app/configuration image_processing
```

dropping a jpg file in the input directory will trigger the ./conf.sh file and will generate in ./output the jpg file resized by 50%
