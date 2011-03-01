{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Network.Riak.Protocol (protoInfo, fileDescriptorProto) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import Text.DescriptorProtos.FileDescriptorProto (FileDescriptorProto)
import Text.ProtocolBuffers.Reflections (ProtoInfo)
import qualified Text.ProtocolBuffers.WireMessage as P' (wireGet,getFromBS)
 
protoInfo :: ProtoInfo
protoInfo
 = P'.read
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".Protocol\", haskellPrefix = [MName \"Network\",MName \"Riak\"], parentModule = [], baseName = MName \"Protocol\"}, protoFilePath = [\"Network\",\"Riak\",\"Protocol.hs\"], protoSource = \"Protocol.proto\", extensionKeys = fromList [], messages = [], enums = [], knownKeyMap = fromList []}"
 
fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto = P'.getFromBS (P'.wireGet 11) (P'.pack "\DLE\n\SOProtocol.proto")