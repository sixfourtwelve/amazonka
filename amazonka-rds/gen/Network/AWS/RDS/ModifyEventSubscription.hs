{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Modifies an existing RDS event notification subscription. Note that you
-- cannot modify the source identifiers using this call; to change source
-- identifiers for a subscription, use the AddSourceIdentifierToSubscription
-- and RemoveSourceIdentifierFromSubscription calls. You can see a list of the
-- event categories for a given SourceType in the Events topic in the Amazon
-- RDS User Guide or by using the DescribeEventCategories action.
-- https://rds.us-east-1.amazonaws.com/ ?Action=ModifyEventSubscription
-- &SubscriptionName=EventSubscription01 &EventCategories.member.1=creation
-- &EventCategories.member.2=deletion &SourceType=db-instance &Enabled=true
-- &Version=2013-01-10 &SignatureVersion=4 &SignatureMethod=HmacSHA256
-- &Timestamp=20130128T005359Z &AWSAccessKeyId= &Signature= true 012345678901
-- db-instance modifying 2013-01-28 00:29:23.736 creation deletion
-- EventSubscription01 arn:aws:sns:us-east-1:012345678901:EventSubscription01
-- 34907d48-68e5-11e2-98ef-2b071ac20a57.
module Network.AWS.RDS
    (
    -- * Request
      ModifyEventSubscription
    -- ** Request constructor
    , mkModifyEventSubscription
    -- ** Request lenses
    , mesSubscriptionName
    , mesSnsTopicArn
    , mesSourceType
    , mesEventCategories
    , mesEnabled

    -- * Response
    , ModifyEventSubscriptionResponse
    -- ** Response constructor
    , mkModifyEventSubscriptionResponse
    -- ** Response lenses
    , mesrEventSubscription
    ) where

import Network.AWS.Request.Query
import Network.AWS.RDS.Types
import Network.AWS.Prelude

-- | 
data ModifyEventSubscription = ModifyEventSubscription
    { _mesSubscriptionName :: Text
    , _mesSnsTopicArn :: Maybe Text
    , _mesSourceType :: Maybe Text
    , _mesEventCategories :: [Text]
    , _mesEnabled :: Maybe Bool
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ModifyEventSubscription' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @SubscriptionName ::@ @Text@
--
-- * @SnsTopicArn ::@ @Maybe Text@
--
-- * @SourceType ::@ @Maybe Text@
--
-- * @EventCategories ::@ @[Text]@
--
-- * @Enabled ::@ @Maybe Bool@
--
mkModifyEventSubscription :: Text -- ^ 'mesSubscriptionName'
                          -> ModifyEventSubscription
mkModifyEventSubscription p1 = ModifyEventSubscription
    { _mesSubscriptionName = p1
    , _mesSnsTopicArn = Nothing
    , _mesSourceType = Nothing
    , _mesEventCategories = mempty
    , _mesEnabled = Nothing
    }

-- | The name of the RDS event notification subscription.
mesSubscriptionName :: Lens' ModifyEventSubscription Text
mesSubscriptionName =
    lens _mesSubscriptionName (\s a -> s { _mesSubscriptionName = a })

-- | The Amazon Resource Name (ARN) of the SNS topic created for event
-- notification. The ARN is created by Amazon SNS when you create a topic and
-- subscribe to it.
mesSnsTopicArn :: Lens' ModifyEventSubscription (Maybe Text)
mesSnsTopicArn = lens _mesSnsTopicArn (\s a -> s { _mesSnsTopicArn = a })

-- | The type of source that will be generating the events. For example, if you
-- want to be notified of events generated by a DB instance, you would set
-- this parameter to db-instance. if this value is not specified, all events
-- are returned. Valid values: db-instance | db-parameter-group |
-- db-security-group | db-snapshot.
mesSourceType :: Lens' ModifyEventSubscription (Maybe Text)
mesSourceType = lens _mesSourceType (\s a -> s { _mesSourceType = a })

-- | A list of event categories for a SourceType that you want to subscribe to.
-- You can see a list of the categories for a given SourceType in the Events
-- topic in the Amazon RDS User Guide or by using the DescribeEventCategories
-- action.
mesEventCategories :: Lens' ModifyEventSubscription [Text]
mesEventCategories =
    lens _mesEventCategories (\s a -> s { _mesEventCategories = a })

-- | A Boolean value; set to true to activate the subscription.
mesEnabled :: Lens' ModifyEventSubscription (Maybe Bool)
mesEnabled = lens _mesEnabled (\s a -> s { _mesEnabled = a })

instance ToQuery ModifyEventSubscription where
    toQuery = genericQuery def

newtype ModifyEventSubscriptionResponse = ModifyEventSubscriptionResponse
    { _mesrEventSubscription :: Maybe EventSubscription
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'ModifyEventSubscriptionResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @EventSubscription ::@ @Maybe EventSubscription@
--
mkModifyEventSubscriptionResponse :: ModifyEventSubscriptionResponse
mkModifyEventSubscriptionResponse = ModifyEventSubscriptionResponse
    { _mesrEventSubscription = Nothing
    }

-- | Contains the results of a successful invocation of the
-- DescribeEventSubscriptions action.
mesrEventSubscription :: Lens' ModifyEventSubscriptionResponse (Maybe EventSubscription)
mesrEventSubscription =
    lens _mesrEventSubscription (\s a -> s { _mesrEventSubscription = a })

instance FromXML ModifyEventSubscriptionResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ModifyEventSubscription where
    type Sv ModifyEventSubscription = RDS
    type Rs ModifyEventSubscription = ModifyEventSubscriptionResponse

    request = post "ModifyEventSubscription"
    response _ = xmlResponse
