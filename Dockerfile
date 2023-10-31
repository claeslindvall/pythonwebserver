FROM python:3
ADD index.html index.html
ADD server.py server.py
EXPOSE 9000
# ENTRYPOINT ["/usr/local/bin/python3", "/server.py"]
RUN export PATH=$PATH:/usr/local/bin
RUN echo $PATH
# CMD ["/usr/local/bin/python3 /server.py"]
CMD ["python3", "serrver.py"]

