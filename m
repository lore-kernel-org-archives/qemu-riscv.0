Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20438C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:23:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Y8r-0005Bl-41; Sun, 11 Jun 2023 23:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Y8o-0005Am-N6; Sun, 11 Jun 2023 23:22:50 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Y8m-0004dF-9O; Sun, 11 Jun 2023 23:22:50 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-463e368a74cso1555271e0c.0; 
 Sun, 11 Jun 2023 20:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686540167; x=1689132167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+QXTiueh7Rqimb9RSqnC0JOFKzvOKlUXgyL1TvY9PA=;
 b=UA9onc5MShNVtc1i7s2StNFz9JC2VOdEd3wW+yv8UZKrHz/btSoFzGN4GQT4XN3A83
 EAL46lR1MRLl8yEqTc9nqVZy01RgYwt72JUSrfopE6SZVjF2woHuklWDfmtnwBVZ7AET
 8TxHOPTx2fKhGjKPZh5o9TxZdrVqzNihhHFKBnn8IEVCVZ6qdmrH/hEWoOqbulwO6LTG
 L0rYJWoUtez0gSN80HUYYRm2hEXnhb1oendVRuME6SYYmqWaYG1Q338mWbRxLlmX5iB5
 gTRsGvkLw/A3R2sM5M3yDOJchiT5YkVLvDUNzZn9rOvsx6uqHwwWG4seJtZ73RlgqvWY
 3VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686540167; x=1689132167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+QXTiueh7Rqimb9RSqnC0JOFKzvOKlUXgyL1TvY9PA=;
 b=JKCDjx56qEVDP2+3mEUvlHr9OBKP5KNGVX+Xz+AFvgBskrntajnp7tKMg+44gUu+/g
 Uesj8I9ry2hu8RRZorKyxPpwcFhuCWtBPOOrFnHPaFKwIphL6NeHflRxJiSGx/XWKF5g
 nZjlWVqQZ3UV+kOsKmxXjPk1yySsyRjeir48Hn9sLMSx6R/s1eipPdH1v9lMh5xlH0Ks
 spcN40Z6AOrUMt0QM2zo+dnNjBdB1yc0nG8mO/SugyRgSvl6GK22FI4sLdHI56UhyKW+
 nwisP24MMtvVYEyaRUQ3UtU8Vm9eOuhLicYtYnPFIpHzG2tCY5g8O+q+/2dScmjatUcM
 2d6Q==
X-Gm-Message-State: AC+VfDxs3jey5lyhDz3hjqQusRqrykLkDYnQEdjB/6K3yxa9tXvbytcZ
 /4w3jvPRO2wNfo3NUwkCpSGUrOP1Juk3Rt/UcsY=
X-Google-Smtp-Source: ACHHUZ4CCOjxO0epezXfNO1caVpDebbzD1m6Ey/V52pnmhwWaw1Ss5KKnNGwWBoyTX3dA9bBfcvjiyV8eSTClWfj2Uo=
X-Received: by 2002:a05:6102:410:b0:439:316a:e1eb with SMTP id
 d16-20020a056102041000b00439316ae1ebmr3748929vsq.32.1686540166647; Sun, 11
 Jun 2023 20:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-4-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-4-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:22:20 +1000
Message-ID: <CAKmqyKNif8pi9hZ0gNg-x6bdnJ8SX7BJKDsKOUNo0qx=JjYuig@mail.gmail.com>
Subject: Re: [PATCH 3/9] disas/riscv: Move types/constants to new header file
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Tue, May 30, 2023 at 11:23=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> In order to enable vendor disassembler support, we need to
> move types and constants into a header file so that other
> compilation units can use them as well.
>
> This patch does not introduce any functional changes.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 270 +-----------------------------------------------
>  disas/riscv.h | 280 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 281 insertions(+), 269 deletions(-)
>  create mode 100644 disas/riscv.h
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d597161d46..a062fb48cc 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -19,158 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
> -
> -
> -/* types */
> -
> -typedef uint64_t rv_inst;
> -typedef uint16_t rv_opcode;
> -
> -/* enums */
> -
> -typedef enum {
> -    rv32,
> -    rv64,
> -    rv128
> -} rv_isa;
> -
> -typedef enum {
> -    rv_rm_rne =3D 0,
> -    rv_rm_rtz =3D 1,
> -    rv_rm_rdn =3D 2,
> -    rv_rm_rup =3D 3,
> -    rv_rm_rmm =3D 4,
> -    rv_rm_dyn =3D 7,
> -} rv_rm;
> -
> -typedef enum {
> -    rv_fence_i =3D 8,
> -    rv_fence_o =3D 4,
> -    rv_fence_r =3D 2,
> -    rv_fence_w =3D 1,
> -} rv_fence;
> -
> -typedef enum {
> -    rv_ireg_zero,
> -    rv_ireg_ra,
> -    rv_ireg_sp,
> -    rv_ireg_gp,
> -    rv_ireg_tp,
> -    rv_ireg_t0,
> -    rv_ireg_t1,
> -    rv_ireg_t2,
> -    rv_ireg_s0,
> -    rv_ireg_s1,
> -    rv_ireg_a0,
> -    rv_ireg_a1,
> -    rv_ireg_a2,
> -    rv_ireg_a3,
> -    rv_ireg_a4,
> -    rv_ireg_a5,
> -    rv_ireg_a6,
> -    rv_ireg_a7,
> -    rv_ireg_s2,
> -    rv_ireg_s3,
> -    rv_ireg_s4,
> -    rv_ireg_s5,
> -    rv_ireg_s6,
> -    rv_ireg_s7,
> -    rv_ireg_s8,
> -    rv_ireg_s9,
> -    rv_ireg_s10,
> -    rv_ireg_s11,
> -    rv_ireg_t3,
> -    rv_ireg_t4,
> -    rv_ireg_t5,
> -    rv_ireg_t6,
> -} rv_ireg;
> -
> -typedef enum {
> -    rvc_end,
> -    rvc_rd_eq_ra,
> -    rvc_rd_eq_x0,
> -    rvc_rs1_eq_x0,
> -    rvc_rs2_eq_x0,
> -    rvc_rs2_eq_rs1,
> -    rvc_rs1_eq_ra,
> -    rvc_imm_eq_zero,
> -    rvc_imm_eq_n1,
> -    rvc_imm_eq_p1,
> -    rvc_csr_eq_0x001,
> -    rvc_csr_eq_0x002,
> -    rvc_csr_eq_0x003,
> -    rvc_csr_eq_0xc00,
> -    rvc_csr_eq_0xc01,
> -    rvc_csr_eq_0xc02,
> -    rvc_csr_eq_0xc80,
> -    rvc_csr_eq_0xc81,
> -    rvc_csr_eq_0xc82,
> -} rvc_constraint;
> -
> -typedef enum {
> -    rv_codec_illegal,
> -    rv_codec_none,
> -    rv_codec_u,
> -    rv_codec_uj,
> -    rv_codec_i,
> -    rv_codec_i_sh5,
> -    rv_codec_i_sh6,
> -    rv_codec_i_sh7,
> -    rv_codec_i_csr,
> -    rv_codec_s,
> -    rv_codec_sb,
> -    rv_codec_r,
> -    rv_codec_r_m,
> -    rv_codec_r4_m,
> -    rv_codec_r_a,
> -    rv_codec_r_l,
> -    rv_codec_r_f,
> -    rv_codec_cb,
> -    rv_codec_cb_imm,
> -    rv_codec_cb_sh5,
> -    rv_codec_cb_sh6,
> -    rv_codec_ci,
> -    rv_codec_ci_sh5,
> -    rv_codec_ci_sh6,
> -    rv_codec_ci_16sp,
> -    rv_codec_ci_lwsp,
> -    rv_codec_ci_ldsp,
> -    rv_codec_ci_lqsp,
> -    rv_codec_ci_li,
> -    rv_codec_ci_lui,
> -    rv_codec_ci_none,
> -    rv_codec_ciw_4spn,
> -    rv_codec_cj,
> -    rv_codec_cj_jal,
> -    rv_codec_cl_lw,
> -    rv_codec_cl_ld,
> -    rv_codec_cl_lq,
> -    rv_codec_cr,
> -    rv_codec_cr_mv,
> -    rv_codec_cr_jalr,
> -    rv_codec_cr_jr,
> -    rv_codec_cs,
> -    rv_codec_cs_sw,
> -    rv_codec_cs_sd,
> -    rv_codec_cs_sq,
> -    rv_codec_css_swsp,
> -    rv_codec_css_sdsp,
> -    rv_codec_css_sqsp,
> -    rv_codec_k_bs,
> -    rv_codec_k_rnum,
> -    rv_codec_v_r,
> -    rv_codec_v_ldst,
> -    rv_codec_v_i,
> -    rv_codec_vsetvli,
> -    rv_codec_vsetivli,
> -    rv_codec_zcb_ext,
> -    rv_codec_zcb_mul,
> -    rv_codec_zcb_lb,
> -    rv_codec_zcb_lh,
> -    rv_codec_zcmp_cm_pushpop,
> -    rv_codec_zcmp_cm_mv,
> -    rv_codec_zcmt_jt,
> -} rv_codec;
> +#include "disas/riscv.h"
>
>  typedef enum {
>      rv_op_illegal =3D 0,
> @@ -966,50 +815,6 @@ typedef enum {
>      rv_op_czero_nez =3D 790,
>  } rv_op;
>
> -/* structures */
> -
> -typedef struct {
> -    uint64_t  pc;
> -    uint64_t  inst;
> -    int32_t   imm;
> -    uint16_t  op;
> -    uint8_t   codec;
> -    uint8_t   rd;
> -    uint8_t   rs1;
> -    uint8_t   rs2;
> -    uint8_t   rs3;
> -    uint8_t   rm;
> -    uint8_t   pred;
> -    uint8_t   succ;
> -    uint8_t   aq;
> -    uint8_t   rl;
> -    uint8_t   bs;
> -    uint8_t   rnum;
> -    uint8_t   vm;
> -    uint32_t  vzimm;
> -    uint8_t   rlist;
> -} rv_decode;
> -
> -typedef struct {
> -    const int op;
> -    const rvc_constraint *constraints;
> -} rv_comp_data;
> -
> -enum {
> -    rvcd_imm_nz =3D 0x1
> -};
> -
> -typedef struct {
> -    const char * const name;
> -    const rv_codec codec;
> -    const char * const format;
> -    const rv_comp_data *pseudo;
> -    const short decomp_rv32;
> -    const short decomp_rv64;
> -    const short decomp_rv128;
> -    const short decomp_data;
> -} rv_opcode_data;
> -
>  /* register names */
>
>  static const char rv_ireg_name_sym[32][5] =3D {
> @@ -1033,79 +838,6 @@ static const char rv_vreg_name_sym[32][4] =3D {
>      "v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31"
>  };
>
> -/* instruction formats */
> -
> -#define rv_fmt_none                   "O\t"
> -#define rv_fmt_rs1                    "O\t1"
> -#define rv_fmt_offset                 "O\to"
> -#define rv_fmt_pred_succ              "O\tp,s"
> -#define rv_fmt_rs1_rs2                "O\t1,2"
> -#define rv_fmt_rd_imm                 "O\t0,i"
> -#define rv_fmt_rd_offset              "O\t0,o"
> -#define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
> -#define rv_fmt_frd_rs1                "O\t3,1"
> -#define rv_fmt_frd_frs1               "O\t3,4"
> -#define rv_fmt_rd_frs1                "O\t0,4"
> -#define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
> -#define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
> -#define rv_fmt_rm_frd_frs1            "O\tr,3,4"
> -#define rv_fmt_rm_frd_rs1             "O\tr,3,1"
> -#define rv_fmt_rm_rd_frs1             "O\tr,0,4"
> -#define rv_fmt_rm_frd_frs1_frs2       "O\tr,3,4,5"
> -#define rv_fmt_rm_frd_frs1_frs2_frs3  "O\tr,3,4,5,6"
> -#define rv_fmt_rd_rs1_imm             "O\t0,1,i"
> -#define rv_fmt_rd_rs1_offset          "O\t0,1,i"
> -#define rv_fmt_rd_offset_rs1          "O\t0,i(1)"
> -#define rv_fmt_frd_offset_rs1         "O\t3,i(1)"
> -#define rv_fmt_rd_csr_rs1             "O\t0,c,1"
> -#define rv_fmt_rd_csr_zimm            "O\t0,c,7"
> -#define rv_fmt_rs2_offset_rs1         "O\t2,i(1)"
> -#define rv_fmt_frs2_offset_rs1        "O\t5,i(1)"
> -#define rv_fmt_rs1_rs2_offset         "O\t1,2,o"
> -#define rv_fmt_rs2_rs1_offset         "O\t2,1,o"
> -#define rv_fmt_aqrl_rd_rs2_rs1        "OAR\t0,2,(1)"
> -#define rv_fmt_aqrl_rd_rs1            "OAR\t0,(1)"
> -#define rv_fmt_rd                     "O\t0"
> -#define rv_fmt_rd_zimm                "O\t0,7"
> -#define rv_fmt_rd_rs1                 "O\t0,1"
> -#define rv_fmt_rd_rs2                 "O\t0,2"
> -#define rv_fmt_rs1_offset             "O\t1,o"
> -#define rv_fmt_rs2_offset             "O\t2,o"
> -#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
> -#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
> -#define rv_fmt_ldst_vd_rs1_vm         "O\tD,(1)m"
> -#define rv_fmt_ldst_vd_rs1_rs2_vm     "O\tD,(1),2m"
> -#define rv_fmt_ldst_vd_rs1_vs2_vm     "O\tD,(1),Fm"
> -#define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
> -#define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
> -#define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
> -#define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
> -#define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
> -#define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
> -#define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
> -#define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
> -#define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
> -#define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
> -#define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
> -#define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
> -#define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
> -#define rv_fmt_vd_vs1                 "O\tD,E"
> -#define rv_fmt_vd_rs1                 "O\tD,1"
> -#define rv_fmt_vd_fs1                 "O\tD,4"
> -#define rv_fmt_vd_imm                 "O\tD,i"
> -#define rv_fmt_vd_vs2                 "O\tD,F"
> -#define rv_fmt_vd_vs2_vm              "O\tD,Fm"
> -#define rv_fmt_rd_vs2_vm              "O\t0,Fm"
> -#define rv_fmt_rd_vs2                 "O\t0,F"
> -#define rv_fmt_fd_vs2                 "O\t3,F"
> -#define rv_fmt_vd_vm                  "O\tDm"
> -#define rv_fmt_vsetvli                "O\t0,1,v"
> -#define rv_fmt_vsetivli               "O\t0,u,v"
> -#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
> -#define rv_fmt_push_rlist             "O\tx,-i"
> -#define rv_fmt_pop_rlist              "O\tx,i"
> -#define rv_fmt_zcmt_index             "O\ti"
> -
>  /* pseudo-instruction constraints */
>
>  static const rvc_constraint rvcc_jal[] =3D { rvc_rd_eq_ra, rvc_end };
> diff --git a/disas/riscv.h b/disas/riscv.h
> new file mode 100644
> index 0000000000..0f34b71518
> --- /dev/null
> +++ b/disas/riscv.h
> @@ -0,0 +1,280 @@
> +/*
> + * QEMU disassembler -- RISC-V specific header.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef DISAS_RISCV_H
> +#define DISAS_RISCV_H
> +
> +#include "qemu/osdep.h"
> +
> +/* types */
> +
> +typedef uint64_t rv_inst;
> +typedef uint16_t rv_opcode;
> +
> +/* enums */
> +
> +typedef enum {
> +    rv32,
> +    rv64,
> +    rv128
> +} rv_isa;
> +
> +typedef enum {
> +    rv_rm_rne =3D 0,
> +    rv_rm_rtz =3D 1,
> +    rv_rm_rdn =3D 2,
> +    rv_rm_rup =3D 3,
> +    rv_rm_rmm =3D 4,
> +    rv_rm_dyn =3D 7,
> +} rv_rm;
> +
> +typedef enum {
> +    rv_fence_i =3D 8,
> +    rv_fence_o =3D 4,
> +    rv_fence_r =3D 2,
> +    rv_fence_w =3D 1,
> +} rv_fence;
> +
> +typedef enum {
> +    rv_ireg_zero,
> +    rv_ireg_ra,
> +    rv_ireg_sp,
> +    rv_ireg_gp,
> +    rv_ireg_tp,
> +    rv_ireg_t0,
> +    rv_ireg_t1,
> +    rv_ireg_t2,
> +    rv_ireg_s0,
> +    rv_ireg_s1,
> +    rv_ireg_a0,
> +    rv_ireg_a1,
> +    rv_ireg_a2,
> +    rv_ireg_a3,
> +    rv_ireg_a4,
> +    rv_ireg_a5,
> +    rv_ireg_a6,
> +    rv_ireg_a7,
> +    rv_ireg_s2,
> +    rv_ireg_s3,
> +    rv_ireg_s4,
> +    rv_ireg_s5,
> +    rv_ireg_s6,
> +    rv_ireg_s7,
> +    rv_ireg_s8,
> +    rv_ireg_s9,
> +    rv_ireg_s10,
> +    rv_ireg_s11,
> +    rv_ireg_t3,
> +    rv_ireg_t4,
> +    rv_ireg_t5,
> +    rv_ireg_t6,
> +} rv_ireg;
> +
> +typedef enum {
> +    rvc_end,
> +    rvc_rd_eq_ra,
> +    rvc_rd_eq_x0,
> +    rvc_rs1_eq_x0,
> +    rvc_rs2_eq_x0,
> +    rvc_rs2_eq_rs1,
> +    rvc_rs1_eq_ra,
> +    rvc_imm_eq_zero,
> +    rvc_imm_eq_n1,
> +    rvc_imm_eq_p1,
> +    rvc_csr_eq_0x001,
> +    rvc_csr_eq_0x002,
> +    rvc_csr_eq_0x003,
> +    rvc_csr_eq_0xc00,
> +    rvc_csr_eq_0xc01,
> +    rvc_csr_eq_0xc02,
> +    rvc_csr_eq_0xc80,
> +    rvc_csr_eq_0xc81,
> +    rvc_csr_eq_0xc82,
> +} rvc_constraint;
> +
> +typedef enum {
> +    rv_codec_illegal,
> +    rv_codec_none,
> +    rv_codec_u,
> +    rv_codec_uj,
> +    rv_codec_i,
> +    rv_codec_i_sh5,
> +    rv_codec_i_sh6,
> +    rv_codec_i_sh7,
> +    rv_codec_i_csr,
> +    rv_codec_s,
> +    rv_codec_sb,
> +    rv_codec_r,
> +    rv_codec_r_m,
> +    rv_codec_r4_m,
> +    rv_codec_r_a,
> +    rv_codec_r_l,
> +    rv_codec_r_f,
> +    rv_codec_cb,
> +    rv_codec_cb_imm,
> +    rv_codec_cb_sh5,
> +    rv_codec_cb_sh6,
> +    rv_codec_ci,
> +    rv_codec_ci_sh5,
> +    rv_codec_ci_sh6,
> +    rv_codec_ci_16sp,
> +    rv_codec_ci_lwsp,
> +    rv_codec_ci_ldsp,
> +    rv_codec_ci_lqsp,
> +    rv_codec_ci_li,
> +    rv_codec_ci_lui,
> +    rv_codec_ci_none,
> +    rv_codec_ciw_4spn,
> +    rv_codec_cj,
> +    rv_codec_cj_jal,
> +    rv_codec_cl_lw,
> +    rv_codec_cl_ld,
> +    rv_codec_cl_lq,
> +    rv_codec_cr,
> +    rv_codec_cr_mv,
> +    rv_codec_cr_jalr,
> +    rv_codec_cr_jr,
> +    rv_codec_cs,
> +    rv_codec_cs_sw,
> +    rv_codec_cs_sd,
> +    rv_codec_cs_sq,
> +    rv_codec_css_swsp,
> +    rv_codec_css_sdsp,
> +    rv_codec_css_sqsp,
> +    rv_codec_k_bs,
> +    rv_codec_k_rnum,
> +    rv_codec_v_r,
> +    rv_codec_v_ldst,
> +    rv_codec_v_i,
> +    rv_codec_vsetvli,
> +    rv_codec_vsetivli,
> +    rv_codec_zcb_ext,
> +    rv_codec_zcb_mul,
> +    rv_codec_zcb_lb,
> +    rv_codec_zcb_lh,
> +    rv_codec_zcmp_cm_pushpop,
> +    rv_codec_zcmp_cm_mv,
> +    rv_codec_zcmt_jt,
> +} rv_codec;
> +
> +/* structures */
> +
> +typedef struct {
> +    uint64_t  pc;
> +    uint64_t  inst;
> +    int32_t   imm;
> +    uint16_t  op;
> +    uint8_t   codec;
> +    uint8_t   rd;
> +    uint8_t   rs1;
> +    uint8_t   rs2;
> +    uint8_t   rs3;
> +    uint8_t   rm;
> +    uint8_t   pred;
> +    uint8_t   succ;
> +    uint8_t   aq;
> +    uint8_t   rl;
> +    uint8_t   bs;
> +    uint8_t   rnum;
> +    uint8_t   vm;
> +    uint32_t  vzimm;
> +    uint8_t   rlist;
> +} rv_decode;
> +
> +typedef struct {
> +    const int op;
> +    const rvc_constraint *constraints;
> +} rv_comp_data;
> +
> +enum {
> +    rvcd_imm_nz =3D 0x1
> +};
> +
> +typedef struct {
> +    const char * const name;
> +    const rv_codec codec;
> +    const char * const format;
> +    const rv_comp_data *pseudo;
> +    const short decomp_rv32;
> +    const short decomp_rv64;
> +    const short decomp_rv128;
> +    const short decomp_data;
> +} rv_opcode_data;
> +
> +/* instruction formats */
> +
> +#define rv_fmt_none                   "O\t"
> +#define rv_fmt_rs1                    "O\t1"
> +#define rv_fmt_offset                 "O\to"
> +#define rv_fmt_pred_succ              "O\tp,s"
> +#define rv_fmt_rs1_rs2                "O\t1,2"
> +#define rv_fmt_rd_imm                 "O\t0,i"
> +#define rv_fmt_rd_offset              "O\t0,o"
> +#define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
> +#define rv_fmt_frd_rs1                "O\t3,1"
> +#define rv_fmt_frd_frs1               "O\t3,4"
> +#define rv_fmt_rd_frs1                "O\t0,4"
> +#define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
> +#define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
> +#define rv_fmt_rm_frd_frs1            "O\tr,3,4"
> +#define rv_fmt_rm_frd_rs1             "O\tr,3,1"
> +#define rv_fmt_rm_rd_frs1             "O\tr,0,4"
> +#define rv_fmt_rm_frd_frs1_frs2       "O\tr,3,4,5"
> +#define rv_fmt_rm_frd_frs1_frs2_frs3  "O\tr,3,4,5,6"
> +#define rv_fmt_rd_rs1_imm             "O\t0,1,i"
> +#define rv_fmt_rd_rs1_offset          "O\t0,1,i"
> +#define rv_fmt_rd_offset_rs1          "O\t0,i(1)"
> +#define rv_fmt_frd_offset_rs1         "O\t3,i(1)"
> +#define rv_fmt_rd_csr_rs1             "O\t0,c,1"
> +#define rv_fmt_rd_csr_zimm            "O\t0,c,7"
> +#define rv_fmt_rs2_offset_rs1         "O\t2,i(1)"
> +#define rv_fmt_frs2_offset_rs1        "O\t5,i(1)"
> +#define rv_fmt_rs1_rs2_offset         "O\t1,2,o"
> +#define rv_fmt_rs2_rs1_offset         "O\t2,1,o"
> +#define rv_fmt_aqrl_rd_rs2_rs1        "OAR\t0,2,(1)"
> +#define rv_fmt_aqrl_rd_rs1            "OAR\t0,(1)"
> +#define rv_fmt_rd                     "O\t0"
> +#define rv_fmt_rd_zimm                "O\t0,7"
> +#define rv_fmt_rd_rs1                 "O\t0,1"
> +#define rv_fmt_rd_rs2                 "O\t0,2"
> +#define rv_fmt_rs1_offset             "O\t1,o"
> +#define rv_fmt_rs2_offset             "O\t2,o"
> +#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
> +#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
> +#define rv_fmt_ldst_vd_rs1_vm         "O\tD,(1)m"
> +#define rv_fmt_ldst_vd_rs1_rs2_vm     "O\tD,(1),2m"
> +#define rv_fmt_ldst_vd_rs1_vs2_vm     "O\tD,(1),Fm"
> +#define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
> +#define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
> +#define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
> +#define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
> +#define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
> +#define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
> +#define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
> +#define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
> +#define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
> +#define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
> +#define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
> +#define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
> +#define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
> +#define rv_fmt_vd_vs1                 "O\tD,E"
> +#define rv_fmt_vd_rs1                 "O\tD,1"
> +#define rv_fmt_vd_fs1                 "O\tD,4"
> +#define rv_fmt_vd_imm                 "O\tD,i"
> +#define rv_fmt_vd_vs2                 "O\tD,F"
> +#define rv_fmt_vd_vs2_vm              "O\tD,Fm"
> +#define rv_fmt_rd_vs2_vm              "O\t0,Fm"
> +#define rv_fmt_rd_vs2                 "O\t0,F"
> +#define rv_fmt_fd_vs2                 "O\t3,F"
> +#define rv_fmt_vd_vm                  "O\tDm"
> +#define rv_fmt_vsetvli                "O\t0,1,v"
> +#define rv_fmt_vsetivli               "O\t0,u,v"
> +#define rv_fmt_rs1_rs2_zce_ldst       "O\t2,i(1)"
> +#define rv_fmt_push_rlist             "O\tx,-i"
> +#define rv_fmt_pop_rlist              "O\tx,i"
> +#define rv_fmt_zcmt_index             "O\ti"
> +
> +#endif /* DISAS_RISCV_H */
> --
> 2.40.1
>
>

