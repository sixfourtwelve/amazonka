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
-- Module      : Amazonka.Connect.Types.UseCaseType
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Connect.Types.UseCaseType
  ( UseCaseType
      ( ..,
        UseCaseType_CONNECT_CAMPAIGNS,
        UseCaseType_RULES_EVALUATION
      ),
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Data as Data
import qualified Amazonka.Prelude as Prelude

newtype UseCaseType = UseCaseType'
  { fromUseCaseType ::
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

pattern UseCaseType_CONNECT_CAMPAIGNS :: UseCaseType
pattern UseCaseType_CONNECT_CAMPAIGNS = UseCaseType' "CONNECT_CAMPAIGNS"

pattern UseCaseType_RULES_EVALUATION :: UseCaseType
pattern UseCaseType_RULES_EVALUATION = UseCaseType' "RULES_EVALUATION"

{-# COMPLETE
  UseCaseType_CONNECT_CAMPAIGNS,
  UseCaseType_RULES_EVALUATION,
  UseCaseType'
  #-}
