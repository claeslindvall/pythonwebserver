FROM ubuntu
RUN apt update 
RUN apt install iproute2 python3 -y
RUN apt clean
ADD index.html index.html
ADD server.py server.py
EXPOSE 9000
# ENTRYPOINT ["/usr/local/bin/python3", "/server.py"]
RUN export PATH=$PATH:/usr/local/bin
RUN echo $PATH
RUN ["/usr/bin/python3 /server.py"]
# CMD ["/usr/local/bin/python3 /server.py"]
# CMD ["python3", "server.py"]
# CMD ["sleep", "10"]

