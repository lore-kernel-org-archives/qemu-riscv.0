Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B0FC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 23:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ04z-0001cJ-3z; Thu, 28 Dec 2023 18:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rJ04x-0001bc-Rc
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 18:46:20 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rJ04w-0004Jn-4D
 for qemu-riscv@nongnu.org; Thu, 28 Dec 2023 18:46:19 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3eb299e2eso30770545ad.2
 for <qemu-riscv@nongnu.org>; Thu, 28 Dec 2023 15:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703807176; x=1704411976; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nr4khX4RfDD3obM8EOii2O8wtSIuNQ08Isb1/l5ekwU=;
 b=UR6sz49sg5P8Obg1oTvMLpUqFkmg8w/VABePAb195QpcXi4JB2ohoNmxaH4WL2TrCw
 E+w3mB9pgF0CBP6+/3jNk7IBBU8RgwSuIiXMXqMv70JsRC7cUQWFYkrtRzD0pWseK6z1
 Tz5VyJerhX/s51CVWY4WW5E3AT1zqcB489YjytjToEB/e3IwVmY82lvFH9SJ7Z+0RBAs
 hD6V4Pg17FZMbcOUpdKO0SgVBKBXN2A6jE9c62zBr6kbJu85OChpmvuJ+s2TetgBx8ub
 OLsAg/BwYB7UcGy0/Y3xEotOFPy5NWMcyZGDXf70LfSBSRVo2YjcHUmraUk9N4H+Drja
 rGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703807176; x=1704411976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nr4khX4RfDD3obM8EOii2O8wtSIuNQ08Isb1/l5ekwU=;
 b=QbqMkEM6w5lKUxxdaswsPmS2yJ6pWvMtfrTokOxjMsBZxnFOBveLufuIi9K5YUjpUl
 XLOquF6R2191eoqjG4iSnmhqNHox79RQynuT5RqRHWYRNtHgDvJIg7bV3QlmjNOlCXLr
 I5/NiQ1uTEUJvZ4NhV9kmhJ3VW9SLFRQDz9cXg8QZVotgQt378LqT123n90HAfL4clj9
 ZDEwARzq/t81C5UUfe5LJ0xA6ZevwojMWN25paTwIqidoUPTeUpzIpG2OHUQSqzYGzRC
 D1QgK4SIIkJO4dyl3HcVG6ebzyXxiMNVsDGF1EDqlZl9Q1m0GO6Iyj1ZtZwSZzWSo8kb
 Cnrw==
X-Gm-Message-State: AOJu0YymMuG17EuTaVjy+3o+RPfEXsDD3CBHarnwUKLttbBkBPPOOqtm
 lR1lTvHXPUGwOgM1+2dqTFmy3wi582Ntuw==
X-Google-Smtp-Source: AGHT+IGTjH3vam9DoCH7ICX6ZBMc+Tfb8bsY8DHNwAqDliYdMoq1BnTgzk/m8Yq7PAD49w0gNnpyTg==
X-Received: by 2002:a17:902:da92:b0:1d0:6ffd:6e71 with SMTP id
 j18-20020a170902da9200b001d06ffd6e71mr5898472plx.105.1703807176522; 
 Thu, 28 Dec 2023 15:46:16 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:324d:cbc2:5f8b:3a9d?
 ([2001:8003:c020:6900:324d:cbc2:5f8b:3a9d])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902cec500b001d07ebef623sm14444351plg.69.2023.12.28.15.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Dec 2023 15:46:15 -0800 (PST)
Message-ID: <2e68509d-755c-473a-9d52-8ec5f947cc71@linaro.org>
Date: Fri, 29 Dec 2023 10:46:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
Content-Language: en-US
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20231224044812.2072140-1-me@deliversmonkey.space>
 <20231224044812.2072140-6-me@deliversmonkey.space>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231224044812.2072140-6-me@deliversmonkey.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12/24/23 15:48, Alexey Baturo wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>   target/riscv/translate.c     | 23 +++++++++++++++++++++--
>   target/riscv/vector_helper.c | 10 ++++++++++
>   2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 1eb501e0d3..c0c5030e05 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -575,11 +575,20 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   /* Compute a canonical address from a register plus offset. */
>   static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>   {
> +    int pmlen = riscv_pm_get_pmlen(ctx->pm_pmm);
>       TCGv addr = tcg_temp_new();
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_addi_tl(addr, src1, imm);
> -    if (get_address_xl(ctx) == MXL_RV32) {
> +    if (ctx->pm_pmm) {
> +        tcg_gen_shli_tl(addr, addr, pmlen);
> +        /* sign extend address by first non-masked bit otherwise zero extend */
> +        if (ctx->pm_signext) {
> +            tcg_gen_sari_tl(addr, addr, pmlen);
> +        } else {
> +            tcg_gen_shri_tl(addr, addr, pmlen);
> +        }
> +    } else if (get_address_xl(ctx) == MXL_RV32) {
>           tcg_gen_ext32u_tl(addr, addr);
>       }
>   
> @@ -589,11 +598,21 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>   /* Compute a canonical address from a register plus reg offset. */
>   static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>   {
> +    int pmlen = riscv_pm_get_pmlen(ctx->pm_pmm);
>       TCGv addr = tcg_temp_new();
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_add_tl(addr, src1, offs);
> -    if (get_xl(ctx) == MXL_RV32) {
> +    /* sign extend address by first non-masked bit */
> +    if (ctx->pm_pmm) {
> +        tcg_gen_shli_tl(addr, addr, pmlen);
> +        /* sign extend address by first non-masked bit otherwise zero extend */
> +        if (ctx->pm_signext) {
> +            tcg_gen_sari_tl(addr, addr, pmlen);
> +        } else {
> +            tcg_gen_shri_tl(addr, addr, pmlen);
> +        }
> +    } else if (get_xl(ctx) == MXL_RV32) {
>           tcg_gen_ext32u_tl(addr, addr);

Use tcg_gen_{s}extract_tl instead of two shifts.

Also, it looks like it would be worth doing all of this once in riscv_tr_init_disas_context:

     if (get_xl(ctx) == MXL_RV32) {
         ctx->addr_width = 32;
         ctx->addr_signed = false;
     } else {
         pm_pmm = FIELD_EX32(tb_flags, TB_FLAGS, PM_PMM);
         ctx->addr_width = 64 - riscv_pm_get_pmlen(pm_pmm);
         ctx->addr_signed = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
     }

then here in get_address_indexed

     if (ctx->addr_signed) {
         tcg_gen_sextract_tl(addr, addr, ctx->addr_width);
     } else {
         tcg_gen_extract_tl(addr, addr, ctx->addr_width);
     }

> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 8e7a8e80a0..faa8f5820d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -94,6 +94,16 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>   
>   static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
>   {
> +    RISCVPmPmm pmm = riscv_pm_get_pmm(env);
> +    int pmlen = riscv_pm_get_pmlen(pmm);
> +    bool signext = !riscv_cpu_bare_mode(env);
> +    addr = addr << pmlen;
> +    /* sign/zero extend masked address by N-1 bit */
> +    if (signext) {
> +        addr = (target_long)addr >> pmlen;
> +    } else {
> +        addr = addr >> pmlen;
> +    }
>       return addr;
>   }

I think you could usefully exit early when likely(pmm == PMM_FIELD_DISABLED), avoiding the 
other computation.


r~

