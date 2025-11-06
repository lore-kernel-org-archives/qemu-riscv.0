Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B095CCFA05
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 11:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGyM6-0002Xx-Hy; Thu, 06 Nov 2025 06:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vGyM3-0002X7-VW
 for qemu-riscv@nongnu.org; Thu, 06 Nov 2025 06:40:39 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vGyM0-0005mM-29
 for qemu-riscv@nongnu.org; Thu, 06 Nov 2025 06:40:39 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7c68bfe1719so206105a34.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Nov 2025 03:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762429234; x=1763034034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hOwCOugdXRoHDklod6xLAZok+uc2GwBjL/VBfmZwZes=;
 b=W7oCDcxYZB6sR7sJpHsnOkvoYUZpQBN+1jwhKCvrAttpPus1Wu1xM5GwAqPCAphr5e
 rHRGM2F0BFdjYGAnNPJWY1QYmNtEN9xInRXeOd+yQ9NlT6GIRE6dml32tV6XhIQIo3oM
 beggkntlhnhD9WoUWWE6g0xhhUG7UhtJWyXliepKe+XdR7iXkiXZWZz2193uKOyQmfcm
 pkC2aROr2rS5MiEJ/uvuir4+VWnmhZnwM7wz7MRZsGtyncHf/6+ppMuL2fFFbWOkrem+
 4AXAVlylNp9w7yDjgm6OxykzR8FJALS1x1R8PxbL84C8W2VlJo4RHC818PZL7nrHCQfK
 +RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762429234; x=1763034034;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hOwCOugdXRoHDklod6xLAZok+uc2GwBjL/VBfmZwZes=;
 b=bERmhNICjo3M6Z5d+SWhRaTW5fTSA7NFp68q8MSnI17TqZq8IpISiDbKnby413Jacc
 vg0MgUxYfl+9KPEw1kS1LL/kYIVh74utOybzT7hksHtFIGEEr2HG7erE/XnNj4bM/IH/
 isr8tL6Rg3Tv+fs5zqTrfrcczrU6MvYRbOpfj4DSrH3cJocqrKBSiDw5g+gTZkBusECt
 vS6f6qnJgD6hi9iFH6TcjhKwRBneFNY6h6v35TBYVHoA2a3lnChqQqC//Ghjy4XwbJPM
 qPVZPMMT3HQ09yB0yQRMbUWIFuZfDIvcfV+kWprXFicuh82hBOdOOzx+hkZBRf+Af+Gn
 nBiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqhae1543mMgOJhAna24vk4H0yi8yMlHL79/9lp2W+Szps0Y2xExt6hjmp4nkfCSQkN04otEUI7j1m@nongnu.org
X-Gm-Message-State: AOJu0YxEQBmvNAhgkmnuJCnWJxV7lxaeCOGD8+LjofDB/AsKSr6D06Na
 UbZqb0vsgbc67JsyCC+qyIQ9xUCfH+R2PepC8mFBGiKv98wahbzWYt+MnwgsTRtT0QA=
X-Gm-Gg: ASbGnctvXUMeEuuus1jacvAbSoymh7aQWHoDMKooT4TzBSvTFy10ccmCldnFLA7bYSp
 I42VQYnCcnC1sCN+eM33hjA9G47Na6KOKKiQTIM2OqP6389/YF9/2p3cuF33HcLU32Ir2kHggki
 9Nxg+SpD2B1mdwcX+1WYBSHmp1WhnQ6U6BMe05fvRkK8W5liyK8KRTweOlP3by4EgptDaVlNS3F
 24PkyqaTLWpBjXLVt983katddhpG871O8bZG8JnweCdDK9q3wcyMpjWm56Q1ZQWCgFpgTiWd/sY
 SK9pjwKW4Aeo2TxeMZPtIjbG93fpt8iZv2nCEIBF3H4ZH4tu0/M1ShK31x6sqtCHh/BAABWrTCD
 IFAGxu3Uo+VMK/VQzAoqkbKdB4pRwMFCBHODT2ye7fxVu/E6p/l+mHGczhu+lb/jTTy9sYRQFe2
 DX0qFWYPZ1+4L3T31VsWW/Od0cGyjCraJH0p7v7D5Q1VAarsFISDviNL8=
X-Google-Smtp-Source: AGHT+IFfyLbxtsEGFl4S+37cGv2h9HS9jtyrgN6/PCSIIkLqr07/ziAjTBAm7pGFQn1kRIiQd3cU/Q==
X-Received: by 2002:a05:6830:600f:b0:7ac:9a7d:a4a1 with SMTP id
 46e09a7af769-7c6d1418f60mr4079638a34.32.1762429234343; 
 Thu, 06 Nov 2025 03:40:34 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc2:7873:e847:e589:d030:667d?
 ([2804:7f0:bcc2:7873:e847:e589:d030:667d])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c6e32d2392sm988414a34.18.2025.11.06.03.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 03:40:33 -0800 (PST)
Message-ID: <ec992615-9812-4d88-ab52-8916ea322a4d@ventanamicro.com>
Date: Thu, 6 Nov 2025 08:40:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] target/riscv: Support Smpmpmt extension
To: Jay Chang <jay.chang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20251104072614.20983-1-jay.chang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251104072614.20983-1-jay.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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



On 11/4/25 4:26 AM, Jay Chang wrote:
> The Smpmpmt extension provides a mechanism to control memory attributes
> at the granularity of PMP (Physical Memory Protection) registers, similar
> to how Svpbmt controls memory attributes at the page level.
> 
> Version 0.6
> https://github.com/riscv/riscv-isa-manual/blob/smpmpmt/src/smpmpmt.adoc#svpbmt
> 
> Signed-off-by: Jay Chang <jay.chang@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/cpu.c                |  2 ++
>   target/riscv/cpu_cfg_fields.h.inc |  1 +
>   target/riscv/pmp.c                | 12 ++++++++++++
>   target/riscv/pmp.h                |  1 +
>   4 files changed, 16 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ae8b721e55..a0290f06f6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -230,6 +230,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(smpmpmt, PRIV_VERSION_1_12_0, ext_smpmpmt),

We need to place smpmpmt in the correct riscv,isa order, i.e. right before smrnmi.

Otherwise LGTM. Thanks,


Daniel

>       ISA_EXT_DATA_ENTRY(svrsw60t59b, PRIV_VERSION_1_13_0, ext_svrsw60t59b),
>       ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
>       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
> @@ -1262,6 +1263,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
>       MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
>       MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
> +    MULTI_EXT_CFG_BOOL("smpmpmt", ext_smpmpmt, false),
>       MULTI_EXT_CFG_BOOL("svrsw60t59b", ext_svrsw60t59b, false),
>       MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
>   
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index a154ecdc79..b1096da664 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -57,6 +57,7 @@ BOOL_FIELD(ext_svadu)
>   BOOL_FIELD(ext_svinval)
>   BOOL_FIELD(ext_svnapot)
>   BOOL_FIELD(ext_svpbmt)
> +BOOL_FIELD(ext_smpmpmt)
>   BOOL_FIELD(ext_svrsw60t59b)
>   BOOL_FIELD(ext_svvptc)
>   BOOL_FIELD(ext_svukte)
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 3ef62d26ad..52a7677683 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -165,6 +165,18 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>                             "ignoring pmpcfg write - invalid\n");
>           } else {
>               uint8_t a_field = pmp_get_a_field(val);
> +
> +            if (!riscv_cpu_cfg(env)->ext_smpmpmt) {
> +                /* If smpmpmt not supported, clear the MTMATCH bit */
> +                val &= ~PMP_MTMATCH;
> +            } else if ((val & PMP_MTMATCH) == PMP_MTMATCH) {
> +                /*
> +                 * If trying to set reserved value (0x3) for MT field,
> +                 * preserve the original MT field from current config.
> +                 */
> +                val = (val & ~PMP_MTMATCH) |
> +                    (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_MTMATCH);
> +            }
>               /*
>                * When granularity g >= 1 (i.e., granularity > 4 bytes),
>                * the NA4 (Naturally Aligned 4-byte) mode is not selectable
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 271cf24169..467fb6b4b1 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -29,6 +29,7 @@ typedef enum {
>       PMP_WRITE = 1 << 1,
>       PMP_EXEC  = 1 << 2,
>       PMP_AMATCH = (3 << 3),
> +    PMP_MTMATCH = (3 << 5),
>       PMP_LOCK  = 1 << 7
>   } pmp_priv_t;
>   


