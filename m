Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E06E7716D
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 00:06:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIzNK-00084O-40; Wed, 04 Dec 2024 19:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIzNF-00082j-Uv
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 19:05:42 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIzNC-0003Pw-Ic
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 19:05:41 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-29e6399b009so184909fac.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 16:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733357135; x=1733961935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wnGKNIxWhNVb5d1v6/cE6WaIjZNJE/0+BheeGVemCPs=;
 b=hnqO4WlIral1aOPSYI+vSxqFRTDTfp9pp92c16SuNsf4Dv33RsF5nLNstUJge+NOa5
 bYj2p/0jb2WEejgx+gKm8M/Y06vDbjeTdHmQ4Xiqc0euqCvRMnvB4FcSgigrwHrPypbn
 EltKIg8T/9NV8cD1Y9mEiZp5QivzL6seAUXlGOdQIUhuMWAyHxH/C1f8sr0065PKMOxT
 lnPNPeEqfl5x+SxWMmAK1djlnaCDPm6DjjxGgJCg2h3YiTgBGSHxCuBv3eP3GGGM1yLU
 i0Npx8Z1DD4qe3dqY0kmjMQO7aFoJLDQBAIX/TXPN+QHKMaLhBVqzI4PUHrmWNVqvM6q
 87oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733357135; x=1733961935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wnGKNIxWhNVb5d1v6/cE6WaIjZNJE/0+BheeGVemCPs=;
 b=NCTpx/j4FcpYQyX3DdgDiEZvfywNlHZ2C7s9OSjE/D0oR2xIluB9IwYS9Ru9/e1D7T
 dJNFbN8oC91/BX05NynEmGAKHYreq5MTCE49VYnksZaKB7BRUYCuLyni/z4LJTgA9Q93
 YZfGGYpePIneNhrluaWAHJlWBkd1vNNONJtJWRvCfECOhv/WnZSsrkshVsuJlJ8vsJn8
 dgw9I/3I0D1ECODXWCuzaGk7sm4Ph2VUpBD/AxgKx+c4b/5psQOUDvHrkrgIHVOhIidI
 zwLfiV655a6bs9HO+pOoVAa4I1HxDY1qW7fkzqT/cHp1olbLtzXLeGqmImZtUS1GlJRl
 3pNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaTphYBz6pZFadISBmjbnxnYUo5EhBiIGOpYCbf7cle61abVDdoSVZ+gIIv1i408oWhrYKYvkl320l@nongnu.org
X-Gm-Message-State: AOJu0YxVti2kBH8ijipRPDOCA07gC0T0OcGQ0JWIBcSVRhhGLrmDuNy+
 RPpVHjUZDWaSn6Vp92T5NAIzYMMhd3JSa9GBI+/Kiem6oeptm5Ko63yE0tI3YpU=
X-Gm-Gg: ASbGnctdEpIJ7NlegPUGPZq8ztpq+pHKD75fnqVu69UjOWggh8AtlLu45u9v2vmNlK8
 35ECM9Avz0kdbg4S9HSymEvo2MlBaZd9Txs9KW/CTsrWRf/tuRw08Q5gOpmk5CqEaZxigFZ1cwU
 UmrtvTLMaF0aya2hAVTUBPL4yx5FYnXV/ob2D42RyCh8CrdUzjkm2pIR54n7P0jNuA+2xR3dMkx
 Npwh+lQLoz5GekpUyVa2X/PbZYRNDl5uhSJh46qYJfFr4KOwgrVdng7OegFhTG/aPa9yrI1Oi26
 HkhUxeVOR2+d906XNXa36ma+c08s
X-Google-Smtp-Source: AGHT+IH5hm0wHgeejGtzZT6GWCYchA6mZBQbQC0jLQqP0LNrYIXMGVUflpqmZN90zbXA49qyDNICYQ==
X-Received: by 2002:a05:6871:3806:b0:297:2763:18d4 with SMTP id
 586e51a60fabf-29e8867576bmr6152728fac.15.1733357134747; 
 Wed, 04 Dec 2024 16:05:34 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f566d7b73sm83857fac.13.2024.12.04.16.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 16:05:34 -0800 (PST)
Message-ID: <5f95a4d0-5224-4b49-82e8-69079057eb16@linaro.org>
Date: Wed, 4 Dec 2024 18:05:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] hw/core/generic-loader: Use
 cpu_datapath_is_big_endian()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org
References: <20241204202602.58083-1-philmd@linaro.org>
 <20241204202602.58083-19-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241204202602.58083-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

On 12/4/24 14:26, Philippe Mathieu-Daudé wrote:
> Rather that using the binary endianness, use the vCPU one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/generic-loader.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index abdd4c08a38..7b3b5f06565 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -31,7 +31,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "exec/tswap.h"
>   #include "sysemu/dma.h"
>   #include "sysemu/reset.h"
>   #include "hw/boards.h"
> @@ -66,7 +65,6 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>   {
>       GenericLoaderState *s = GENERIC_LOADER(dev);
>       hwaddr entry;
> -    int big_endian;
>       ssize_t size = 0;
>   
>       s->set_pc = false;
> @@ -134,14 +132,13 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>           s->cpu = first_cpu;
>       }
>   
> -    big_endian = qemu_binary_is_bigendian();
> -
>       if (s->file) {
>           AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
>   
>           if (!s->force_raw) {
>               size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,
> -                               NULL, big_endian, 0, 0, 0, as);
> +                               NULL, cpu_datapath_is_big_endian(s->cpu),
> +                               0, 0, 0, as);
>   
>               if (size < 0) {
>                   size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,

Given that we're not verifying ehdr.e_machine from the file via the generic-loader, I see 
no point in verifying ehdr.e_ident[EI_DATA] either.

I suggest changing load_elf* big_endian parameter to elf_data, then use ELFCLASSNONE to 
skip the EI_DATA test.  This more or less mirrors the elf_machine parameter -- we use 
EM_NONE (0) to skip the e_machine test.


r~

