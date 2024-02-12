ARG BASE_IMAGE
FROM $BASE_IMAGE

# customize bash
COPY bashrc-git-prompt /tmp/
RUN curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh >> /etc/skel/.bashrc \
    && cat /tmp/bashrc-git-prompt >> /etc/skel/.bashrc \
    && rm -rf /tmp/bashrc-git-prompt \
    && echo "source /opt/ros/humble/setup.bash" >> /etc/skel/.bashrc

# install apt packages
RUN apt update && apt install -y --no-install-recommends \
   gdb \
   python3-autopep8 \
   python3-ipykernel \
   ros-humble-ackermann-msgs \
   ros-humble-cartographer-ros \
   ros-humble-gscam \
   ros-humble-nav2-map-server \
   ros-humble-serial-driver \
   ros-humble-urg-node \
   vim

# install python packages
RUN python3 -m pip --no-cache-dir install \
    argparse \
    casadi \
    git+https://github.com/CL2-UWaterloo/trajectory_planning_helpers.git \
    quadprog \
    scikit-learn \
    scikit-image

# set up entrypoint
COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]

CMD ["/bin/bash"]

