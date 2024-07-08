# [Qualcomm AI Direct Engine SDK](https://www.qualcomm.com/developer/software/qualcomm-ai-engine-direct-sdk)

## [Docs](https://docs.qualcomm.com/bundle/publicresource/topics/80-63442-50/introduction.html)

## Troubleshooting

### Android deployment

Compiled models are usually (if not always?) tight to particular versions of QNN.
Thus, we face troubles given (context) binary, but we're using (linking it) the wrong versions of QNN.
The issue is annoying as we often sync binaries from host to device & QNN error messages aren't helpful.
In such case, [keep calm & carry on](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKj8oZmUhJKyTfOI7BSYngDQBCFpUXktK7PA&s) 

On-device:
```
sha1sum qnn-net-run libQnnHtp.so libQnnHtpNetRunExtensions.so libQnnHtpPrepare.so libQnnHtpV73Skel.so libQnnHtpV73Stub.so
```

On host:
```bash
cd $QNN_SDK_ROOT
sha1sum bin/aarch64-android/qnn-net-run lib/aarch64-android/libQnnHtpNetRunExtensions.so lib/aarch64-android/libQnnHtpPrepare.so lib/hexagon-v73/unsigned/libQnnHtpV73Skel.so lib/aarch64-android/libQnnHtpV73Stub.so
```

## References

- [(Old) entry page](https://developer.qualcomm.com/hardware/qualcomm-innovators-development-kit/qualcomm-ai-engine-direct)
