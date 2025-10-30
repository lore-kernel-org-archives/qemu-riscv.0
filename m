Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C4BCCF9F0
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 14:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vETZY-0001OP-JZ; Thu, 30 Oct 2025 10:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vETZO-0001KO-1o
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 10:24:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vETZJ-00067X-4Z
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 10:24:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso876017b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761834234; x=1762439034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2qhmL40yJuYA7VTug2A9/droT3+foPeGGcISVtBeqCo=;
 b=ilb85lcci2CiIuyYcM/KLvevRSK+UpCEqKx3DeYcNKr8zY7y74KIz5bsaIX7iVWuyz
 /Ek+PKT0CAm3bdg3tejmtn/LnsKCUevexOdAdbStOhWqP16Nn+MuNtmNVUhCi5X5Q0Yc
 zExn6u0jja/kCXMq43mkaawj/DkdcSYAbwh73agBo6AcROr12FT0hbPRIBkMcE5q7lGr
 dtmaGS/FFG/LaBkviUhZWRKq1ctcRUNzKAHOR2lSi5pZNlkMGmSvePP3aIsHjpoexo32
 iZjvriussZVdEcVeKetn1YcIhhk7v51+ch7eADad5Zyd0IZEPxSMp9yqcNfFMyUH6fri
 wsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761834234; x=1762439034;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2qhmL40yJuYA7VTug2A9/droT3+foPeGGcISVtBeqCo=;
 b=c8CWbDw96XVtJm6/1kwsvAmK753R255L3UZx87+LUaWLpwsorS8B49QdocCsH2m5lW
 WBHFjQsHvVuIh+3FB4lNSCJmyPWdaARgEfWh1CXIp2auYXSlkFVsaF4/LyjueLQM4hfL
 bKZp5LeXabZv4KIQs/WW64107Z5GX7kIXz6rDYjq4MQfwSs+k2iFy4o6tVHZ7AAZ2230
 CwjaTLx2sZgqV+cy1uKMcKYsJLBINrRglN9cC1mfTL/MzXdjB9nr+sIcax30pGm99JD3
 cGGN8K5Lbdxmcm0drF+ZGRsQ7U6JU2T/OV51PwNfsURaVvbEb/7zE9l1RIWQdl5DsjjL
 hr5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxafbdvACycz3u0JTC5Q7yPMjaLpCV26nQuVDCm0HeCCweDEerMGWMY/JeECmcJxGQaxaNMUoiTD+F@nongnu.org
X-Gm-Message-State: AOJu0Yxpw4CnkGVh9GJ7JFR0E3Yyi8EBXFj1yYxMG+C8y0JdoeUkZ//G
 sNrD2r+UCE/m0bTnDtiMLWzKdb0wshMtyHgO4p4EuzUZbeSI6qqEdog0s6uz7BxQ2Es=
X-Gm-Gg: ASbGncsuGZtkNkDYCtKXhQCjP2lcvINlnBY8Vyzx1NNQhLczmFynEGFsoeZT2NpZIlB
 SCt7jnra9b8+gF3zxsTgWBgXbUOft+iK4THgGHEWrLoQ+zlvTJB+hBhDvNopXF1o2pw+p+ArMqa
 +GanhBWNO/rXrupLvcqI3qEcLr1PZ2vKXukOYX5Io0ste0yVBiJH5GHowqn0GTEk6kMGk/k1xkT
 +VwNmECN70RGGE4ZKVX19iS3kXNwKVOn7Xk4p4TL9WMGF5PBWaOYxJ13Gz7VPsZQdOoUySiEcHq
 8Jwh8FC6Hs3z7PefFGTVuLC+mPQgyW8UF9b7iJTMWrtpyFmFcjtQovBjClszrbsYMzz0fAZXghS
 XuWZymNfw20xx8xH/BwDmH1TYe3TA8HlJ2H01tsljzXbtTTI1WMfrltl4xqE3rrvcoaJm8WHKXS
 7koCJsT9tBJsGleSql4rLvAhQ=
X-Google-Smtp-Source: AGHT+IFuwKo04u9v0JNDnnu0lw8LLMTDxx7C5hMRIO22lCjQU5IfvCCWveWeiXaY9m3O8KUM2m2QRw==
X-Received: by 2002:a17:903:1a4e:b0:246:80b1:8c87 with SMTP id
 d9443c01a7336-294deef8844mr94161415ad.43.1761834229801; 
 Thu, 30 Oct 2025 07:23:49 -0700 (PDT)
Received: from [192.168.68.110] ([187.101.65.79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d0c414sm189617475ad.44.2025.10.30.07.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 07:23:49 -0700 (PDT)
Message-ID: <8a1ee6f6-0198-4a6c-b4db-180ede88187f@ventanamicro.com>
Date: Thu, 30 Oct 2025 11:23:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: riscv-iommu: Don't look up DDT cache in Off and
 Bare modes
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20251028085032.2053569-1-frank.chang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251028085032.2053569-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
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



On 10/28/25 5:50 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> According to the RISC-V IOMMU specification:
> 
> * When ddtp.iommu_mode is set to Off, there is no DDT look-up, and an "All
>    inbound transactions disallowed" fault (cause = 256) is reported for any
>    inbound transaction.
> 
> * When ddtp.iommu_mode is set to Bare, there is no DDT look-up, and the
>    translated address is the same as the IOVA, unless the transaction type
>    is disallowed (cause = 260).
> 
> In the current implementation, the DDT cache is incorrectly looked up
> even when ddtp.iommu_mode is set to Off or Bare. This may result in
> unintended cache hits.
> 
> Therefore, the DDT cache must not be looked up when ddtp.iommu_mode is
> set to Off or Bare. For other modes, software is required to issue cache
> invalidation commands before any inbound transactions.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index b33c7fe3259..95db811f125 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1290,13 +1290,18 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
>           .devid = devid,
>           .process_id = process_id,
>       };
> +    unsigned mode = get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
>   
>       ctx_cache = g_hash_table_ref(s->ctx_cache);
> -    ctx = g_hash_table_lookup(ctx_cache, &key);
>   
> -    if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
> -        *ref = ctx_cache;
> -        return ctx;
> +    if (mode != RISCV_IOMMU_DDTP_MODE_OFF &&
> +        mode != RISCV_IOMMU_DDTP_MODE_BARE) {
> +        ctx = g_hash_table_lookup(ctx_cache, &key);
> +
> +        if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
> +            *ref = ctx_cache;
> +            return ctx;
> +        }
>       }
>   
>       ctx = g_new0(RISCVIOMMUContext, 1);


