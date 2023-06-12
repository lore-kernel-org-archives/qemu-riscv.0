Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13146C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:41:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YQG-0003WE-HX; Sun, 11 Jun 2023 23:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YQE-0003Vq-IZ; Sun, 11 Jun 2023 23:40:50 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YQ8-0001GU-KI; Sun, 11 Jun 2023 23:40:47 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-463992996d2so1021133e0c.2; 
 Sun, 11 Jun 2023 20:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686541243; x=1689133243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9Wt95JrlLqBxfyd7yqP+VcabIHjbY6udXe6lFl/DEk=;
 b=j92frVJt/Lln+5PlWuvfvBU9yvTQQLCrfRe6BrTeO0/428VW2yralnMYD+jFCRNp0Q
 W+BVMPX9hxpLVWVRQqkFvSFUdF2Grp2h5KO6RE5+hvDWb7BwmR/N1zAecr3WjrytHu//
 rnQCoYWkU8/nH+92enF7gcE38FDEMTjF4gwUegO+Hsd52B3nLYNicqJ66RlS3JMi99q6
 S2D6nhDfZJe07BQ/VVOxYJ7/yLn4dourQjF3NCi4DAt429ZMXkFFjLRZ78AoQx1mlqRg
 TOwgBgpGWveEFr4oTq3y/qTGQNJP+BDrIFhP9+f6N3Of+iN+23mgixW2DyOAzsACNejK
 xFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686541243; x=1689133243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9Wt95JrlLqBxfyd7yqP+VcabIHjbY6udXe6lFl/DEk=;
 b=HrAEG5MH3q6sfgyKFo69P6b+bwzW3MnlGChtPYbRJGTWyN/kIkaJ94J+vDim6q4ww6
 6RxiAeMwJJFcZpGWrZeAJvUJy7KoU2QtKny8i/nYwymqN4D7ekWtFSkSGWXnYqPo9jdC
 gcJ1TevAPPXgSUFeBTjGN9qGAYpZqA0YenNNzV/l86L62p4WTRmtOBRmHe4KuLT7aDKS
 sZZFOwGxC2n/GMvj4xUezawFLWZaxfJ/U9mNUjHb2PrQQRHMUtCxJioCe/s5NBa6Ikaf
 exVcBb95bAY917GS7TEY82z57IhOnsy7aWqYxm6QMCOsYlzLSUPS4UIlnjFByFsyW97D
 MHeA==
X-Gm-Message-State: AC+VfDz2k1aLm9v6N2oGvIMRdhhpLC85+HHyWsaiprySdu5QdTRP3s3a
 MJyjMIBWA1Sq3oVlqFnnNzSD6oPQUttAmKOZJac=
X-Google-Smtp-Source: ACHHUZ6oqd4F6GV+Eag1AUGFrJJveoJC/XQOfYPpvdT+VpT+0GPkuWQVkKWlbgDQy82JyXdQI8DlhrAoaQS7UBAQqjo=
X-Received: by 2002:a1f:604c:0:b0:453:4cf2:780f with SMTP id
 u73-20020a1f604c000000b004534cf2780fmr2922760vkb.3.1686541242892; Sun, 11 Jun
 2023 20:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-10-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-10-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:40:16 +1000
Message-ID: <CAKmqyKM-XF4_LrFEu+21UXRAkHPLkfLxu7q2UW744HXvRTAaag@mail.gmail.com>
Subject: Re: [PATCH 9/9] disas/riscv: Add support for XThead* instructions
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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

On Tue, May 30, 2023 at 11:21=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> Support for emulating XThead* instruction has been added recently.
> This patch adds support for these instructions to the RISC-V disassembler=
.
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/meson.build         |   1 +
>  disas/riscv-xthead.c      | 707 ++++++++++++++++++++++++++++++++++++++
>  disas/riscv-xthead.h      |  28 ++
>  disas/riscv.c             |  69 ++++
>  disas/riscv.h             |  12 +
>  target/riscv/cpu-config.h |  11 +
>  6 files changed, 828 insertions(+)
>  create mode 100644 disas/riscv-xthead.c
>  create mode 100644 disas/riscv-xthead.h
>
> diff --git a/disas/meson.build b/disas/meson.build
> index e0ee326411..8f64e378f9 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -8,6 +8,7 @@ common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mi=
ps.c', 'nanomips.c'))
>  common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
>  common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files(
>      'riscv.c',
> +    'riscv-xthead.c',
>      'riscv-xventana.c'
>  ))
>  common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
> diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
> new file mode 100644
> index 0000000000..99da679d16
> --- /dev/null
> +++ b/disas/riscv-xthead.c
> @@ -0,0 +1,707 @@
> +/*
> + * QEMU RISC-V Disassembler for xthead.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "disas/riscv.h"
> +#include "disas/riscv-xthead.h"
> +
> +typedef enum {
> +    /* 0 is reserved for rv_op_illegal. */
> +    /* XTheadBa */
> +    rv_op_th_addsl =3D 1,
> +    /* XTheadBb */
> +    rv_op_th_srri,
> +    rv_op_th_srriw,
> +    rv_op_th_ext,
> +    rv_op_th_extu,
> +    rv_op_th_ff0,
> +    rv_op_th_ff1,
> +    rv_op_th_rev,
> +    rv_op_th_revw,
> +    rv_op_th_tstnbz,
> +    /* XTheadBs */
> +    rv_op_th_tst,
> +    /* XTheadCmo */
> +    rv_op_th_dcache_call,
> +    rv_op_th_dcache_ciall,
> +    rv_op_th_dcache_iall,
> +    rv_op_th_dcache_cpa,
> +    rv_op_th_dcache_cipa,
> +    rv_op_th_dcache_ipa,
> +    rv_op_th_dcache_cva,
> +    rv_op_th_dcache_civa,
> +    rv_op_th_dcache_iva,
> +    rv_op_th_dcache_csw,
> +    rv_op_th_dcache_cisw,
> +    rv_op_th_dcache_isw,
> +    rv_op_th_dcache_cpal1,
> +    rv_op_th_dcache_cval1,
> +    rv_op_th_icache_iall,
> +    rv_op_th_icache_ialls,
> +    rv_op_th_icache_ipa,
> +    rv_op_th_icache_iva,
> +    rv_op_th_l2cache_call,
> +    rv_op_th_l2cache_ciall,
> +    rv_op_th_l2cache_iall,
> +    /* XTheadCondMov */
> +    rv_op_th_mveqz,
> +    rv_op_th_mvnez,
> +    /* XTheadFMemIdx */
> +    rv_op_th_flrd,
> +    rv_op_th_flrw,
> +    rv_op_th_flurd,
> +    rv_op_th_flurw,
> +    rv_op_th_fsrd,
> +    rv_op_th_fsrw,
> +    rv_op_th_fsurd,
> +    rv_op_th_fsurw,
> +    /* XTheadFmv */
> +    rv_op_th_fmv_hw_x,
> +    rv_op_th_fmv_x_hw,
> +    /* XTheadMac */
> +    rv_op_th_mula,
> +    rv_op_th_mulah,
> +    rv_op_th_mulaw,
> +    rv_op_th_muls,
> +    rv_op_th_mulsw,
> +    rv_op_th_mulsh,
> +    /* XTheadMemIdx */
> +    rv_op_th_lbia,
> +    rv_op_th_lbib,
> +    rv_op_th_lbuia,
> +    rv_op_th_lbuib,
> +    rv_op_th_lhia,
> +    rv_op_th_lhib,
> +    rv_op_th_lhuia,
> +    rv_op_th_lhuib,
> +    rv_op_th_lwia,
> +    rv_op_th_lwib,
> +    rv_op_th_lwuia,
> +    rv_op_th_lwuib,
> +    rv_op_th_ldia,
> +    rv_op_th_ldib,
> +    rv_op_th_sbia,
> +    rv_op_th_sbib,
> +    rv_op_th_shia,
> +    rv_op_th_shib,
> +    rv_op_th_swia,
> +    rv_op_th_swib,
> +    rv_op_th_sdia,
> +    rv_op_th_sdib,
> +    rv_op_th_lrb,
> +    rv_op_th_lrbu,
> +    rv_op_th_lrh,
> +    rv_op_th_lrhu,
> +    rv_op_th_lrw,
> +    rv_op_th_lrwu,
> +    rv_op_th_lrd,
> +    rv_op_th_srb,
> +    rv_op_th_srh,
> +    rv_op_th_srw,
> +    rv_op_th_srd,
> +    rv_op_th_lurb,
> +    rv_op_th_lurbu,
> +    rv_op_th_lurh,
> +    rv_op_th_lurhu,
> +    rv_op_th_lurw,
> +    rv_op_th_lurwu,
> +    rv_op_th_lurd,
> +    rv_op_th_surb,
> +    rv_op_th_surh,
> +    rv_op_th_surw,
> +    rv_op_th_surd,
> +    /* XTheadMemPair */
> +    rv_op_th_ldd,
> +    rv_op_th_lwd,
> +    rv_op_th_lwud,
> +    rv_op_th_sdd,
> +    rv_op_th_swd,
> +    /* XTheadSync */
> +    rv_op_th_sfence_vmas,
> +    rv_op_th_sync,
> +    rv_op_th_sync_i,
> +    rv_op_th_sync_is,
> +    rv_op_th_sync_s,
> +} rv_xthead_op;
> +
> +const rv_opcode_data xthead_opcode_data[] =3D {
> +    { "th.illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
> +    /* XTheadBa */
> +    { "th.addsl", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    /* XTheadBb */
> +    { "th.srri", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "th.srriw", rv_codec_r2_imm5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "th.ext", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0, =
0 },
> +    { "th.extu", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0,=
 0 },
> +    { "th.ff0", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.ff1", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.rev", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.revw", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "th.tstnbz", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    /* XTheadBs */
> +    { "th.tst", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    /* XTheadCmo */
> +    { "th.dcache.call", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.dcache.ciall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.dcache.iall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.dcache.cpa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.cipa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.ipa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.cva", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.civa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.iva", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.csw", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.cisw", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.isw", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.cpal1", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.dcache.cval1", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.icache.iall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.icache.ialls", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.icache.ipa", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.icache.iva", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
> +    { "th.l2cache.call", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.l2cache.ciall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.l2cache.iall", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    /* XTheadCondMov */
> +    { "th.mveqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mvnez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    /* XTheadFMemIdx */
> +    { "th.flrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.flrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.flurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> +    { "th.flurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> +    { "th.fsrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.fsrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.fsurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> +    { "th.fsurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> +    /* XTheadFmv */
> +    { "th.fmv.hw.x", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
> +    { "th.fmv.x.hw", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
> +    /* XTheadMac */
> +    { "th.mula", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulaw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulah", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.muls", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulsw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.mulsh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    /* XTheadMemIdx */
> +    { "th.lbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.lbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml, NULL, 0=
, 0, 0 },
> +    { "th.lbuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, N=
ULL, 0, 0, 0 },
> +    { "th.lbuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, N=
ULL, 0, 0, 0 },
> +    { "th.lhia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.lhib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.lhuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, N=
ULL, 0, 0, 0 },
> +    { "th.lhuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, N=
ULL, 0, 0, 0 },
> +    { "th.lwia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.lwib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.lwuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, N=
ULL, 0, 0, 0 },
> +    { "th.lwuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, N=
ULL, 0, 0, 0 },
> +    { "th.ldia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.ldib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.sbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.sbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.shia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.shib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.swia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.swib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.sdia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.sdib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, NU=
LL, 0, 0, 0 },
> +    { "th.lrb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.lrh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.lrw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lrwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.lrd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.srd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 },
> +    { "th.lurb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.lurbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.lurh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.lurhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.lurw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.lurwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> +    { "th.lurd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.surb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.surh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.surw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    { "th.surd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 }=
,
> +    /* XTheadMemPair */
> +    { "th.ldd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.lwd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.lwud", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.sdd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    { "th.swd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> +    /* XTheadSync */
> +    { "th.sfence.vmas", rv_codec_r, rv_fmt_rs1_rs2, NULL, 0, 0, 0 },
> +    { "th.sync", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.sync.i", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.sync.is", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "th.sync.s", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
> +};
> +
> +void decode_xtheadba(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 1:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b0000000:
> +                case 0b0000001:
> +                case 0b0000010:
> +                case 0b0000011: op =3D rv_op_th_addsl; break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadbb(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 1:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b0001010: op =3D rv_op_th_srriw; break;
> +                case 0b1000000:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_tstnbz;
> +                    }
> +                    break;
> +                case 0b1000001:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_rev;
> +                    }
> +                    break;
> +                case 0b1000010:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_ff0;
> +                    }
> +                    break;
> +                case 0b1000011:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_ff1;
> +                    }
> +                    break;
> +                case 0b1000100:
> +                case 0b1001000:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_revw;
> +                    }
> +                    break;
> +                case 0b0000100:
> +                case 0b0000101: op =3D rv_op_th_srri; break;
> +                }
> +                break;
> +            case 2: op =3D rv_op_th_ext; break;
> +            case 3: op =3D rv_op_th_extu; break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadbs(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 1:
> +                switch ((inst >> 26) & 0b111111) {
> +                case 0b100010: op =3D rv_op_th_tst; break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadcmo(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 0:
> +                switch ((inst >> 20 & 0b111111111111)) {
> +                case 0b000000000001:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_dcache_call;
> +                    }
> +                    break;
> +                case 0b000000000011:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_dcache_ciall;
> +                    }
> +                    break;
> +                case 0b000000000010:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_dcache_iall;
> +                    }
> +                    break;
> +                case 0b000000101001: op =3D rv_op_th_dcache_cpa; break;
> +                case 0b000000101011: op =3D rv_op_th_dcache_cipa; break;
> +                case 0b000000101010: op =3D rv_op_th_dcache_ipa; break;
> +                case 0b000000100101: op =3D rv_op_th_dcache_cva; break;
> +                case 0b000000100111: op =3D rv_op_th_dcache_civa; break;
> +                case 0b000000100110: op =3D rv_op_th_dcache_iva; break;
> +                case 0b000000100001: op =3D rv_op_th_dcache_csw; break;
> +                case 0b000000100011: op =3D rv_op_th_dcache_cisw; break;
> +                case 0b000000100010: op =3D rv_op_th_dcache_isw; break;
> +                case 0b000000101000: op =3D rv_op_th_dcache_cpal1; break=
;
> +                case 0b000000100100: op =3D rv_op_th_dcache_cval1; break=
;
> +                case 0b000000010000:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_icache_iall;
> +                    }
> +                    break;
> +                case 0b000000010001:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_icache_ialls;
> +                    }
> +                    break;
> +                case 0b000000111000: op =3D rv_op_th_icache_ipa; break;
> +                case 0b000000110000: op =3D rv_op_th_icache_iva; break;
> +                case 0b000000010101:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_l2cache_call;
> +                    }
> +                    break;
> +                case 0b000000010111:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_l2cache_ciall;
> +                    }
> +                    break;
> +                case 0b000000010110:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_l2cache_iall;
> +                    }
> +                    break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadcondmov(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 1:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b0100000: op =3D rv_op_th_mveqz; break;
> +                case 0b0100001: op =3D rv_op_th_mvnez; break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadfmemidx(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 6:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 8: op =3D rv_op_th_flrw; break;
> +                case 10: op =3D rv_op_th_flurw; break;
> +                case 12: op =3D rv_op_th_flrd; break;
> +                case 14: op =3D rv_op_th_flurd; break;
> +                }
> +                break;
> +            case 7:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 8: op =3D rv_op_th_fsrw; break;
> +                case 10: op =3D rv_op_th_fsurw; break;
> +                case 12: op =3D rv_op_th_fsrd; break;
> +                case 14: op =3D rv_op_th_fsurd; break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadfmv(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 1:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b1010000:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_fmv_hw_x;
> +                    }
> +                    break;
> +                case 0b1100000:
> +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                        op =3D rv_op_th_fmv_x_hw;
> +                    }
> +                    break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadmac(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 1:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b0010000: op =3D rv_op_th_mula; break;
> +                case 0b0010001: op =3D rv_op_th_muls; break;
> +                case 0b0010010: op =3D rv_op_th_mulaw; break;
> +                case 0b0010011: op =3D rv_op_th_mulsw; break;
> +                case 0b0010100: op =3D rv_op_th_mulah; break;
> +                case 0b0010101: op =3D rv_op_th_mulsh; break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadmemidx(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 4:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 0: op =3D rv_op_th_lrb; break;
> +                case 1: op =3D rv_op_th_lbib; break;
> +                case 2: op =3D rv_op_th_lurb; break;
> +                case 3: op =3D rv_op_th_lbia; break;
> +                case 4: op =3D rv_op_th_lrh; break;
> +                case 5: op =3D rv_op_th_lhib; break;
> +                case 6: op =3D rv_op_th_lurh; break;
> +                case 7: op =3D rv_op_th_lhia; break;
> +                case 8: op =3D rv_op_th_lrw; break;
> +                case 9: op =3D rv_op_th_lwib; break;
> +                case 10: op =3D rv_op_th_lurw; break;
> +                case 11: op =3D rv_op_th_lwia; break;
> +                case 12: op =3D rv_op_th_lrd; break;
> +                case 13: op =3D rv_op_th_ldib; break;
> +                case 14: op =3D rv_op_th_lurd; break;
> +                case 15: op =3D rv_op_th_ldia; break;
> +                case 16: op =3D rv_op_th_lrbu; break;
> +                case 17: op =3D rv_op_th_lbuib; break;
> +                case 18: op =3D rv_op_th_lurbu; break;
> +                case 19: op =3D rv_op_th_lbuia; break;
> +                case 20: op =3D rv_op_th_lrhu; break;
> +                case 21: op =3D rv_op_th_lhuib; break;
> +                case 22: op =3D rv_op_th_lurhu; break;
> +                case 23: op =3D rv_op_th_lhuia; break;
> +                case 24: op =3D rv_op_th_lrwu; break;
> +                case 25: op =3D rv_op_th_lwuib; break;
> +                case 26: op =3D rv_op_th_lurwu; break;
> +                case 27: op =3D rv_op_th_lwuia; break;
> +                }
> +                break;
> +            case 5:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 0: op =3D rv_op_th_srb; break;
> +                case 1: op =3D rv_op_th_sbib; break;
> +                case 2: op =3D rv_op_th_surb; break;
> +                case 3: op =3D rv_op_th_sbia; break;
> +                case 4: op =3D rv_op_th_srh; break;
> +                case 5: op =3D rv_op_th_shib; break;
> +                case 6: op =3D rv_op_th_surh; break;
> +                case 7: op =3D rv_op_th_shia; break;
> +                case 8: op =3D rv_op_th_srw; break;
> +                case 9: op =3D rv_op_th_swib; break;
> +                case 10: op =3D rv_op_th_surw; break;
> +                case 11: op =3D rv_op_th_swia; break;
> +                case 12: op =3D rv_op_th_srd; break;
> +                case 13: op =3D rv_op_th_sdib; break;
> +                case 14: op =3D rv_op_th_surd; break;
> +                case 15: op =3D rv_op_th_sdia; break;
> +                }
> +                break;
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadmempair(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 4:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 28: op =3D rv_op_th_lwd; break;
> +                case 30: op =3D rv_op_th_lwud; break;
> +                case 31: op =3D rv_op_th_ldd; break;
> +                }
> +                break;
> +            case 5:
> +                switch ((inst >> 27) & 0b11111) {
> +                case 28: op =3D rv_op_th_swd; break;
> +                case 31: op =3D rv_op_th_sdd; break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> +
> +void decode_xtheadsync(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst =3D dec->inst;
> +    rv_opcode op =3D rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 2:
> +            /* custom-0 */
> +            switch ((inst >> 12) & 0b111) {
> +            case 0:
> +                switch ((inst >> 25) & 0b1111111) {
> +                case 0b0000010: op =3D rv_op_th_sfence_vmas; break;
> +                case 0b0000000:
> +                    switch ((inst >> 20) & 0b11111) {
> +                    case 0b11000: op =3D rv_op_th_sync; break;
> +                    case 0b11010: op =3D rv_op_th_sync_i; break;
> +                    case 0b11011: op =3D rv_op_th_sync_is; break;
> +                    case 0b11001: op =3D rv_op_th_sync_s; break;
> +                    }
> +                    break;
> +                }
> +                break;
> +            }
> +            break;
> +            /* custom-0 */
> +        }
> +        break;
> +    }
> +
> +    dec->op =3D op;
> +}
> diff --git a/disas/riscv-xthead.h b/disas/riscv-xthead.h
> new file mode 100644
> index 0000000000..fcd42746e7
> --- /dev/null
> +++ b/disas/riscv-xthead.h
> @@ -0,0 +1,28 @@
> +/*
> + * QEMU disassembler -- RISC-V specific header (xthead*).
> + *
> + * Copyright (c) 2023 VRULL GmbH
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef DISAS_RISCV_XTHEAD_H
> +#define DISAS_RISCV_XTHEAD_H
> +
> +#include "disas/riscv.h"
> +
> +extern const rv_opcode_data xthead_opcode_data[];
> +
> +void decode_xtheadba(rv_decode *, rv_isa);
> +void decode_xtheadbb(rv_decode *, rv_isa);
> +void decode_xtheadbs(rv_decode *, rv_isa);
> +void decode_xtheadcmo(rv_decode *, rv_isa);
> +void decode_xtheadcondmov(rv_decode *, rv_isa);
> +void decode_xtheadfmemidx(rv_decode *, rv_isa);
> +void decode_xtheadfmv(rv_decode *, rv_isa);
> +void decode_xtheadmac(rv_decode *, rv_isa);
> +void decode_xtheadmemidx(rv_decode *, rv_isa);
> +void decode_xtheadmempair(rv_decode *, rv_isa);
> +void decode_xtheadsync(rv_decode *, rv_isa);
> +
> +#endif /* DISAS_RISCV_XTHEAD_H */
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 4f71333c45..b1a30928df 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -18,11 +18,13 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/bitops.h"
>  #include "disas/dis-asm.h"
>  #include "disas/riscv.h"
>  #include "target/riscv/cpu-config.h"
>
>  /* Vendor extensions */
> +#include "disas/riscv-xthead.h"
>  #include "disas/riscv-xventana.h"
>
>  typedef enum {
> @@ -3784,6 +3786,26 @@ static uint32_t operand_zcmp_rlist(rv_inst inst)
>      return ((inst << 56) >> 60);
>  }
>
> +static uint32_t operand_imm6(rv_inst inst)
> +{
> +    return (inst << 38) >> 60;
> +}
> +
> +static uint32_t operand_imm2(rv_inst inst)
> +{
> +    return (inst << 37) >> 62;
> +}
> +
> +static uint32_t operand_immh(rv_inst inst)
> +{
> +    return (inst << 32) >> 58;
> +}
> +
> +static uint32_t operand_imml(rv_inst inst)
> +{
> +    return (inst << 38) >> 58;
> +}
> +
>  static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t=
 spimm)
>  {
>      int xlen_bytes_log2 =3D isa =3D=3D rv64 ? 3 : 2;
> @@ -4148,6 +4170,38 @@ static void decode_inst_operands(rv_decode *dec, r=
v_isa isa)
>      case rv_codec_zcmt_jt:
>          dec->imm =3D operand_tbl_index(inst);
>          break;
> +    case rv_codec_r2_imm5:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs1 =3D operand_rs1(inst);
> +        dec->imm =3D operand_rs2(inst);
> +        break;
> +    case rv_codec_r2:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs1 =3D operand_rs1(inst);
> +        break;
> +    case rv_codec_r2_imm6:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs1 =3D operand_rs1(inst);
> +        dec->imm =3D operand_imm6(inst);
> +        break;
> +    case rv_codec_r_imm2:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs1 =3D operand_rs1(inst);
> +        dec->rs2 =3D operand_rs2(inst);
> +        dec->imm =3D operand_imm2(inst);
> +        break;
> +    case rv_codec_r2_immhl:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs1 =3D operand_rs1(inst);
> +        dec->imm =3D operand_immh(inst);
> +        dec->imm1 =3D operand_imml(inst);
> +        break;
> +    case rv_codec_r2_imm2_imm5:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs1 =3D operand_rs1(inst);
> +        dec->imm =3D sextract32(operand_rs2(inst), 0, 5);
> +        dec->imm1 =3D operand_imm2(inst);
> +        break;
>      };
>  }
>
> @@ -4352,6 +4406,10 @@ static void format_inst(char *buf, size_t buflen, =
size_t tab, rv_decode *dec)
>              snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b111=
11));
>              append(buf, tmp, buflen);
>              break;
> +        case 'j':
> +            snprintf(tmp, sizeof(tmp), "%d", dec->imm1);
> +            append(buf, tmp, buflen);
> +            break;
>          case 'o':
>              snprintf(tmp, sizeof(tmp), "%d", dec->imm);
>              append(buf, tmp, buflen);
> @@ -4617,6 +4675,17 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, =
uint64_t pc, rv_inst inst,
>          void (*decode_func)(rv_decode *, rv_isa);
>      } decoders[] =3D {
>          { always_true_p, rvi_opcode_data, decode_inst_opcode },
> +        { has_xtheadba_p, xthead_opcode_data, decode_xtheadba },
> +        { has_xtheadbb_p, xthead_opcode_data, decode_xtheadbb },
> +        { has_xtheadbs_p, xthead_opcode_data, decode_xtheadbs },
> +        { has_xtheadcmo_p, xthead_opcode_data, decode_xtheadcmo },
> +        { has_xtheadcondmov_p, xthead_opcode_data, decode_xtheadcondmov =
},
> +        { has_xtheadfmemidx_p, xthead_opcode_data, decode_xtheadfmemidx =
},
> +        { has_xtheadfmv_p, xthead_opcode_data, decode_xtheadfmv },
> +        { has_xtheadmac_p, xthead_opcode_data, decode_xtheadmac },
> +        { has_xtheadmemidx_p, xthead_opcode_data, decode_xtheadmemidx },
> +        { has_xtheadmempair_p, xthead_opcode_data, decode_xtheadmempair =
},
> +        { has_xtheadsync_p, xthead_opcode_data, decode_xtheadsync },
>          { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacon=
dops },
>      };
>
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 188f03feeb..f7ece1bb53 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -158,6 +158,12 @@ typedef enum {
>      rv_codec_zcmp_cm_pushpop,
>      rv_codec_zcmp_cm_mv,
>      rv_codec_zcmt_jt,
> +    rv_codec_r2_imm5,
> +    rv_codec_r2,
> +    rv_codec_r2_imm6,
> +    rv_codec_r_imm2,
> +    rv_codec_r2_immhl,
> +    rv_codec_r2_imm2_imm5,
>  } rv_codec;
>
>  /* structures */
> @@ -183,6 +189,7 @@ typedef struct {
>      uint64_t  inst;
>      const rv_opcode_data *opcode_data;
>      int32_t   imm;
> +    int32_t   imm1;
>      uint16_t  op;
>      uint8_t   codec;
>      uint8_t   rd;
> @@ -281,5 +288,10 @@ enum {
>  #define rv_fmt_push_rlist             "O\tx,-i"
>  #define rv_fmt_pop_rlist              "O\tx,i"
>  #define rv_fmt_zcmt_index             "O\ti"
> +#define rv_fmt_rd_rs1_rs2_imm         "O\t0,1,2,i"
> +#define rv_fmt_frd_rs1_rs2_imm        "O\t3,1,2,i"
> +#define rv_fmt_rd_rs1_immh_imml       "O\t0,1,i,j"
> +#define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
> +#define rv_fmt_rd2_imm                "O\t0,2,(1),i"
>
>  #endif /* DISAS_RISCV_H */
> diff --git a/target/riscv/cpu-config.h b/target/riscv/cpu-config.h
> index ca368af0b2..ae7c1a44ff 100644
> --- a/target/riscv/cpu-config.h
> +++ b/target/riscv/cpu-config.h
> @@ -143,6 +143,17 @@ static inline bool has_xthead_p(const RISCVCPUConfig=
 *cfg)
>          return cfg->ext_ ## ext ; \
>      }
>
> +MATERIALISE_EXT_PREDICATE(xtheadba)
> +MATERIALISE_EXT_PREDICATE(xtheadbb)
> +MATERIALISE_EXT_PREDICATE(xtheadbs)
> +MATERIALISE_EXT_PREDICATE(xtheadcmo)
> +MATERIALISE_EXT_PREDICATE(xtheadcondmov)
> +MATERIALISE_EXT_PREDICATE(xtheadfmemidx)
> +MATERIALISE_EXT_PREDICATE(xtheadfmv)
> +MATERIALISE_EXT_PREDICATE(xtheadmac)
> +MATERIALISE_EXT_PREDICATE(xtheadmemidx)
> +MATERIALISE_EXT_PREDICATE(xtheadmempair)
> +MATERIALISE_EXT_PREDICATE(xtheadsync)
>  MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
>
>  #endif /* RISCV_CPU_CONFIG_H */
> --
> 2.40.1
>
>

