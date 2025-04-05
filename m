Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D202DC369A3
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:20:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zho-0005Cm-ES; Sat, 05 Apr 2025 05:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zhU-000596-Ez
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:20:31 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zhO-0000Ie-RT
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:20:27 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso2560835b3a.0
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844819; x=1744449619; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wrsf2v96Mfp6wqDdp0fVns3X9m/BPHpWxEHYMxb5zCI=;
 b=fzLdoRmohzyQH2Hs3L3HOq3PdTQ7U6Iz2Gl9b29QH2kU6PxgyVHZev62PaXJntUmTD
 xnneR+IxFJdYITDKUVa3beXOPa+///gPMxKBphewd2AkfQGhE29Rh1AVhWb8fle/gkcz
 cgRSBoqK1c4xPLZEid1w+lCBCsP429CC27nYyKB89+pVbXkYidTTYy2wYoC3cQ9KVNs5
 L6kjnG6nouQ9899eUvNEknzBiTv5VMGmdfCaWcae1BdeO00k7NJpA3QKM0Ud5LVsaMGb
 lWgeeRuQcy+3kURMJHTsnZh0YKCxBctMoYglivrMxRj4qJgK/Tk492JT3lrNEdNfwuJC
 N7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844819; x=1744449619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wrsf2v96Mfp6wqDdp0fVns3X9m/BPHpWxEHYMxb5zCI=;
 b=sAgRrDEVw4wupY2RVGLpzJN6wmXmJd0Gsw2o4kdtJaAjWyQ1eh318/TZtFvHhG4K/5
 4TFRgEONjkjOKBDYMJr+ebNBb4rebOytA3HhisqhXvKZ5o61dnvwQct3knzlsG1+HV7K
 BFzHGia/pekdf4UvdQx2m0cx8Yo+Bq5uF96qVIEpGSvH+vrl3bq/msHKCBnYQa+5K4Ms
 MKGX3jsRW3Kk64dxHW7qDLYo4GSarEiJLbd4+dMKvD9u3S+pEo2DugwcBJAffvu/uDq8
 SaWDJDobaDniNCdPQxxxdL5VbiM3qlh4iNb5ZOv8pVWfR8a3f8sWMjeq6Uos8gl2AblM
 iasQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLB64iGxNpTbJQx5Ek+7jHHgsbJkSUhIiZdxxtDC6Ie6mgs6kREYQcf5viDl1N4Hfb1Ua621OXPGhc@nongnu.org
X-Gm-Message-State: AOJu0YxT5tzbN0hyIDcUMnvlTyFIPiGQ41a5+qN3/CVHpMnGUWFyNXgU
 QNCC3TbyAfBfqyMovlqzd+u4uU8ba8zREa6U+nP7rIy0vaIdFobgYG/BwoWbxLE=
X-Gm-Gg: ASbGncuZ7XaM9ZNxweNZ2ooEEqSy80V0UXQ6P7QjhdFZTSwqaNefCxfpr2o87zc2XeQ
 rTph0kJZ10RUzFNpn7sH86inJQU6rRschlbzre6ikWF816YmvmViHQRuTFO0+dgepF61LnWUlmY
 82w5sIT26FdAd6dg7iiYyX3IkzjIpfBETp3/PUcux0ZNDH9f+IuKb9FVKHCovj2KW9z0RbMRA7o
 U85PF/pkvxV/gKSBaf49xhdGHjKP3vJ7nKuBcJtwC0+GNU2Ob+0byJXj0gNWc3SadqYgHw6hL1e
 9pSqU+lLSj9HPKg36N2ZRh9bPNJA8YwbUgwazokZCngBNhleD11j0yoiByIF
X-Google-Smtp-Source: AGHT+IG5FlPw9N9bzM1aG8G1elkherBPMhvql1odyRZz/UWZGK67HeEdO3vrCpq8j9QS/cxbEJQntQ==
X-Received: by 2002:a05:6a00:2410:b0:736:3ea8:4813 with SMTP id
 d2e1a72fcca58-739e59050b0mr9407063b3a.2.1743844819253; 
 Sat, 05 Apr 2025 02:20:19 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0dea8fsm4809573b3a.157.2025.04.05.02.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:20:18 -0700 (PDT)
Message-ID: <cafa9cf4-c0d0-4a94-8b45-061d87235c3b@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:20:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector widen instructions(OPMVV/OPMVX/etc.)
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-10-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-10-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> The vd of vector widening mul-add instructions is one of the input
> operands.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


With your co-authored-by tag removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvbf16.c.inc |  9 ++-
>   target/riscv/insn_trans/trans_rvv.c.inc    | 73 +++++++++++++++++-----
>   2 files changed, 65 insertions(+), 17 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/insn_trans/trans_rvbf16.c.inc
> index 0a9cd1ec315..066dc364c5b 100644
> --- a/target/riscv/insn_trans/trans_rvbf16.c.inc
> +++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
> @@ -119,8 +119,11 @@ static bool trans_vfwmaccbf16_vv(DisasContext *ctx, arg_vfwmaccbf16_vv *a)
>       REQUIRE_FPU;
>       REQUIRE_ZVFBFWMA(ctx);
>   
> +    uint8_t sew = ctx->sew;
>       if (require_rvv(ctx) && vext_check_isa_ill(ctx) && (ctx->sew == MO_16) &&
> -        vext_check_dss(ctx, a->rd, a->rs1, a->rs2, a->vm)) {
> +        vext_check_dss(ctx, a->rd, a->rs1, a->rs2, a->vm) &&
> +        vext_check_input_eew(ctx, a->rd, sew + 1, a->rs1, sew, a->vm) &&
> +        vext_check_input_eew(ctx, a->rd, sew + 1, a->rs2, sew, a->vm)) {
>           uint32_t data = 0;
>   
>           gen_set_rm_chkfrm(ctx, RISCV_FRM_DYN);
> @@ -146,8 +149,10 @@ static bool trans_vfwmaccbf16_vf(DisasContext *ctx, arg_vfwmaccbf16_vf *a)
>       REQUIRE_FPU;
>       REQUIRE_ZVFBFWMA(ctx);
>   
> +    uint8_t sew = ctx->sew;
>       if (require_rvv(ctx) && (ctx->sew == MO_16) && vext_check_isa_ill(ctx) &&
> -        vext_check_ds(ctx, a->rd, a->rs2, a->vm)) {
> +        vext_check_ds(ctx, a->rd, a->rs2, a->vm) &&
> +        vext_check_input_eew(ctx, a->rd, sew + 1, a->rs2, sew, a->vm)) {
>           uint32_t data = 0;
>   
>           gen_set_rm(ctx, RISCV_FRM_DYN);
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 728912fc1f2..f30157939b8 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -529,6 +529,7 @@ static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
>   static bool vext_check_ds(DisasContext *s, int vd, int vs, int vm)
>   {
>       return vext_wide_check_common(s, vd, vm) &&
> +           vext_check_input_eew(s, vs, s->sew, -1, 0, vm) &&
>              require_align(vs, s->lmul) &&
>              require_noover(vd, s->lmul + 1, vs, s->lmul);
>   }
> @@ -536,6 +537,7 @@ static bool vext_check_ds(DisasContext *s, int vd, int vs, int vm)
>   static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
>   {
>       return vext_wide_check_common(s, vd, vm) &&
> +           vext_check_input_eew(s, vs, s->sew + 1, -1, 0, vm) &&
>              require_align(vs, s->lmul + 1);
>   }
>   
> @@ -554,6 +556,7 @@ static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
>   static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, int vm)
>   {
>       return vext_check_ds(s, vd, vs2, vm) &&
> +           vext_check_input_eew(s, vs1, s->sew, vs2, s->sew, vm) &&
>              require_align(vs1, s->lmul) &&
>              require_noover(vd, s->lmul + 1, vs1, s->lmul);
>   }
> @@ -576,6 +579,7 @@ static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, int vm)
>   static bool vext_check_dds(DisasContext *s, int vd, int vs1, int vs2, int vm)
>   {
>       return vext_check_ds(s, vd, vs1, vm) &&
> +           vext_check_input_eew(s, vs1, s->sew, vs2, s->sew + 1, vm) &&
>              require_align(vs2, s->lmul + 1);
>   }
>   
> @@ -1532,6 +1536,16 @@ static bool opivv_widen_check(DisasContext *s, arg_rmrr *a)
>              vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
> +/* OPIVV with overwrite and WIDEN */
> +static bool opivv_overwrite_widen_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           vext_check_input_eew(s, a->rd, s->sew + 1, a->rs1, s->sew, a->vm) &&
> +           vext_check_input_eew(s, a->rd, s->sew + 1, a->rs2, s->sew, a->vm);
> +}
> +
>   static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>                              gen_helper_gvec_4_ptr *fn,
>                              bool (*checkfn)(DisasContext *, arg_rmrr *))
> @@ -1579,6 +1593,14 @@ static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
>              vext_check_ds(s, a->rd, a->rs2, a->vm);
>   }
>   
> +static bool opivx_overwrite_widen_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> +           vext_check_input_eew(s, a->rd, s->sew + 1, a->rs2, s->sew, a->vm);
> +}
> +
>   #define GEN_OPIVX_WIDEN_TRANS(NAME, CHECK) \
>   static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
>   {                                                                         \
> @@ -2050,13 +2072,13 @@ GEN_OPIVX_TRANS(vmadd_vx, opivx_check)
>   GEN_OPIVX_TRANS(vnmsub_vx, opivx_check)
>   
>   /* Vector Widening Integer Multiply-Add Instructions */
> -GEN_OPIVV_WIDEN_TRANS(vwmaccu_vv, opivv_widen_check)
> -GEN_OPIVV_WIDEN_TRANS(vwmacc_vv, opivv_widen_check)
> -GEN_OPIVV_WIDEN_TRANS(vwmaccsu_vv, opivv_widen_check)
> -GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx, opivx_widen_check)
> -GEN_OPIVX_WIDEN_TRANS(vwmacc_vx, opivx_widen_check)
> -GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx, opivx_widen_check)
> -GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx, opivx_widen_check)
> +GEN_OPIVV_WIDEN_TRANS(vwmaccu_vv, opivv_overwrite_widen_check)
> +GEN_OPIVV_WIDEN_TRANS(vwmacc_vv, opivv_overwrite_widen_check)
> +GEN_OPIVV_WIDEN_TRANS(vwmaccsu_vv, opivv_overwrite_widen_check)
> +GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx, opivx_overwrite_widen_check)
> +GEN_OPIVX_WIDEN_TRANS(vwmacc_vx, opivx_overwrite_widen_check)
> +GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx, opivx_overwrite_widen_check)
> +GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx, opivx_overwrite_widen_check)
>   
>   /* Vector Integer Merge and Move Instructions */
>   static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
> @@ -2397,6 +2419,17 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>              vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
>   }
>   
> +static bool opfvv_overwrite_widen_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return require_rvv(s) &&
> +           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
> +           vext_check_input_eew(s, a->rd, s->sew + 1, a->rs1, s->sew, a->vm) &&
> +           vext_check_input_eew(s, a->rd, s->sew + 1, a->rs2, s->sew, a->vm);
> +}
> +
>   /* OPFVV with WIDEN */
>   #define GEN_OPFVV_WIDEN_TRANS(NAME, CHECK)                       \
>   static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
> @@ -2436,6 +2469,16 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>              vext_check_ds(s, a->rd, a->rs2, a->vm);
>   }
>   
> +static bool opfvf_overwrite_widen_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return require_rvv(s) &&
> +           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
> +           vext_check_input_eew(s, a->rd, s->sew + 1, a->rs2, s->sew, a->vm);
> +}
> +
>   /* OPFVF with WIDEN */
>   #define GEN_OPFVF_WIDEN_TRANS(NAME, CHECK)                       \
>   static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
> @@ -2560,14 +2603,14 @@ GEN_OPFVF_TRANS(vfmsub_vf, opfvf_check)
>   GEN_OPFVF_TRANS(vfnmsub_vf, opfvf_check)
>   
>   /* Vector Widening Floating-Point Fused Multiply-Add Instructions */
> -GEN_OPFVV_WIDEN_TRANS(vfwmacc_vv, opfvv_widen_check)
> -GEN_OPFVV_WIDEN_TRANS(vfwnmacc_vv, opfvv_widen_check)
> -GEN_OPFVV_WIDEN_TRANS(vfwmsac_vv, opfvv_widen_check)
> -GEN_OPFVV_WIDEN_TRANS(vfwnmsac_vv, opfvv_widen_check)
> -GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf, opfvf_widen_check)
> -GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf, opfvf_widen_check)
> -GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf, opfvf_widen_check)
> -GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf, opfvf_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwmacc_vv, opfvv_overwrite_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwnmacc_vv, opfvv_overwrite_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwmsac_vv, opfvv_overwrite_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwnmsac_vv, opfvv_overwrite_widen_check)
> +GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf, opfvf_overwrite_widen_check)
> +GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf, opfvf_overwrite_widen_check)
> +GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf, opfvf_overwrite_widen_check)
> +GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf, opfvf_overwrite_widen_check)
>   
>   /* Vector Floating-Point Square-Root Instruction */
>   


