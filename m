Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1CBC46CCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 22:49:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGRrO-0007LK-2Y; Thu, 21 Dec 2023 17:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rGRrM-0007Kx-QI
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 17:49:44 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rGRrK-00033A-LK
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 17:49:44 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d89f278cc9so966336b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 14:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703198981; x=1703803781; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GMuyFOHtNaWMhJh0VuThu+TLPM7q7s1GwW52vliCXrA=;
 b=PZ7avcxjq5mtlLPkSdvZv1pmg8YWSqsx8b7QG06Q6PqnMJbJng2KeqTSqjcvAeYYex
 NmItc0qcjo6ZZG5FDys2KM2TblNBsacBX7G5yuyw8D6x90ywvVXO7XGjq2ubgwdTqNTY
 Wp9W2JXdmIciUH/yU5SNFouOl4zkem0b8PZfQc52pnBdbgqMb9g3i+imQxSTjKjKrco8
 n6ckWKpNjNDk25nNFxXwWOX+j2rBAuLVMNytspEBchpHf+igkbpyLw5ySts5ewIPgT8H
 YS4YzJoFq6baFSZrM7Afh1L6vX/oYtjfZRgJAdegcq9Bqwwf4f0sEFKNv/x4sciMcLjn
 eEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703198981; x=1703803781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GMuyFOHtNaWMhJh0VuThu+TLPM7q7s1GwW52vliCXrA=;
 b=sSl96/bJrODD4X0TP//wUusSfQa0MQbv046IpGwyE0sP2YD28kKxLMtLZ4BbRnuXp6
 yKo6ibbzWCzMltfIMwCC9EhvAND5IYRnv3Fv0kOjpJlnRKZRO7ERnZ5HEpxDZzewv4Bu
 wfig1pwB5Gv7vr1isp1A5Gv9LzH3eyulBLwJSl+ajfEfDLYXJzaLdBq1uFI9KL8vg/Ma
 z402rlk4Yca/xrG+902Sw+THRk3J1FQiEneYvwAmDM7z+TFi4qo8GIwCo4NnBp0M5Bvi
 wY63nSlZnzALHPhxKlKzvAy+qvz3aNdRTxyOoT3Ph+JRnKS3SomRMmhX77KUPgrek5wW
 i6dQ==
X-Gm-Message-State: AOJu0YxFTmR0iR4YgUVDSZArGdG33WbkyOdWLt29hAKFdqN2ZSoZdebA
 eSte+Gg10csjRVCgFSBNvP1P66cA4xgQvw==
X-Google-Smtp-Source: AGHT+IGgnHL7HF01k3LOHatxpmDbA5DtviVamziCHoAYgu/Ay4UgFEfJkwSfZhw+RaGhXctJf6L88w==
X-Received: by 2002:a05:6a00:2d24:b0:6d8:1daf:ae3a with SMTP id
 fa36-20020a056a002d2400b006d81dafae3amr1510903pfb.27.1703198980881; 
 Thu, 21 Dec 2023 14:49:40 -0800 (PST)
Received: from ?IPV6:2001:8004:5170:1dd0:f3d2:7d7a:220f:5fe7?
 ([2001:8004:5170:1dd0:f3d2:7d7a:220f:5fe7])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a62e807000000b006d9314bc0afsm2104946pfi.152.2023.12.21.14.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 14:49:40 -0800 (PST)
Message-ID: <6da02b36-d82f-49ae-ae85-4642486dabe7@linaro.org>
Date: Fri, 22 Dec 2023 09:49:32 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] target/riscv: Add pointer masking tb flags
Content-Language: en-US
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20231221104035.1287244-1-me@deliversmonkey.space>
 <20231221104035.1287244-4-me@deliversmonkey.space>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231221104035.1287244-4-me@deliversmonkey.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 12/21/23 21:40, Alexey Baturo wrote:
> From: Alexey Baturo <baturo.alexey@gmail.com>
> 
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>   target/riscv/cpu.h        | 19 +++++++++++++------
>   target/riscv/cpu_helper.c |  4 ++++
>   target/riscv/translate.c  | 10 ++++++++++
>   3 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f49d4aa52c..2099168950 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -390,6 +390,10 @@ struct CPUArchState {
>       target_ulong senvcfg;
>       uint64_t henvcfg;
>   #endif
> +    /* current number of masked top bits by pointer masking */
> +    target_ulong pm_pmlen;
> +    /* if pointer masking should do sign extension */
> +    bool pm_signext;
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> @@ -538,14 +542,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
>   FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
>   /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
>   FIELD(TB_FLAGS, XL, 16, 2)
> -FIELD(TB_FLAGS, VTA, 18, 1)
> -FIELD(TB_FLAGS, VMA, 19, 1)
> +/* If pointer masking should be applied and address sign extended */
> +FIELD(TB_FLAGS, PM_ENABLED, 18, 1)

I think it would be better add the entire two bit field here, so that the translator can 
see the true width of the address.  You can then use tcg_gen_{s}extract_tl to perform the 
truncation.  At which point the 'target_ulong pm_pmlen' is not required.


r~

> +FIELD(TB_FLAGS, PM_SIGNEXTEND, 19, 1)
> +FIELD(TB_FLAGS, VTA, 20, 1)
> +FIELD(TB_FLAGS, VMA, 21, 1)
>   /* Native debug itrigger */
> -FIELD(TB_FLAGS, ITRIGGER, 20, 1)
> +FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>   /* Virtual mode enabled */
> -FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
> -FIELD(TB_FLAGS, PRIV, 22, 2)
> -FIELD(TB_FLAGS, AXL, 24, 2)
> +FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
> +FIELD(TB_FLAGS, PRIV, 24, 2)
> +FIELD(TB_FLAGS, AXL, 25, 2)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a3d477d226..79cddbd930 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -135,6 +135,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>       flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
>       flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>       flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> +    if (env->pm_pmlen != 0) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, 1);
> +    }
> +    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, env->pm_signext);
>   
>       *pflags = flags;
>   }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6b4b9a671c..4c0d526b58 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -42,6 +42,8 @@ static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl, cpu_vstart;
>   static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>   static TCGv load_res;
>   static TCGv load_val;
> +/* number of top masked address bits by pointer masking extension */
> +static TCGv pm_pmlen;
>   
>   /*
>    * If an operation is being performed on less than TARGET_LONG_BITS,
> @@ -103,6 +105,9 @@ typedef struct DisasContext {
>       bool vl_eq_vlmax;
>       CPUState *cs;
>       TCGv zero;
> +    /* pointer masking extension */
> +    bool pm_enabled;
> +    bool pm_signext;
>       /* Use icount trigger for native debug */
>       bool itrigger;
>       /* FRM is known to contain a valid value. */
> @@ -1176,6 +1181,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>       ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
>       ctx->cs = cs;
> +    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> +    ctx->pm_signext = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>       ctx->zero = tcg_constant_tl(0);
>       ctx->virt_inst_excp = false;
> @@ -1307,4 +1314,7 @@ void riscv_translate_init(void)
>                                "load_res");
>       load_val = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, load_val),
>                                "load_val");
> +    /* Assign var with number of pointer masking masked bits to tcg global */
> +    pm_pmlen = tcg_global_mem_new(tcg_env, offsetof(CPURISCVState, pm_pmlen),
> +                                   "pmlen");
>   }


