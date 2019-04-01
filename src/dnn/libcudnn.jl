cudnnGetVersion() = ccall((:cudnnGetVersion,libcudnn), Cint, ())

cudnnGetErrorString(status) = ccall((:cudnnGetErrorString,libcudnn), Ptr{UInt8}, (cudnnStatus_t,), status)

function cudnnCreate()
    handle = Ref{cudnnHandle_t}()
    @check ccall((:cudnnCreate,libcudnn), cudnnStatus_t, (Ptr{cudnnHandle_t},), handle)
    return handle[]
end

function cudnnDestroy(handle)
    @check ccall((:cudnnDestroy,libcudnn), cudnnStatus_t, (cudnnHandle_t,), handle)
end

function cudnnCreateTensorDescriptor(tensorDesc)
    @check ccall((:cudnnCreateTensorDescriptor,libcudnn),
                 cudnnStatus_t,
                 (Ptr{cudnnTensorDescriptor_t},),
                 tensorDesc)
end

function cudnnSetTensorNdDescriptor(tensorDesc,dataType,nbDims,dimA,strideA)
    @check ccall((:cudnnSetTensorNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnTensorDescriptor_t,cudnnDataType_t,Cint,Ptr{Cint},Ptr{Cint}),
                 tensorDesc,dataType,nbDims,dimA,strideA)
end

function cudnnGetTensorNdDescriptor(tensorDesc,nbDimsRequested,dataType,nbDims,dimA,strideA)
    @check ccall((:cudnnGetTensorNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnTensorDescriptor_t,Cint,Ptr{cudnnDataType_t},Ptr{Cint},Ptr{Cint},Ptr{Cint}),
                 tensorDesc,nbDimsRequested,dataType,nbDims,dimA,strideA)
end

function cudnnDestroyTensorDescriptor(tensorDesc)
    @check ccall((:cudnnDestroyTensorDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnTensorDescriptor_t,),
                 tensorDesc)
end

function cudnnCreateFilterDescriptor(filterDesc)
    @check ccall((:cudnnCreateFilterDescriptor,libcudnn),
                 cudnnStatus_t,
                 (Ptr{cudnnFilterDescriptor_t},),
                 filterDesc)
end

function cudnnSetFilterNdDescriptor(filterDesc,dataType,nbDims,filterDimA)
    @check ccall((:cudnnSetFilterNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnFilterDescriptor_t,cudnnDataType_t,Cint,Ptr{Cint}),
                 filterDesc,dataType,nbDims,filterDimA)
end

function cudnnSetFilterNdDescriptor(filterDesc,dataType,format,nbDims,filterDimA)
    @check ccall((:cudnnSetFilterNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnFilterDescriptor_t,cudnnDataType_t,cudnnTensorFormat_t,Cint,Ptr{Cint}),
                 filterDesc,dataType,format,nbDims,filterDimA)
end

function cudnnSetFilterNdDescriptor_v4(filterDesc,dataType,format,nbDims,filterDimA)
    @check ccall((:cudnnSetFilterNdDescriptor_v4,libcudnn),
                 cudnnStatus_t,
                 (cudnnFilterDescriptor_t,cudnnDataType_t,cudnnTensorFormat_t,Cint,Ptr{Cint}),
                 filterDesc,dataType,format,nbDims,filterDimA)
end

function cudnnGetFilterNdDescriptor(filterDesc,nbDimsRequested,dataType,nbDims,filterDimA)
    @check ccall((:cudnnGetFilterNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnFilterDescriptor_t,Cint,Ptr{cudnnDataType_t},Ptr{Cint},Ptr{Cint}),
                 filterDesc,nbDimsRequested,dataType,nbDims,filterDimA)
end

function cudnnGetFilterNdDescriptor_v4(filterDesc,nbDimsRequested,dataType,format,nbDims,filterDimA)
    @check ccall((:cudnnGetFilterNdDescriptor_v4,libcudnn),
                 cudnnStatus_t,
                 (cudnnFilterDescriptor_t,Cint,Ptr{cudnnDataType_t},Ptr{cudnnTensorFormat_t},Ptr{Cint},Ptr{Cint}),
                 filterDesc,nbDimsRequested,dataType,format,nbDims,filterDimA)
end

function cudnnDestroyFilterDescriptor(filterDesc)
    @check ccall((:cudnnDestroyFilterDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnFilterDescriptor_t,),
                 filterDesc)
end

function cudnnCreateConvolutionDescriptor(convDesc)
    @check ccall((:cudnnCreateConvolutionDescriptor,libcudnn),
                 cudnnStatus_t,
                 (Ptr{cudnnConvolutionDescriptor_t},),
                 convDesc)
end

function cudnnSetConvolutionNdDescriptor(convDesc,arrayLength,padA,filterStrideA,dilationA,mode,dataType)
    @check ccall((:cudnnSetConvolutionNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnConvolutionDescriptor_t,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},
                  cudnnConvolutionMode_t,cudnnDataType_t),
                 convDesc,arrayLength,padA,filterStrideA,dilationA,mode,dataType)
end

function cudnnGetConvolutionNdDescriptor(convDesc,arrayLengthRequested,arrayLength,padA,strideA,dilationA,mode,dataType)
    @check ccall((:cudnnGetConvolutionNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnConvolutionDescriptor_t,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint},
                  Ptr{cudnnConvolutionMode_t},Ptr{cudnnDataType_t}),
                 convDesc,arrayLengthRequested,arrayLength,padA,strideA,dilationA,mode,dataType)
end

function cudnnDestroyConvolutionDescriptor(convDesc)
    @check ccall((:cudnnDestroyConvolutionDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnConvolutionDescriptor_t,),
                 convDesc)
end

function cudnnSetConvolutionMathType(convDesc, mathType)
    @check ccall((:cudnnSetConvolutionMathType,libcudnn),
                 cudnnStatus_t,
                 (cudnnConvolutionDescriptor_t, cudnnMathType_t),
                 convDesc, mathType)
end

function cudnnCreatePoolingDescriptor(poolingDesc)
    @check ccall((:cudnnCreatePoolingDescriptor,libcudnn),
                 cudnnStatus_t,
                 (Ptr{cudnnPoolingDescriptor_t},),
                 poolingDesc)
end

function cudnnSetPoolingNdDescriptor(poolingDesc,mode,maxpoolingNanOpt,nbDims,windowDimA,paddingA,strideA)
    @check ccall((:cudnnSetPoolingNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnPoolingDescriptor_t,cudnnPoolingMode_t,cudnnNanPropagation_t,
                  Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint}),
                 poolingDesc,mode,maxpoolingNanOpt,nbDims,windowDimA,paddingA,strideA)
end

function cudnnGetPoolingNdDescriptor(poolingDesc,nbDimsRequested,mode,maxpoolingNanOpt,nbDims,windowDimA,paddingA,strideA)
    @check ccall((:cudnnGetPoolingNdDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnPoolingDescriptor_t,Cint,Ptr{cudnnPoolingMode_t},
                  Ptr{cudnnNanPropagation_t},Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Cint}),
                 poolingDesc,nbDimsRequested,mode,maxpoolingNanOpt,nbDims,windowDimA,paddingA,strideA)
end

function cudnnDestroyPoolingDescriptor(poolingDesc)
    @check ccall((:cudnnDestroyPoolingDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnPoolingDescriptor_t,),
                 poolingDesc)
end

function cudnnSetActivationDescriptor(activationDesc, mode, reluNanOpt, coeff)
    @check ccall((:cudnnSetActivationDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnActivationDescriptor_t,cudnnActivationMode_t,
                  cudnnNanPropagation_t,Cdouble),
                 activationDesc,mode,reluNanOpt,coeff)
end

function cudnnGetActivationDescriptor(activationDesc, mode, reluNanOpt, coeff)
    @check ccall((:cudnnGetActivationDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnActivationDescriptor_t,Ptr{cudnnActivationMode_t},
                  Ptr{cudnnNanPropagation_t},Ptr{Cdouble}),
                 activationDesc,mode,reluNanOpt,coeff)
end

function cudnnCreateActivationDescriptor(activationDesc)
    @check ccall((:cudnnCreateActivationDescriptor,libcudnn),
                 cudnnStatus_t,
                 (Ptr{cudnnActivationDescriptor_t},),
                 activationDesc)
end

function cudnnDestroyActivationDescriptor(activationDesc)
    @check ccall((:cudnnDestroyActivationDescriptor,libcudnn),
                 cudnnStatus_t,
                 (cudnnActivationDescriptor_t,),
                 activationDesc)
end

function cudnnSoftmaxForward(algo,mode,alpha,xDesc,x,beta,yDesc,y)
    @check ccall((:cudnnSoftmaxForward,libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t,cudnnSoftmaxAlgorithm_t,cudnnSoftmaxMode_t,Ptr{Nothing},
                  cudnnTensorDescriptor_t,CuPtr{Nothing},Ptr{Nothing},cudnnTensorDescriptor_t,
                  CuPtr{Nothing}),
                 handle(),
                 algo,mode,alpha,xDesc,x,beta,yDesc,y)
end

function cudnnSoftmaxForward(src::CuArray{T,4}, dest::CuArray{T,4}=src;
                             algorithm=CUDNN_SOFTMAX_ACCURATE, # or CUDNN_SOFTMAX_FAST
                             mode=CUDNN_SOFTMAX_MODE_INSTANCE, # or CUDNN_SOFTMAX_MODE_CHANNEL
                             alpha=1.0, beta=0.0) where T
    cudnnSoftmaxForward(algorithm, mode,
                        cptr(alpha, src), TensorDesc(src), src,
                        cptr(beta, dest), TensorDesc(dest), dest)
    return dest
end

function cudnnSoftmaxBackward(algo,mode,alpha,yDesc,y,dyDesc,dy,beta,dxDesc,dx)
    @check ccall((:cudnnSoftmaxBackward,libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t,cudnnSoftmaxAlgorithm_t,cudnnSoftmaxMode_t,Ptr{Nothing},
                  cudnnTensorDescriptor_t,CuPtr{Nothing},cudnnTensorDescriptor_t,CuPtr{Nothing},
                  Ptr{Nothing},cudnnTensorDescriptor_t,CuPtr{Nothing}),
                 handle(),
                 algo,mode,alpha,yDesc,y,dyDesc,dy,beta,dxDesc,dx)
end

function cudnnSoftmaxBackward(src::CuArray{T,4}, srcDiff::CuArray{T,4}, destDiff::CuArray=srcDiff;
                              algorithm=CUDNN_SOFTMAX_ACCURATE, # or CUDNN_SOFTMAX_FAST
                              mode=CUDNN_SOFTMAX_MODE_INSTANCE, # or CUDNN_SOFTMAX_MODE_CHANNEL
                              alpha=1.0, beta=0.0) where T
    cudnnSoftmaxBackward(algorithm, mode,
                         cptr(alpha, src), TensorDesc(src), src,
                         TensorDesc(srcDiff), srcDiff,
                         cptr(beta, destDiff), TensorDesc(destDiff), destDiff)
    return destDiff
end

function cudnnConvolutionBiasActivationForward(alpha1, xDesc, x, wDesc, w, convDesc, algo, workspace, workspace_size, alpha2, biasDesc, bias, activationDesc, yDesc, y)
    @check ccall((:cudnnConvolutionBiasActivationForward, libcudnn),
                cudnnStatus_t,
                (cudnnHandle_t, Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing},
                 cudnnFilterDescriptor_t, CuPtr{Nothing}, cudnnConvolutionDescriptor_t,
                 cudnnConvolutionFwdAlgo_t, CuPtr{Nothing}, Csize_t, Ptr{Nothing},
                 cudnnTensorDescriptor_t, CuPtr{Nothing}, cudnnTensorDescriptor_t,
                 CuPtr{Nothing}, cudnnActivationDescriptor_t, cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), alpha1, xDesc, x, wDesc, w, convDesc, algo, workspace,
                 workspace_size, alpha2, yDesc, y, biasDesc, bias, activationDesc, yDesc, y)
end

function cudnnConvolutionBiasActivationForward(y::CuArray{T,N}, x::CuArray{T,N}, w::CuArray{T,N}, bias::CuArray{T,N};
                                               alpha1=1, workspace=CU_NULL, workspace_size=0,
                                               algo=0, alpha2=0, padding=0, stride=1, dilation=1, mode=0,
                                               activationMode=CUDNN_ACTIVATION_IDENTITY, activationCoeff=0.0,
                                               activationReluNanOpt=CUDNN_NOT_PROPAGATE_NAN) where {T,N}
    cd = ConvDesc(T, N-2, padding, stride, dilation, mode)
    ad = ActivationDesc(activationMode, T(activationCoeff), activationReluNanOpt)
    cudnnConvolutionBiasActivationForward(Ref(T(alpha1)),TensorDesc(x),x,FilterDesc(w),w,cd,algo,workspace,
        workspace_size,Ref(T(alpha2)),TensorDesc(bias),bias,ad,TensorDesc(y),y)
    return y
end

function cudnnConvolutionForward(alpha, xDesc, x, wDesc, w, convDesc, algo, workspace, workspace_size, beta, yDesc, y)
    @check ccall((:cudnnConvolutionForward, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing},
                  cudnnFilterDescriptor_t, CuPtr{Nothing}, cudnnConvolutionDescriptor_t,
                  cudnnConvolutionFwdAlgo_t, CuPtr{Nothing}, Cint, Ptr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), alpha, xDesc, x, wDesc, w, convDesc, algo, workspace,
                 workspace_size, beta, yDesc, y)
end

function cudnnConvolutionForward(y::CuArray{T,N}, x::CuArray{T,N}, w::CuArray{T,N},
                                 cdims::DenseConvDims; algo=0, workspace=CU_NULL,
                                 workspace_size=0, alpha=1, beta=0) where {T,N}
    cudnnConvolutionForward(
      Ref(T(alpha)), TensorDesc(x), x, FilterDesc(w), w, ConvDesc(T,cdims),
      algo, workspace, workspace_size, Ref(T(beta)), TensorDesc(y), y
    )
    return y
end

function cudnnGetConvolutionForwardWorkspaceSize(xDesc, wDesc, convDesc, yDesc, algo, workspace_size)
    @check ccall((:cudnnGetConvolutionForwardWorkspaceSize, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, cudnnTensorDescriptor_t, cudnnFilterDescriptor_t,
                  cudnnConvolutionDescriptor_t, cudnnTensorDescriptor_t,
                  cudnnConvolutionFwdAlgo_t, Ptr{Cint}),
                 handle(), xDesc, wDesc, convDesc, yDesc, algo, workspace_size)
end

function cudnnGetConvolutionForwardWorkspaceSize(y::CuArray{T,N}, x::CuArray{T,N}, w::CuArray{T,N},
                                                 cdims::DenseConvDims; algo=0) where {T,N}
    workspace_size = Ref{Cint}()
    cudnnGetConvolutionForwardWorkspaceSize(
        TensorDesc(x), FilterDesc(w), ConvDesc(T, cdims),
        TensorDesc(y), algo, workspace_size
    )
    return Int(workspace_size[])
end

function cudnnConvolutionBackwardData(alpha, wDesc, w, dyDesc, dy, convDesc, algo, workspace, workspace_size, beta, dxDesc, dx)
    @check ccall((:cudnnConvolutionBackwardData, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, Ptr{Nothing}, cudnnFilterDescriptor_t, CuPtr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}, cudnnConvolutionDescriptor_t,
                  cudnnConvolutionBwdDataAlgo_t, CuPtr{Nothing}, Cint, Ptr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), alpha, wDesc, w, dyDesc, dy, convDesc, algo, workspace,
                 workspace_size, beta, dxDesc, dx)
end

function cudnnConvolutionBackwardData(dx::CuArray{T,N}, w::CuArray{T,N}, dy::CuArray{T,N};
                                      cdims::DenseConvDims, algo=0, workspace=CU_NULL,
                                      workspace_size=0, alpha=1, beta=0) where {T,N}
    cudnnConvolutionBackwardData(
      Ref(T(alpha)), FilterDesc(w), w, TensorDesc(dy), dy, ConvDesc(T, cdims),
      algo, workspace, workspace_size, Ref(T(beta)), TensorDesc(dx), dx
    )
    return dx
end

function cudnnGetConvolutionBackwardDataWorkspaceSize(wDesc, dyDesc, convDesc, dxDesc, algo, workspace_size)
    @check ccall((:cudnnGetConvolutionBackwardDataWorkspaceSize, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, cudnnFilterDescriptor_t, cudnnTensorDescriptor_t,
                  cudnnConvolutionDescriptor_t, cudnnTensorDescriptor_t,
                  cudnnConvolutionFwdAlgo_t, Ptr{Cint}),
                 handle(), wDesc, dyDesc, convDesc, dxDesc, algo, workspace_size)
end

function cudnnGetConvolutionBackwardDataWorkspaceSize(dx::CuArray{T,N}, w::CuArray{T,N}, dy::CuArray{T,N};
                                                      cdims::DenseConvDims, algo=0) where {T,N}
    workspace_size = Ref{Cint}()
    cudnnGetConvolutionBackwardDataWorkspaceSize(
        FilterDesc(w), TensorDesc(dy), ConvDesc(T, cdims),
        TensorDesc(dx), algo, workspace_size
    )
    return Int(workspace_size[])
end

function cudnnConvolutionBackwardFilter(alpha, xDesc, x, dyDesc, dy, convDesc, algo, workspace, workspace_size, beta, dwDesc, dw)
    @check ccall((:cudnnConvolutionBackwardFilter, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}, cudnnConvolutionDescriptor_t,
                  cudnnConvolutionBwdFilterAlgo_t, CuPtr{Nothing}, Cint, Ptr{Nothing},
                  cudnnFilterDescriptor_t, CuPtr{Nothing}),
                 handle(), alpha, xDesc, x, dyDesc, dy, convDesc, algo, workspace,
                 workspace_size, beta, dwDesc, dw)
end

function cudnnConvolutionBackwardFilter(dw::CuArray{T,N}, x::CuArray{T,N}, dy::CuArray{T,N},
                                        cdims::DenseConvDims; algo=0, workspace=CU_NULL,
                                        workspace_size=0, alpha=1, beta=0) where {T,N}
    cudnnConvolutionBackwardFilter(
        Ref(T(alpha)), TensorDesc(x), x, TensorDesc(dy), dy, ConvDesc(T, cdims),
        algo, workspace, workspace_size, Ref(T(beta)), FilterDesc(dw), dw
    )
    return dw
end

function cudnnGetConvolutionBackwardFilterWorkspaceSize(xDesc, dyDesc, convDesc, dwDesc, algo, workspace_size)
    @check ccall((:cudnnGetConvolutionBackwardFilterWorkspaceSize, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, cudnnTensorDescriptor_t, cudnnTensorDescriptor_t,
                  cudnnConvolutionDescriptor_t, cudnnFilterDescriptor_t,
                  cudnnConvolutionFwdAlgo_t, Ptr{Cint}),
                 handle(), xDesc, dyDesc, convDesc, dwDesc, algo, workspace_size)
end

function cudnnGetConvolutionBackwardFilterWorkspaceSize(dw::CuArray{T,N}, x::CuArray{T,N}, dy::CuArray{T,N};
                                                        cdims::DenseConvDims, algo=0) where {T,N}
    workspace_size = Ref{Cint}()
    cudnnGetConvolutionBackwardFilterWorkspaceSize(
        TensorDesc(x), TensorDesc(dy), ConvDesc(T, cdims),
        FilterDesc(dw), algo, workspace_size
    )
    return Int(workspace_size[])
end

function cudnnConvolutionBackwardBias(alpha, dyDesc, dy, beta, dbDesc, db)
    @check ccall((:cudnnConvolutionBackwardBias, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing},
                  Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), alpha, dyDesc, dy, beta, dbDesc, db)
end

function cudnnConvolutionBackwardBias(db::CuArray{T,N}, dy::CuArray{T,N}; alpha=1, beta=0) where {T,N}
    cudnnConvolutionBackwardBias(Ref(T(alpha)), TensorDesc(dy), dy, Ref(T(beta)), TensorDesc(db), db)
    return db
end

function cudnnPoolingForward(poolingDesc,alpha,xDesc,x,beta,yDesc,y)
    @check ccall((:cudnnPoolingForward,libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t,cudnnPoolingDescriptor_t,Ptr{Nothing},cudnnTensorDescriptor_t,
                  CuPtr{Nothing},Ptr{Nothing},cudnnTensorDescriptor_t,CuPtr{Nothing}),
                 handle(), poolingDesc,alpha,xDesc,x,beta,yDesc,y)
end

function cudnnPoolingBackward(poolingDesc,alpha,yDesc,y,dyDesc,dy,xDesc,x,beta,dxDesc,dx)
    @check ccall((:cudnnPoolingBackward,libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t,cudnnPoolingDescriptor_t,Ptr{Nothing},cudnnTensorDescriptor_t,
                  CuPtr{Nothing},cudnnTensorDescriptor_t,CuPtr{Nothing},cudnnTensorDescriptor_t,
                  CuPtr{Nothing},Ptr{Nothing},cudnnTensorDescriptor_t,CuPtr{Nothing}),
                 handle(),poolingDesc,alpha,yDesc,y,dyDesc,dy,xDesc,x,beta,dxDesc,dx)
end

function cudnnPoolingForward(y::CuArray{T,N}, x::CuArray{T,N}, pdims::PoolDims;
                             alpha=1, mode=0) where {T,N}
    beta = 0
    cudnnPoolingForward(PoolDesc(pdims, mode), Ref(T(alpha)), TensorDesc(x), x, Ref(T(beta)), TensorDesc(y), y)
    return y
end

function cudnnPoolingBackward(dx::CuArray{T,N}, dy::CuArray{T,N}, x::CuArray{T,N}, y::CuArray{T,N},
                              pdims::PoolDims; alpha=1, mode=0) where {T,N}
    if alpha!=1 && mode==0; error("Gradient of pool(alpha!=1,mode=0) broken in CUDNN"); end
    beta = 0
    cudnnPoolingBackward(
        PoolDesc(pdims, mode), Ref(T(alpha)), TensorDesc(y), y,
        TensorDesc(dy), dy, TensorDesc(x), x, Ref(T(beta)), TensorDesc(dx), dx
    )
    return dx
end

function cudnnActivationForward(activationDesc, alpha, xDesc, x, beta, yDesc, y)
    @check ccall((:cudnnActivationForward, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, cudnnActivationDescriptor_t, Ptr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}, Ptr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), activationDesc, alpha, xDesc, x, beta, yDesc, y)
end

function cudnnActivationForward(y::CuArray{T,N}, x::CuArray{T,N}; mode=CUDNN_ACTIVATION_RELU, #CUDNN_ACTIVATION_IDENTITY will not work
                                coeff=0.0, reluNanOpt=CUDNN_NOT_PROPAGATE_NAN, alpha=1, beta=0) where {T,N}
    ad = ActivationDesc(mode, T(coeff), reluNanOpt)
    cudnnActivationForward(ad, Ref(T(alpha)), TensorDesc(x), x, Ref(T(beta)), TensorDesc(y), y)
    return y
end

function cudnnActivationBackward(activationDesc, alpha, yDesc, y, dyDesc, dy, xDesc, x, beta, dxDesc, dx)
    @check ccall((:cudnnActivationBackward, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, cudnnActivationDescriptor_t, Ptr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}, cudnnTensorDescriptor_t,
                  CuPtr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing}, Ptr{Nothing},
                  cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), activationDesc, alpha, yDesc, y, dyDesc, dy, xDesc, x, beta, dxDesc, dx)
end

function cudnnActivationBackward(dx::CuArray{T,N}, x::CuArray{T,N}, y::CuArray{T,N}, dy::CuArray{T,N};
                                 mode=CUDNN_ACTIVATION_RELU, #CUDNN_ACTIVATION_IDENTITY will not work
                                 coeff=0.0, reluNanOpt=CUDNN_NOT_PROPAGATE_NAN, alpha=1, beta=0) where {T,N}
    ad = ActivationDesc(mode, T(coeff), reluNanOpt)
    cudnnActivationBackward(ad, Ref(T(alpha)), TensorDesc(y), y, TensorDesc(dy), dy, TensorDesc(x), x, Ref(T(beta)), TensorDesc(dx), dx)
    return dx
end

function cudnnAddTensor(alpha, aDesc, A, beta, cDesc, C)
    @check ccall((:cudnnAddTensor, libcudnn),
                 cudnnStatus_t,
                 (cudnnHandle_t, Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing},
                  Ptr{Nothing}, cudnnTensorDescriptor_t, CuPtr{Nothing}),
                 handle(), alpha, aDesc, A, beta, cDesc, C)
end

function cudnnAddTensor(A::CuArray{T,N}, C::CuArray{T,N}; alpha=1,
                        beta=1) where {T,N}
    aDesc = TensorDesc(A)
    cDesc = TensorDesc(C)
    cudnnAddTensor(Ref(T(alpha)), aDesc, A, Ref(T(beta)), cDesc, C)
    return C
end

function cudnnGetProperty(property::CUDAapi.libraryPropertyType)
  value_ref = Ref{Cint}()
  @check ccall((:cudnnGetProperty, libcudnn),
               cudnnStatus_t,
               (Cint, Ptr{Cint}),
               property, value_ref)
  value_ref[]
end
