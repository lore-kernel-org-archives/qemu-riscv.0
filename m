Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE5C4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:07:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLGt8-0005N7-Lv; Thu, 04 Jan 2024 01:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLGt6-0005MI-5N; Thu, 04 Jan 2024 01:07:28 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLGt4-0005o1-0G; Thu, 04 Jan 2024 01:07:27 -0500
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7cbebe9ca1dso71351241.2; 
 Wed, 03 Jan 2024 22:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704348444; x=1704953244; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymTUbt6L3egvo8LqGsrrDp80LpEUcHiOAmeYnH9fEqw=;
 b=Wh0XyAH4pZAIobYQtgzWvpTSxteALsC73Cail8gLkD3+8lR34c9bPdtUfj6JLIWmBS
 mQS6NGEVjmX6VEfs6tWfvjejBsxcKMgtZ5jj3ZWS4OqxbG5aGcMzgeFk/D4gjl+lb5Ij
 jCX26ljyMSwz3FwgaJKcsZ6Z5/nF5My9/sifyZlnydJUQt4P9GhfGQeMvZgbNg1XM+vg
 hYLuxCcYbvTGLlS0ehsc/i5MGAc6sx58ZoTbzl4/4rjGM8YFiEjISpb9J/Xo4/CVmYMP
 xr3maynH2nByi82OXG6+fGOykV8vgyaJT92kBhxR1AtKkrhD564KNauHWsb6UsJhtTX1
 GzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704348444; x=1704953244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymTUbt6L3egvo8LqGsrrDp80LpEUcHiOAmeYnH9fEqw=;
 b=EfwZcrVdVsTmCC1q+U+BCKT534At/wBeMwoLZ6oK2lL7wzBgnmNSUOG+G+uK3xgCsq
 mJu/v98V/e3zzxSJ7HOVDi0y08GCBdW6LxAjtQzitEP65rvlZsIBPd/wwR12EzHuf5Zn
 uvomR6xuW6Go+QjX7TmuyGGldbyUZdL1ugddtTbZus231UJEw+HnlTl3RpcDOuE/u0Et
 WlPHtmXDOoHhEe88I0xfqqLYds2q+tQXfb7HYGaM0y3buZ2Ej9Lnv0ZU6dhX/uXyDlev
 ConoC1g7buRTHT4/WxU2R0z+YNJ8x7Hy5bdLlDf+QvmMFe2kMWY6S1gWrgb+72cYBsCw
 usJg==
X-Gm-Message-State: AOJu0YwxyLgdvZHWZ9Zg5DB2CS5U031ACBfLjm8eZcS8MAjHbbSYRm9Q
 rcpXhIJr1ip4zYto4m7HyYPJ0H3smjLkXe5Zfvs=
X-Google-Smtp-Source: AGHT+IFf0aLvq7tG7fyXD+ZO6OXtrDJm189lT+p+vDq99Y7K+yuu60rI+kfCarVI6kk1QtsY9T1/5AeORHzwb9yuQC8=
X-Received: by 2002:a05:6102:c46:b0:466:fc12:e9a6 with SMTP id
 y6-20020a0561020c4600b00466fc12e9a6mr62024vss.35.1704348444085; Wed, 03 Jan
 2024 22:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20231207153842.32401-1-rbradford@rivosinc.com>
 <20231207153842.32401-2-rbradford@rivosinc.com>
In-Reply-To: <20231207153842.32401-2-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:06:57 +1000
Message-ID: <CAKmqyKN_FxRjLNBpunGL+9zXL7fi3LiE-XA5fNtETDVtdgQw-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Add support for Zacas extension
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Dec 8, 2023 at 1:40=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> From: Weiwei Li <liweiwei@iscas.ac.cn>
>
> Add support for amocas.w/d/q instructions which are part of the ratified
> Zacas extension: https://github.com/riscv/riscv-zacas
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                          |   2 +
>  target/riscv/cpu_cfg.h                      |   1 +
>  target/riscv/insn32.decode                  |   6 +
>  target/riscv/insn_trans/trans_rvzacas.c.inc | 150 ++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c                  |   5 +
>  target/riscv/translate.c                    |   1 +
>  6 files changed, 165 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzacas.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07..a265833b17 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -87,6 +87,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
>      ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
>      ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
> +    ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
>      ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
> @@ -1300,6 +1301,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
>      MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
>      MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
> +    MULTI_EXT_CFG_BOOL("zacas", ext_zacas, false),
>      MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
>      MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
>      MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..d516de4a44 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -77,6 +77,7 @@ struct RISCVCPUConfig {
>      bool ext_svnapot;
>      bool ext_svpbmt;
>      bool ext_zdinx;
> +    bool ext_zacas;
>      bool ext_zawrs;
>      bool ext_zfa;
>      bool ext_zfbfmin;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 33597fe2bb..f22df04cfd 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -1004,3 +1004,9 @@ vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 =
@r2_vm_1
>  vsm4k_vi    100001 1 ..... ..... 010 ..... 1110111 @r_vm_1
>  vsm4r_vv    101000 1 ..... 10000 010 ..... 1110111 @r2_vm_1
>  vsm4r_vs    101001 1 ..... 10000 010 ..... 1110111 @r2_vm_1
> +
> +# *** RV32 Zacas Standard Extension ***
> +amocas_w    00101 . . ..... ..... 010 ..... 0101111 @atom_st
> +amocas_d    00101 . . ..... ..... 011 ..... 0101111 @atom_st
> +# *** RV64 Zacas Standard Extension ***
> +amocas_q    00101 . . ..... ..... 100 ..... 0101111 @atom_st
> diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc b/target/riscv/i=
nsn_trans/trans_rvzacas.c.inc
> new file mode 100644
> index 0000000000..5d274d4c08
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
> @@ -0,0 +1,150 @@
> +/*
> + * RISC-V translation routines for the RV64 Zacas Standard Extension.
> + *
> + * Copyright (c) 2020-2023 PLCT Lab
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZACAS(ctx) do {          \
> +    if (!ctx->cfg_ptr->ext_zacas) {      \
> +        return false;                     \
> +    }                                     \
> +} while (0)
> +
> +static bool gen_cmpxchg(DisasContext *ctx, arg_atomic *a, MemOp mop)
> +{
> +    TCGv dest =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGv src1 =3D get_address(ctx, a->rs1, 0);
> +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    decode_save_opc(ctx);
> +    tcg_gen_atomic_cmpxchg_tl(dest, src1, dest, src2, ctx->mem_idx, mop)=
;
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
> +{
> +    REQUIRE_ZACAS(ctx);
> +    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TESL);
> +}
> +
> +static TCGv_i64 get_gpr_pair(DisasContext *ctx, int reg_num)
> +{
> +    TCGv_i64 t;
> +
> +    assert(get_ol(ctx) =3D=3D MXL_RV32);
> +
> +    if (reg_num =3D=3D 0) {
> +        return tcg_constant_i64(0);
> +    }
> +
> +    t =3D tcg_temp_new_i64();
> +    tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
> +    return t;
> +}
> +
> +static void gen_set_gpr_pair(DisasContext *ctx, int reg_num, TCGv_i64 t)
> +{
> +    assert(get_ol(ctx) =3D=3D MXL_RV32);
> +
> +    if (reg_num !=3D 0) {
> +#ifdef TARGET_RISCV32
> +        tcg_gen_extr_i64_i32(cpu_gpr[reg_num], cpu_gpr[reg_num + 1], t);
> +#else
> +        tcg_gen_ext32s_i64(cpu_gpr[reg_num], t);
> +        tcg_gen_sari_i64(cpu_gpr[reg_num + 1], t, 32);
> +#endif
> +
> +        if (get_xl_max(ctx) =3D=3D MXL_RV128) {
> +            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
> +            tcg_gen_sari_tl(cpu_gprh[reg_num + 1], cpu_gpr[reg_num + 1],=
 63);
> +        }
> +    }
> +}
> +
> +static bool gen_cmpxchg64(DisasContext *ctx, arg_atomic *a, MemOp mop)
> +{
> +    /*
> +     * Encodings with odd numbered registers specified in rs2 and rd are
> +     * reserved.
> +     */
> +    if ((a->rs2 | a->rd) & 1) {
> +        return false;
> +    }
> +
> +    TCGv_i64 dest =3D get_gpr_pair(ctx, a->rd);
> +    TCGv src1 =3D get_address(ctx, a->rs1, 0);
> +    TCGv_i64 src2 =3D get_gpr_pair(ctx, a->rs2);
> +
> +    decode_save_opc(ctx);
> +    tcg_gen_atomic_cmpxchg_i64(dest, src1, dest, src2, ctx->mem_idx, mop=
);
> +
> +    gen_set_gpr_pair(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static bool trans_amocas_d(DisasContext *ctx, arg_amocas_d *a)
> +{
> +    REQUIRE_ZACAS(ctx);
> +    switch (get_ol(ctx)) {
> +    case MXL_RV32:
> +        return gen_cmpxchg64(ctx, a, MO_ALIGN | MO_TEUQ);
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TEUQ);
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static bool trans_amocas_q(DisasContext *ctx, arg_amocas_q *a)
> +{
> +    REQUIRE_ZACAS(ctx);
> +    REQUIRE_64BIT(ctx);
> +
> +    /*
> +     * Encodings with odd numbered registers specified in rs2 and rd are
> +     * reserved.
> +     */
> +    if ((a->rs2 | a->rd) & 1) {
> +        return false;
> +    }
> +
> +#ifdef TARGET_RISCV64
> +    TCGv_i128 dest =3D tcg_temp_new_i128();
> +    TCGv src1 =3D get_address(ctx, a->rs1, 0);
> +    TCGv_i128 src2 =3D tcg_temp_new_i128();
> +    TCGv_i64 src2l =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv_i64 src2h =3D get_gpr(ctx, a->rs2 =3D=3D 0 ? 0 : a->rs2 + 1, EX=
T_NONE);
> +    TCGv_i64 destl =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGv_i64 desth =3D get_gpr(ctx, a->rd =3D=3D 0 ? 0 : a->rd + 1, EXT_=
NONE);
> +
> +    tcg_gen_concat_i64_i128(src2, src2l, src2h);
> +    tcg_gen_concat_i64_i128(dest, destl, desth);
> +    decode_save_opc(ctx);
> +    tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx,
> +                                (MO_ALIGN | MO_TEUO));
> +
> +    tcg_gen_extr_i128_i64(destl, desth, dest);
> +
> +    if (a->rd !=3D 0) {
> +        gen_set_gpr(ctx, a->rd, destl);
> +        gen_set_gpr(ctx, a->rd + 1, desth);
> +    }
> +#endif
> +
> +    return true;
> +}
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8a35683a34..29b5a88931 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -343,6 +343,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          return;
>      }
>
> +    if ((cpu->cfg.ext_zacas) && !riscv_has_ext(env, RVA)) {
> +        error_setg(errp, "Zacas extension requires A extension");
> +        return;
> +    }
> +
>      if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env, RVA)) {
>          error_setg(errp, "Zawrs extension requires A extension");
>          return;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0be79bb16..071fbad7ef 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1089,6 +1089,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzicond.c.inc"
> +#include "insn_trans/trans_rvzacas.c.inc"
>  #include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzicbo.c.inc"
>  #include "insn_trans/trans_rvzfa.c.inc"
> --
> 2.43.0
>
>

