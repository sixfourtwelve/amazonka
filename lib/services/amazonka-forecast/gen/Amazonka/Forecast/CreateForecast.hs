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
-- Module      : Amazonka.Forecast.CreateForecast
-- Copyright   : (c) 2013-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a forecast for each item in the @TARGET_TIME_SERIES@ dataset
-- that was used to train the predictor. This is known as inference. To
-- retrieve the forecast for a single item at low latency, use the
-- operation. To export the complete forecast into your Amazon Simple
-- Storage Service (Amazon S3) bucket, use the CreateForecastExportJob
-- operation.
--
-- The range of the forecast is determined by the @ForecastHorizon@ value,
-- which you specify in the CreatePredictor request. When you query a
-- forecast, you can request a specific date range within the forecast.
--
-- To get a list of all your forecasts, use the ListForecasts operation.
--
-- The forecasts generated by Amazon Forecast are in the same time zone as
-- the dataset that was used to create the predictor.
--
-- For more information, see howitworks-forecast.
--
-- The @Status@ of the forecast must be @ACTIVE@ before you can query or
-- export the forecast. Use the DescribeForecast operation to get the
-- status.
--
-- By default, a forecast includes predictions for every item (@item_id@)
-- in the dataset group that was used to train the predictor. However, you
-- can use the @TimeSeriesSelector@ object to generate a forecast on a
-- subset of time series. Forecast creation is skipped for any time series
-- that you specify that are not in the input dataset. The forecast export
-- file will not contain these time series or their forecasted values.
module Amazonka.Forecast.CreateForecast
  ( -- * Creating a Request
    CreateForecast (..),
    newCreateForecast,

    -- * Request Lenses
    createForecast_tags,
    createForecast_forecastTypes,
    createForecast_timeSeriesSelector,
    createForecast_forecastName,
    createForecast_predictorArn,

    -- * Destructuring the Response
    CreateForecastResponse (..),
    newCreateForecastResponse,

    -- * Response Lenses
    createForecastResponse_forecastArn,
    createForecastResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Core.Lens.Internal as Lens
import Amazonka.Forecast.Types
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newCreateForecast' smart constructor.
data CreateForecast = CreateForecast'
  { -- | The optional metadata that you apply to the forecast to help you
    -- categorize and organize them. Each tag consists of a key and an optional
    -- value, both of which you define.
    --
    -- The following basic restrictions apply to tags:
    --
    -- -   Maximum number of tags per resource - 50.
    --
    -- -   For each resource, each tag key must be unique, and each tag key can
    --     have only one value.
    --
    -- -   Maximum key length - 128 Unicode characters in UTF-8.
    --
    -- -   Maximum value length - 256 Unicode characters in UTF-8.
    --
    -- -   If your tagging schema is used across multiple services and
    --     resources, remember that other services may have restrictions on
    --     allowed characters. Generally allowed characters are: letters,
    --     numbers, and spaces representable in UTF-8, and the following
    --     characters: + - = . _ : \/ \@.
    --
    -- -   Tag keys and values are case sensitive.
    --
    -- -   Do not use @aws:@, @AWS:@, or any upper or lowercase combination of
    --     such as a prefix for keys as it is reserved for AWS use. You cannot
    --     edit or delete tag keys with this prefix. Values can have this
    --     prefix. If a tag value has @aws@ as its prefix but the key does not,
    --     then Forecast considers it to be a user tag and will count against
    --     the limit of 50 tags. Tags with only the key prefix of @aws@ do not
    --     count against your tags per resource limit.
    tags :: Prelude.Maybe [Tag],
    -- | The quantiles at which probabilistic forecasts are generated. __You can
    -- currently specify up to 5 quantiles per forecast__. Accepted values
    -- include @0.01 to 0.99@ (increments of .01 only) and @mean@. The mean
    -- forecast is different from the median (0.50) when the distribution is
    -- not symmetric (for example, Beta and Negative Binomial).
    --
    -- The default quantiles are the quantiles you specified during predictor
    -- creation. If you didn\'t specify quantiles, the default values are
    -- @[\"0.1\", \"0.5\", \"0.9\"]@.
    forecastTypes :: Prelude.Maybe (Prelude.NonEmpty Prelude.Text),
    -- | Defines the set of time series that are used to create the forecasts in
    -- a @TimeSeriesIdentifiers@ object.
    --
    -- The @TimeSeriesIdentifiers@ object needs the following information:
    --
    -- -   @DataSource@
    --
    -- -   @Format@
    --
    -- -   @Schema@
    timeSeriesSelector :: Prelude.Maybe TimeSeriesSelector,
    -- | A name for the forecast.
    forecastName :: Prelude.Text,
    -- | The Amazon Resource Name (ARN) of the predictor to use to generate the
    -- forecast.
    predictorArn :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateForecast' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'tags', 'createForecast_tags' - The optional metadata that you apply to the forecast to help you
-- categorize and organize them. Each tag consists of a key and an optional
-- value, both of which you define.
--
-- The following basic restrictions apply to tags:
--
-- -   Maximum number of tags per resource - 50.
--
-- -   For each resource, each tag key must be unique, and each tag key can
--     have only one value.
--
-- -   Maximum key length - 128 Unicode characters in UTF-8.
--
-- -   Maximum value length - 256 Unicode characters in UTF-8.
--
-- -   If your tagging schema is used across multiple services and
--     resources, remember that other services may have restrictions on
--     allowed characters. Generally allowed characters are: letters,
--     numbers, and spaces representable in UTF-8, and the following
--     characters: + - = . _ : \/ \@.
--
-- -   Tag keys and values are case sensitive.
--
-- -   Do not use @aws:@, @AWS:@, or any upper or lowercase combination of
--     such as a prefix for keys as it is reserved for AWS use. You cannot
--     edit or delete tag keys with this prefix. Values can have this
--     prefix. If a tag value has @aws@ as its prefix but the key does not,
--     then Forecast considers it to be a user tag and will count against
--     the limit of 50 tags. Tags with only the key prefix of @aws@ do not
--     count against your tags per resource limit.
--
-- 'forecastTypes', 'createForecast_forecastTypes' - The quantiles at which probabilistic forecasts are generated. __You can
-- currently specify up to 5 quantiles per forecast__. Accepted values
-- include @0.01 to 0.99@ (increments of .01 only) and @mean@. The mean
-- forecast is different from the median (0.50) when the distribution is
-- not symmetric (for example, Beta and Negative Binomial).
--
-- The default quantiles are the quantiles you specified during predictor
-- creation. If you didn\'t specify quantiles, the default values are
-- @[\"0.1\", \"0.5\", \"0.9\"]@.
--
-- 'timeSeriesSelector', 'createForecast_timeSeriesSelector' - Defines the set of time series that are used to create the forecasts in
-- a @TimeSeriesIdentifiers@ object.
--
-- The @TimeSeriesIdentifiers@ object needs the following information:
--
-- -   @DataSource@
--
-- -   @Format@
--
-- -   @Schema@
--
-- 'forecastName', 'createForecast_forecastName' - A name for the forecast.
--
-- 'predictorArn', 'createForecast_predictorArn' - The Amazon Resource Name (ARN) of the predictor to use to generate the
-- forecast.
newCreateForecast ::
  -- | 'forecastName'
  Prelude.Text ->
  -- | 'predictorArn'
  Prelude.Text ->
  CreateForecast
newCreateForecast pForecastName_ pPredictorArn_ =
  CreateForecast'
    { tags = Prelude.Nothing,
      forecastTypes = Prelude.Nothing,
      timeSeriesSelector = Prelude.Nothing,
      forecastName = pForecastName_,
      predictorArn = pPredictorArn_
    }

-- | The optional metadata that you apply to the forecast to help you
-- categorize and organize them. Each tag consists of a key and an optional
-- value, both of which you define.
--
-- The following basic restrictions apply to tags:
--
-- -   Maximum number of tags per resource - 50.
--
-- -   For each resource, each tag key must be unique, and each tag key can
--     have only one value.
--
-- -   Maximum key length - 128 Unicode characters in UTF-8.
--
-- -   Maximum value length - 256 Unicode characters in UTF-8.
--
-- -   If your tagging schema is used across multiple services and
--     resources, remember that other services may have restrictions on
--     allowed characters. Generally allowed characters are: letters,
--     numbers, and spaces representable in UTF-8, and the following
--     characters: + - = . _ : \/ \@.
--
-- -   Tag keys and values are case sensitive.
--
-- -   Do not use @aws:@, @AWS:@, or any upper or lowercase combination of
--     such as a prefix for keys as it is reserved for AWS use. You cannot
--     edit or delete tag keys with this prefix. Values can have this
--     prefix. If a tag value has @aws@ as its prefix but the key does not,
--     then Forecast considers it to be a user tag and will count against
--     the limit of 50 tags. Tags with only the key prefix of @aws@ do not
--     count against your tags per resource limit.
createForecast_tags :: Lens.Lens' CreateForecast (Prelude.Maybe [Tag])
createForecast_tags = Lens.lens (\CreateForecast' {tags} -> tags) (\s@CreateForecast' {} a -> s {tags = a} :: CreateForecast) Prelude.. Lens.mapping Lens.coerced

-- | The quantiles at which probabilistic forecasts are generated. __You can
-- currently specify up to 5 quantiles per forecast__. Accepted values
-- include @0.01 to 0.99@ (increments of .01 only) and @mean@. The mean
-- forecast is different from the median (0.50) when the distribution is
-- not symmetric (for example, Beta and Negative Binomial).
--
-- The default quantiles are the quantiles you specified during predictor
-- creation. If you didn\'t specify quantiles, the default values are
-- @[\"0.1\", \"0.5\", \"0.9\"]@.
createForecast_forecastTypes :: Lens.Lens' CreateForecast (Prelude.Maybe (Prelude.NonEmpty Prelude.Text))
createForecast_forecastTypes = Lens.lens (\CreateForecast' {forecastTypes} -> forecastTypes) (\s@CreateForecast' {} a -> s {forecastTypes = a} :: CreateForecast) Prelude.. Lens.mapping Lens.coerced

-- | Defines the set of time series that are used to create the forecasts in
-- a @TimeSeriesIdentifiers@ object.
--
-- The @TimeSeriesIdentifiers@ object needs the following information:
--
-- -   @DataSource@
--
-- -   @Format@
--
-- -   @Schema@
createForecast_timeSeriesSelector :: Lens.Lens' CreateForecast (Prelude.Maybe TimeSeriesSelector)
createForecast_timeSeriesSelector = Lens.lens (\CreateForecast' {timeSeriesSelector} -> timeSeriesSelector) (\s@CreateForecast' {} a -> s {timeSeriesSelector = a} :: CreateForecast)

-- | A name for the forecast.
createForecast_forecastName :: Lens.Lens' CreateForecast Prelude.Text
createForecast_forecastName = Lens.lens (\CreateForecast' {forecastName} -> forecastName) (\s@CreateForecast' {} a -> s {forecastName = a} :: CreateForecast)

-- | The Amazon Resource Name (ARN) of the predictor to use to generate the
-- forecast.
createForecast_predictorArn :: Lens.Lens' CreateForecast Prelude.Text
createForecast_predictorArn = Lens.lens (\CreateForecast' {predictorArn} -> predictorArn) (\s@CreateForecast' {} a -> s {predictorArn = a} :: CreateForecast)

instance Core.AWSRequest CreateForecast where
  type
    AWSResponse CreateForecast =
      CreateForecastResponse
  request overrides =
    Request.postJSON (overrides defaultService)
  response =
    Response.receiveJSON
      ( \s h x ->
          CreateForecastResponse'
            Prelude.<$> (x Core..?> "ForecastArn")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable CreateForecast where
  hashWithSalt _salt CreateForecast' {..} =
    _salt `Prelude.hashWithSalt` tags
      `Prelude.hashWithSalt` forecastTypes
      `Prelude.hashWithSalt` timeSeriesSelector
      `Prelude.hashWithSalt` forecastName
      `Prelude.hashWithSalt` predictorArn

instance Prelude.NFData CreateForecast where
  rnf CreateForecast' {..} =
    Prelude.rnf tags
      `Prelude.seq` Prelude.rnf forecastTypes
      `Prelude.seq` Prelude.rnf timeSeriesSelector
      `Prelude.seq` Prelude.rnf forecastName
      `Prelude.seq` Prelude.rnf predictorArn

instance Core.ToHeaders CreateForecast where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "AmazonForecast.CreateForecast" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON CreateForecast where
  toJSON CreateForecast' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("Tags" Core..=) Prelude.<$> tags,
            ("ForecastTypes" Core..=) Prelude.<$> forecastTypes,
            ("TimeSeriesSelector" Core..=)
              Prelude.<$> timeSeriesSelector,
            Prelude.Just ("ForecastName" Core..= forecastName),
            Prelude.Just ("PredictorArn" Core..= predictorArn)
          ]
      )

instance Core.ToPath CreateForecast where
  toPath = Prelude.const "/"

instance Core.ToQuery CreateForecast where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newCreateForecastResponse' smart constructor.
data CreateForecastResponse = CreateForecastResponse'
  { -- | The Amazon Resource Name (ARN) of the forecast.
    forecastArn :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'CreateForecastResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'forecastArn', 'createForecastResponse_forecastArn' - The Amazon Resource Name (ARN) of the forecast.
--
-- 'httpStatus', 'createForecastResponse_httpStatus' - The response's http status code.
newCreateForecastResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  CreateForecastResponse
newCreateForecastResponse pHttpStatus_ =
  CreateForecastResponse'
    { forecastArn =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The Amazon Resource Name (ARN) of the forecast.
createForecastResponse_forecastArn :: Lens.Lens' CreateForecastResponse (Prelude.Maybe Prelude.Text)
createForecastResponse_forecastArn = Lens.lens (\CreateForecastResponse' {forecastArn} -> forecastArn) (\s@CreateForecastResponse' {} a -> s {forecastArn = a} :: CreateForecastResponse)

-- | The response's http status code.
createForecastResponse_httpStatus :: Lens.Lens' CreateForecastResponse Prelude.Int
createForecastResponse_httpStatus = Lens.lens (\CreateForecastResponse' {httpStatus} -> httpStatus) (\s@CreateForecastResponse' {} a -> s {httpStatus = a} :: CreateForecastResponse)

instance Prelude.NFData CreateForecastResponse where
  rnf CreateForecastResponse' {..} =
    Prelude.rnf forecastArn
      `Prelude.seq` Prelude.rnf httpStatus
