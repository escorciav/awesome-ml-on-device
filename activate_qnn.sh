# Activation script for Qualcomm AI Direct Engine: QNN
# https://www.qualcomm.com/developer/software/qualcomm-ai-engine-direct-sdk
#
# Usage: source activate_qnn.sh
#
# Note: Program written assuming that user uses QNN as part of (Python) AutoCaML toolkit 
#
QNN_DIR=$USER_LOCAL/qnn
# Use this till version 2.21.0.240401
proj_conda_env=qnn
# Use this from 2.22.6.240515 till version ?
proj_conda_env=qnn2

# 1. List available versions
echo 🚀 Activating conda env, for qnn: $proj_conda_env
conda activate $proj_conda_env

# 2. List available versions
echo "Available versions:"
ls $QNN_DIR | grep -v activate_qnn.sh | awk -F'-v' '{print $2}'

# 3. Set the latest version as QNN_SDK_ROOT
latest_version=$(ls $QNN_DIR | grep -v activate_qnn.sh | sort -V | tail -n 1 | awk -F'-v' '{print $2}')
export QNN_SDK_ROOT=$QNN_DIR/qnn-v$latest_version

# 4. QNN setup
echo "QNN_SDK_ROOT set to: $QNN_SDK_ROOT"
if [ -d "$QNN_SDK_ROOT" ]; then
    echo 🚀 QNN found: $QNN_SDK_ROOT
    echo 🚀 Updating PATH and PYTHONPATH env-vars with QNN binaries and libraries
    export PATH=${QNN_SDK_ROOT}/bin/x86_64-linux-clang:${PATH}
    export PYTHONPATH=${QNN_SDK_ROOT}/benchmarks/QNN/:${QNN_SDK_ROOT}/lib/python:${PYTHONPATH}
    export LD_LIBRARY_PATH=${QNN_SDK_ROOT}/lib/x86_64-linux-clang:${LD_LIBRARY_PATH}
else
    echo "⚠️ $QNN_SDK_ROOT does not exist❗"
fi
