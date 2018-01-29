FROM nanshe/nanshe:sge
MAINTAINER John Kirkham <jakirkham@gmail.com>

RUN for PYTHON_VERSION in 2 3; do \
        export INSTALL_CONDA_PATH="/opt/conda${PYTHON_VERSION}" && \
        . ${INSTALL_CONDA_PATH}/bin/activate root && \
        conda install -qy -n root notebook && \
        python -m ipykernel install && \
        conda clean -tipsy ; \
    done ; \
    mkdir -p /notebooks

ENTRYPOINT [ "/opt/conda/bin/tini", "--", "/usr/share/docker/entrypoint.sh", "python3", "-m", "notebook", "--allow-root", "--no-browser", "--ip=*" , "--notebook-dir=/notebooks"]
