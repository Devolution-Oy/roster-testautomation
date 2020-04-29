FROM devolutionfinland/rf-docker-base:1.0.0

COPY --chown=robot:robot requirements.txt /home/robot/.

RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/tini", "--", "xvfb-run", "python3", "run.py"]
