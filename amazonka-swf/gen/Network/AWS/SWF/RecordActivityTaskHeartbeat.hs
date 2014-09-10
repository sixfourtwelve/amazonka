{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SWF
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Used by activity workers to report to the service that the ActivityTask
-- represented by the specified taskToken is still making progress. The worker
-- can also (optionally) specify details of the progress, for example percent
-- complete, using the details parameter. This action can also be used by the
-- worker as a mechanism to check if cancellation is being requested for the
-- activity task. If a cancellation is being attempted for the specified task,
-- then the boolean cancelRequested flag returned by the service is set to
-- true. This action resets the taskHeartbeatTimeout clock. The
-- taskHeartbeatTimeout is specified in RegisterActivityType. This action does
-- not in itself create an event in the workflow execution history. However,
-- if the task times out, the workflow execution history will contain a
-- ActivityTaskTimedOut event that contains the information from the last
-- heartbeat generated by the activity worker. The taskStartToCloseTimeout of
-- an activity type is the maximum duration of an activity task, regardless of
-- the number of RecordActivityTaskHeartbeat requests received. The
-- taskStartToCloseTimeout is also specified in RegisterActivityType. This
-- operation is only useful for long-lived activities to report liveliness of
-- the task and to determine if a cancellation is being attempted. If the
-- cancelRequested flag returns true, a cancellation is being attempted. If
-- the worker can cancel the activity, it should respond with
-- RespondActivityTaskCanceled. Otherwise, it should ignore the cancellation
-- request. Access Control You can use IAM policies to control this action's
-- access to Amazon SWF resources as follows: Use a Resource element with the
-- domain name to limit the action to only specified domains. Use an Action
-- element to allow or deny permission to call this action. You cannot use an
-- IAM policy to constrain this action's parameters. If the caller does not
-- have sufficient permissions to invoke the action, or the parameter values
-- fall outside the specified constraints, the action fails by throwing
-- OperationNotPermitted. For details and example IAM policies, see Using IAM
-- to Manage Access to Amazon SWF Workflows. RecordActivityTaskHeartbeat
-- Example POST / HTTP/1.1 Host: swf.us-east-1.amazonaws.com User-Agent:
-- Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.25) Gecko/20111212
-- Firefox/3.6.25 ( .NET CLR 3.5.30729; .NET4.0E) Accept: application/json,
-- text/javascript, */* Accept-Language: en-us,en;q=0.5 Accept-Encoding:
-- gzip,deflate Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7 Keep-Alive: 115
-- Connection: keep-alive Content-Type: application/x-amz-json-1.0
-- X-Requested-With: XMLHttpRequest X-Amz-Date: Mon, 16 Jan 2012 03:55:06 GMT
-- X-Amz-Target: SimpleWorkflowService.RecordActivityTaskHeartbeat
-- Content-Encoding: amz-1.0 X-Amzn-Authorization: AWS3
-- AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE,Algorithm=HmacSHA256,SignedHeaders=Host;X-Amz-Date;X-Amz-Target;Content-Encoding,Signature=DEA8rw5TqtpqCeTljl7eotZkuWTgmGZ1PWyDNZPehT0=
-- Referer: http://swf.us-east-1.amazonaws.com/explorer/index.html
-- Content-Length: 623 Pragma: no-cache Cache-Control: no-cache {"taskToken":
-- "AAAAKgAAAAEAAAAAAAAAAX9p3pcp3857oLXFUuwdxRU5/zmn9f40XaMF7VohAH4jOtjXpZu7GdOzEi0b3cWYHbG5b5dpdcTXHUDPVMHXiUxCgr+Nc/wUW9016W4YxJGs/jmxzPln8qLftU+SW135Q0UuKp5XRGoRTJp3tbHn2pY1vC8gDB/K69J6q668U1pd4Cd9o43//lGgOIjN0/Ihg+DO+83HNcOuVEQMM28kNMXf7yePh31M4dMKJwQaQZG13huJXDwzJOoZQz+XFuqFly+lPnCE4XvsnhfAvTsh50EtNDEtQzPCFJoUeld9g64V/FS/39PHL3M93PBUuroPyHuCwHsNC6fZ7gM/XOKmW4kKnXPoQweEUkFV/J6E6+M1reBO7nJADTrLSnajg6MY/viWsEYmMw/DS5FlquFaDIhFkLhWUWN+V2KqiKS23GYwpzgZ7fgcWHQF2NLEY3zrjam4LW/UW5VLCyM3FpVD3erCTi9IvUgslPzyVGuWNAoTmgJEWvimgwiHxJMxxc9JBDR390iMmImxVl3eeSDUWx8reQltiviadPDjyRmVhYP8",
-- "details": "starting task"} HTTP/1.1 200 OK Content-Length: 25
-- Content-Type: application/json x-amzn-RequestId:
-- e08622cd-3ff5-11e1-9b11-7182192d0b57 {"cancelRequested":false}.
module Network.AWS.SWF
    (
    -- * Request
      RecordActivityTaskHeartbeat
    -- ** Request constructor
    , mkRecordActivityTaskHeartbeat
    -- ** Request lenses
    , rathTaskToken
    , rathDetails

    -- * Response
    , RecordActivityTaskHeartbeatResponse
    -- ** Response constructor
    , mkRecordActivityTaskHeartbeatResponse
    -- ** Response lenses
    , rathrCancelRequested
    ) where

import Network.AWS.SWF.Types
import Network.AWS.Prelude
import Network.AWS.Request.JSON

data RecordActivityTaskHeartbeat = RecordActivityTaskHeartbeat
    { _rathTaskToken :: Text
    , _rathDetails :: Maybe Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'RecordActivityTaskHeartbeat' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @TaskToken ::@ @Text@
--
-- * @Details ::@ @Maybe Text@
--
mkRecordActivityTaskHeartbeat :: Text -- ^ 'rathTaskToken'
                              -> RecordActivityTaskHeartbeat
mkRecordActivityTaskHeartbeat p1 = RecordActivityTaskHeartbeat
    { _rathTaskToken = p1
    , _rathDetails = Nothing
    }

-- | The taskToken of the ActivityTask. The taskToken is generated by the
-- service and should be treated as an opaque value. If the task is passed to
-- another process, its taskToken must also be passed. This enables it to
-- provide its progress and respond with results.
rathTaskToken :: Lens' RecordActivityTaskHeartbeat Text
rathTaskToken = lens _rathTaskToken (\s a -> s { _rathTaskToken = a })

-- | If specified, contains details about the progress of the task.
rathDetails :: Lens' RecordActivityTaskHeartbeat (Maybe Text)
rathDetails = lens _rathDetails (\s a -> s { _rathDetails = a })

instance ToPath RecordActivityTaskHeartbeat

instance ToQuery RecordActivityTaskHeartbeat

instance ToHeaders RecordActivityTaskHeartbeat

instance ToJSON RecordActivityTaskHeartbeat

-- | Status information about an activity task.
newtype RecordActivityTaskHeartbeatResponse = RecordActivityTaskHeartbeatResponse
    { _rathrCancelRequested :: Bool
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'RecordActivityTaskHeartbeatResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @CancelRequested ::@ @Bool@
--
mkRecordActivityTaskHeartbeatResponse :: Bool -- ^ 'rathrCancelRequested'
                                      -> RecordActivityTaskHeartbeatResponse
mkRecordActivityTaskHeartbeatResponse p1 = RecordActivityTaskHeartbeatResponse
    { _rathrCancelRequested = p1
    }

-- | Set to true if cancellation of the task is requested.
rathrCancelRequested :: Lens' RecordActivityTaskHeartbeatResponse Bool
rathrCancelRequested =
    lens _rathrCancelRequested (\s a -> s { _rathrCancelRequested = a })

instance FromJSON RecordActivityTaskHeartbeatResponse

instance AWSRequest RecordActivityTaskHeartbeat where
    type Sv RecordActivityTaskHeartbeat = SWF
    type Rs RecordActivityTaskHeartbeat = RecordActivityTaskHeartbeatResponse

    request = get
    response _ = jsonResponse
