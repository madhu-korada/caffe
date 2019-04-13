# Caffe CIFAR 10

CIFAR 10 in Caffe

# Executing command

Clone the repository and build
```
git clone https://github.com/madhu-korada/caffe.git
mkdir build
cd build
cmake ..
make all
```
go to the location
```
cd build/examples/classification
```
use this command to do the classification task

```
classification deploy.prototxt cifar10_full_iter_10375.caffemodel mean.binaryproto batches.meta.txt bird.jpg
```
or
```
./build/examples/cpp_classification/classification deploy.prototxt cifar10_full_iter_100000.caffemodel mean.binaryproto batches.meta.txt bird.jpg
```
sample_images

![alt text](https://github.com/madhu-korada/caffe/blob/master/Pictures/prediction.png)

![alt text](https://github.com/madhu-korada/caffe/blob/master/Pictures/prediction2.png)

![alt text](https://github.com/madhu-korada/caffe/blob/master/Pictures/prediction3.png)

Above mentioned classification file takes 5 arguments as followed. 
1. network prototxt file
2. caffemodel file
3. binaryproto file
4. labels file
5. image file

# Steps followed by me

Data collection

This script downloads cifar10 data and unzips it.
```
./data/cifar10/get_cifar10.sh
```

This script converts image data to LMDB format
```
./examples/cifar10/create_cifar10.sh
```
#### Creating the network prototxt file
  
2 Architectures. [Training](https://github.com/madhu-korada/caffe/blob/master/examples/cifar10/madhu/train.prototxt), [Deploying](https://github.com/madhu-korada/caffe/blob/master/examples/cifar10/madhu/deploy.prototxt)
 
Reference network architecture [link](https://github.com/madhu-korada/caffe/blob/master/examples/cifar10/madhu/cifar%20network.jpeg) [link](https://github.com/madhu-korada/caffe/blob/master/examples/cifar10/madhu/Cifar%20network.PNG)

Steps for writting network architecture
  
1. Creating two phases at the data layer (Train, Test)

2. Starting on with layers with reference(link)

3. Initializing weights in conv and FullyConnected layers (For Deploy network not needed)

4. Ending with SoftMaxLoss layer (For Deploy network only SoftMax)

5. 2 bottoms for Softmax layer For training network

#### Solverstate file

Defining the net > Defining Hyperparameters > RMSprop optimizer > Solver mode(CPU or GPU)

#### Training
```
./examples/cifar10/madhu/train_quick.sh
```

accuracy at 50000 iteration 74.2 % 


![alt text](https://github.com/madhu-korada/caffe/blob/master/Pictures/training50000.png)



accuracy at 200000 iterations 76.19 %


![alt text](https://github.com/madhu-korada/caffe/blob/master/Pictures/training76.png)


accuracy at 440000 iterations 78.01 %

![alt text](https://github.com/madhu-korada/caffe/blob/master/Pictures/training.png)

## Installation Steps

Setup Details

 - Ubuntu 16.04
 
 - Geforce GTX 1070

 - CUDA 9.0

 - cuDNN 7.4

Installing drivers
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install git curl cmake
```
Adding proprietary graphic drivers PPA to system
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
```
Go too virtual console (Alt + ctrl + F1)

Installing Drivers
```
sudo apt-get install nvidia-384
sudo reboot
```
checking
```
nvidia-smi
```

Download CUDA from nvidia cuda archive website
```
cd ~/Downloads
sudo sh cuda_9.0.176_384.81_linux.run
sudo sh cuda_9.0.176.1_linux.run
similarly run for all the downloaded patches
```

cuDNN
```
sudo tar -xzvf cudnn-9.0-linux-x64-v7.4.1.5.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```
add these in bashrc file
```
export CUDA_HOME=/usr/local/cuda
export PATH=/usr/local/cuda/bin:$PATH
export CPATH=/usr/local/cuda/include:$CPATH
export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
```
```
source ~/.bashrc
nvcc -V
```

OpenCV 3.X
```
cd~
git clone https://github.com/anujonthemove/opencv3-installation.git
cd opencv3-installation 
sh install-opencv.sh
```


CAFFE

Installing the Dependencies

```
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev \
libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler
sudo apt-get install -y --no-install-recommends libboost-all-dev
```
clone the repository
```
git clone https://github.com/BVLC/caffe
cd caffe
```

make a copy of the config file

```
cp Makefile.config.example Makefile.config
```

follow this [link](https://medium.com/@anujonthemove/deep-learning-environment-setup-on-ubuntu-16-04-83078e1cba1f) to setup opencv ,cuda and 
follow this [link](https://chunml.github.io/ChunML.github.io/project/Installing-Caffe-Ubuntu/) for installing caffe

