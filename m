Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB13CF2564
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 01:05:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLWdJ-0006JH-Nk; Tue, 18 Nov 2025 20:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vLWdG-0006Id-VT
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 20:05:15 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vLWdE-0005hq-3O
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 20:05:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b737cd03d46so539128966b.0
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 17:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763514309; x=1764119109; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reLeUxb5yz4eBETAxAtKd9wnqnVBZ/fkION/xt6iQKE=;
 b=IwDanQ25Zu0RorVQXEcU6hyWR+YsI5LKShdXqwGArEEFAj08zdpoVtNk3Knz3LHJWu
 Rs1VPQQAOujgxIKmH7ZyQIceEIPUb05+CDeuIs9ONFhb4tQezk3SG8ise+fPVTyeGF4X
 ZwmHffVpHZ2UWxKo2lD+p9KA4e7LpeSZ9Dn3VIrtvSTFSdPHYPijynfKvncIidNPxX5f
 ryDKAZSwA5DXkZcENb9YGBjkiIhmlk90J9oSbEA7RJitYcuXyhbmAvaWZnA0S8cXkn5s
 mIRsR67pQnuSB/TMb2m9d3kWEWxUQxutjWlnNIKOFBZ475V/wFjxUr5oV/6mEB7uFjVa
 E0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763514309; x=1764119109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=reLeUxb5yz4eBETAxAtKd9wnqnVBZ/fkION/xt6iQKE=;
 b=iy6rP5j1JIOWR3udEUB/SxdvEMO2KxraPohZqhC+LJEWwHr85+priK1rBVTy+KhCfY
 MUD/nZ2tgXocAf5UJYBfOsAmBygSOEUJP8fhPF8Skb1EoeiYZbwcxrsAC3+9Ncvge4qL
 hoQqh4fiHD7fRfHbP25TFlm0jRgLqaEgmmUzGMwsb+B0ea0JwychOqOTkHEKb8FBWJS7
 YwuHqluesutRQIxM9Yeq9L/DlYWkaiQF/rHseskU7pBDLEnEsXoObj9gibqG2ScPZZCx
 1jhdN+UNfagJd+eC3tjS7nuu0SbnszZZB0XNp5tRtC7Sune2fLaKSsoObT7idC61ejK1
 oVRQ==
X-Gm-Message-State: AOJu0Yxbq6YfQZ+SHvxf49mme5vRplZDPQHBrN4zVCB4hwjrS90tpm6K
 cO8ET/COs6yOpRt4dh4U0YiLVuN48U41XPhJ/HObERFDwJZBqggaP+RgtWcH5W+70K323biXBFw
 AE49lL8uVncvvZ5jhD58lWcabIsItJaU=
X-Gm-Gg: ASbGncsYrqA3rDthX9uoucZwUgoQJ4+oCC3nG5677pA6VyJAhbtW9jmfrg+Kz1BiNE2
 rb8diYLwWZyAINNhQiHDUV7mz//9YKxdLTS+ctYtBe6uyABQRRi3x8dQDO1nNtyjdWYHk/NRcHY
 OXl+7W7MrFpYQ/cbJsX6keaTsDuPz8Kp9eeXCoQD/6EOTq58IYl6HDn8aI/qe0Ewprug9sIvoSn
 iM4IsuikEm/y0ZOEIkJ3gmZLpAlLgibBX56GmAH6OZGlIU+lwXjdnNPOTZFcn5u4Sc8GBlvX5kv
 Rt2I1H1f+tsBK+9e36d60bDu1W1iiLjif42v7eK7Xm+9Byo=
X-Google-Smtp-Source: AGHT+IHNySxODsIH0u2LzQLHfCFL9r7IiFGiTOTeQNpn7cob4bA+jlb8sgM7YVGFNX/tcqLl0PxI+zCM7BOxVvvmBk4=
X-Received: by 2002:a17:907:9496:b0:b72:588:2976 with SMTP id
 a640c23a62f3a-b7367c02102mr2062949766b.60.1763514309016; Tue, 18 Nov 2025
 17:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20251112162923.311714-1-roan.richmond@codethink.co.uk>
In-Reply-To: <20251112162923.311714-1-roan.richmond@codethink.co.uk>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Nov 2025 11:04:42 +1000
X-Gm-Features: AWmQ_bl1gsYSrl8wf_H0ThvKeFTddaeEd0of5S2memw89z0iLdaouKBtFnw-wy8
Message-ID: <CAKmqyKOk39af_jWRuXj984DYhMoeRQwVUk=PKJp1=z-n-3rmMQ@mail.gmail.com>
Subject: Re: [PATCH v5] Add RISCV ZALASR extension
To: Roan Richmond <roan.richmond@codethink.co.uk>
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Nov 13, 2025 at 2:29=E2=80=AFAM Roan Richmond
<roan.richmond@codethink.co.uk> wrote:
>
> This is based on version v0.9 of the ZALASR specification [1].
> The specification is listed as in Ratified state [2].
>
> [1]: https://github.com/riscv/riscv-zalasr/tree/v0.9
> [2]: https://lf-riscv.atlassian.net/wiki/spaces/HOME/pages/16154882/All+R=
ISC-V+Specifications+Under+Active+Development
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Roan Richmond <roan.richmond@codethink.co.uk>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> V5:
>   - Rebased onto newest master
>   - Fixes for checkpatch.pl
>     - 2 occurances of trailing whitespace
>     - License comment reformatted to what checkpatch expects
>
>  target/riscv/cpu.c                           |   2 +
>  target/riscv/cpu_cfg_fields.h.inc            |   1 +
>  target/riscv/insn32.decode                   |  10 ++
>  target/riscv/insn_trans/trans_rvzalasr.c.inc | 113 +++++++++++++++++++
>  target/riscv/translate.c                     |   1 +
>  5 files changed, 127 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzalasr.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 73d4280d7c..96e33ee10f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,6 +127,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
>      ISA_EXT_DATA_ENTRY(zabha, PRIV_VERSION_1_13_0, ext_zabha),
>      ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
> +    ISA_EXT_DATA_ENTRY(zalasr, PRIV_VERSION_1_12_0, ext_zalasr),
>      ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
>      ISA_EXT_DATA_ENTRY(zama16b, PRIV_VERSION_1_13_0, ext_zama16b),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
> @@ -1253,6 +1254,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zama16b", ext_zama16b, false),
>      MULTI_EXT_CFG_BOOL("zabha", ext_zabha, false),
>      MULTI_EXT_CFG_BOOL("zaamo", ext_zaamo, false),
> +    MULTI_EXT_CFG_BOOL("zalasr", ext_zalasr, false),
>      MULTI_EXT_CFG_BOOL("zalrsc", ext_zalrsc, false),
>      MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
>      MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fie=
lds.h.inc
> index a154ecdc79..7d3d5d0d57 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -65,6 +65,7 @@ BOOL_FIELD(ext_zaamo)
>  BOOL_FIELD(ext_zacas)
>  BOOL_FIELD(ext_zama16b)
>  BOOL_FIELD(ext_zabha)
> +BOOL_FIELD(ext_zalasr)
>  BOOL_FIELD(ext_zalrsc)
>  BOOL_FIELD(ext_zawrs)
>  BOOL_FIELD(ext_zfa)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index cd23b1f3a9..c848c0c1c5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -1066,3 +1066,13 @@ amominu_h  11000 . . ..... ..... 001 ..... 0101111=
 @atom_st
>  amomaxu_h  11100 . . ..... ..... 001 ..... 0101111 @atom_st
>  amocas_b    00101 . . ..... ..... 000 ..... 0101111 @atom_st
>  amocas_h    00101 . . ..... ..... 001 ..... 0101111 @atom_st
> +
> +# *** Zalasr Standard Extension ***
> +lb_aqrl  00110 . . ..... ..... 000 ..... 0101111 @atom_st
> +lh_aqrl  00110 . . ..... ..... 001 ..... 0101111 @atom_st
> +lw_aqrl  00110 . . ..... ..... 010 ..... 0101111 @atom_st
> +ld_aqrl  00110 . . ..... ..... 011 ..... 0101111 @atom_st
> +sb_aqrl  00111 . . ..... ..... 000 ..... 0101111 @atom_st
> +sh_aqrl  00111 . . ..... ..... 001 ..... 0101111 @atom_st
> +sw_aqrl  00111 . . ..... ..... 010 ..... 0101111 @atom_st
> +sd_aqrl  00111 . . ..... ..... 011 ..... 0101111 @atom_st
> diff --git a/target/riscv/insn_trans/trans_rvzalasr.c.inc b/target/riscv/=
insn_trans/trans_rvzalasr.c.inc
> new file mode 100644
> index 0000000000..bf86805cef
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzalasr.c.inc
> @@ -0,0 +1,113 @@
> +/*
> + * RISC-V translation routines for the ZALASR (Load-Aquire and Store-Rel=
ease)
> + * Extension.
> + *
> + * Copyright (c) 2025 Roan Richmond, roan.richmond@codethink.co.uk
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * The documentation of the ISA extension can be found here:
> + *   https://github.com/riscv/riscv-zalasr/tree/v0.9
> + */
> +
> +#define REQUIRE_ZALASR(ctx) do {     \
> +    if (!ctx->cfg_ptr->ext_zalasr) { \
> +        return false;                \
> +    }                                \
> +} while (0)
> +
> +static bool gen_load_acquire(DisasContext *ctx, arg_lb_aqrl *a, MemOp me=
mop)
> +{
> +    decode_save_opc(ctx, 0);
> +
> +    TCGv addr =3D get_address(ctx, a->rs1, 0);
> +    TCGv dest =3D get_gpr(ctx, a->rd, EXT_NONE);
> +    TCGBar bar =3D (a->rl) ? TCG_BAR_STRL : 0;
> +
> +    /* Check that AQ is set, as this is mandatory */
> +    if (!a->aq) {
> +        return false;
> +    }
> +
> +    memop |=3D (ctx->cfg_ptr->ext_zama16b) ? MO_ATOM_WITHIN16 : 0;
> +
> +    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    /* Add a memory barrier implied by AQ (mandatory) and RL (optional) =
*/
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ | bar);
> +
> +    return true;
> +}
> +
> +static bool trans_lb_aqrl(DisasContext *ctx, arg_lb_aqrl *a)
> +{
> +    REQUIRE_ZALASR(ctx);
> +    return gen_load_acquire(ctx, a, (MO_ALIGN | MO_SB));
> +}
> +
> +static bool trans_lh_aqrl(DisasContext *ctx, arg_lh_aqrl *a)
> +{
> +    REQUIRE_ZALASR(ctx);
> +    return gen_load_acquire(ctx, a, (MO_ALIGN | MO_TESW));
> +}
> +
> +static bool trans_lw_aqrl(DisasContext *ctx, arg_lw_aqrl *a)
> +{
> +    REQUIRE_ZALASR(ctx);
> +    return gen_load_acquire(ctx, a, (MO_ALIGN | MO_TESL));
> +}
> +
> +static bool trans_ld_aqrl(DisasContext *ctx, arg_ld_aqrl *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZALASR(ctx);
> +    return gen_load_acquire(ctx, a, (MO_ALIGN | MO_TEUQ));
> +}
> +
> +static bool gen_store_release(DisasContext *ctx, arg_sb_aqrl *a, MemOp m=
emop)
> +{
> +    decode_save_opc(ctx, 0);
> +
> +    TCGv addr =3D get_address(ctx, a->rs1, 0);
> +    TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGBar bar =3D (a->aq) ? TCG_BAR_LDAQ : 0;
> +
> +    /* Check that RL is set, as this is mandatory */
> +    if (!a->rl) {
> +        return false;
> +    }
> +
> +    memop |=3D (ctx->cfg_ptr->ext_zama16b) ? MO_ATOM_WITHIN16 : 0;
> +
> +    /* Add a memory barrier implied by RL (mandatory) and AQ (optional) =
*/
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL | bar);
> +
> +    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
> +    return true;
> +}
> +
> +static bool trans_sb_aqrl(DisasContext *ctx, arg_sb_aqrl *a)
> +{
> +    REQUIRE_ZALASR(ctx);
> +    return gen_store_release(ctx, a, (MO_ALIGN | MO_SB));
> +}
> +
> +static bool trans_sh_aqrl(DisasContext *ctx, arg_sh_aqrl *a)
> +{
> +    REQUIRE_ZALASR(ctx);
> +    return gen_store_release(ctx, a, (MO_ALIGN | MO_TESW));
> +}
> +
> +static bool trans_sw_aqrl(DisasContext *ctx, arg_sw_aqrl *a)
> +{
> +    REQUIRE_ZALASR(ctx);
> +    return gen_store_release(ctx, a, (MO_ALIGN | MO_TESL));
> +}
> +
> +static bool trans_sd_aqrl(DisasContext *ctx, arg_sd_aqrl *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZALASR(ctx);
> +    return gen_store_release(ctx, a, (MO_ALIGN | MO_TEUQ));
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e1f4dc5ffd..f89a99c849 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1199,6 +1199,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvzicond.c.inc"
>  #include "insn_trans/trans_rvzacas.c.inc"
>  #include "insn_trans/trans_rvzabha.c.inc"
> +#include "insn_trans/trans_rvzalasr.c.inc"
>  #include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzicbo.c.inc"
>  #include "insn_trans/trans_rvzimop.c.inc"
> --
> 2.43.0
>

