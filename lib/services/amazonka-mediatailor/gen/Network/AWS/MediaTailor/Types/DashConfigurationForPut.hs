{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MediaTailor.Types.DashConfigurationForPut
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MediaTailor.Types.DashConfigurationForPut where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.MediaTailor.Types.OriginManifestType
import qualified Network.AWS.Prelude as Prelude

-- | The configuration for DASH PUT operations.
--
-- /See:/ 'newDashConfigurationForPut' smart constructor.
data DashConfigurationForPut = DashConfigurationForPut'
  { -- | The setting that controls whether MediaTailor handles manifests from the
    -- origin server as multi-period manifests or single-period manifests. If
    -- your origin server produces single-period manifests, set this to
    -- SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period
    -- manifests, omit this setting or set it to MULTI_PERIOD.
    originManifestType :: Prelude.Maybe OriginManifestType,
    -- | The setting that controls whether MediaTailor includes the Location tag
    -- in DASH manifests. MediaTailor populates the Location tag with the URL
    -- for manifest update requests, to be used by players that don\'t support
    -- sticky redirects. Disable this if you have CDN routing rules set up for
    -- accessing MediaTailor manifests, and you are either using client-side
    -- reporting or your players support sticky HTTP redirects. Valid values
    -- are DISABLED and EMT_DEFAULT. The EMT_DEFAULT setting enables the
    -- inclusion of the tag and is the default value.
    mpdLocation :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DashConfigurationForPut' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'originManifestType', 'dashConfigurationForPut_originManifestType' - The setting that controls whether MediaTailor handles manifests from the
-- origin server as multi-period manifests or single-period manifests. If
-- your origin server produces single-period manifests, set this to
-- SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period
-- manifests, omit this setting or set it to MULTI_PERIOD.
--
-- 'mpdLocation', 'dashConfigurationForPut_mpdLocation' - The setting that controls whether MediaTailor includes the Location tag
-- in DASH manifests. MediaTailor populates the Location tag with the URL
-- for manifest update requests, to be used by players that don\'t support
-- sticky redirects. Disable this if you have CDN routing rules set up for
-- accessing MediaTailor manifests, and you are either using client-side
-- reporting or your players support sticky HTTP redirects. Valid values
-- are DISABLED and EMT_DEFAULT. The EMT_DEFAULT setting enables the
-- inclusion of the tag and is the default value.
newDashConfigurationForPut ::
  DashConfigurationForPut
newDashConfigurationForPut =
  DashConfigurationForPut'
    { originManifestType =
        Prelude.Nothing,
      mpdLocation = Prelude.Nothing
    }

-- | The setting that controls whether MediaTailor handles manifests from the
-- origin server as multi-period manifests or single-period manifests. If
-- your origin server produces single-period manifests, set this to
-- SINGLE_PERIOD. The default setting is MULTI_PERIOD. For multi-period
-- manifests, omit this setting or set it to MULTI_PERIOD.
dashConfigurationForPut_originManifestType :: Lens.Lens' DashConfigurationForPut (Prelude.Maybe OriginManifestType)
dashConfigurationForPut_originManifestType = Lens.lens (\DashConfigurationForPut' {originManifestType} -> originManifestType) (\s@DashConfigurationForPut' {} a -> s {originManifestType = a} :: DashConfigurationForPut)

-- | The setting that controls whether MediaTailor includes the Location tag
-- in DASH manifests. MediaTailor populates the Location tag with the URL
-- for manifest update requests, to be used by players that don\'t support
-- sticky redirects. Disable this if you have CDN routing rules set up for
-- accessing MediaTailor manifests, and you are either using client-side
-- reporting or your players support sticky HTTP redirects. Valid values
-- are DISABLED and EMT_DEFAULT. The EMT_DEFAULT setting enables the
-- inclusion of the tag and is the default value.
dashConfigurationForPut_mpdLocation :: Lens.Lens' DashConfigurationForPut (Prelude.Maybe Prelude.Text)
dashConfigurationForPut_mpdLocation = Lens.lens (\DashConfigurationForPut' {mpdLocation} -> mpdLocation) (\s@DashConfigurationForPut' {} a -> s {mpdLocation = a} :: DashConfigurationForPut)

instance Prelude.Hashable DashConfigurationForPut

instance Prelude.NFData DashConfigurationForPut

instance Core.ToJSON DashConfigurationForPut where
  toJSON DashConfigurationForPut' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("OriginManifestType" Core..=)
              Prelude.<$> originManifestType,
            ("MpdLocation" Core..=) Prelude.<$> mpdLocation
          ]
      )
