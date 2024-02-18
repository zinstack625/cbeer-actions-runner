FROM ghcr.io/actions/actions-runner:latest
    MAINTAINER Anton Klimanov       <klimanov625@outlook.com>

USER root
RUN usermod -aG sudo root && \
    apt-get update -y && \
    apt-get install -y \
        build-essential \
        cmake \
        git \
        libgtest-dev \
        libgmock-dev \
        gcovr \
        meson \
        python3 \
        python3-pip \
        curl \
        unzip    && \
    python3 -m pip install cpplint && \
    curl -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip -o sonarscanner.zip && \
    unzip sonarscanner.zip -d /opt/ && \
    apt-get remove unzip -y && \
    rm -rf sonarscanner.zip /var/lib/apt/lists/*
USER runner
ENV PATH "/opt/sonar-scanner-5.0.1.3006-linux/bin:${PATH}"
