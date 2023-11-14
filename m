Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D836DC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 13:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2tNZ-0001Es-6T; Tue, 14 Nov 2023 08:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2tNX-0001DW-C4
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 08:22:55 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2tNV-0000iZ-79
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 08:22:55 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc5916d578so49987835ad.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Nov 2023 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699968172; x=1700572972; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pyxgIvb0I18cqvUKvTl3NA0ImbVPBLAZOXXkRbalrkU=;
 b=hPesT8cplNwePbevg8CvLAN6LFk/e3ZxusJEmyFyVa/sDl55jLhqH7ghOBnP7nY8Xg
 UmmNGJv9nO2k2dnEjX445McP8sTNlRv63fSFZFQsxbfBn44BUABAnUySZbFxRj87EK1p
 gQYDlnfeM2xmR5TJZH7xcTCVFpsmAyJF6xmqejj6jJDmpI65F2RymAvgm5YqK0MiNgtZ
 mLs4b6duyOkbuzfYJfRLuxFyB1avB8IxNX4HUU6IE6skXwKvxPTA4/irTZscOxyIYqeg
 ai0bViGlcZxugpIRSWa3yQzpUt3Ot7ce7zUprqDoYgXQwOl1dMl4HI0OhIeP5q94GWaF
 rNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699968172; x=1700572972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pyxgIvb0I18cqvUKvTl3NA0ImbVPBLAZOXXkRbalrkU=;
 b=EJHUb137sgKq9YWU42aDxUgJs7LVkCjN9Pb9R0vA84gkHR2/cNJMXNW88Y5L6Fau8G
 FhYSz0as6uoRZhPonQPK07Z798G0Wd+UJEQxhTcxq6SbHuwJQhHJ5tBA4745u5MAhEaL
 ueQtjJXEdNOlBtS+HQtFHJevBwqBmM+9LINRj8yBcR/Si5pR/fad9xMQNyz7mphmzHQV
 9Q0/4w32EwZZ6QwSvFGTZAer2KnTvD8NZHzeIOFTEd7gc8qoBOiAK/Ty3l/lAaYsp8Ke
 No5ehOoK/Ny+GgTwrS+LuatGri3H7fktQFlsgneyEw1gsgCpabzj+PK2AJjUKeB5+/wU
 UyHw==
X-Gm-Message-State: AOJu0Ywp00wTqirTFjN9kgSmX84QHMcMZ0Jo9/PjXW558lMTVmFkWlc3
 Fe/0ai6g7jifIJWGgC2I/GxR7A==
X-Google-Smtp-Source: AGHT+IEd0g08AGeRREXQvg3oHyUzbY7KAzjZwlJ2gRX53FQyRZvXzz2Z338fGn6EJUFUp+4iwunGvA==
X-Received: by 2002:a17:902:d4ce:b0:1ce:15cb:630b with SMTP id
 o14-20020a170902d4ce00b001ce15cb630bmr2789707plg.54.1699968171570; 
 Tue, 14 Nov 2023 05:22:51 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.148])
 by smtp.gmail.com with ESMTPSA id
 ji17-20020a170903325100b001c9c97beb9csm5654640plb.71.2023.11.14.05.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 05:22:51 -0800 (PST)
Message-ID: <b77ac647-c4d7-4dfc-bde5-1efffb4ebe91@ventanamicro.com>
Date: Tue, 14 Nov 2023 10:22:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] RISC-V: Add support for Ztso
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
 <20231113095605.1131443-2-christoph.muellner@vrull.eu>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231113095605.1131443-2-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 11/13/23 06:56, Christoph Muellner wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The Ztso extension is already ratified, this adds it as a CPU property
> and adds various fences throughout the port in order to allow TSO
> targets to function on weaker hosts.  We need no fences for AMOs as
> they're already SC, the placess we need barriers are described.

s/placess/places

> These fences are placed in the RISC-V backend rather than TCG as is
> planned for x86-on-arm64 because RISC-V allows heterogenous (and

s/heterogenous/heterogeneous

> likely soon dynamic) hart memory models.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c                      |  2 ++
>   target/riscv/cpu_cfg.h                  |  1 +
>   target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
>   target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
>   target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
>   target/riscv/translate.c                |  3 +++
>   6 files changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07..b446e553b1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -118,6 +118,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
>       ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
>       ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
> +    ISA_EXT_DATA_ENTRY(ztso, PRIV_VERSION_1_12_0, ext_ztso),
>       ISA_EXT_DATA_ENTRY(zvbb, PRIV_VERSION_1_12_0, ext_zvbb),
>       ISA_EXT_DATA_ENTRY(zvbc, PRIV_VERSION_1_12_0, ext_zvbc),
>       ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
> @@ -1336,6 +1337,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("zksed", ext_zksed, false),
>       MULTI_EXT_CFG_BOOL("zksh", ext_zksh, false),
>       MULTI_EXT_CFG_BOOL("zkt", ext_zkt, false),
> +    MULTI_EXT_CFG_BOOL("ztso", ext_ztso, false),
>   
>       MULTI_EXT_CFG_BOOL("zdinx", ext_zdinx, false),
>       MULTI_EXT_CFG_BOOL("zfinx", ext_zfinx, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..a0f951d9c1 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -70,6 +70,7 @@ struct RISCVCPUConfig {
>       bool ext_zihintntl;
>       bool ext_zihintpause;
>       bool ext_zihpm;
> +    bool ext_ztso;
>       bool ext_smstateen;
>       bool ext_sstc;
>       bool ext_svadu;
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 5f194a447b..85c7e31f2a 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -28,7 +28,11 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>       }
>       tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
> -    if (a->aq) {
> +    /*
> +     * TSO defines AMOs as acquire+release-RCsc, but does not define LR/SC as
> +     * AMOs.  Instead treat them like loads.
> +     */
> +    if (a->aq || ctx->ztso) {
>           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
>       }
>   
> @@ -64,9 +68,10 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       gen_set_label(l1);
>       /*
>        * Address comparison failure.  However, we still need to
> -     * provide the memory barrier implied by AQ/RL.
> +     * provide the memory barrier implied by AQ/RL/TSO.
>        */
> -    tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
> +    TCGBar bar_strl = (ctx->ztso || a->rl) ? TCG_BAR_STRL : 0;
> +    tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + bar_strl);
>       gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
>   
>       gen_set_label(l2);
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index faf6d65064..ad40d3e87f 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -266,12 +266,20 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
>   
>   static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>   {
> +    bool out;
> +
>       decode_save_opc(ctx);
>       if (get_xl(ctx) == MXL_RV128) {
> -        return gen_load_i128(ctx, a, memop);
> +        out = gen_load_i128(ctx, a, memop);
>       } else {
> -        return gen_load_tl(ctx, a, memop);
> +        out = gen_load_tl(ctx, a, memop);
> +    }
> +
> +    if (ctx->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
>       }
> +
> +    return out;
>   }
>   
>   static bool trans_lb(DisasContext *ctx, arg_lb *a)
> @@ -328,6 +336,10 @@ static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
>       TCGv addr = get_address(ctx, a->rs1, a->imm);
>       TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
>   
> +    if (ctx->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    }
> +
>       tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
>       return true;
>   }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 78bd363310..76e63fcbca 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -636,8 +636,28 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>       tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>       tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
>   
> +    /*
> +     * According to the specification
> +     *
> +     *   Additionally, if the Ztso extension is implemented, then vector memory
> +     *   instructions in the V extension and Zve family of extensions follow
> +     *   RVTSO at the instruction level.  The Ztso extension does not
> +     *   strengthen the ordering of intra-instruction element accesses.
> +     *
> +     * as a result neither ordered nor unordered accesses from the V
> +     * instructions need ordering within the loop but we do still need barriers
> +     * around the loop.
> +     */
> +    if (is_store && s->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    }
> +
>       fn(dest, mask, base, tcg_env, desc);
>   
> +    if (!is_store && s->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> +    }
> +
>       if (!is_store) {
>           mark_vs_dirty(s);
>       }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0be79bb16..ab56051d6d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -109,6 +109,8 @@ typedef struct DisasContext {
>       /* PointerMasking extension */
>       bool pm_mask_enabled;
>       bool pm_base_enabled;
> +    /* Ztso */
> +    bool ztso;
>       /* Use icount trigger for native debug */
>       bool itrigger;
>       /* FRM is known to contain a valid value. */
> @@ -1194,6 +1196,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->cs = cs;
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> +    ctx->ztso = cpu->cfg.ext_ztso;
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>       ctx->zero = tcg_constant_tl(0);
>       ctx->virt_inst_excp = false;

