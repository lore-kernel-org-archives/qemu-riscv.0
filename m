Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D4EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 02:58:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK90r-0001Sk-Vn; Thu, 13 Jul 2023 22:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK90q-0001S2-FQ; Thu, 13 Jul 2023 22:58:32 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK90o-0003UW-Sh; Thu, 13 Jul 2023 22:58:32 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-44691ebb0e1so577490137.0; 
 Thu, 13 Jul 2023 19:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689303508; x=1691895508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ljfNYVIKwGLaHPEXj4njhV7CNnvKn8QWv2BGf1vmxA=;
 b=YNeqOFuYMgFM8g8LSuRfsYJmyJj/vu6V+kcwcgQQQJzET494gOpgKMtymcJYBrHdJ1
 44JfXUz9FqPM3yabRXG87eDB7R3mpWwjqfCUyPQbwXgbOamdwOZha3nefO33P5M4mhs5
 +w2eBoCrSac5U8Q28JhyTChQqhf9NGUgyzkrBvtf2ed1udr5W9U3gpEtluZzwbuTZIgW
 kDCGiYb6Llpp8ckDRwXSDajds2sh90iLM/4IGTwnOQJJokHtU9EkfZPLgxJwSGPR4gqh
 pOPYKB4M96Qsj9Z6cdsKIyRXd1EbXCsNwhLr3sCDeieRkYsfB8D7AvfcHGIqxgUM16PT
 rrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689303508; x=1691895508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ljfNYVIKwGLaHPEXj4njhV7CNnvKn8QWv2BGf1vmxA=;
 b=EkRAw+u75W2wjhcN1TEm5vMTQMzb/zwSMZgp8BS0SFvaZwMu1Nmk4foaza3rmSH2fX
 yjbPCUjqNnVmoikchKkyiWSdWexM6bMESvPj6Iijr0WORCVPBe6AWkcQRYWBG6ULtKI8
 GievH5wEf3f1bgZioLUQ1qfQnNrO7vDIDKJkVrmkcMK6rWgodjoqtogqnQI6ElckSV2O
 pnyL0PN43fJTzBZpWLDDSyZuAHHRg5mAEXKjvBeSlAgIOjkyYxshl0XfAVWEDTL2o7xQ
 O5lKEuEwAVOGxKx593nDpSPYNheBVBstLI7UHGjWVDfF0lfxyBDZwMV2Q5bXqHcZG/m7
 sjTQ==
X-Gm-Message-State: ABy/qLa3ys9rmIhtkbscV2ZnU6hCOOeb+iqlL1TPw47h5BQgpFPIMRNB
 olc7rvLuAnc/vujw0/C6OUyrlw417SvCONKD0j8=
X-Google-Smtp-Source: APBJJlG5NQ6MC+ujfw/AfA2BinsaHBgJAmaEc8NWdekIdpcS+0e9iObpktvWS7qd13GiJgvROWFRBIxVh0pGQmie2J0=
X-Received: by 2002:a05:6102:2d6:b0:445:2be0:f54f with SMTP id
 h22-20020a05610202d600b004452be0f54fmr2542460vsh.22.1689303508357; Thu, 13
 Jul 2023 19:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230711075051.1531007-1-christoph.muellner@vrull.eu>
In-Reply-To: <20230711075051.1531007-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 12:58:02 +1000
Message-ID: <CAKmqyKMQ2nOmymXCSBYxH-q=QSTO_1z3-UaMXf98Jt6-oFvHYg@mail.gmail.com>
Subject: Re: [PATCH] riscv/disas: Fix disas output of upper immediates
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Tue, Jul 11, 2023 at 5:52=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> The GNU assembler produces the following output for instructions
> with upper immediates:
>     00002597                auipc   a1,0x2
>     000024b7                lui     s1,0x2
>     6409                    lui     s0,0x2 # c.lui
>
> The immediate operands of upper immediates are not shifted.
>
> However, the QEMU disassembler prints them shifted:
>     00002597          auipc                   a1,8192
>     000024b7          lui                     s1,8192
>     6409              lui                     s0,8192 # c.lui
>
> The current implementation extracts the immediate bits and shifts the by =
12,
> so the internal representation of the immediate is the actual immediate.
> However, the immediates are later printed using rv_fmt_rd_imm or
> rv_fmt_rd_offset, which don't undo the shift.
>
> Let's fix this by using specific output formats for instructions
> with upper immediates, that take care of the shift.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  disas/riscv.c | 19 ++++++++++++++++---
>  disas/riscv.h |  2 ++
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index cd7b6e86a7..3873a69157 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1135,8 +1135,8 @@ static const rv_comp_data rvcp_fsgnjx_q[] =3D {
>
>  const rv_opcode_data rvi_opcode_data[] =3D {
>      { "illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
> -    { "lui", rv_codec_u, rv_fmt_rd_imm, NULL, 0, 0, 0 },
> -    { "auipc", rv_codec_u, rv_fmt_rd_offset, NULL, 0, 0, 0 },
> +    { "lui", rv_codec_u, rv_fmt_rd_uimm, NULL, 0, 0, 0 },
> +    { "auipc", rv_codec_u, rv_fmt_rd_uoffset, NULL, 0, 0, 0 },
>      { "jal", rv_codec_uj, rv_fmt_rd_offset, rvcp_jal, 0, 0, 0 },
>      { "jalr", rv_codec_i, rv_fmt_rd_rs1_offset, rvcp_jalr, 0, 0, 0 },
>      { "beq", rv_codec_sb, rv_fmt_rs1_rs2_offset, rvcp_beq, 0, 0, 0 },
> @@ -1382,7 +1382,7 @@ const rv_opcode_data rvi_opcode_data[] =3D {
>        rv_op_addi },
>      { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_add=
i,
>        rv_op_addi, rv_op_addi, rvcd_imm_nz },
> -    { "c.lui", rv_codec_ci_lui, rv_fmt_rd_imm, NULL, rv_op_lui, rv_op_lu=
i,
> +    { "c.lui", rv_codec_ci_lui, rv_fmt_rd_uimm, NULL, rv_op_lui, rv_op_l=
ui,
>        rv_op_lui, rvcd_imm_nz },
>      { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srli,
>        rv_op_srli, rv_op_srli, rvcd_imm_nz },
> @@ -4694,6 +4694,19 @@ static void format_inst(char *buf, size_t buflen, =
size_t tab, rv_decode *dec)
>                  dec->pc + dec->imm);
>              append(buf, tmp, buflen);
>              break;
> +        case 'U':
> +            fmt++;
> +            snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12);
> +            append(buf, tmp, buflen);
> +            if (*fmt =3D=3D 'o') {
> +                while (strlen(buf) < tab * 2) {
> +                    append(buf, " ", buflen);
> +                }
> +                snprintf(tmp, sizeof(tmp), "# 0x%" PRIx64,
> +                    dec->pc + dec->imm);
> +                append(buf, tmp, buflen);
> +            }
> +            break;
>          case 'c': {
>              const char *name =3D csr_name(dec->imm & 0xfff);
>              if (name) {
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 9cf901fc1e..8abb578b51 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -227,7 +227,9 @@ enum {
>  #define rv_fmt_pred_succ              "O\tp,s"
>  #define rv_fmt_rs1_rs2                "O\t1,2"
>  #define rv_fmt_rd_imm                 "O\t0,i"
> +#define rv_fmt_rd_uimm                "O\t0,Ui"
>  #define rv_fmt_rd_offset              "O\t0,o"
> +#define rv_fmt_rd_uoffset             "O\t0,Uo"
>  #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
>  #define rv_fmt_frd_rs1                "O\t3,1"
>  #define rv_fmt_frd_rs1_rs2            "O\t3,1,2"
> --
> 2.41.0
>
>

