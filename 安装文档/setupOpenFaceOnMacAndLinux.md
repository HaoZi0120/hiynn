# Installing open face using `conda` (OSX and GNU/Linux)

Step 1. Install `miniconda` with the following commands  
* `wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh`  
* `bash Miniconda3-latest-Linux-x86_64.sh` and follow instructions.  
* Add a Python 2.7 environment with: `conda create --name openface python=2.7`  
* Activate the new env with: `source activate openface`  

Step 2. Install dependencies  
* Add the `conda-forge` channel with: `conda config --add channels conda-forge`  
* `conda install numpy  txaio twisted autobahn OpenSSL pyopenssl imagehash ervice_identity`  
* `conda install opencv==2.4.13.4`  

Step 3. Install Torch and dependencies  
* Deactivate the `openface` environment by opening a new terminal.  
* `git clone https://github.com/torch/distro.git ~/torch --recursive`  
* `cd ~/torch; bash install-deps;`  
* `./install.sh`  
* add ". ~/torch/install/bin/torch-activate" to ~/.bash_profile  
* `source ~/.bash_profile`  
* `cd ~/torch/install/bin`    
* Execute the following to install the Torch deps `for NAME in dpnn nn optim optnet csvigo cutorch cunn fblualib torchx tds; do ./luarocks install $NAME; done`  

Step 4. Install open face in `openface` environment using  
* `source activate openface`  
* `git clone https://github.com/cmusatyalab/openface.git ~/openface`  
* `cd openface`  
* `python setup.py install`  
* Download `dlib`s models with: `./models/get-models.sh`  

Open face is now installed. Test it with  
* `./demos/classifier.py infer models/openface/celeb-classifier.nn4.small2.v1.pkl ./images/examples/carell.jpg` 
