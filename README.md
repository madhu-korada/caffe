# Caffe CIFAR 10

CIFAR 10 in Caffe

# Executing command

Clone the repository
```
git clone https://github.com/madhu-korada/caffe.git
```
go to the location
```
cd build/examples/classification
```
use this command to do the classification task
```
classification deploy.prototxt cifar10_full_iter_36.caffemodel mean.binaryproto batches.meta.txt cat.jpg
```
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
  
2 Architectures. Training, Deploying
 
Reference network architecture (link)

Steps for writting network architecture
  
1. Creating two phases at the data layer (Train, Test)

2. Starting on with layers with reference(link)

3. Initializing weights in conv and FullyConnected layers (For Deploy network not needed)

4. Ending with SoftMaxLoss layer (For Deploy network only SoftMax)

5. 2 bottoms for Softmax layer


Training
```
./examples/cifar10/madhu/train_quick.sh
```

Since i used CPU it took a lot of time for me to train, so i stopped at 1000 iteration. Loss didn't seem to go down much till 1000 iterations. Learning rate was kept 0.001. 


