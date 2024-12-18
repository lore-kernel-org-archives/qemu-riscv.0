Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3B7E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 15:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNvtg-0007nJ-Vp; Wed, 18 Dec 2024 10:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNvte-0007m7-Qp
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 10:23:34 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNvtV-0005QB-V4
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 10:23:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ef748105deso4788602a91.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 07:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734535401; x=1735140201; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lreE2R6tb3iLmLelFz+Ot/uZhkE3XiY9YhFak0vOJpM=;
 b=j+5ia29+Pbdkc1384VGAqyJGG3FvDc0tKPwRE52lgFinYdf1r6lbosL1JyjvoKsGgP
 lpBuIC9ACo86zk6eGS856vpFNiFxbunpsQtivvN/ApgaT1jTDre/WHpnHtR0zNc1zGTW
 fUzmrRVbX4XCD4qsNaImIUN7Y+kzlXxgHDy1D+4la5PBoeHqztcn/Aejcce7oF8LjxrE
 eStlO9DPnwJfMPC89uXTYH9Rbmze4LvhEmdpYCbL922g/5+rJxzAho+M9ccxjvH55H1Z
 qWBYmbOgv/o05Vsc9XsHjiaqPn4oSP32nMhVGwfNG3QhlmVZ0z914eldAw9AOUbrtbux
 /CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734535401; x=1735140201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lreE2R6tb3iLmLelFz+Ot/uZhkE3XiY9YhFak0vOJpM=;
 b=WXh95gzWSVWnIHlbw9lsKh76zP4ABFkqwIk3+uHCKGdOCAFROLJBrvnuNEmu4h+y6X
 Mb4GfgZWjEXW1O6VOfQ5YW8cGnWcANZbPd9ZbKR2gBh4d6qq6iDDX9cYRW8CimHsgyK5
 qkmfYAHzurv+4pK71RD5i7h7HT2QfpRuixnXsCHZaMoobiBCteYMpYiNwr5N5OddR+kI
 dL4zVvvh8QA3yZIGM7SnAz/l2IeGi33bcYsX/2QWZ3r4LGLFlGlyIJj8RvzTid8jfJiq
 jOyRwwHj6O1YGQTE0oDHJSuVNji/MU6DDhVYFJtBENTtbXB5L1G0IdOUdaaGJnhEOHC/
 pfRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC+Bc7Of6HyzkfLVtmYkIb20xcCi+PrBV0SGevnc28jo2sUKRQlzjduk9DjXXvrY7uWMqi2rGb5HQR@nongnu.org
X-Gm-Message-State: AOJu0YxgUhy/b6pyvIrt84g69fqRmo0/8a50jPSkd8EJa9kjeResvyQX
 +X1qJptIdMJh9+OD/Q8DgNrJh6P9oc3ow6iZiNvTBn1CnBOEgwsGq5eNBIEGpTs=
X-Gm-Gg: ASbGncvFg5kmbRw7r0+Tx6GzTXoCO/JdtwajX0qTmlIJhexkfCvtExVfCN46UT2qZ0n
 w4WG+b3Stu6p425c8FSW16mjEX04/+XpEGj+mnUJ/zv9z56+LI8Ul5WFt19EtZeG34WMgpkjlID
 APKSy9WMIa7XIQPw2KMFKb0+Czm8M1a5ydjFWAluKrgLW1Hq4rPQaHlKOFVo47mNNZl7gBAA5WS
 XXYo2ZlBcdNVMRKWsDAn4+BAslL+erAzsHvvV6fik82HXG5hxwgpShH85I/KZM7UNbp7g==
X-Google-Smtp-Source: AGHT+IF09GhL+Ki+4HqLtun74ygfo0zNZWVRaxo1k9NwfIG7AnK490JZJr6mapzLSv1att0add886g==
X-Received: by 2002:a17:90b:2d92:b0:2ee:b26c:10a3 with SMTP id
 98e67ed59e1d1-2f2e9388a46mr4083577a91.36.1734535401334; 
 Wed, 18 Dec 2024 07:23:21 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed82d456sm1685903a91.29.2024.12.18.07.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 07:23:20 -0800 (PST)
Message-ID: <90151574-8d31-4fd3-8b0e-44e6e409f6ee@ventanamicro.com>
Date: Wed, 18 Dec 2024 12:23:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] target/riscv: rvv: fix typo in vext continuous
 ldst function names
To: Craig Blackmore <craig.blackmore@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
References: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
 <20241218142353.1027938-2-craig.blackmore@embecosm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241218142353.1027938-2-craig.blackmore@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 12/18/24 11:23 AM, Craig Blackmore wrote:
> Replace `continus` with `continuous`.
> 
> Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a85dd1d200..0f57e48cc5 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -195,7 +195,7 @@ GEN_VEXT_ST_ELEM(ste_w, uint32_t, H4, stl)
>   GEN_VEXT_ST_ELEM(ste_d, uint64_t, H8, stq)
>   
>   static inline QEMU_ALWAYS_INLINE void
> -vext_continus_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
> +vext_continuous_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
>                          void *vd, uint32_t evl, target_ulong addr,
>                          uint32_t reg_start, uintptr_t ra, uint32_t esz,
>                          bool is_load)
> @@ -207,7 +207,7 @@ vext_continus_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
>   }
>   
>   static inline QEMU_ALWAYS_INLINE void
> -vext_continus_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
> +vext_continuous_ldst_host(CPURISCVState *env, vext_ldst_elem_fn_host *ldst_host,
>                           void *vd, uint32_t evl, uint32_t reg_start, void *host,
>                           uint32_t esz, bool is_load)
>   {
> @@ -342,8 +342,8 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
>   
>       if (flags == 0) {
>           if (nf == 1) {
> -            vext_continus_ldst_host(env, ldst_host, vd, evl, env->vstart, host,
> -                                    esz, is_load);
> +            vext_continuous_ldst_host(env, ldst_host, vd, evl, env->vstart,
> +                                      host, esz, is_load);
>           } else {
>               for (i = env->vstart; i < evl; ++i) {
>                   k = 0;
> @@ -357,7 +357,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
>           env->vstart += elems;
>       } else {
>           if (nf == 1) {
> -            vext_continus_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart,
> +            vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart,
>                                      ra, esz, is_load);
>           } else {
>               /* load bytes from guest memory */


