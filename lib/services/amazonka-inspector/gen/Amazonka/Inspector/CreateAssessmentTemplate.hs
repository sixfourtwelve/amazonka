{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Amazonka.Inspector.CreateAssessmentTemplate
-- Copyright   : (c) 2013-2023 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an assessment template for the assessment target that is
-- specified by the ARN of the assessment target. If the
-- <https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html service-linked role>
-- isn’t already registered, this action also creates and registers a
-- service-linked role to grant Amazon Inspector access to AWS Services
-- needed to perform security assessments.
module Amazonka.Inspector.CreateAssessmentTemplate
  ( -- * Creating a Request
    CreateAssessmentTemplate (..),
    newCreateAssessmentTemplate,

    -- * Request Lenses
    createAssessmentTemplate_userAttributesForFindings,
    createAssessmentTemplate_assessmentTargetArn,
    createAssessmentTemplate_assessmentTemplateName,
    createAssessmentTemplate_durationInSeconds,
    createAssessmentTemplate_rulesPackageArns,

    -- * Destructuring the Response
    CreateAssessmentTemplateResponse (..),
    newCreateAssessmentTemplateResponse,

    -- * Response Lenses
    createAssessmentTemplateResponse_httpStatus,
    createAssessmentTemplateResponse_assessmentTemplateArn,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Data as Data
import Amazonka.Inspector.Types
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newCreateAssessmentTemplate' smart constructor.
data CreateAssessmentTemplate = CreateAssessmentTemplate'
  { -- | The user-defined attributes that are assigned to every finding that is
    -- generated by the assessment run that uses this assessment template. An
    -- attribute is a key and value pair (an Attribute object). Within an
    -- assessment template, each key must be unique.
    userAttributesForFindings :: Prelude.Maybe [Attribute],
    -- | The ARN that specifies the assessment target for which you want to
    -- create the assessment template.
    assessmentTargetArn :: Prelude.Text,
    -- | The user-defined name that identifies the assessment template that you
    -- want to create. You can create several assessment templates for an
    -- assessment target. The names of the assessment templates that correspond
    -- to a particular assessment target must be unique.
    assessmentTemplateName :: Prelude.Text,
    -- | The duration of the assessment run in seconds.
    durationInSeconds :: Prelude.Natural,
    -- | The ARNs that specify the rules packages that you want to attach to the
    -- assessment template.
    rulesPackageArns :: [Prelude.Text]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateAssessmentTemplate' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'userAttributesForFindings', 'createAssessmentTemplate_userAttributesForFindings' - The user-defined attributes that are assigned to every finding that is
-- generated by the assessment run that uses this assessment template. An
-- attribute is a key and value pair (an Attribute object). Within an
-- assessment template, each key must be unique.
--
-- 'assessmentTargetArn', 'createAssessmentTemplate_assessmentTargetArn' - The ARN that specifies the assessment target for which you want to
-- create the assessment template.
--
-- 'assessmentTemplateName', 'createAssessmentTemplate_assessmentTemplateName' - The user-defined name that identifies the assessment template that you
-- want to create. You can create several assessment templates for an
-- assessment target. The names of the assessment templates that correspond
-- to a particular assessment target must be unique.
--
-- 'durationInSeconds', 'createAssessmentTemplate_durationInSeconds' - The duration of the assessment run in seconds.
--
-- 'rulesPackageArns', 'createAssessmentTemplate_rulesPackageArns' - The ARNs that specify the rules packages that you want to attach to the
-- assessment template.
newCreateAssessmentTemplate ::
  -- | 'assessmentTargetArn'
  Prelude.Text ->
  -- | 'assessmentTemplateName'
  Prelude.Text ->
  -- | 'durationInSeconds'
  Prelude.Natural ->
  CreateAssessmentTemplate
newCreateAssessmentTemplate
  pAssessmentTargetArn_
  pAssessmentTemplateName_
  pDurationInSeconds_ =
    CreateAssessmentTemplate'
      { userAttributesForFindings =
          Prelude.Nothing,
        assessmentTargetArn = pAssessmentTargetArn_,
        assessmentTemplateName = pAssessmentTemplateName_,
        durationInSeconds = pDurationInSeconds_,
        rulesPackageArns = Prelude.mempty
      }

-- | The user-defined attributes that are assigned to every finding that is
-- generated by the assessment run that uses this assessment template. An
-- attribute is a key and value pair (an Attribute object). Within an
-- assessment template, each key must be unique.
createAssessmentTemplate_userAttributesForFindings :: Lens.Lens' CreateAssessmentTemplate (Prelude.Maybe [Attribute])
createAssessmentTemplate_userAttributesForFindings = Lens.lens (\CreateAssessmentTemplate' {userAttributesForFindings} -> userAttributesForFindings) (\s@CreateAssessmentTemplate' {} a -> s {userAttributesForFindings = a} :: CreateAssessmentTemplate) Prelude.. Lens.mapping Lens.coerced

-- | The ARN that specifies the assessment target for which you want to
-- create the assessment template.
createAssessmentTemplate_assessmentTargetArn :: Lens.Lens' CreateAssessmentTemplate Prelude.Text
createAssessmentTemplate_assessmentTargetArn = Lens.lens (\CreateAssessmentTemplate' {assessmentTargetArn} -> assessmentTargetArn) (\s@CreateAssessmentTemplate' {} a -> s {assessmentTargetArn = a} :: CreateAssessmentTemplate)

-- | The user-defined name that identifies the assessment template that you
-- want to create. You can create several assessment templates for an
-- assessment target. The names of the assessment templates that correspond
-- to a particular assessment target must be unique.
createAssessmentTemplate_assessmentTemplateName :: Lens.Lens' CreateAssessmentTemplate Prelude.Text
createAssessmentTemplate_assessmentTemplateName = Lens.lens (\CreateAssessmentTemplate' {assessmentTemplateName} -> assessmentTemplateName) (\s@CreateAssessmentTemplate' {} a -> s {assessmentTemplateName = a} :: CreateAssessmentTemplate)

-- | The duration of the assessment run in seconds.
createAssessmentTemplate_durationInSeconds :: Lens.Lens' CreateAssessmentTemplate Prelude.Natural
createAssessmentTemplate_durationInSeconds = Lens.lens (\CreateAssessmentTemplate' {durationInSeconds} -> durationInSeconds) (\s@CreateAssessmentTemplate' {} a -> s {durationInSeconds = a} :: CreateAssessmentTemplate)

-- | The ARNs that specify the rules packages that you want to attach to the
-- assessment template.
createAssessmentTemplate_rulesPackageArns :: Lens.Lens' CreateAssessmentTemplate [Prelude.Text]
createAssessmentTemplate_rulesPackageArns = Lens.lens (\CreateAssessmentTemplate' {rulesPackageArns} -> rulesPackageArns) (\s@CreateAssessmentTemplate' {} a -> s {rulesPackageArns = a} :: CreateAssessmentTemplate) Prelude.. Lens.coerced

instance Core.AWSRequest CreateAssessmentTemplate where
  type
    AWSResponse CreateAssessmentTemplate =
      CreateAssessmentTemplateResponse
  request overrides =
    Request.postJSON (overrides defaultService)
  response =
    Response.receiveJSON
      ( \s h x ->
          CreateAssessmentTemplateResponse'
            Prelude.<$> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> (x Data..:> "assessmentTemplateArn")
      )

instance Prelude.Hashable CreateAssessmentTemplate where
  hashWithSalt _salt CreateAssessmentTemplate' {..} =
    _salt
      `Prelude.hashWithSalt` userAttributesForFindings
      `Prelude.hashWithSalt` assessmentTargetArn
      `Prelude.hashWithSalt` assessmentTemplateName
      `Prelude.hashWithSalt` durationInSeconds
      `Prelude.hashWithSalt` rulesPackageArns

instance Prelude.NFData CreateAssessmentTemplate where
  rnf CreateAssessmentTemplate' {..} =
    Prelude.rnf userAttributesForFindings
      `Prelude.seq` Prelude.rnf assessmentTargetArn
      `Prelude.seq` Prelude.rnf assessmentTemplateName
      `Prelude.seq` Prelude.rnf durationInSeconds
      `Prelude.seq` Prelude.rnf rulesPackageArns

instance Data.ToHeaders CreateAssessmentTemplate where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Data.=# ( "InspectorService.CreateAssessmentTemplate" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Data.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Data.ToJSON CreateAssessmentTemplate where
  toJSON CreateAssessmentTemplate' {..} =
    Data.object
      ( Prelude.catMaybes
          [ ("userAttributesForFindings" Data..=)
              Prelude.<$> userAttributesForFindings,
            Prelude.Just
              ("assessmentTargetArn" Data..= assessmentTargetArn),
            Prelude.Just
              ( "assessmentTemplateName"
                  Data..= assessmentTemplateName
              ),
            Prelude.Just
              ("durationInSeconds" Data..= durationInSeconds),
            Prelude.Just
              ("rulesPackageArns" Data..= rulesPackageArns)
          ]
      )

instance Data.ToPath CreateAssessmentTemplate where
  toPath = Prelude.const "/"

instance Data.ToQuery CreateAssessmentTemplate where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newCreateAssessmentTemplateResponse' smart constructor.
data CreateAssessmentTemplateResponse = CreateAssessmentTemplateResponse'
  { -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | The ARN that specifies the assessment template that is created.
    assessmentTemplateArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateAssessmentTemplateResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'httpStatus', 'createAssessmentTemplateResponse_httpStatus' - The response's http status code.
--
-- 'assessmentTemplateArn', 'createAssessmentTemplateResponse_assessmentTemplateArn' - The ARN that specifies the assessment template that is created.
newCreateAssessmentTemplateResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  -- | 'assessmentTemplateArn'
  Prelude.Text ->
  CreateAssessmentTemplateResponse
newCreateAssessmentTemplateResponse
  pHttpStatus_
  pAssessmentTemplateArn_ =
    CreateAssessmentTemplateResponse'
      { httpStatus =
          pHttpStatus_,
        assessmentTemplateArn =
          pAssessmentTemplateArn_
      }

-- | The response's http status code.
createAssessmentTemplateResponse_httpStatus :: Lens.Lens' CreateAssessmentTemplateResponse Prelude.Int
createAssessmentTemplateResponse_httpStatus = Lens.lens (\CreateAssessmentTemplateResponse' {httpStatus} -> httpStatus) (\s@CreateAssessmentTemplateResponse' {} a -> s {httpStatus = a} :: CreateAssessmentTemplateResponse)

-- | The ARN that specifies the assessment template that is created.
createAssessmentTemplateResponse_assessmentTemplateArn :: Lens.Lens' CreateAssessmentTemplateResponse Prelude.Text
createAssessmentTemplateResponse_assessmentTemplateArn = Lens.lens (\CreateAssessmentTemplateResponse' {assessmentTemplateArn} -> assessmentTemplateArn) (\s@CreateAssessmentTemplateResponse' {} a -> s {assessmentTemplateArn = a} :: CreateAssessmentTemplateResponse)

instance
  Prelude.NFData
    CreateAssessmentTemplateResponse
  where
  rnf CreateAssessmentTemplateResponse' {..} =
    Prelude.rnf httpStatus
      `Prelude.seq` Prelude.rnf assessmentTemplateArn
