Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A799D729EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 17:08:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tH4U6-0006iu-Mj; Fri, 29 Nov 2024 12:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tH4U0-0006i7-UK
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 12:08:44 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tH4Tz-0008A1-GG
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 12:08:44 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2142214abd2so16546685ad.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 09:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1732900122; x=1733504922; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t2viKvgj0wwAyRIWliYcaWM9Myznzn9A44elH3XekC0=;
 b=HayK85eSQZeP37aDCnUOJIQBERjotIENIgOoROuc4NLE4MmyGSMsck/JS+4ADwDwyz
 8KHf2YTcLqo2t5v6/qrDZ4aBtmp4E2Lz8CeS0JH/ONSxb17Ths/M+CQgYLvjziLyvWY/
 O/C6Ot1lMQwUbXcuvhBNuNIEPlYOKXDZfJ+j/7BZfeDMoGGZ+QjgtERORk4pTLezdIz2
 V+eKiJ03wUEol39WVMV3mIGLPb/j/KMtRprR3NIXSrSjz38h/VvlUMpEb09fM6okB4r0
 EVsgMQuZwxNxTBPuJZ9FZqOETUGqm2jyJTjUPbP38QefRq2pyUW4/UCE26T2Itx2DOqj
 zIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732900122; x=1733504922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2viKvgj0wwAyRIWliYcaWM9Myznzn9A44elH3XekC0=;
 b=cmjr80cQ+LSLQRyAGSFW0S6EjNrH7IvZeywXCon25dUwVC6gdK/qDMUsDKobUvDVQi
 vLIyaRcA301fUUGDUcfgDzossT7L8D0G6/9xNdEkMHFEEJOQTF6yRmsvO87lSIwOmo1b
 k55V+nptEUO5ZF2+oVLivYrwtVQ9djSoK4tsYTXRMMi3ixKoElqvKYKUehVy3GLbaYq0
 yTELnFbX0pTF/p5zDSPFBmKjPaN/XpXj635CpB72DHW6aDpKL7Yb88n46MmSckKfWD3u
 grE94CEQ8PlXpJUlhVLwmzkrxqeUEK+owwHJqnEKTnDHmT2ou70tvUqNkzPM8K3uIi5J
 SwjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfFCrSs4GnYawrrlG8Nqc8ZN6I8nO72Ydfx5B4v1nzotRCZD/TrAU5yf6w3sNehvDcKFP7k5jnXF9x@nongnu.org
X-Gm-Message-State: AOJu0YzkShoQ/hCF27JzIIcO7jWcmPtv38yJX/Pxw+TBAZPRrMJRDjfR
 OduappVejwmHWbd/13l63V+KTN9lr6wqJLhwnDAddmvEttgm+l8AZ7MPcfnjV1s=
X-Gm-Gg: ASbGnctodz2O7WbWE2Grzv9Ikw3PTsv+ZWIoM+8ZvTztb/I/iYwF9KPOb2Ss6411bYT
 VnwMFurmxZ4q8Gb5pjbmpCO/FvSKcEA5HK/v0VMiG0AC/2z5vp7ZcComkruHzoRV5sCs8DU0gtP
 a4pG3xzp+N4mXobjljC8K2oesZbazeiTEkrz3Lg0E5B+awMA3qPZUJYufm8wcJ+JKo1hBsD1yW9
 MZdXEAayfRcBMmztwbaHmnSwxymPGKrV1MpKGdSPcMwQXA6IgTNBDkVqOK22sc=
X-Google-Smtp-Source: AGHT+IGhr4dmw40nMvAiTQC0CYyewCWS8cLIuUYZUTyOAdjY7jAYlPGFLaACAWwc9ubsAPykNwkrJA==
X-Received: by 2002:a17:902:f682:b0:210:f706:dc4b with SMTP id
 d9443c01a7336-2150109af63mr152710175ad.13.1732900122016; 
 Fri, 29 Nov 2024 09:08:42 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541814731sm3814014b3a.143.2024.11.29.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 09:08:41 -0800 (PST)
Message-ID: <c813fcb7-8e5f-4dd2-bf58-839e76d04c28@ventanamicro.com>
Date: Fri, 29 Nov 2024 14:08:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 3/3] hw/char/riscv_htif: Clarify MemoryRegionOps
 expect 32-bit accesses
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20241129154304.34946-1-philmd@linaro.org>
 <20241129154304.34946-4-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241129154304.34946-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 11/29/24 12:43 PM, Philippe Mathieu-Daudé wrote:
> Looking at htif_mm_ops[] read/write handlers, we notice they
> expect 32-bit values to accumulate into to the 'fromhost' and
> 'tohost' 64-bit variables. Explicit by setting the .impl
> min/max fields.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Notes
> 
> 1/ these variables belong to HTIFState but are declared statically!
> 
>    static uint64_t fromhost_addr, tohost_addr, begin_sig_addr, end_sig_addr;
> 
> 2/ I believe a 64-bit implementation would simplify the logic.


Perhaps. We would need to check with the protocol first. There might be
a reason why we're using 64 bit read/writes internally while doing 32 bits
r/w in the device.


For now:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> 
> 3/ This is a non-QOM device model!
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/riscv_htif.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 3f84d8d6738..db69b5e3ca7 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -325,6 +325,10 @@ static const MemoryRegionOps htif_mm_ops = {
>       .read = htif_mm_read,
>       .write = htif_mm_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
>   };
>   
>   HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,


