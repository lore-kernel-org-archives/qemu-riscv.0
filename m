Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD992C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:26:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MDh-0008PJ-2E; Thu, 25 May 2023 21:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MDf-0008Ow-Jq; Thu, 25 May 2023 21:26:15 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MDc-0004pe-It; Thu, 25 May 2023 21:26:15 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-439367c12ceso108607137.0; 
 Thu, 25 May 2023 18:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064371; x=1687656371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58TK8tGESqvE1Ki5DiyQNPD+I17bEfjhvybr0pKjeVo=;
 b=ggBQFLf2DrhOCpKpZn/jAOi+RSKTyGnCzyCL12K7px+ydzkyHSrWf1pDFJRO+VQccw
 C69vikSnE0wKLZJuTRvqeZcbCnxxJMX3idVX/LOtxEwft95sHivRNHNcTUX2ng1PVDkw
 3xvRvaah5zWBVWvNX9HkvX+pv13C3X4ELKcb44i10QXFD9gOZE/fSlvr32NUsck04tSY
 UFM9jeOba+lQAkNYefgpO+sZjE6a9X012LMMi1r+XnWJLXQ2eN9NrqtZvMqdH/kLymW8
 Xr8esRGvYIixZrGVRxFSLrF+22R9S9Vhwz5e7+R9G8pAFhVVvNI5F8WX+bbRRQKWmkyp
 bRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064371; x=1687656371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58TK8tGESqvE1Ki5DiyQNPD+I17bEfjhvybr0pKjeVo=;
 b=HB12O856IHJBZG9ECB5BnBh4rsGSzXmC0HP6HuL6RXRGILKam9JGF1vHgjhGBnJnrD
 xs+9l7E9yT2ULMFV8kvyBXOXQfT08DjncdE1pC0gAIG6+k5FDA8Z6Dc1TV5x60YVbfwu
 r302oN/vHIE9p6xNygeC4PDRbOKFYG3Mhbvds24PPkexA41sQGH/SG4PggDMzoxaZicF
 gY01b8Q+kYM82RaoYLUioFVhOp4PBk2loB2pW7rfbHK3kkdvpvkGkEMbSZBIfXgqQOt2
 BlPBkm36tD/idpqNvijGwDL45iGFR2Xa9z9CD4Wbhxd3h5c8JxryBlBsg3RkdmG3PTuL
 L4sA==
X-Gm-Message-State: AC+VfDyzNaaM6sOfMzxSeZ36xE5W280ZVZzHeVxH4ps5Cf+Mp2LepNXx
 dilXsFV5NJl82rEFfAu1qkCUt7tMgbgYwgIYY0E=
X-Google-Smtp-Source: ACHHUZ7ut9+RwHMCB8nJDNLs+fL6gdzZnDue9FbL4eZdE1MgJNe6DHOh9+cmRZ5/ugNe4KjaK6JVR/g8+KgsnwqhtYE=
X-Received: by 2002:a67:ef84:0:b0:434:2f6a:6009 with SMTP id
 r4-20020a67ef84000000b004342f6a6009mr77970vsp.8.1685064370991; Thu, 25 May
 2023 18:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:25:44 +1000
Message-ID: <CAKmqyKPo4zcijWn+gi+PbxvoMKJtEdCLoF1v_hzR--g0uZMerA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] disas/riscv.c: Fix lines with over 80 characters
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Tue, May 23, 2023 at 7:37=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Fix lines with over 80 characters.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 201 +++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 140 insertions(+), 61 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index a8eca47da2..e5d3cefd17 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1108,8 +1108,10 @@ static const char rv_vreg_name_sym[32][4] =3D {
>  /* pseudo-instruction constraints */
>
>  static const rvc_constraint rvcc_jal[] =3D { rvc_rd_eq_ra, rvc_end };
> -static const rvc_constraint rvcc_jalr[] =3D { rvc_rd_eq_ra, rvc_imm_eq_z=
ero, rvc_end };
> -static const rvc_constraint rvcc_nop[] =3D { rvc_rd_eq_x0, rvc_rs1_eq_x0=
, rvc_imm_eq_zero, rvc_end };
> +static const rvc_constraint rvcc_jalr[] =3D { rvc_rd_eq_ra, rvc_imm_eq_z=
ero,
> +                                            rvc_end };
> +static const rvc_constraint rvcc_nop[] =3D { rvc_rd_eq_x0, rvc_rs1_eq_x0=
,
> +                                           rvc_imm_eq_zero, rvc_end };
>  static const rvc_constraint rvcc_mv[] =3D { rvc_imm_eq_zero, rvc_end };
>  static const rvc_constraint rvcc_not[] =3D { rvc_imm_eq_n1, rvc_end };
>  static const rvc_constraint rvcc_neg[] =3D { rvc_rs1_eq_x0, rvc_end };
> @@ -1139,18 +1141,28 @@ static const rvc_constraint rvcc_bleu[] =3D { rvc=
_end };
>  static const rvc_constraint rvcc_bgt[] =3D { rvc_end };
>  static const rvc_constraint rvcc_bgtu[] =3D { rvc_end };
>  static const rvc_constraint rvcc_j[] =3D { rvc_rd_eq_x0, rvc_end };
> -static const rvc_constraint rvcc_ret[] =3D { rvc_rd_eq_x0, rvc_rs1_eq_ra=
, rvc_end };
> -static const rvc_constraint rvcc_jr[] =3D { rvc_rd_eq_x0, rvc_imm_eq_zer=
o, rvc_end };
> -static const rvc_constraint rvcc_rdcycle[] =3D { rvc_rs1_eq_x0, rvc_csr_=
eq_0xc00, rvc_end };
> -static const rvc_constraint rvcc_rdtime[] =3D { rvc_rs1_eq_x0, rvc_csr_e=
q_0xc01, rvc_end };
> -static const rvc_constraint rvcc_rdinstret[] =3D { rvc_rs1_eq_x0, rvc_cs=
r_eq_0xc02, rvc_end };
> -static const rvc_constraint rvcc_rdcycleh[] =3D { rvc_rs1_eq_x0, rvc_csr=
_eq_0xc80, rvc_end };
> -static const rvc_constraint rvcc_rdtimeh[] =3D { rvc_rs1_eq_x0, rvc_csr_=
eq_0xc81, rvc_end };
> +static const rvc_constraint rvcc_ret[] =3D { rvc_rd_eq_x0, rvc_rs1_eq_ra=
,
> +                                           rvc_end };
> +static const rvc_constraint rvcc_jr[] =3D { rvc_rd_eq_x0, rvc_imm_eq_zer=
o,
> +                                          rvc_end };
> +static const rvc_constraint rvcc_rdcycle[] =3D { rvc_rs1_eq_x0, rvc_csr_=
eq_0xc00,
> +                                               rvc_end };
> +static const rvc_constraint rvcc_rdtime[] =3D { rvc_rs1_eq_x0, rvc_csr_e=
q_0xc01,
> +                                              rvc_end };
> +static const rvc_constraint rvcc_rdinstret[] =3D { rvc_rs1_eq_x0,
> +                                                 rvc_csr_eq_0xc02, rvc_e=
nd };
> +static const rvc_constraint rvcc_rdcycleh[] =3D { rvc_rs1_eq_x0,
> +                                                rvc_csr_eq_0xc80, rvc_en=
d };
> +static const rvc_constraint rvcc_rdtimeh[] =3D { rvc_rs1_eq_x0, rvc_csr_=
eq_0xc81,
> +                                               rvc_end };
>  static const rvc_constraint rvcc_rdinstreth[] =3D { rvc_rs1_eq_x0,
>                                                    rvc_csr_eq_0xc82, rvc_=
end };
> -static const rvc_constraint rvcc_frcsr[] =3D { rvc_rs1_eq_x0, rvc_csr_eq=
_0x003, rvc_end };
> -static const rvc_constraint rvcc_frrm[] =3D { rvc_rs1_eq_x0, rvc_csr_eq_=
0x002, rvc_end };
> -static const rvc_constraint rvcc_frflags[] =3D { rvc_rs1_eq_x0, rvc_csr_=
eq_0x001, rvc_end };
> +static const rvc_constraint rvcc_frcsr[] =3D { rvc_rs1_eq_x0, rvc_csr_eq=
_0x003,
> +                                             rvc_end };
> +static const rvc_constraint rvcc_frrm[] =3D { rvc_rs1_eq_x0, rvc_csr_eq_=
0x002,
> +                                            rvc_end };
> +static const rvc_constraint rvcc_frflags[] =3D { rvc_rs1_eq_x0, rvc_csr_=
eq_0x001,
> +                                               rvc_end };
>  static const rvc_constraint rvcc_fscsr[] =3D { rvc_csr_eq_0x003, rvc_end=
 };
>  static const rvc_constraint rvcc_fsrm[] =3D { rvc_csr_eq_0x002, rvc_end =
};
>  static const rvc_constraint rvcc_fsflags[] =3D { rvc_csr_eq_0x001, rvc_e=
nd };
> @@ -1552,17 +1564,23 @@ const rv_opcode_data opcode_data[] =3D {
>      { "fmv.q.x", rv_codec_r, rv_fmt_frd_rs1, NULL, 0, 0, 0 },
>      { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, NULL, rv_op_ad=
di,
>        rv_op_addi, rv_op_addi, rvcd_imm_nz },
> -    { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld, r=
v_op_fld, 0 },
> -    { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_o=
p_lw, rv_op_lw },
> +    { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld,
> +      rv_op_fld, 0 },
> +    { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_o=
p_lw,
> +      rv_op_lw },
>      { "c.flw", rv_codec_cl_lw, rv_fmt_frd_offset_rs1, NULL, rv_op_flw, 0=
, 0 },
> -    { "c.fsd", rv_codec_cs_sd, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd, =
rv_op_fsd, 0 },
> -    { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_=
op_sw, rv_op_sw },
> +    { "c.fsd", rv_codec_cs_sd, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd,
> +      rv_op_fsd, 0 },
> +    { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_=
op_sw,
> +      rv_op_sw },
>      { "c.fsw", rv_codec_cs_sw, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw, =
0, 0 },
> -    { "c.nop", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_addi, rv_op_ad=
di, rv_op_addi },
> +    { "c.nop", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_addi, rv_op_ad=
di,
> +      rv_op_addi },
>      { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_=
addi,
>        rv_op_addi, rvcd_imm_nz },
>      { "c.jal", rv_codec_cj_jal, rv_fmt_rd_offset, NULL, rv_op_jal, 0, 0 =
},
> -    { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op=
_addi, rv_op_addi },
> +    { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op=
_addi,
> +      rv_op_addi },
>      { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_add=
i,
>        rv_op_addi, rv_op_addi, rvcd_imm_nz },
>      { "c.lui", rv_codec_ci_lui, rv_fmt_rd_imm, NULL, rv_op_lui, rv_op_lu=
i,
> @@ -1573,37 +1591,63 @@ const rv_opcode_data opcode_data[] =3D {
>        rv_op_srai, rv_op_srai, rvcd_imm_nz },
>      { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi,
>        rv_op_andi, rv_op_andi },
> -    { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_su=
b, rv_op_sub },
> -    { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xo=
r, rv_op_xor },
> -    { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or, =
rv_op_or },
> -    { "c.and", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_and, rv_op_an=
d, rv_op_and },
> -    { "c.subw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_subw, rv_op_=
subw, rv_op_subw },
> -    { "c.addw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_addw, rv_op_=
addw, rv_op_addw },
> -    { "c.j", rv_codec_cj, rv_fmt_rd_offset, NULL, rv_op_jal, rv_op_jal, =
rv_op_jal },
> -    { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_beq, rv_=
op_beq, rv_op_beq },
> -    { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne, rv_=
op_bne, rv_op_bne },
> +    { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_su=
b,
> +      rv_op_sub },
> +    { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xo=
r,
> +      rv_op_xor },
> +    { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or,
> +      rv_op_or },
> +    { "c.and", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_and, rv_op_an=
d,
> +      rv_op_and },
> +    { "c.subw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_subw, rv_op_=
subw,
> +      rv_op_subw },
> +    { "c.addw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_addw, rv_op_=
addw,
> +      rv_op_addw },
> +    { "c.j", rv_codec_cj, rv_fmt_rd_offset, NULL, rv_op_jal, rv_op_jal,
> +      rv_op_jal },
> +    { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_beq, rv_=
op_beq,
> +      rv_op_beq },
> +    { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne, rv_=
op_bne,
> +      rv_op_bne },
>      { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_slli,
>        rv_op_slli, rv_op_slli, rvcd_imm_nz },
> -    { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fl=
d, rv_op_fld, rv_op_fld },
> -    { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, =
rv_op_lw, rv_op_lw },
> -    { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fl=
w, 0, 0 },
> -    { "c.jr", rv_codec_cr_jr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr, rv=
_op_jalr, rv_op_jalr },
> -    { "c.mv", rv_codec_cr_mv, rv_fmt_rd_rs1_rs2, NULL, rv_op_addi, rv_op=
_addi, rv_op_addi },
> -    { "c.ebreak", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_ebreak, rv_=
op_ebreak, rv_op_ebreak },
> -    { "c.jalr", rv_codec_cr_jalr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr=
, rv_op_jalr, rv_op_jalr },
> -    { "c.add", rv_codec_cr, rv_fmt_rd_rs1_rs2, NULL, rv_op_add, rv_op_ad=
d, rv_op_add },
> -    { "c.fsdsp", rv_codec_css_sdsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_=
fsd, rv_op_fsd, rv_op_fsd },
> -    { "c.swsp", rv_codec_css_swsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw=
, rv_op_sw, rv_op_sw },
> -    { "c.fswsp", rv_codec_css_swsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_=
fsw, 0, 0 },
> -    { "c.ld", rv_codec_cl_ld, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_ld, r=
v_op_ld },
> -    { "c.sd", rv_codec_cs_sd, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op_sd, =
rv_op_sd },
> -    { "c.addiw", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, 0, rv_op_addiw, r=
v_op_addiw },
> -    { "c.ldsp", rv_codec_ci_ldsp, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_l=
d, rv_op_ld },
> -    { "c.sdsp", rv_codec_css_sdsp, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op=
_sd, rv_op_sd },
> +    { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fl=
d,
> +      rv_op_fld, rv_op_fld },
> +    { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw,
> +      rv_op_lw, rv_op_lw },
> +    { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fl=
w, 0,
> +      0 },
> +    { "c.jr", rv_codec_cr_jr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr,
> +      rv_op_jalr, rv_op_jalr },
> +    { "c.mv", rv_codec_cr_mv, rv_fmt_rd_rs1_rs2, NULL, rv_op_addi, rv_op=
_addi,
> +      rv_op_addi },
> +    { "c.ebreak", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_ebreak,
> +      rv_op_ebreak, rv_op_ebreak },
> +    { "c.jalr", rv_codec_cr_jalr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr=
,
> +      rv_op_jalr, rv_op_jalr },
> +    { "c.add", rv_codec_cr, rv_fmt_rd_rs1_rs2, NULL, rv_op_add, rv_op_ad=
d,
> +      rv_op_add },
> +    { "c.fsdsp", rv_codec_css_sdsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_=
fsd,
> +      rv_op_fsd, rv_op_fsd },
> +    { "c.swsp", rv_codec_css_swsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw=
,
> +      rv_op_sw, rv_op_sw },
> +    { "c.fswsp", rv_codec_css_swsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_=
fsw, 0,
> +      0 },
> +    { "c.ld", rv_codec_cl_ld, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_ld,
> +      rv_op_ld },
> +    { "c.sd", rv_codec_cs_sd, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op_sd,
> +      rv_op_sd },
> +    { "c.addiw", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, 0, rv_op_addiw,
> +      rv_op_addiw },
> +    { "c.ldsp", rv_codec_ci_ldsp, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_l=
d,
> +      rv_op_ld },
> +    { "c.sdsp", rv_codec_css_sdsp, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op=
_sd,
> +      rv_op_sd },
>      { "c.lq", rv_codec_cl_lq, rv_fmt_rd_offset_rs1, NULL, 0, 0, rv_op_lq=
 },
>      { "c.sq", rv_codec_cs_sq, rv_fmt_rs2_offset_rs1, NULL, 0, 0, rv_op_s=
q },
>      { "c.lqsp", rv_codec_ci_lqsp, rv_fmt_rd_offset_rs1, NULL, 0, 0, rv_o=
p_lq },
> -    { "c.sqsp", rv_codec_css_sqsp, rv_fmt_rs2_offset_rs1, NULL, 0, 0, rv=
_op_sq },
> +    { "c.sqsp", rv_codec_css_sqsp, rv_fmt_rs2_offset_rs1, NULL, 0, 0,
> +      rv_op_sq },
>      { "nop", rv_codec_i, rv_fmt_none, NULL, 0, 0, 0 },
>      { "mv", rv_codec_i, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "not", rv_codec_i, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> @@ -2840,7 +2884,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>              }
>              break;
>          case 11:
> -            switch (((inst >> 24) & 0b11111000) | ((inst >> 12) & 0b0000=
0111)) {
> +            switch (((inst >> 24) & 0b11111000) |
> +                    ((inst >> 12) & 0b00000111)) {
>              case 2: op =3D rv_op_amoadd_w; break;
>              case 3: op =3D rv_op_amoadd_d; break;
>              case 4: op =3D rv_op_amoadd_q; break;
> @@ -2889,7 +2934,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>              }
>              break;
>          case 12:
> -            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b00=
00000111)) {
> +            switch (((inst >> 22) & 0b1111111000) |
> +                    ((inst >> 12) & 0b0000000111)) {
>              case 0: op =3D rv_op_add; break;
>              case 1: op =3D rv_op_sll; break;
>              case 2: op =3D rv_op_slt; break;
> @@ -2960,7 +3006,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>              break;
>          case 13: op =3D rv_op_lui; break;
>          case 14:
> -            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b00=
00000111)) {
> +            switch (((inst >> 22) & 0b1111111000) |
> +                    ((inst >> 12) & 0b0000000111)) {
>              case 0: op =3D rv_op_addw; break;
>              case 1: op =3D rv_op_sllw; break;
>              case 5: op =3D rv_op_srlw; break;
> @@ -3169,35 +3216,41 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
>                  }
>                  break;
>              case 112:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b=
00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                  case 0: op =3D rv_op_fmv_x_s; break;
>                  case 1: op =3D rv_op_fclass_s; break;
>                  }
>                  break;
>              case 113:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b=
00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                  case 0: op =3D rv_op_fmv_x_d; break;
>                  case 1: op =3D rv_op_fclass_d; break;
>                  }
>                  break;
>              case 115:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b=
00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                  case 0: op =3D rv_op_fmv_x_q; break;
>                  case 1: op =3D rv_op_fclass_q; break;
>                  }
>                  break;
>              case 120:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b=
00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                  case 0: op =3D rv_op_fmv_s_x; break;
>                  }
>                  break;
>              case 121:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b=
00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                  case 0: op =3D rv_op_fmv_d_x; break;
>                  }
>                  break;
>              case 123:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b=
00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                  case 0: op =3D rv_op_fmv_q_x; break;
>                  }
>                  break;
> @@ -3218,9 +3271,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                  case 11: op =3D rv_op_vxor_vv; break;
>                  case 12: op =3D rv_op_vrgather_vv; break;
>                  case 14: op =3D rv_op_vrgatherei16_vv; break;
> -                case 16: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
adc_vvm; break;
> +                case 16:
> +                    if (((inst >> 25) & 1) =3D=3D 0) {
> +                        op =3D rv_op_vadc_vvm;
> +                    }
> +                    break;
>                  case 17: op =3D rv_op_vmadc_vvm; break;
> -                case 18: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
sbc_vvm; break;
> +                case 18:
> +                    if (((inst >> 25) & 1) =3D=3D 0) {
> +                        op =3D rv_op_vsbc_vvm;
> +                    }
> +                    break;
>                  case 19: op =3D rv_op_vmsbc_vvm; break;
>                  case 23:
>                      if (((inst >> 20) & 0b111111) =3D=3D 32)
> @@ -3367,7 +3428,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                      case 2: op =3D rv_op_vmsof_m; break;
>                      case 3: op =3D rv_op_vmsif_m; break;
>                      case 16: op =3D rv_op_viota_m; break;
> -                    case 17: if (((inst >> 20) & 0b11111) =3D=3D 0) op =
=3D rv_op_vid_v; break;
> +                    case 17:
> +                        if (((inst >> 20) & 0b11111) =3D=3D 0) {
> +                            op =3D rv_op_vid_v;
> +                        }
> +                        break;
>                      }
>                      break;
>                  case 23: if ((inst >> 25) & 1) op =3D rv_op_vcompress_vm=
; break;
> @@ -3417,7 +3482,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                  case 12: op =3D rv_op_vrgather_vi; break;
>                  case 14: op =3D rv_op_vslideup_vi; break;
>                  case 15: op =3D rv_op_vslidedown_vi; break;
> -                case 16: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
adc_vim; break;
> +                case 16:
> +                    if (((inst >> 25) & 1) =3D=3D 0) {
> +                        op =3D rv_op_vadc_vim;
> +                    }
> +                    break;
>                  case 17: op =3D rv_op_vmadc_vim; break;
>                  case 23:
>                      if (((inst >> 20) & 0b111111) =3D=3D 32)
> @@ -3467,9 +3536,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                  case 12: op =3D rv_op_vrgather_vx; break;
>                  case 14: op =3D rv_op_vslideup_vx; break;
>                  case 15: op =3D rv_op_vslidedown_vx; break;
> -                case 16: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
adc_vxm; break;
> +                case 16:
> +                    if (((inst >> 25) & 1) =3D=3D 0) {
> +                        op =3D rv_op_vadc_vxm;
> +                    }
> +                    break;
>                  case 17: op =3D rv_op_vmadc_vxm; break;
> -                case 18: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
sbc_vxm; break;
> +                case 18:
> +                    if (((inst >> 25) & 1) =3D=3D 0) {
> +                        op =3D rv_op_vsbc_vxm;
> +                    }
> +                    break;
>                  case 19: op =3D rv_op_vmsbc_vxm; break;
>                  case 23:
>                      if (((inst >> 20) & 0b111111) =3D=3D 32)
> @@ -3640,7 +3717,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>          case 28:
>              switch (((inst >> 12) & 0b111)) {
>              case 0:
> -                switch (((inst >> 20) & 0b111111100000) | ((inst >> 7) &=
 0b000000011111)) {
> +                switch (((inst >> 20) & 0b111111100000) |
> +                        ((inst >> 7) & 0b000000011111)) {
>                  case 0:
>                      switch (((inst >> 15) & 0b1111111111)) {
>                      case 0: op =3D rv_op_ecall; break;
> @@ -3690,7 +3768,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>              }
>              break;
>          case 30:
> -            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b00=
00000111)) {
> +            switch (((inst >> 22) & 0b1111111000) |
> +                    ((inst >> 12) & 0b0000000111)) {
>              case 0: op =3D rv_op_addd; break;
>              case 1: op =3D rv_op_slld; break;
>              case 5: op =3D rv_op_srld; break;
> --
> 2.25.1
>
>

