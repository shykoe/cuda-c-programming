#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>

using namespace std;

void GetCudaImfo() {
  int deviceCount;
  cudaGetDeviceCount(&deviceCount);
  int dev;
  for (dev = 0; dev < deviceCount; dev++) {
    int driver_version(0), runtime_version(0);
    cudaDeviceProp deviceProp;
    cudaGetDeviceProperties(&deviceProp, dev);
    if (dev == 0)
      if (deviceProp.minor = 9999 && deviceProp.major == 9999)
        cout << endl;
    cout << "使用GPU device " << dev << ": " << deviceProp.name << endl;
    cudaDriverGetVersion(&driver_version);
    cout << "CUDA驱动版本:" << driver_version / 1000 << "."
         << (driver_version % 1000) / 10 << endl;
    cudaRuntimeGetVersion(&runtime_version);
    cout << "CUDA运行时版本:" << runtime_version / 1000 << "."
         << (runtime_version % 1000) / 10 << endl;
    cout << "设备计算能力:" << deviceProp.major << "." << deviceProp.minor
         << endl;
    cout << "显卡时钟频率:" << deviceProp.clockRate * 1e-6f << " GHz" << endl;
    cout << "内存时钟频率:" << deviceProp.memoryClockRate * 1e-3f << " MHz"
         << endl;
    cout << "内存总线带宽:" << deviceProp.memoryBusWidth << " bit" << endl;
    cout << "总显存大小:" << deviceProp.totalGlobalMem / (1024.0 * 1024.0)
         << " MB" << endl;
    cout << "总常量内存大小:" << deviceProp.totalConstMem / 1024.0 << " KB"
         << endl;
    cout << "SM数量:" << deviceProp.multiProcessorCount << endl;
    cout << "每个SM最大线程数:" << deviceProp.maxThreadsPerMultiProcessor
         << endl;
    cout << "每个线程块(block)共享内存大小:"
         << deviceProp.sharedMemPerBlock / 1024.0 << " KB" << endl;
    cout << "每个线程块(block)的最大线程数:" << deviceProp.maxThreadsPerBlock
         << endl;
    cout << "每个线程块(block)的最大可用寄存器数:" << deviceProp.regsPerBlock
         << endl;
    cout << "线程束(wrap)尺寸:" << deviceProp.warpSize << endl;
    cout << "每个线程块(block)各个维度最大尺寸:" << deviceProp.maxThreadsDim[0]
         << " x " << deviceProp.maxThreadsDim[1] << " x "
         << deviceProp.maxThreadsDim[2] << endl;
    cout << "每个线程格(grid)各个维度最大尺寸:" << deviceProp.maxGridSize[0]
         << " x " << deviceProp.maxGridSize[1] << " x "
         << deviceProp.maxGridSize[2] << endl;
    cout << "最大存储间距:" << deviceProp.memPitch / (1024.0 * 1024.0) << " MB"
         << endl;
  }
}

int main() {
  GetCudaImfo();

  return 0;
}