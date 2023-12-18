Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BECC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 15:02:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFF8P-0000lc-UF; Mon, 18 Dec 2023 10:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rFF8N-0000lF-Ov
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:02:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rFF8I-0006wq-QV
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 10:02:19 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so34928345e9.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702911733; x=1703516533;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LvD0DE9NlH/SmgXeqH0Q/2qmdV37fOcKxpbG3fK4nVc=;
 b=MyYkPaBscLXzVpPt4j7X11vOl5gUZNnYVANJUweREVetW4PyZHUnaQDIXu+VBDDthM
 e7NoYweeBmXkVwM2CeC0DT/o2IKeh0neqSsg/L/xFiJdj1y5t1ameJpPQU1Nb225pDRQ
 Mu0veNyHZsw8al69/x9NWt9xaGC0yht3o+rX4bn8fNK5fM/ymSC9Xf1RPBywNfE6z0aR
 GHKiD9WVng1zEh0eLRwG88VtUUCgEHycdiWNzVEkvAZFPnLZmCnBE0LRJvca+53KCKBS
 +VoF4/kxb87aFELU2I3uRzlVaURk7mJUokDcQ/fgBaznkHUx7b5RJ6KhZ5Kybp/QpgK3
 eL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911733; x=1703516533;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LvD0DE9NlH/SmgXeqH0Q/2qmdV37fOcKxpbG3fK4nVc=;
 b=cWFePenbaAWaVWLJ3mQPlh35UKAUcpIPAt/YEn6b4uZQzwsuKd03DGNzN+OpTb4j1o
 i1yqUHQNL0vykWN35wQShrW0SpJLedGJMSXr2EpAJExLeDQTeHXvXH+jvTyzqGVOEKp9
 vvRA2iJkrjQgFfoXnGKScd0D57s02agQorvUpd61s6QZeaWZaAQnAB5WOOmkVio2HGqM
 +TbggJ7Dpq0bP+FGQB1kDku7Zzzm89R+4JSBzZg1uDZdq1LAkSWca5B7eWYQtSAVZHP1
 IomCOdiTJNATwtT9IMos1Hgq19QkE1BsnXyWC6G12YirPAEzbk3HwLO5prsswX55Vz0t
 Eklg==
X-Gm-Message-State: AOJu0YxTiCWgGMQrCDeIL5whKDTk1E+xT3IwlLb/dmHuaXlu9dxWGTwx
 cbeU4xACuU1wZWvk0kuFkL2Mgw==
X-Google-Smtp-Source: AGHT+IGgKeXSafwYpc//bz06c68INJZUBxklMCDfA599ru96/d9YbJcqkmTlrIEPC8agg8LcRyPSAQ==
X-Received: by 2002:a1c:6a0a:0:b0:40c:2c40:8c with SMTP id
 f10-20020a1c6a0a000000b0040c2c40008cmr8656554wmc.154.1702911732460; 
 Mon, 18 Dec 2023 07:02:12 -0800 (PST)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b0040596352951sm45141923wmb.5.2023.12.18.07.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:02:12 -0800 (PST)
Message-ID: <4fe52c34042a219b3fe0140e6ce28578857ddb1a.camel@rivosinc.com>
Subject: Re: [PATCH 1/2] target/riscv: Add support for Zacas extension
From: Rob Bradford <rbradford@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,  Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang
 Wang <wangjunqiang@iscas.ac.cn>
Date: Mon, 18 Dec 2023 15:02:11 +0000
In-Reply-To: <CAKmqyKN50b9RAqfrMoe9_vZB1PfML+7K7u4=jeSE1Na6PPD3NA@mail.gmail.com>
References: <20231207153842.32401-1-rbradford@rivosinc.com>
 <20231207153842.32401-2-rbradford@rivosinc.com>
 <CAKmqyKN50b9RAqfrMoe9_vZB1PfML+7K7u4=jeSE1Na6PPD3NA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32f.google.com
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

Hi Alistair,

Thanks for providing some feedback - responses below:

On Mon, 2023-12-18 at 12:54 +1000, Alistair Francis wrote:
> On Fri, Dec 8, 2023 at 1:40=E2=80=AFAM Rob Bradford <rbradford@rivosinc.c=
om>
> wrote:
> >=20
> > From: Weiwei Li <liweiwei@iscas.ac.cn>
> >=20
> > Add support for amocas.w/d/q instructions which are part of the
> > ratified
> > Zacas extension: https://github.com/riscv/riscv-zacas
> >=20
> > Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> > =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0target/riscv/cpu_cfg.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0target/riscv/insn32.decode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 6 +
> > =C2=A0target/riscv/insn_trans/trans_rvzacas.c.inc | 150
> > ++++++++++++++++++++
> > =C2=A0target/riscv/tcg/tcg-cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +
> > =C2=A0target/riscv/translate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> > =C2=A06 files changed, 165 insertions(+)
> > =C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzacas.c.inc
> >=20
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 83c7c0cf07..a265833b17 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -87,6 +87,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1=
_10_0,
> > ext_zihintpause),
> > =C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0,=
 ext_zihpm),
> > =C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0,=
 ext_zmmul),
> > +=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_=
zacas),
> > =C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0,=
 ext_zawrs),
> > =C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, e=
xt_zfa),
> > =C2=A0=C2=A0=C2=A0=C2=A0 ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_=
0, ext_zfbfmin),
> > @@ -1300,6 +1301,7 @@ const RISCVCPUMultiExtConfig
> > riscv_cpu_extensions[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
> > =C2=A0=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl,=
 true),
> > =C2=A0=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpa=
use, true),
> > +=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zacas", ext_zacas, false),
> > =C2=A0=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
> > =C2=A0=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
> > =C2=A0=C2=A0=C2=A0=C2=A0 MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index f4605fb190..d516de4a44 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -77,6 +77,7 @@ struct RISCVCPUConfig {
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_svnapot;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_svpbmt;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zdinx;
> > +=C2=A0=C2=A0=C2=A0 bool ext_zacas;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zawrs;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfa;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfbfmin;
> > diff --git a/target/riscv/insn32.decode
> > b/target/riscv/insn32.decode
> > index 33597fe2bb..f22df04cfd 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -1004,3 +1004,9 @@ vgmul_vv=C2=A0=C2=A0=C2=A0 101000 1 ..... 10001 0=
10 .....
> > 1110111 @r2_vm_1
> > =C2=A0vsm4k_vi=C2=A0=C2=A0=C2=A0 100001 1 ..... ..... 010 ..... 1110111=
 @r_vm_1
> > =C2=A0vsm4r_vv=C2=A0=C2=A0=C2=A0 101000 1 ..... 10000 010 ..... 1110111=
 @r2_vm_1
> > =C2=A0vsm4r_vs=C2=A0=C2=A0=C2=A0 101001 1 ..... 10000 010 ..... 1110111=
 @r2_vm_1
> > +
> > +# *** RV32 Zacas Standard Extension ***
> > +amocas_w=C2=A0=C2=A0=C2=A0 00101 . . ..... ..... 010 ..... 0101111 @at=
om_st
> > +amocas_d=C2=A0=C2=A0=C2=A0 00101 . . ..... ..... 011 ..... 0101111 @at=
om_st
> > +# *** RV64 Zacas Standard Extension ***
> > +amocas_q=C2=A0=C2=A0=C2=A0 00101 . . ..... ..... 100 ..... 0101111 @at=
om_st
> > diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc
> > b/target/riscv/insn_trans/trans_rvzacas.c.inc
> > new file mode 100644
> > index 0000000000..5d274d4c08
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
> > @@ -0,0 +1,150 @@
> > +/*
> > + * RISC-V translation routines for the RV64 Zacas Standard
> > Extension.
> > + *
> > + * Copyright (c) 2020-2023 PLCT Lab
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
=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if (!ctx->cfg_ptr->ext_zacas) {=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +} while (0)
> > +
> > +static bool gen_cmpxchg(DisasContext *ctx, arg_atomic *a, MemOp
> > mop)
> > +{
> > +=C2=A0=C2=A0=C2=A0 TCGv dest =3D get_gpr(ctx, a->rd, EXT_NONE);
> > +=C2=A0=C2=A0=C2=A0 TCGv src1 =3D get_address(ctx, a->rs1, 0);
> > +=C2=A0=C2=A0=C2=A0 TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> > +
> > +=C2=A0=C2=A0=C2=A0 decode_save_opc(ctx);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_atomic_cmpxchg_tl(dest, src1, dest, src2, c=
tx-
> > >mem_idx, mop);
> > +
> > +=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd, dest);
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +
> > +static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +=C2=A0=C2=A0=C2=A0 return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TESL);
> > +}
> > +
> > +static TCGv_i64 get_gpr_pair(DisasContext *ctx, int reg_num)
> > +{
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 t;
> > +
> > +=C2=A0=C2=A0=C2=A0 assert(get_ol(ctx) =3D=3D MXL_RV32);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (reg_num =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return tcg_constant_i64(0);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 t =3D tcg_temp_new_i64();
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[=
reg_num +
> > 1]);
> > +=C2=A0=C2=A0=C2=A0 return t;
> > +}
> > +
> > +static void gen_set_gpr_pair(DisasContext *ctx, int reg_num,
> > TCGv_i64 t)
> > +{
> > +=C2=A0=C2=A0=C2=A0 assert(get_ol(ctx) =3D=3D MXL_RV32);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (reg_num !=3D 0) {
> > +#ifdef TARGET_RISCV32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_gen_extr_i64_i32(cpu_gp=
r[reg_num], cpu_gpr[reg_num +
> > 1], t);
> > +#else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_gen_ext32s_i64(cpu_gpr[=
reg_num], t);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_gen_sari_i64(cpu_gpr[re=
g_num + 1], t, 32);
> > +#endif
>=20
> This should be dynamic based on the MXL.
>=20

This function is already conditional on MXL =3D 32 as it us only called
from trans_amocas_d() when get_ol() =3D=3D MXL_RV32 (there is an assertion
at the top to enforce this.) The compile time conditional code is
required as the cpu_gpr type (TCGv) changes between TCGv_i32 or
TCGv_i64 at build time - requiring different functions to be called to
split the value and assign to registers.

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_xl_max(ctx) =3D=3D =
MXL_RV128) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg=
_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num],
> > 63);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg=
_gen_sari_tl(cpu_gprh[reg_num + 1], cpu_gpr[reg_num
> > + 1], 63);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +static bool gen_cmpxchg64(DisasContext *ctx, arg_atomic *a, MemOp
> > mop)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Encodings with odd numbered registers speci=
fied in rs2 and
> > rd are
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * reserved.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 if ((a->rs2 | a->rd) & 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 dest =3D get_gpr_pair(ctx, a->rd);
> > +=C2=A0=C2=A0=C2=A0 TCGv src1 =3D get_address(ctx, a->rs1, 0);
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 src2 =3D get_gpr_pair(ctx, a->rs2);
> > +
> > +=C2=A0=C2=A0=C2=A0 decode_save_opc(ctx);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_atomic_cmpxchg_i64(dest, src1, dest, src2, =
ctx-
> > >mem_idx, mop);
> > +
> > +=C2=A0=C2=A0=C2=A0 gen_set_gpr_pair(ctx, a->rd, dest);
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > +
> > +static bool trans_amocas_d(DisasContext *ctx, arg_amocas_d *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +=C2=A0=C2=A0=C2=A0 switch (get_ol(ctx)) {
> > +=C2=A0=C2=A0=C2=A0 case MXL_RV32:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_cmpxchg64(ctx, a=
, MO_ALIGN | MO_TEUQ);
> > +=C2=A0=C2=A0=C2=A0 case MXL_RV64:
> > +=C2=A0=C2=A0=C2=A0 case MXL_RV128:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gen_cmpxchg(ctx, a, =
MO_ALIGN | MO_TEUQ);
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_assert_not_reached();
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +static bool trans_amocas_q(DisasContext *ctx, arg_amocas_q *a)
> > +{
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_ZACAS(ctx);
> > +=C2=A0=C2=A0=C2=A0 REQUIRE_64BIT(ctx);
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Encodings with odd numbered registers speci=
fied in rs2 and
> > rd are
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * reserved.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 if ((a->rs2 | a->rd) & 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +#ifdef TARGET_RISCV64
>=20
> We already have a REQUIRE_64BIT(ctx), do we need this as well?
>=20

Unfortunately yes, because when compiling under TARGET_RISCV32 there is
a type mismatch error from the get_gpr() method - similar to the
requirement to have two paths in the gen_cmpxchg64() function: e.g. to
concatenate the two TGV_i64 to a TGV_i128 the datatype from get_gpr()
must be TGV_i64.

The REQUIRE_6BIT() provides the necessary check at runtime to check
that we are running with MXL =3D 64.

Cheers,

Rob

> Alistair
>=20
> > +=C2=A0=C2=A0=C2=A0 TCGv_i128 dest =3D tcg_temp_new_i128();
> > +=C2=A0=C2=A0=C2=A0 TCGv src1 =3D get_address(ctx, a->rs1, 0);
> > +=C2=A0=C2=A0=C2=A0 TCGv_i128 src2 =3D tcg_temp_new_i128();
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 src2l =3D get_gpr(ctx, a->rs2, EXT_NONE);
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 src2h =3D get_gpr(ctx, a->rs2 =3D=3D 0 ? 0=
 : a->rs2 + 1,
> > EXT_NONE);
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 destl =3D get_gpr(ctx, a->rd, EXT_NONE);
> > +=C2=A0=C2=A0=C2=A0 TCGv_i64 desth =3D get_gpr(ctx, a->rd =3D=3D 0 ? 0 =
: a->rd + 1,
> > EXT_NONE);
> > +
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_i64_i128(src2, src2l, src2h);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_concat_i64_i128(dest, destl, desth);
> > +=C2=A0=C2=A0=C2=A0 decode_save_opc(ctx);
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2,=
 ctx-
> > >mem_idx,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (MO_ALIGN | MO_TEUO));
> > +
> > +=C2=A0=C2=A0=C2=A0 tcg_gen_extr_i128_i64(destl, desth, dest);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (a->rd !=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd, des=
tl);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_set_gpr(ctx, a->rd + 1,=
 desth);
> > +=C2=A0=C2=A0=C2=A0 }
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return true;
> > +}
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-
> > cpu.c
> > index 8a35683a34..29b5a88931 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -343,6 +343,11 @@ void
> > riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > +=C2=A0=C2=A0=C2=A0 if ((cpu->cfg.ext_zacas) && !riscv_has_ext(env, RVA=
)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zacas ext=
ension requires A extension");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ((cpu->cfg.ext_zawrs) && !riscv_has_ext(env=
, RVA)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zawr=
s extension requires A extension");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index f0be79bb16..071fbad7ef 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1089,6 +1089,7 @@ static uint32_t opcode_at(DisasContextBase
> > *dcbase, target_ulong pc)
> > =C2=A0#include "insn_trans/trans_rvv.c.inc"
> > =C2=A0#include "insn_trans/trans_rvb.c.inc"
> > =C2=A0#include "insn_trans/trans_rvzicond.c.inc"
> > +#include "insn_trans/trans_rvzacas.c.inc"
> > =C2=A0#include "insn_trans/trans_rvzawrs.c.inc"
> > =C2=A0#include "insn_trans/trans_rvzicbo.c.inc"
> > =C2=A0#include "insn_trans/trans_rvzfa.c.inc"
> > --
> > 2.43.0
> >=20
> >=20


