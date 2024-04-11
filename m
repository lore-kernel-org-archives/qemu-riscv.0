Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD38FCD1284
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 11:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rusdY-0007Gj-Eg; Thu, 11 Apr 2024 07:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusdT-0007FF-Gf
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 07:30:32 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rusdR-0005cN-Ql
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 07:30:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so5073361a12.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712835028; x=1713439828; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C836pQcgTLra/kJ/JUFTbZumnEBac6SnR5IxpEompXo=;
 b=jQ3M5m37Q2hWiI6A79OiigDMPJee6BKQ+oRhGk/VI6wi6S6VBNF929Q2TsZjawjkKs
 BBhfgZx9oamVJPi5vTFH6nFcnCSQEDNOjJaLBN7qK+FJuF+sS+/asA2UzQthOpmbIP1q
 hmp+a32zsFsGQ67V/XGtRtmoUwYtbGWUis3Km8OeVH+Z67G/YtNHTLuMD+BUcb310xoV
 5hpf/V+MiKTmzUNEn7yFvR5lLTeA07J4p1JPoTofLrJP6Gm5opPZHmBtGlSq7/ao2P1K
 YoQmB9AbiBZ1qqUnl6G75I8bmRv/T/t8kkInfBMRylypiAowQSkmJj9m7vh3XcpSaAna
 xecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712835028; x=1713439828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C836pQcgTLra/kJ/JUFTbZumnEBac6SnR5IxpEompXo=;
 b=us7bVm5EBkQ+SpxYWzfa2TDOcS0qpKdzEwPPo5vWl9wnmGWvwoCRyEYHOBkUPqfZ1X
 o5xumQGSEXRMuDbyLQJk6m31tj+vMS68L3SwOKuMnbCN57Szp/4VpoRkmtxjCETAwk30
 hlPjeFS9F0s6B16kLVwaBreSaLHqA/T1AqGKhh1PMR4G8XfuyF0Ju7ODM/Q9kbvnQi6L
 5xxB3kng+rh+xP9Tr76NtO0SDUrDWG8c+vvTKhU25ngwi4ux5Dd3LlZ70jVVZgp4FSH9
 50oGqgrVDSFocFZrQx67Jd27DUMQTQZs0K/8V3RhgMmLjURB3E77O+sFG1i7KnVWXlNI
 y9Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYv92wn6OzNja6EbRHbytHj1+JLgFzCAMK04ABlHG+L502sFrhjh/pJmvhbPs5GA7/fcTip0TQaf63bhR+GVm4sfuk7aY=
X-Gm-Message-State: AOJu0YztmiYIeSThrrGinJkoCycXqTksUT2lQtT79GEkAoB6jagZoBJQ
 ksWbvd248sF3Tygi3l/Z9AHCaykiUW9CbZRZWIBYdVRKaGt2B46RVM6JXwail3wAGBiuVIYSxzA
 EdpiQfSKCCViyQxGoVXlCEgKcDlwsmIDiLdAUUg==
X-Google-Smtp-Source: AGHT+IF/tOtdMJ6e68KPsfbaVRMi+YUVlm72VVmvLS51WCs/EELAXLl4tVDruP/hIJlSGb15mDwt65SP278RGcVPwfk=
X-Received: by 2002:a50:9b55:0:b0:566:2f24:b063 with SMTP id
 a21-20020a509b55000000b005662f24b063mr3675472edj.23.1712835028041; Thu, 11
 Apr 2024 04:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-7-philmd@linaro.org>
In-Reply-To: <20240411104340.6617-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 12:30:16 +0100
Message-ID: <CAFEAcA9_pbMBjNsOJe2LkfC6z5wuRMSM1pL7X0aHVjdzysoLOw@mail.gmail.com>
Subject: Re: [PATCH 6/9] hw/net/rocker: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, 11 Apr 2024 at 11:47, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.

("developer")

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/rocker/rocker.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

>          switch (offset) {
>          case ROCKER_DMA_DESC_ADDR_OFFSET:
> -            sprintf(buf, "Ring[%s] ADDR", ring_name);
> +            snprintf(buf, sizeofbuf), "Ring[%s] ADDR", ring_name);

Something seems to have gone wrong here. Shouldn't this have
failed to compile ?

thanks
-- PMM

