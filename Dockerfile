FROM nanshe/nanshe:latest
MAINTAINER John Kirkham <jakirkham@gmail.com>

RUN for PYTHON_VERSION in 2 3; do \
        mkdir -p /notebooks && \
        export INSTALL_CONDA_PATH="/opt/conda${PYTHON_VERSION}" && \
        . "${INSTALL_CONDA_PATH}/etc/profile.d/conda.sh" && \
        conda activate base && \
        conda install -qy notebook && \
        python -m ipykernel install --prefix "/opt/conda2" && \
        python -m ipykernel install --prefix "/opt/conda3" && \
        conda clean -tipsy && \
        conda deactivate && \
        rm -rf ~/.conda ; \
    done

ENTRYPOINT [ "/opt/conda/bin/tini", "--", "/usr/share/docker/entrypoint.sh", "python3", "-m", "notebook", "--allow-root", "--no-browser", "--ip=*" , "--notebook-dir=/notebooks" ]
