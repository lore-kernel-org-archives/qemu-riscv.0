Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF2EC43602
	for <qemu-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 23:30:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdyxH-0006wg-19; Sun, 28 Jun 2026 19:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdyxF-0006vG-Hb
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 19:30:25 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdyxD-0001N3-OC
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 19:30:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-697ce8cfe65so4413901a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 16:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782689422; cv=none;
 d=google.com; s=arc-20260327;
 b=pGi7y42YX/kc7UWE54eR4/PYt/SAPf8DXFZTGskuGbo7JenuJuTC+L45hNDgaeF6eq
 267O9yeu1rHpQxFh6OdbT3VjibvrGJWeWCL8hNT0PE+p+bbaFU1hyIsmeN/7LLTCRJdu
 /ebHJW4cvKSelpx4kRd2A5MAEiVxZVnpvCqNKsX68n6r/UTvrpXCRY7xE9bjPm2waIqX
 laQWR4Kdi6ryqp+jbB5dKJ8YhWuJ/w9yDzNf8t7WxpijdKu1/e3lDztUuL9dROqvlpsX
 R6jSHHDYXPpIFqSwzLSbG6DG2RtizEbJM93lp9eZxVyCU6rmUMk4N3SIvpA+5hq8Z6o5
 dUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bAwUwdm66U+P5EfWF9HLID7LGqV52wZrK+nliMLVhsY=;
 fh=ctLwViyVmdmEBOQu21xujAUGw4Zso02PD7A+UU71dMo=;
 b=rOgvwWHbRPVJQWeFa4HYNIg+kxmfe7oa2gvZzro8GwWhsV1eIMY1X4yLMGtsW21FeV
 063/G4Wk6BXtQGZcucxLNASzbIAPWVvXoh8yU97u5OFrz7zmRQ3gUtaTZiJFO786Grrj
 jzzt3Du4K15LGkOlK6xAmWccF40Mi+JbzKRvMuXgaQM/k73pGemCrvM6yRx6jSUnye49
 SUAUr/crTcSpoDJLdn/CfpC68NJ7b12MjQj+zftui4LAngQX5KnGRf7pBg3ZMCEgN4Mf
 +M5eWiUbD6yZdM5sGoWwzQk8YHNqL7DvZ2/H1zWhD4/IHGzD961MvFb5yf2UTtOaXKVv
 yOGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782689422; x=1783294222; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAwUwdm66U+P5EfWF9HLID7LGqV52wZrK+nliMLVhsY=;
 b=RFcqSmrVJM7kUdFhTRxjPq2CLoZP2iOJZ3Zv2mkafnXvYVvxuwqpcKdunCSBp+mWOk
 zC5DrR0yu1FnDmc9aIy5xPCFrsxbkqNJpgClgYcSWyfyqw7166u16ROBoOvWeLyxZOEX
 JlcQSRGnjwE5OcP3ZsYk1zgIvTwm14qSB/tZARHtERcCXKqQR+eKgi4RkK1qMGUEAX3R
 KGeqGdhv38l22M12qN2F4y/C9om2S+cn88LOgrroI3NYDveSJeicwSYlzigYboFVf67i
 /NVqkkLjUVoNENpLmUdjLGAhjMVrMgqgKJT5VV6lrPfVk1Ce/WHm6nH/mh8zCwcbfJhV
 uFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782689422; x=1783294222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bAwUwdm66U+P5EfWF9HLID7LGqV52wZrK+nliMLVhsY=;
 b=cW1azCOjD6t+QjipYHWiDxPJsVpc8saea/ysyByVn4W3PzGt+ij5fPkM/jqHEXnUfO
 Mq4sETjnomAtibYNPn4a4pMP4g/mAhs+tdyLizTcgyT0fyYu/Lcg+vqV/mnycqr6Rmd7
 M9wANiwbYDziwtSq2xIWiO//pi+GP/eG0FtTn9qXM5rjLWn+4jBrmuOmLjhFntjHkArY
 Cm2uYIZf9aVBXdoRLWnQMJ7nN8+4fLXfFlN52BnDMMMIl7vvUOT7fmSDmIDIkY5dZ7UA
 m9wCtwM+1AXMzA5ct3JaUQKByvm70aWSzoq8KG6zDBIvp0kS9DKYTxmI+muNbNAalWQf
 cdvw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQtZAtCjw5M8Wk+Io27F7ZBUkqcWHGVKuJ4qkwGFv503hnYSz122/VKxsoQ+04xH9yDOAZdSHCxg6P@nongnu.org
X-Gm-Message-State: AOJu0Yycs/RNuOK++nRT504U+F7w2M0sW5H3HBuLL9KKFfV0gxE5V+tG
 gNmYMx9tBlFahjlWsrK+JMaIDS4mZGjnAA9Dn44JVm2r8QpDtq8/IIJjpo3yF4AvlG05V7hpwxt
 8xtKbHZPFU4zEBcallD+fiBz6U5YbQgs=
X-Gm-Gg: AfdE7clfMSyAyiRFy7Tgfge4hWiTAG/F4+yLlEwrHyrfq217jejOKSlQjp0bkZAo/mM
 AzMOHBaG8Y6bTV5LOhh4cX4zD3FOWSaviRkImdFGerHHycZxOO3IWwd3Qm+yfBEg4kkct27tyrD
 jYuSDnMnj0CiWvWzcTNjEMMn1bj3582zoGk/CyKQf8DG2kbADj5DnZOAOCLueBGDV2WwdxVhV0s
 +HSK/ietN7zNTuWrnEp5P0CfzCmjEdtCrtJjh4wHRHM78Ft5z54ofHo0eOz+u2FvWNxVams3grG
 T3YhsuiJp6bnNenK7E6WzgHIGN0Tif/6nwDDxw==
X-Received: by 2002:a05:6402:4012:b0:698:954:484e with SMTP id
 4fb4d7f45d1cf-69810b5dffemr5377304a12.14.1782689421931; Sun, 28 Jun 2026
 16:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260627194640.4130073-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260627194640.4130073-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 09:29:55 +1000
X-Gm-Features: AVVi8CevfnhJwG3rGgMrPNZub_Rxen2FbZwWvDpy53DB2fSAr3B3YREtbRGlOmo
Message-ID: <CAKmqyKNjb3M7YkgqBmD_oEYP9L7MUnboTAWoQ-Th_QDtvLS=Ow@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu: check DC.TC reserved bits
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sun, Jun 28, 2026 at 5:48=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We are not checking for reserved TC bits being set during device context
> validation.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3548
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu-bits.h | 3 +++
>  hw/riscv/riscv-iommu.c      | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index a938fd3eb4..f9b6f35170 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -308,6 +308,9 @@ struct riscv_iommu_dc {
>  #define RISCV_IOMMU_DC_IOHGATP_GSCID    GENMASK_ULL(59, 44)
>  #define RISCV_IOMMU_DC_IOHGATP_MODE     RISCV_IOMMU_ATP_MODE_FIELD
>
> +#define RISCV_IOMMU_DC_TC_RESERVED      (GENMASK_ULL(23, 12) \
> +                                         | GENMASK_ULL(63, 32))
> +
>  enum riscv_iommu_dc_iohgatp_modes {
>      RISCV_IOMMU_DC_IOHGATP_MODE_BARE =3D 0,
>      RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4 =3D 8,
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..c2c470b5df 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -752,6 +752,10 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOM=
MUState *s,
>      uint32_t fsc_mode, msi_mode;
>      uint64_t gatp;
>
> +    if (ctx->tc & RISCV_IOMMU_DC_TC_RESERVED) {
> +        return false;
> +    }
> +
>      if (!(s->cap & RISCV_IOMMU_CAP_ATS) &&
>          (ctx->tc & RISCV_IOMMU_DC_TC_EN_ATS ||
>           ctx->tc & RISCV_IOMMU_DC_TC_EN_PRI ||
> --
> 2.43.0
>
>

