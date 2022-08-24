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
-- Module      : Amazonka.Organizations.Types.PolicyTargetSummary
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.Organizations.Types.PolicyTargetSummary where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import Amazonka.Organizations.Types.TargetType
import qualified Amazonka.Prelude as Prelude

-- | Contains information about a root, OU, or account that a policy is
-- attached to.
--
-- /See:/ 'newPolicyTargetSummary' smart constructor.
data PolicyTargetSummary = PolicyTargetSummary'
  { -- | The friendly name of the policy target.
    --
    -- The <http://wikipedia.org/wiki/regex regex pattern> that is used to
    -- validate this parameter is a string of any of the characters in the
    -- ASCII character range.
    name :: Prelude.Maybe Prelude.Text,
    -- | The type of the policy target.
    type' :: Prelude.Maybe TargetType,
    -- | The unique identifier (ID) of the policy target.
    --
    -- The <http://wikipedia.org/wiki/regex regex pattern> for a target ID
    -- string requires one of the following:
    --
    -- -   __Root__ - A string that begins with \"r-\" followed by from 4 to 32
    --     lowercase letters or digits.
    --
    -- -   __Account__ - A string that consists of exactly 12 digits.
    --
    -- -   __Organizational unit (OU)__ - A string that begins with \"ou-\"
    --     followed by from 4 to 32 lowercase letters or digits (the ID of the
    --     root that the OU is in). This string is followed by a second \"-\"
    --     dash and from 8 to 32 additional lowercase letters or digits.
    targetId :: Prelude.Maybe Prelude.Text,
    -- | The Amazon Resource Name (ARN) of the policy target.
    --
    -- For more information about ARNs in Organizations, see
    -- <https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies ARN Formats Supported by Organizations>
    -- in the /Amazon Web Services Service Authorization Reference/.
    arn :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'PolicyTargetSummary' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'name', 'policyTargetSummary_name' - The friendly name of the policy target.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> that is used to
-- validate this parameter is a string of any of the characters in the
-- ASCII character range.
--
-- 'type'', 'policyTargetSummary_type' - The type of the policy target.
--
-- 'targetId', 'policyTargetSummary_targetId' - The unique identifier (ID) of the policy target.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> for a target ID
-- string requires one of the following:
--
-- -   __Root__ - A string that begins with \"r-\" followed by from 4 to 32
--     lowercase letters or digits.
--
-- -   __Account__ - A string that consists of exactly 12 digits.
--
-- -   __Organizational unit (OU)__ - A string that begins with \"ou-\"
--     followed by from 4 to 32 lowercase letters or digits (the ID of the
--     root that the OU is in). This string is followed by a second \"-\"
--     dash and from 8 to 32 additional lowercase letters or digits.
--
-- 'arn', 'policyTargetSummary_arn' - The Amazon Resource Name (ARN) of the policy target.
--
-- For more information about ARNs in Organizations, see
-- <https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies ARN Formats Supported by Organizations>
-- in the /Amazon Web Services Service Authorization Reference/.
newPolicyTargetSummary ::
  PolicyTargetSummary
newPolicyTargetSummary =
  PolicyTargetSummary'
    { name = Prelude.Nothing,
      type' = Prelude.Nothing,
      targetId = Prelude.Nothing,
      arn = Prelude.Nothing
    }

-- | The friendly name of the policy target.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> that is used to
-- validate this parameter is a string of any of the characters in the
-- ASCII character range.
policyTargetSummary_name :: Lens.Lens' PolicyTargetSummary (Prelude.Maybe Prelude.Text)
policyTargetSummary_name = Lens.lens (\PolicyTargetSummary' {name} -> name) (\s@PolicyTargetSummary' {} a -> s {name = a} :: PolicyTargetSummary)

-- | The type of the policy target.
policyTargetSummary_type :: Lens.Lens' PolicyTargetSummary (Prelude.Maybe TargetType)
policyTargetSummary_type = Lens.lens (\PolicyTargetSummary' {type'} -> type') (\s@PolicyTargetSummary' {} a -> s {type' = a} :: PolicyTargetSummary)

-- | The unique identifier (ID) of the policy target.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> for a target ID
-- string requires one of the following:
--
-- -   __Root__ - A string that begins with \"r-\" followed by from 4 to 32
--     lowercase letters or digits.
--
-- -   __Account__ - A string that consists of exactly 12 digits.
--
-- -   __Organizational unit (OU)__ - A string that begins with \"ou-\"
--     followed by from 4 to 32 lowercase letters or digits (the ID of the
--     root that the OU is in). This string is followed by a second \"-\"
--     dash and from 8 to 32 additional lowercase letters or digits.
policyTargetSummary_targetId :: Lens.Lens' PolicyTargetSummary (Prelude.Maybe Prelude.Text)
policyTargetSummary_targetId = Lens.lens (\PolicyTargetSummary' {targetId} -> targetId) (\s@PolicyTargetSummary' {} a -> s {targetId = a} :: PolicyTargetSummary)

-- | The Amazon Resource Name (ARN) of the policy target.
--
-- For more information about ARNs in Organizations, see
-- <https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies ARN Formats Supported by Organizations>
-- in the /Amazon Web Services Service Authorization Reference/.
policyTargetSummary_arn :: Lens.Lens' PolicyTargetSummary (Prelude.Maybe Prelude.Text)
policyTargetSummary_arn = Lens.lens (\PolicyTargetSummary' {arn} -> arn) (\s@PolicyTargetSummary' {} a -> s {arn = a} :: PolicyTargetSummary)

instance Core.FromJSON PolicyTargetSummary where
  parseJSON =
    Core.withObject
      "PolicyTargetSummary"
      ( \x ->
          PolicyTargetSummary'
            Prelude.<$> (x Core..:? "Name")
            Prelude.<*> (x Core..:? "Type")
            Prelude.<*> (x Core..:? "TargetId")
            Prelude.<*> (x Core..:? "Arn")
      )

instance Prelude.Hashable PolicyTargetSummary where
  hashWithSalt _salt PolicyTargetSummary' {..} =
    _salt `Prelude.hashWithSalt` name
      `Prelude.hashWithSalt` type'
      `Prelude.hashWithSalt` targetId
      `Prelude.hashWithSalt` arn

instance Prelude.NFData PolicyTargetSummary where
  rnf PolicyTargetSummary' {..} =
    Prelude.rnf name
      `Prelude.seq` Prelude.rnf type'
      `Prelude.seq` Prelude.rnf targetId
      `Prelude.seq` Prelude.rnf arn
