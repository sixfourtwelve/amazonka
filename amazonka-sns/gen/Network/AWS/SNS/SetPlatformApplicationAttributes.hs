{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SNS.SetPlatformApplicationAttributes
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Sets the attributes of the platform application object for the supported
-- push notification services, such as APNS and GCM. For more information, see
-- Using Amazon SNS Mobile Push Notifications.
--
-- <http://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html>
module Network.AWS.SNS.SetPlatformApplicationAttributes
    (
    -- * Request
      SetPlatformApplicationAttributes
    -- ** Request constructor
    , setPlatformApplicationAttributes
    -- ** Request lenses
    , spaaAttributes
    , spaaPlatformApplicationArn

    -- * Response
    , SetPlatformApplicationAttributesResponse
    -- ** Response constructor
    , setPlatformApplicationAttributesResponse
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.SNS.Types
import qualified GHC.Exts

data SetPlatformApplicationAttributes = SetPlatformApplicationAttributes
    { _spaaAttributes             :: Map Text Text
    , _spaaPlatformApplicationArn :: Text
    } deriving (Eq, Show, Generic)

-- | 'SetPlatformApplicationAttributes' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'spaaAttributes' @::@ 'HashMap' 'Text' 'Text'
--
-- * 'spaaPlatformApplicationArn' @::@ 'Text'
--
setPlatformApplicationAttributes :: Text -- ^ 'spaaPlatformApplicationArn'
                                 -> SetPlatformApplicationAttributes
setPlatformApplicationAttributes p1 = SetPlatformApplicationAttributes
    { _spaaPlatformApplicationArn = p1
    , _spaaAttributes             = mempty
    }

-- | A map of the platform application attributes. Attributes in this map
-- include the following: PlatformCredential -- The credential received from
-- the notification service. For APNS/APNS_SANDBOX, PlatformCredential is
-- "private key". For GCM, PlatformCredential is "API key". For ADM,
-- PlatformCredential is "client secret". PlatformPrincipal -- The principal
-- received from the notification service. For APNS/APNS_SANDBOX,
-- PlatformPrincipal is "SSL certificate". For GCM, PlatformPrincipal is not
-- applicable. For ADM, PlatformPrincipal is "client id".
-- EventEndpointCreated -- Topic ARN to which EndpointCreated event
-- notifications should be sent. EventEndpointDeleted -- Topic ARN to which
-- EndpointDeleted event notifications should be sent. EventEndpointUpdated
-- -- Topic ARN to which EndpointUpdate event notifications should be sent.
-- EventDeliveryFailure -- Topic ARN to which DeliveryFailure event
-- notifications should be sent upon Direct Publish delivery failure
-- (permanent) to one of the application's endpoints.
spaaAttributes :: Lens' SetPlatformApplicationAttributes (HashMap Text Text)
spaaAttributes = lens _spaaAttributes (\s a -> s { _spaaAttributes = a })
    . _Map

-- | PlatformApplicationArn for SetPlatformApplicationAttributes action.
spaaPlatformApplicationArn :: Lens' SetPlatformApplicationAttributes Text
spaaPlatformApplicationArn =
    lens _spaaPlatformApplicationArn
        (\s a -> s { _spaaPlatformApplicationArn = a })

data SetPlatformApplicationAttributesResponse = SetPlatformApplicationAttributesResponse
    deriving (Eq, Ord, Show, Generic)

-- | 'SetPlatformApplicationAttributesResponse' constructor.
setPlatformApplicationAttributesResponse :: SetPlatformApplicationAttributesResponse
setPlatformApplicationAttributesResponse = SetPlatformApplicationAttributesResponse

instance AWSRequest SetPlatformApplicationAttributes where
    type Sv SetPlatformApplicationAttributes = SNS
    type Rs SetPlatformApplicationAttributes = SetPlatformApplicationAttributesResponse

    request  = post "SetPlatformApplicationAttributes"
    response = nullResponse SetPlatformApplicationAttributesResponse

instance ToPath SetPlatformApplicationAttributes where
    toPath = const "/"

instance ToHeaders SetPlatformApplicationAttributes

instance ToQuery SetPlatformApplicationAttributes
