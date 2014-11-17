{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.StorageGateway.AddUploadBuffer
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | This operation configures one or more gateway local disks as upload buffer
-- for a specified gateway. This operation is supported for both the
-- gateway-stored and gateway-cached volume architectures. In the request, you
-- specify the gateway Amazon Resource Name (ARN) to which you want to add
-- upload buffer, and one or more disk IDs that you want to configure as
-- upload buffer.
--
-- <http://docs.aws.amazon.com/storagegateway/latest/APIReference/API_AddUploadBuffer.html>
module Network.AWS.StorageGateway.AddUploadBuffer
    (
    -- * Request
      AddUploadBuffer
    -- ** Request constructor
    , addUploadBuffer
    -- ** Request lenses
    , aubDiskIds
    , aubGatewayARN

    -- * Response
    , AddUploadBufferResponse
    -- ** Response constructor
    , addUploadBufferResponse
    -- ** Response lenses
    , aubrGatewayARN
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.JSON
import Network.AWS.StorageGateway.Types
import qualified GHC.Exts

data AddUploadBuffer = AddUploadBuffer
    { _aubDiskIds    :: [Text]
    , _aubGatewayARN :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'AddUploadBuffer' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'aubDiskIds' @::@ ['Text']
--
-- * 'aubGatewayARN' @::@ 'Text'
--
addUploadBuffer :: Text -- ^ 'aubGatewayARN'
                -> AddUploadBuffer
addUploadBuffer p1 = AddUploadBuffer
    { _aubGatewayARN = p1
    , _aubDiskIds    = mempty
    }

aubDiskIds :: Lens' AddUploadBuffer [Text]
aubDiskIds = lens _aubDiskIds (\s a -> s { _aubDiskIds = a })

aubGatewayARN :: Lens' AddUploadBuffer Text
aubGatewayARN = lens _aubGatewayARN (\s a -> s { _aubGatewayARN = a })

newtype AddUploadBufferResponse = AddUploadBufferResponse
    { _aubrGatewayARN :: Maybe Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'AddUploadBufferResponse' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'aubrGatewayARN' @::@ 'Maybe' 'Text'
--
addUploadBufferResponse :: AddUploadBufferResponse
addUploadBufferResponse = AddUploadBufferResponse
    { _aubrGatewayARN = Nothing
    }

aubrGatewayARN :: Lens' AddUploadBufferResponse (Maybe Text)
aubrGatewayARN = lens _aubrGatewayARN (\s a -> s { _aubrGatewayARN = a })

instance AWSRequest AddUploadBuffer where
    type Sv AddUploadBuffer = StorageGateway
    type Rs AddUploadBuffer = AddUploadBufferResponse

    request  = post
    response = jsonResponse

instance FromJSON AddUploadBufferResponse where
    parseJSON = genericParseJSON jsonOptions

instance ToPath AddUploadBuffer where
    toPath = const "/"

instance ToHeaders AddUploadBuffer

instance ToQuery AddUploadBuffer where
    toQuery = const mempty

instance ToJSON AddUploadBuffer where
    toJSON = genericToJSON jsonOptions
