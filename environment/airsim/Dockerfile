# Use NVIDIA base image with CUDA support for GPU acceleration
FROM nvidia/cudagl:10.0-devel-ubuntu18.04

# Set environment variable to non-interactive to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-key del 3bf863cc
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

# Update the package list and install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean
# # Install curl, gnupg, and other necessary dependencies
# RUN apt-get update && apt-get install -y \
#     curl \
#     gnupg \
#     git \
#     cmake \
#     build-essential \
#     wget \
#     python3-pip \
#     python3-dev \
#     python3-venv \
#     libglib2.0-0 \
#     libsm6 \
#     libxext6 \
#     libxrender-dev

RUN git clone -b 4.27 git@github.com:EpicGames/UnrealEngine.git
RUN cd UnrealEngine
RUN ./Setup.sh
RUN ./GenerateProjectFiles.sh
RUN make

RUN cd ..

# Clone the AirSim repository
RUN git clone https://github.com/microsoft/AirSim.git /AirSim

# Set the working directory to AirSim
WORKDIR /AirSim

RUN ./setup.sh
RUN ./build.sh

# # Install dependencies and build AirSim
# RUN cd Airsim/docker
# RUN bash ./download_blocks_env_binary.sh
# RUN bash ./run_airsim_image_binary.sh DOCKER_IMAGE_NAME UNREAL_BINARY_SHELL_SCRIPT UNREAL_BINARY_ARGUMENTS -- headless

# # Set the working directory for running AirSim
# WORKDIR /AirSim/Blocks

# # Expose necessary ports (optional for API communication)
# EXPOSE 9090

# # Default command to run AirSim
# CMD ["./Blocks.sh", "-windowed", "-ResX=1080", "-ResY=720"]