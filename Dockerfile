# syntax=docker/dockerfile:1
#ABESIT DGX 
#FROM nvcr.io/nvidia/pytorch:22.11-py3 
# GLB DGX
#20.12-py3 
FROM python:3.8-slim-buster

#Upgrade pip
#RUN /usr/bin/python -m pip install --upgrade pip

#https://grigorkh.medium.com/fix-tzdata-hangs-docker-image-build-cdb52cc3360d
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /Multi-Person-Face-Recognition
#COPY requirements\.txt requirements\.txt
RUN pip3 install torch==1.7.0+cpu torchvision==0.8.1+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install cmake
RUN apt-get update 
RUN apt-get install -y build-essential
RUN pip install --no-build-isolation --no-binary face-recognition-models visitor lit
RUN pip3 install absl-py==1.3.0
RUN pip3 install asttokens==2.1.0
RUN pip3 install backcall==0.2.0
RUN pip3 install cachetools==5.2.0
RUN pip3 install certifi==2022.9.24
RUN pip3 install charset-normalizer==2.1.1
RUN pip3 install click==8.1.3
RUN pip3 install contourpy==1.0.6
RUN pip3 install cycler==0.11.0
RUN pip3 install decorator==5.1.1
RUN pip3 install dlib==19.24.0
RUN pip3 install dominate==2.7.0
RUN pip3 install executing==1.2.0
RUN pip3 install face-recognition==1.3.0
RUN pip3 install face-recognition-models==0.3.0
RUN pip3 install Flask>=2.2.2
RUN pip3 install Flask-Bootstrap
RUN pip3 install fonttools==4.38.0
#google-api-core==2.11.0
#google-api-python-client==2.71.0
#google-auth==2.14.1
#google-auth-httplib2==0.1.0
#google-auth-oauthlib==0.8.0
#googleapis-common-protos==1.58.0
RUN pip3 install grpcio==1.50.0
RUN pip3 install httplib2==0.21.0
RUN pip3 install idna==3.4
RUN pip3 install importlib-metadata==5.0.0
RUN pip3 install ipython==8.6.0
RUN pip3 install itsdangerous==2.1.2
RUN pip3 install jedi==0.18.1
RUN pip3 install Jinja2==3.1.2
RUN pip3 install kiwisolver==1.4.4
RUN pip3 install Markdown==3.4.1
RUN pip3 install MarkupSafe==2.1.1
RUN pip3 install matplotlib==3.6.2
RUN pip3 install matplotlib-inline==0.1.6
RUN pip3 install numpy==1.23.4
RUN pip3 install oauthlib==3.2.2
RUN pip3 install opencv-python
RUN pip3 install packaging==21.3
RUN pip3 install pandas==1.5.1
RUN pip3 install parso==0.8.3
RUN pip3 install pexpect==4.8.0
RUN pip3 install pickleshare==0.7.5
RUN pip3 install Pillow==9.3.0
RUN pip3 install prompt-toolkit==3.0.32
#protobuf==4.21.12
RUN pip3 install protobuf3
RUN pip3 install psutil==5.9.4
RUN pip3 install ptyprocess==0.7.0
RUN pip3 install pure-eval==0.2.2
RUN pip3 install pyasn1==0.4.8
RUN pip3 install pyasn1-modules==0.2.8
RUN pip3 install Pygments==2.13.0
RUN pip3 install pyparsing==3.0.9
RUN pip3 install python-dateutil==2.8.2
RUN pip3 install pytz==2022.6
RUN pip3 install PyYAML
RUN pip3 install requests==2.28.1
RUN pip3 install requests-oauthlib==1.3.1
RUN pip3 install rsa==4.9
RUN pip3 install scipy==1.9.3
RUN pip3 install seaborn==0.12.1
RUN pip3 install six==1.16.0
RUN pip3 install stack-data==0.6.1
RUN pip3 install tensorboard==2.11.0
RUN pip3 install tensorboard-data-server==0.6.1
RUN pip3 install tensorboard-plugin-wit==1.8.1
RUN pip3 install thop==0.1.1.post2209072238
RUN pip3 install tqdm==4.64.1
RUN pip3 install traitlets==5.5.0
RUN pip3 install typing-extensions==4.4.0
RUN pip3 install uritemplate==4.1.1
RUN pip3 install urllib3==1.26.12
RUN pip3 install validators==0.20.0
RUN pip3 install visitor==0.1.3
RUN pip3 install wcwidth==0.2.5
RUN pip3 install Werkzeug==2.2.2
RUN pip3 install WTForms==3.0.1
RUN pip3 install zipp==3.10.0
RUN apt update -y
RUN apt install ffmpeg libsm6 libxext6  -y

#Gmail APIs
RUN pip3 install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib

COPY . .

CMD [ "python3", "-m" , "flask", "--app", "app", "run", "--host=0.0.0.0"]
