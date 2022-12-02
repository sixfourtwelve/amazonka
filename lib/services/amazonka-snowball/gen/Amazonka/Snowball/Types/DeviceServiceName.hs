{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.Snowball.Types.DeviceServiceName
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Snowball.Types.DeviceServiceName
  ( DeviceServiceName
      ( ..,
        DeviceServiceName_NFS_ON_DEVICE_SERVICE,
        DeviceServiceName_S3_ON_DEVICE_SERVICE
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

newtype DeviceServiceName = DeviceServiceName'
  { fromDeviceServiceName ::
      Data.Text
  }
  deriving stock
    ( Prelude.Show,
      Prelude.Read,
      Prelude.Eq,
      Prelude.Ord,
      Prelude.Generic
    )
  deriving newtype
    ( Prelude.Hashable,
      Prelude.NFData,
      Data.FromText,
      Data.ToText,
      Data.ToByteString,
      Data.ToLog,
      Data.ToHeader,
      Data.ToQuery,
      Data.FromJSON,
      Data.FromJSONKey,
      Data.ToJSON,
      Data.ToJSONKey,
      Data.FromXML,
      Data.ToXML
    )

pattern DeviceServiceName_NFS_ON_DEVICE_SERVICE :: DeviceServiceName
pattern DeviceServiceName_NFS_ON_DEVICE_SERVICE = DeviceServiceName' "NFS_ON_DEVICE_SERVICE"

pattern DeviceServiceName_S3_ON_DEVICE_SERVICE :: DeviceServiceName
pattern DeviceServiceName_S3_ON_DEVICE_SERVICE = DeviceServiceName' "S3_ON_DEVICE_SERVICE"

{-# COMPLETE
  DeviceServiceName_NFS_ON_DEVICE_SERVICE,
  DeviceServiceName_S3_ON_DEVICE_SERVICE,
  DeviceServiceName'
  #-}
