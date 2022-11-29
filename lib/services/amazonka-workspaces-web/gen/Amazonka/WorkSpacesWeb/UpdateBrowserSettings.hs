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
-- Module      : Amazonka.WorkSpacesWeb.UpdateBrowserSettings
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates browser settings.
module Amazonka.WorkSpacesWeb.UpdateBrowserSettings
  ( -- * Creating a Request
    UpdateBrowserSettings (..),
    newUpdateBrowserSettings,

    -- * Request Lenses
    updateBrowserSettings_clientToken,
    updateBrowserSettings_browserPolicy,
    updateBrowserSettings_browserSettingsArn,

    -- * Destructuring the Response
    UpdateBrowserSettingsResponse (..),
    newUpdateBrowserSettingsResponse,

    -- * Response Lenses
    updateBrowserSettingsResponse_httpStatus,
    updateBrowserSettingsResponse_browserSettings,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response
import Amazonka.WorkSpacesWeb.Types

-- | /See:/ 'newUpdateBrowserSettings' smart constructor.
data UpdateBrowserSettings = UpdateBrowserSettings'
  { -- | A unique, case-sensitive identifier that you provide to ensure the
    -- idempotency of the request. Idempotency ensures that an API request
    -- completes only once. With an idempotent request, if the original request
    -- completes successfully, subsequent retries with the same client token
    -- return the result from the original successful request.
    --
    -- If you do not specify a client token, one is automatically generated by
    -- the AWS SDK.
    clientToken :: Prelude.Maybe Prelude.Text,
    -- | A JSON string containing Chrome Enterprise policies that will be applied
    -- to all streaming sessions.
    browserPolicy :: Prelude.Maybe (Core.Sensitive Prelude.Text),
    -- | The ARN of the browser settings.
    browserSettingsArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'UpdateBrowserSettings' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'clientToken', 'updateBrowserSettings_clientToken' - A unique, case-sensitive identifier that you provide to ensure the
-- idempotency of the request. Idempotency ensures that an API request
-- completes only once. With an idempotent request, if the original request
-- completes successfully, subsequent retries with the same client token
-- return the result from the original successful request.
--
-- If you do not specify a client token, one is automatically generated by
-- the AWS SDK.
--
-- 'browserPolicy', 'updateBrowserSettings_browserPolicy' - A JSON string containing Chrome Enterprise policies that will be applied
-- to all streaming sessions.
--
-- 'browserSettingsArn', 'updateBrowserSettings_browserSettingsArn' - The ARN of the browser settings.
newUpdateBrowserSettings ::
  -- | 'browserSettingsArn'
  Prelude.Text ->
  UpdateBrowserSettings
newUpdateBrowserSettings pBrowserSettingsArn_ =
  UpdateBrowserSettings'
    { clientToken =
        Prelude.Nothing,
      browserPolicy = Prelude.Nothing,
      browserSettingsArn = pBrowserSettingsArn_
    }

-- | A unique, case-sensitive identifier that you provide to ensure the
-- idempotency of the request. Idempotency ensures that an API request
-- completes only once. With an idempotent request, if the original request
-- completes successfully, subsequent retries with the same client token
-- return the result from the original successful request.
--
-- If you do not specify a client token, one is automatically generated by
-- the AWS SDK.
updateBrowserSettings_clientToken :: Lens.Lens' UpdateBrowserSettings (Prelude.Maybe Prelude.Text)
updateBrowserSettings_clientToken = Lens.lens (\UpdateBrowserSettings' {clientToken} -> clientToken) (\s@UpdateBrowserSettings' {} a -> s {clientToken = a} :: UpdateBrowserSettings)

-- | A JSON string containing Chrome Enterprise policies that will be applied
-- to all streaming sessions.
updateBrowserSettings_browserPolicy :: Lens.Lens' UpdateBrowserSettings (Prelude.Maybe Prelude.Text)
updateBrowserSettings_browserPolicy = Lens.lens (\UpdateBrowserSettings' {browserPolicy} -> browserPolicy) (\s@UpdateBrowserSettings' {} a -> s {browserPolicy = a} :: UpdateBrowserSettings) Prelude.. Lens.mapping Core._Sensitive

-- | The ARN of the browser settings.
updateBrowserSettings_browserSettingsArn :: Lens.Lens' UpdateBrowserSettings Prelude.Text
updateBrowserSettings_browserSettingsArn = Lens.lens (\UpdateBrowserSettings' {browserSettingsArn} -> browserSettingsArn) (\s@UpdateBrowserSettings' {} a -> s {browserSettingsArn = a} :: UpdateBrowserSettings)

instance Core.AWSRequest UpdateBrowserSettings where
  type
    AWSResponse UpdateBrowserSettings =
      UpdateBrowserSettingsResponse
  request overrides =
    Request.patchJSON (overrides defaultService)
  response =
    Response.receiveJSON
      ( \s h x ->
          UpdateBrowserSettingsResponse'
            Prelude.<$> (Prelude.pure (Prelude.fromEnum s))
            Prelude.<*> (x Core..:> "browserSettings")
      )

instance Prelude.Hashable UpdateBrowserSettings where
  hashWithSalt _salt UpdateBrowserSettings' {..} =
    _salt `Prelude.hashWithSalt` clientToken
      `Prelude.hashWithSalt` browserPolicy
      `Prelude.hashWithSalt` browserSettingsArn

instance Prelude.NFData UpdateBrowserSettings where
  rnf UpdateBrowserSettings' {..} =
    Prelude.rnf clientToken
      `Prelude.seq` Prelude.rnf browserPolicy
      `Prelude.seq` Prelude.rnf browserSettingsArn

instance Core.ToHeaders UpdateBrowserSettings where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON UpdateBrowserSettings where
  toJSON UpdateBrowserSettings' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("clientToken" Core..=) Prelude.<$> clientToken,
            ("browserPolicy" Core..=) Prelude.<$> browserPolicy
          ]
      )

instance Core.ToPath UpdateBrowserSettings where
  toPath UpdateBrowserSettings' {..} =
    Prelude.mconcat
      ["/browserSettings/", Core.toBS browserSettingsArn]

instance Core.ToQuery UpdateBrowserSettings where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newUpdateBrowserSettingsResponse' smart constructor.
data UpdateBrowserSettingsResponse = UpdateBrowserSettingsResponse'
  { -- | The response's http status code.
    httpStatus :: Prelude.Int,
    -- | The browser settings.
    browserSettings :: BrowserSettings
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'UpdateBrowserSettingsResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'httpStatus', 'updateBrowserSettingsResponse_httpStatus' - The response's http status code.
--
-- 'browserSettings', 'updateBrowserSettingsResponse_browserSettings' - The browser settings.
newUpdateBrowserSettingsResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  -- | 'browserSettings'
  BrowserSettings ->
  UpdateBrowserSettingsResponse
newUpdateBrowserSettingsResponse
  pHttpStatus_
  pBrowserSettings_ =
    UpdateBrowserSettingsResponse'
      { httpStatus =
          pHttpStatus_,
        browserSettings = pBrowserSettings_
      }

-- | The response's http status code.
updateBrowserSettingsResponse_httpStatus :: Lens.Lens' UpdateBrowserSettingsResponse Prelude.Int
updateBrowserSettingsResponse_httpStatus = Lens.lens (\UpdateBrowserSettingsResponse' {httpStatus} -> httpStatus) (\s@UpdateBrowserSettingsResponse' {} a -> s {httpStatus = a} :: UpdateBrowserSettingsResponse)

-- | The browser settings.
updateBrowserSettingsResponse_browserSettings :: Lens.Lens' UpdateBrowserSettingsResponse BrowserSettings
updateBrowserSettingsResponse_browserSettings = Lens.lens (\UpdateBrowserSettingsResponse' {browserSettings} -> browserSettings) (\s@UpdateBrowserSettingsResponse' {} a -> s {browserSettings = a} :: UpdateBrowserSettingsResponse)

instance Prelude.NFData UpdateBrowserSettingsResponse where
  rnf UpdateBrowserSettingsResponse' {..} =
    Prelude.rnf httpStatus
      `Prelude.seq` Prelude.rnf browserSettings
