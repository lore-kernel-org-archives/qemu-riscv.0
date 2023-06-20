Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF80EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 15:23:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBdC4-0005yd-2j; Tue, 20 Jun 2023 11:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qBdBu-0005LZ-3U
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 11:22:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qBdBr-0001LL-Am
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 11:22:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f909853509so27875315e9.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687274559; x=1689866559; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cLXgodAGXBj+v2zu9ZxU3lUOFEwsOiyp9aYqfTOHlKM=;
 b=oVNBfboTGA3fTDGNC8IWvnIki9nqNQkyOgaHo2nL/a+lnN2vNIYpjh4kz2zuceE82g
 fLRcynv1myMWA/i32yKMp/GKwupjM69Ze9D8fZIYRSRb1Wgk8A2qatfzsklaYgkTRvgm
 Tt8BHb0ae3Ez+wTlTkSnaa+dhLJpDwJLplNej//cDt02jhMTIgWfrBG8WSwl/bYZBBV9
 vlVLVEnAmHQLOG4JSykvnNwdls9Qv8TZ8IaAYPb7lDnWk/NPeEbJO4U59vyOvmsJdbRN
 Rx88MukXhu3cTKU94TB8XhSVW+l4jyc7MvIYuXPGPGRekNqG5RKzH5p7XQH5A7GEteA7
 F/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687274559; x=1689866559;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cLXgodAGXBj+v2zu9ZxU3lUOFEwsOiyp9aYqfTOHlKM=;
 b=C2SGid1AfLkzJuKkqR6CHoyKHN5woUwomGPK+EdaevJ/KhChIKcExoE5U20soVA/Fa
 KzvQzEq2DmPIxuGF9RtPuWE+z0XVKTxvNXWI0IBeiZX13tVZ9Sxk8OVUcFXgkMh7YCNs
 6u7gabhsQJX+jl8OBt7iT6E/xLHHHT+FufZGEBmYQuhuR5RxHMeDQT7TzHMZ0r9rpZp3
 3EfxHoWE10rrS/k3Zb99MseATajsWgRMvvliIUy/S7a3fA48GditCm+p6jg1kdr4i4Wo
 gLvaflDdV3Dq3oV0BM5swPyExMjRnlJNZLNfjnifmJVQI9xFJkYG/V+b694tseS+cfUO
 laeQ==
X-Gm-Message-State: AC+VfDyYM24MhQ13A3mHFIa7gk9oZnhlngmtvuMIXzdmk2mHmJktPaC0
 g6Be4DEkzG6MXBYkWpPwvHZ6lQ==
X-Google-Smtp-Source: ACHHUZ6dhtS9ZBZ9s1b+tPXU4OrZig7K+lp5+nFi8/F5u1osef5WXmjAEx0UbTQiIozs2WUaLNneRA==
X-Received: by 2002:a5d:4fc1:0:b0:30f:c1ab:a039 with SMTP id
 h1-20020a5d4fc1000000b0030fc1aba039mr8273718wrw.40.1687274558850; 
 Tue, 20 Jun 2023 08:22:38 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 f1-20020adfdb41000000b0030ae499da59sm2195145wrj.111.2023.06.20.08.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 08:22:38 -0700 (PDT)
Message-ID: <8dcd36274bcf4493abb8d872868af6df12d32c5a.camel@rivosinc.com>
Subject: Re: [PATCH 1/2] target/riscv: Add Zacas ISA extension support
From: Rob Bradford <rbradford@rivosinc.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>
Date: Tue, 20 Jun 2023 16:22:37 +0100
In-Reply-To: <6e6e4cdb-fb24-286c-f493-0cce73f38615@iscas.ac.cn>
References: <20230602121638.36342-1-rbradford@rivosinc.com>
 <20230602121638.36342-2-rbradford@rivosinc.com>
 <6e6e4cdb-fb24-286c-f493-0cce73f38615@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.module_f38+16663+080ec715) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 2023-06-02 at 23:04 +0800, Weiwei Li wrote:
>=20
> On 2023/6/2 20:16, Rob Bradford wrote:
> > This commit adds support for the the amocas.{w,d,q} instructions
> > behind
> > a new property to enable that instruction.
> >=20
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
>=20
> I also implemented an initial version for this extension without any=20
> tests a few days ago.
>=20
> You can find it in
> https://github.com/plctlab/plct-qemu/tree/plct-zacas-dev.

Hi, thank you for sharing this! Sorry for the delay in response. I had
a chance to test your version and found a small issue with the .Q
implementation when I tested it.

Here is the fix:

diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc
b/target/riscv/insn_trans/trans_rvzacas.c.inc
index c063079c6a..e556f48da8 100644
--- a/target/riscv/insn_trans/trans_rvzacas.c.inc
+++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
@@ -129,11 +129,12 @@ static bool trans_amocas_q(DisasContext *ctx,
arg_amocas_q *a)
     TCGv_i128 src2 =3D tcg_temp_new_i128();
     TCGv_i64 src2l =3D get_gpr(ctx, a->rs2, EXT_NONE);
     TCGv_i64 src2h =3D get_gpr(ctx, a->rs2 =3D=3D 0 ? 0 : a->rs2 + 1,
EXT_NONE);
-    TCGv_i64 destl =3D get_gpr(ctx, a->rs2, EXT_NONE);
-    TCGv_i64 desth =3D get_gpr(ctx, a->rs2 =3D=3D 0 ? 0 : a->rs2 + 1,
EXT_NONE);
+    TCGv_i64 destl =3D get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv_i64 desth =3D get_gpr(ctx, a->rd =3D=3D 0 ? 0 : a->rd + 1,
EXT_NONE);
    =20
     tcg_gen_concat_i64_i128(src2, src2l, src2h);
     tcg_gen_concat_i64_i128(dest, destl, desth);
+    decode_save_opc(ctx);
     tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx,
                                 (MO_ALIGN | MO_TEUO));

Since you already have an implementation ready i'm happy for your
version to be the one included.

>=20
> Hope it can help you.
>=20
> > =C2=A0 target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 target/riscv/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 target/riscv/insn32.decode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 5 +
> > =C2=A0 target/riscv/insn_trans/trans_rvzacas.c.inc | 146
> > ++++++++++++++++++++
> > =C2=A0 target/riscv/translate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> > =C2=A0 5 files changed, 157 insertions(+)
> > =C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvzacas.c.inc
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index db0875fb43..e99833eb4a 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -82,6 +82,7 @@ static const struct isa_ext_data isa_edata_arr[]
> > =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1=
_10_0, ext_icsr),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSIO=
N_1_10_0,
> > ext_ifencei),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VER=
SION_1_10_0,
> > ext_zihintpause),
> > +=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_=
zacas),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1=
_12_0, ext_zawrs),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_1=
1_0, ext_zfh),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zfhmin, PRIV_VERSION_=
1_11_0, ext_zfhmin),
> > @@ -1604,6 +1605,9 @@ static Property riscv_cpu_extensions[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg=
.ext_zvfh, false),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, =
cfg.ext_zvfhmin,
> > false),
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0 /* Atomic CAS (Zacas) */
> > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("x-zacas", RISCVCPU, cfg.ext_zacas=
, false),
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
> > =C2=A0 };
> > =C2=A0=20
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index de7e43126a..ac4d9e8e9c 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -436,6 +436,7 @@ struct RISCVCPUConfig {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_smaia;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_ssaia;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool ext_sscofpmf;
> > +=C2=A0=C2=A0=C2=A0 bool ext_zacas;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool rvv_ta_all_1s;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool rvv_ma_all_1s;
> > =C2=A0=20
> > diff --git a/target/riscv/insn32.decode
> > b/target/riscv/insn32.decode
> > index 73d5d1b045..97d17ee520 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -255,6 +255,11 @@ amomax_d=C2=A0=C2=A0 10100 . . ..... ..... 011 ...=
..
> > 0101111 @atom_st
> > =C2=A0 amominu_d=C2=A0 11000 . . ..... ..... 011 ..... 0101111 @atom_st
> > =C2=A0 amomaxu_d=C2=A0 11100 . . ..... ..... 011 ..... 0101111 @atom_st
> > =C2=A0=20
> > +# *** Zacas Extension
> > +amocas_w=C2=A0=C2=A0 00101 . . ..... ..... 010 ..... 0101111 @atom_st
> > +amocas_d=C2=A0=C2=A0 00101 . . ..... ..... 011 ..... 0101111 @atom_st
> > +amocas_q=C2=A0=C2=A0 00101 . . ..... ..... 100 ..... 0101111 @atom_st
> > +
> > =C2=A0 # *** RV32F Standard Extension ***
> > =C2=A0 flw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ............=C2=A0=
=C2=A0 ..... 010 ..... 0000111 @i
> > =C2=A0 fsw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .......=C2=A0 ....=
. ..... 010 ..... 0100111 @s
> > diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc
> > b/target/riscv/insn_trans/trans_rvzacas.c.inc
> > new file mode 100644
> > index 0000000000..3f1b58ee8a
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
> > @@ -0,0 +1,146 @@
> > +/*
> > + * RISC-V translation routines for Zacas extension
> > + *
> > + * Copyright (c) 2023 Rivos Inc
> > + *
> > + * This program is free software; you can redistribute it and/or
> > modify it
> > + * under the terms and conditions of the GNU General Public
> > License,
> > + * version 2 or later, as published by the Free Software
> > Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> > WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of
> > MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public
> > License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public
> > License along with
> > + * this program.=C2=A0 If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#define REQUIRE_ZACAS(ctx) do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if (!ctx->cfg_ptr->ext_zacas) {=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +} while (0)
> > +
> > +static bool amocas_tl(DisasContext *ctx, arg_atomic *a, MemOp mop)
> > +{
> > +=C2=A0=C2=A0=C2=A0 TCGv retv =3D dest_gpr(ctx, a->rd);
> > +=C2=A0=C2=A0=C2=A0 TCGv addr =3D get_address(ctx, a->rs1, 0);
> > +=C2=A0=C2=A0=C2=A0 TCGv newv =3D get_gpr(ctx, a->rs2, EXT_ZERO);
> > +=C2=A0=C2=A0=C2=A0 TCGv cmpv =3D get_gpr(ctx, a->rd, EXT_ZERO);
> > +
> > +=C2=A0=C2=A0=C2=A0 decode_save_opc(ctx);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_atomic_cmpxchg_tl(retv, addr, cmpv, newv, c=
tx-
> > >mem_idx, mop);
> > +=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd, retv);
> > +
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +
> > +#if TARGET_LONG_BITS =3D=3D 32
> > +static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +=C2=A0=C2=A0=C2=A0 return amocas_tl(ctx, a, MO_TESL | MO_ALIGN);
> > +}
> > +#else
> > +static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +=C2=A0=C2=A0=C2=A0 ctx->ol =3D MXL_RV32;
> > +=C2=A0=C2=A0=C2=A0 return amocas_tl(ctx, a, MO_TESL | MO_ALIGN);
> > +}
> > +#endif
>=20
> This seems unnecessary to use different trans function for RV32 and
> RV64.
>=20
> tcg_gen_atomic_cmpxchg_tl itself will do the actually cmp and xchg=20
> operation based on size in memop
>=20
> instead of the target long size.

Thank you - I can see from your version how this would work.

>=20
> > +
> > +#if TARGET_LONG_BITS =3D=3D 32
> We commonly use TARGET_RISCV32 instead of TARGET_LONG_BITS in similar
> cases.

Noted - thank you. Richard in another thread also pointed out my
version didn't handle dynamic xlen correctly.


> > +static bool trans_amocas_d(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 retv, newv, cmpv;
> > +=C2=A0=C2=A0=C2=A0 TCGv_i32 cmpv_l, cmpv_h, newv_l, newv_h;
> > +=C2=A0=C2=A0=C2=A0 TCGv addr;
> > +
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (a->rd % 2 =3D=3D 1 || a->rs2 % 2 =3D=3D 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 addr =3D get_address(ctx, a->rs1, 0);
> > +=C2=A0=C2=A0=C2=A0 cmpv_l =3D get_gpr(ctx, a->rd, 0);
> It's better to use EXT_NONE instead of 0 in this and following cases.

Noted!

> > +=C2=A0=C2=A0=C2=A0 cmpv_h =3D a->rd =3D=3D 0 ? get_gpr(ctx, 0, 0) : ge=
t_gpr(ctx, a->rd
> > + 1, 0);
> We can use ctx->zero for get_gpr(ctx, 0, 0) directly here.

Thanks!

> > +=C2=A0=C2=A0=C2=A0 cmpv =3D tcg_temp_new_i64();
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_i32_i64(cmpv, cmpv_l, cmpv_h);
> > +=C2=A0=C2=A0=C2=A0 newv_l =3D get_gpr(ctx, a->rs2, 0);
> > +=C2=A0=C2=A0=C2=A0 newv_h =3D a->rs2 =3D=3D 0 ? get_gpr(ctx, 0, 0) : g=
et_gpr(ctx, a-
> > >rs2 + 1, 0);
> > +=C2=A0=C2=A0=C2=A0 newv =3D tcg_temp_new_i64();
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_i32_i64(newv, newv_l, newv_h);
> > +=C2=A0=C2=A0=C2=A0 retv =3D tcg_temp_new_i64();
> > +
> > +=C2=A0=C2=A0=C2=A0 decode_save_opc(ctx);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_atomic_cmpxchg_i64(retv, addr, cmpv, newv, =
ctx-
> > >mem_idx,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MO_TESQ | MO_ALIGN);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (a->rd !=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TCGv_i32 retv_l =3D tcg_tem=
p_new_i32();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TCGv_i32 retv_h =3D tcg_tem=
p_new_i32();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_gen_extr_i64_i32(retv_l=
, retv_h, retv);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd, ret=
v_l);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd + 1,=
 retv_h);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +#else
> > +static bool trans_amocas_d(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> This seems not correct.=C2=A0 amocas_d can work on RV32, so I think it ca=
n
> also work on RV64 with xl =3D 32
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +=C2=A0=C2=A0=C2=A0 return amocas_tl(ctx, a, MO_TESQ | MO_ALIGN);
> > +}
> > +#endif
> > +
> > +#if TARGET_LONG_BITS =3D=3D 32
> > +static bool trans_amocas_q(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return false;
> > +}
>=20
> This case is unnecessary.
>=20
> We can just add REQUIRE_64BIT(ctx) in following trans_amocas_q
>=20

Thank you for the review - this was my first TCG patch and i've learnt
a lot from that.

Cheers,

Rob

> > +#else
> > +static bool trans_amocas_q(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 TCGv_i128 retv, newv, cmpv;
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 cmpv_l, cmpv_h, newv_l, newv_h;
> > +=C2=A0=C2=A0=C2=A0 TCGv addr;
> > +
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (a->rd % 2 =3D=3D 1 || a->rs2 % 2 =3D=3D 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 addr =3D get_address(ctx, a->rs1, 0);
> > +=C2=A0=C2=A0=C2=A0 cmpv_l =3D get_gpr(ctx, a->rd, 0);
> > +=C2=A0=C2=A0=C2=A0 cmpv_h =3D a->rd =3D=3D 0 ? get_gpr(ctx, 0, 0) : ge=
t_gpr(ctx, a->rd
> > + 1, 0);
> > +=C2=A0=C2=A0=C2=A0 cmpv =3D tcg_temp_new_i128();
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_i64_i128(cmpv, cmpv_l, cmpv_h);
> > +=C2=A0=C2=A0=C2=A0 newv_l =3D get_gpr(ctx, a->rs2, 0);
> > +=C2=A0=C2=A0=C2=A0 newv_h =3D a->rs2 =3D=3D 0 ? get_gpr(ctx, 0, 0) : g=
et_gpr(ctx, a-
> > >rs2 + 1, 0);
> > +=C2=A0=C2=A0=C2=A0 newv =3D tcg_temp_new_i128();
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_i64_i128(newv, newv_l, newv_h);
> > +=C2=A0=C2=A0=C2=A0 retv =3D tcg_temp_new_i128();
> > +
> > +=C2=A0=C2=A0=C2=A0 decode_save_opc(ctx);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_atomic_cmpxchg_i128(retv, addr, cmpv, newv,=
 ctx-
> > >mem_idx,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MO_TEUO | MO_ALIGN);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (a->rd !=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TCGv_i64 retv_l =3D tcg_tem=
p_new_i64();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TCGv_i64 retv_h =3D tcg_tem=
p_new_i64();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_gen_extr_i128_i64(retv_=
l, retv_h, retv);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd, ret=
v_l);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd + 1,=
 retv_h);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +#endif
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 928da0d3f0..55438f5ebf 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1074,6 +1074,7 @@ static uint32_t opcode_at(DisasContextBase
> > *dcbase, target_ulong pc)
> > =C2=A0 #include "insn_trans/trans_rvv.c.inc"
> > =C2=A0 #include "insn_trans/trans_rvb.c.inc"
> > =C2=A0 #include "insn_trans/trans_rvzicond.c.inc"
> > +#include "insn_trans/trans_rvzacas.c.inc"
> > =C2=A0 #include "insn_trans/trans_rvzawrs.c.inc"
> > =C2=A0 #include "insn_trans/trans_rvzicbo.c.inc"
> > =C2=A0 #include "insn_trans/trans_rvzfh.c.inc"
>=20


