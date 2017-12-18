FROM nanshe/nanshe:latest
MAINTAINER John Kirkham <jakirkham@gmail.com>

RUN for PYTHON_VERSION in 2 3; do \
        # Pin `jupyter_client` to workaround an issue with `pytest`.
        # Please see the linked PR.
        #
        # https://github.com/conda-forge/jupyter_client-feedstock/pull/14
        #
        echo "jupyter_client 5.1.0" >> "/opt/conda${PYTHON_VERSION}/conda-meta/pinned" && \
        export INSTALL_CONDA_PATH="/opt/conda${PYTHON_VERSION}" && \
        . ${INSTALL_CONDA_PATH}/bin/activate root && \
        conda install -qy -n root notebook && \
        python -m ipykernel install && \
        conda clean -tipsy ; \
    done ; \
    mkdir -p /notebooks

ENTRYPOINT [ "/opt/conda/bin/tini", "--", "/usr/share/docker/entrypoint.sh", "python3", "-m", "notebook", "--allow-root", "--no-browser", "--ip=*" , "--notebook-dir=/notebooks"]
