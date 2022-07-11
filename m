Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAw0w-0005jc-1D
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 12:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oAw0q-0005hR-Bn
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 12:11:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oAw0k-0005xX-03
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 12:11:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so5304564wme.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Jul 2022 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlwUoqI88anykgKoirL7Fyk3eJmE3rMvstys/QEE9vo=;
 b=iZtKZFvP08S3Os/6b4Yhov6yIqHGH46kZFp2tBM7WHkLQspC4kAcjPLqjAJWPrdFjq
 GZxIbmojGK5vDUdjjJ35Gdm2brD+ul3VjHyajcNJ4gfZRossQaqAaS3QYtSR6xjD+BHA
 r7yHnTd5gXN5C8E5/0Wi0sv9+Nszmj7rupBI5BO3SgRaVjhI78oR+1V6Wka2pNstVTOt
 0mm8XUgCdCym417U4z6GeJSxg1N2o0kMgzeB/SC9OctvdjqffhdSYTDQDhy5unaRrL0r
 a43Ysqgfq+X6xQDpF1LERf+SxFGPi6IGuVjjPWaVbE/MrBubWACquGIFUXKzPg2+C5hs
 D1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlwUoqI88anykgKoirL7Fyk3eJmE3rMvstys/QEE9vo=;
 b=iGzh1wY6gN8BW4UvdL2SLpmHRj5FckgpJNuBrQb7OnQ2XWCbv9mwpUWtgN7nqhODZl
 8aemU5JNc90WMiJwQGaaK4AMfehKtjDDElqNmQOwtOaWmWsm7nz3n5NimeckLdLpDjsH
 uUIUSRfttz5baQVjTWP270PgzV15WfKCaf+KqWf7tKy7Q+J2BJtV1PkZVa9xEjkC1uiM
 4DRVomDKCGjVDBs9P1Qbox08Gcetqfhwgii+VwkZLE5PRKRE8Z0fOMHNJuSTK4EJPzdF
 0+pIMyWjda2oK9Oyt/oUaMPQbJaF4VYmquWVKuBp3VCBDQCb29OFGXrjw1oFB0cHkVB3
 pZzg==
X-Gm-Message-State: AJIora/Uoq9kQkQBkbtDofuQYOR6vux4HcXlYOaX6P320jaLAjlC4d15
 0ZgrhUsmYYPgyityb2V5zruGITIs4Fk63b1SAsrTTg==
X-Google-Smtp-Source: AGRyM1tPR1JEeQRvVYgOklIncVaIMcta8tXn2pv2VN7UB8VB3+azAMsq3gUdQp+WltyCXsx0dw10ntfcNAzpED/SiP4=
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id
 w7-20020a1cf607000000b003a03dc9c4dbmr16951933wmc.30.1657555908226; Mon, 11
 Jul 2022 09:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Mon, 11 Jul 2022 10:14:30 +0530
Message-ID: <CAFXwXr=OK38-vFo7+1z4RtqKcr9hz74bVxb__q6xi7rkyziMUw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000001b080a05e389cf3a"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jul 2022 16:11:56 -0000

--0000000000001b080a05e389cf3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 10 July 2022, 16:36 Fr=C3=A9d=C3=A9ric P=C3=A9trot, <
frederic.petrot@univ-grenoble-alpes.fr> wrote:

> For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c
> it stays 0 and is a hint instruction that does not change processor state=
.
> For rv128c right shifts, the 6-bit shamt is in addition sign extended to
> 7 bits.
>

Um, what says that? First, it makes no sense =E2=80=94 while some systems d=
efine
negative shifts as opposite direction, riscv is not one of them.

Second, the 20220707 draft spec does not agree with you:

  Shifts by an immediate (SLLI/SRLI/SRAI)
  are now encoded using the low 7 bits of
  the I-immediate....

Nothing about that sentence says "signed".


r~


> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> ---
>  target/riscv/insn16.decode |  7 ++++---
>  disas/riscv.c              | 27 +++++++++++++++++++++------
>  target/riscv/translate.c   | 20 ++++++++++++++++++--
>  3 files changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index 02c8f61b48..ccfe59f294 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -31,7 +31,8 @@
>  %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=3Dex_shift_1
>  %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=3Dex_shift_1
>
> -%shimm_6bit   12:1 2:5               !function=3Dex_rvc_shifti
> +%shlimm_6bit  12:1 2:5               !function=3Dex_rvc_shiftli
> +%shrimm_6bit  12:1 2:5               !function=3Dex_rvc_shiftri
>  %uimm_6bit_lq 2:4 12:1 6:1           !function=3Dex_shift_4
>  %uimm_6bit_ld 2:3 12:1 5:2           !function=3Dex_shift_3
>  %uimm_6bit_lw 2:2 12:1 4:3           !function=3Dex_shift_2
> @@ -82,9 +83,9 @@
>  @c_addi16sp     ... .  ..... ..... .. &i imm=3D%imm_addi16sp rs1=3D2 rd=
=3D2
>
>  @c_shift        ... . .. ... ..... .. \
> -                &shift rd=3D%rs1_3 rs1=3D%rs1_3 shamt=3D%shimm_6bit
> +                &shift rd=3D%rs1_3 rs1=3D%rs1_3 shamt=3D%shrimm_6bit
>  @c_shift2       ... . .. ... ..... .. \
> -                &shift rd=3D%rd rs1=3D%rd shamt=3D%shimm_6bit
> +                &shift rd=3D%rd rs1=3D%rd shamt=3D%shlimm_6bit
>
>  @c_andi         ... . .. ... ..... .. &i imm=3D%imm_ci rs1=3D%rs1_3 rd=
=3D%rs1_3
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7af6afc8fa..489c2ae5e8 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)
>          ((inst << 56) >> 63) << 11;
>  }
>
> -static uint32_t operand_cimmsh6(rv_inst inst)
> +static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
>  {
> -    return ((inst << 51) >> 63) << 5 |
> +    int imm =3D ((inst << 51) >> 63) << 5 |
>          (inst << 57) >> 59;
> +    if (isa =3D=3D rv128) {
> +        imm =3D imm ? imm : 64;
> +    }
> +    return imm;
> +}
> +
> +static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
> +{
> +    int imm =3D ((inst << 51) >> 63) << 5 |
> +        (inst << 57) >> 59;
> +    if (isa =3D=3D rv128) {
> +        imm =3D imm | (imm & 32) << 1;
> +        imm =3D imm ? imm : 64;
> +    }
> +    return imm;
>  }
>
>  static int32_t operand_cimmi(rv_inst inst)
> @@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)
>
>  /* decode operands */
>
> -static void decode_inst_operands(rv_decode *dec)
> +static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>  {
>      rv_inst inst =3D dec->inst;
>      dec->codec =3D opcode_data[dec->op].codec;
> @@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)
>      case rv_codec_cb_sh6:
>          dec->rd =3D dec->rs1 =3D operand_crs1rdq(inst) + 8;
>          dec->rs2 =3D rv_ireg_zero;
> -        dec->imm =3D operand_cimmsh6(inst);
> +        dec->imm =3D operand_cimmshr6(inst, isa);
>          break;
>      case rv_codec_ci:
>          dec->rd =3D dec->rs1 =3D operand_crs1rd(inst);
> @@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)
>      case rv_codec_ci_sh6:
>          dec->rd =3D dec->rs1 =3D operand_crs1rd(inst);
>          dec->rs2 =3D rv_ireg_zero;
> -        dec->imm =3D operand_cimmsh6(inst);
> +        dec->imm =3D operand_cimmshl6(inst, isa);
>          break;
>      case rv_codec_ci_16sp:
>          dec->rd =3D rv_ireg_sp;
> @@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa,
> uint64_t pc, rv_inst inst)
>      dec.pc =3D pc;
>      dec.inst =3D inst;
>      decode_inst_opcode(&dec, isa);
> -    decode_inst_operands(&dec);
> +    decode_inst_operands(&dec, isa);
>      decode_inst_decompress(&dec, isa);
>      decode_inst_lift_pseudo(&dec);
>      format_inst(buf, buflen, 16, &dec);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a94..d7c82a9c81 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int
> reg)
>      return 8 + reg;
>  }
>
> -static int ex_rvc_shifti(DisasContext *ctx, int imm)
> +static int ex_rvc_shiftli(DisasContext *ctx, int imm)
>  {
>      /* For RV128 a shamt of 0 means a shift by 64. */
> -    return imm ? imm : 64;
> +    if (get_ol(ctx) =3D=3D MXL_RV128) {
> +        imm =3D imm ? imm : 64;
> +    }
> +    return imm;
> +}
> +
> +static int ex_rvc_shiftri(DisasContext *ctx, int imm)
> +{
> +    /*
> +     * For RV128 a shamt of 0 means a shift by 64, furthermore, for righ=
t
> +     * shifts, the shamt is sign-extended.
> +     */
> +    if (get_ol(ctx) =3D=3D MXL_RV128) {
> +        imm =3D imm | (imm & 32) << 1;
> +        imm =3D imm ? imm : 64;
> +    }
> +    return imm;
>  }
>
>  /* Include the auto-generated decoder for 32 bit insn */
> --
> 2.36.1
>
>
>

--0000000000001b080a05e389cf3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Sun, 10 J=
uly 2022, 16:36 Fr=C3=A9d=C3=A9ric P=C3=A9trot, &lt;<a href=3D"mailto:frede=
ric.petrot@univ-grenoble-alpes.fr">frederic.petrot@univ-grenoble-alpes.fr</=
a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c<b=
r>
it stays 0 and is a hint instruction that does not change processor state.<=
br>
For rv128c right shifts, the 6-bit shamt is in addition sign extended to<br=
>
7 bits.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Um, what says that? First, it makes no sense =E2=80=94 while some sy=
stems define negative shifts as opposite direction, riscv is not one of the=
m.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Second, the 20220707 =
draft spec does not agree with you:</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">=C2=A0 Shifts by an immediate (SLLI/SRLI/SRAI)</div><div dir=3D=
"auto">=C2=A0 are now encoded using the low 7 bits of</div><div dir=3D"auto=
">=C2=A0 the I-immediate....</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Nothing about that sentence says &quot;signed&quot;.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">r~</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot &lt;<a href=3D"mailto:frederi=
c.petrot@univ-grenoble-alpes.fr" target=3D"_blank" rel=3D"noreferrer">frede=
ric.petrot@univ-grenoble-alpes.fr</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn16.decode |=C2=A0 7 ++++---<br>
=C2=A0disas/riscv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 27 ++=
+++++++++++++++++++------<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0| 20 ++++++++++++++++++--<br>
=C2=A03 files changed, 43 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode<br>
index 02c8f61b48..ccfe59f294 100644<br>
--- a/target/riscv/insn16.decode<br>
+++ b/target/riscv/insn16.decode<br>
@@ -31,7 +31,8 @@<br>
=C2=A0%imm_cb=C2=A0 =C2=A0 =C2=A0 =C2=A0 12:s1 5:2 2:1 10:2 3:2 !function=
=3Dex_shift_1<br>
=C2=A0%imm_cj=C2=A0 =C2=A0 =C2=A0 =C2=A0 12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3=
 !function=3Dex_shift_1<br>
<br>
-%shimm_6bit=C2=A0 =C2=A012:1 2:5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0!function=3Dex_rvc_shifti<br>
+%shlimm_6bit=C2=A0 12:1 2:5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0!function=3Dex_rvc_shiftli<br>
+%shrimm_6bit=C2=A0 12:1 2:5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0!function=3Dex_rvc_shiftri<br>
=C2=A0%uimm_6bit_lq 2:4 12:1 6:1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!f=
unction=3Dex_shift_4<br>
=C2=A0%uimm_6bit_ld 2:3 12:1 5:2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!f=
unction=3Dex_shift_3<br>
=C2=A0%uimm_6bit_lw 2:2 12:1 4:3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!f=
unction=3Dex_shift_2<br>
@@ -82,9 +83,9 @@<br>
=C2=A0@c_addi16sp=C2=A0 =C2=A0 =C2=A0... .=C2=A0 ..... ..... .. &amp;i imm=
=3D%imm_addi16sp rs1=3D2 rd=3D2<br>
<br>
=C2=A0@c_shift=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... . .. ... ..... .. \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;shift rd=3D%r=
s1_3 rs1=3D%rs1_3 shamt=3D%shimm_6bit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;shift rd=3D%r=
s1_3 rs1=3D%rs1_3 shamt=3D%shrimm_6bit<br>
=C2=A0@c_shift2=C2=A0 =C2=A0 =C2=A0 =C2=A0... . .. ... ..... .. \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;shift rd=3D%r=
d rs1=3D%rd shamt=3D%shimm_6bit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;shift rd=3D%r=
d rs1=3D%rd shamt=3D%shlimm_6bit<br>
<br>
=C2=A0@c_andi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0... . .. ... ..... .. &amp;i=
 imm=3D%imm_ci rs1=3D%rs1_3 rd=3D%rs1_3<br>
<br>
diff --git a/disas/riscv.c b/disas/riscv.c<br>
index 7af6afc8fa..489c2ae5e8 100644<br>
--- a/disas/riscv.c<br>
+++ b/disas/riscv.c<br>
@@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((inst &lt;&lt; 56) &gt;&gt; 63) &lt;&lt;=
 11;<br>
=C2=A0}<br>
<br>
-static uint32_t operand_cimmsh6(rv_inst inst)<br>
+static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return ((inst &lt;&lt; 51) &gt;&gt; 63) &lt;&lt; 5 |<br>
+=C2=A0 =C2=A0 int imm =3D ((inst &lt;&lt; 51) &gt;&gt; 63) &lt;&lt; 5 |<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(inst &lt;&lt; 57) &gt;&gt; 59;<br>
+=C2=A0 =C2=A0 if (isa =3D=3D rv128) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imm =3D imm ? imm : 64;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return imm;<br>
+}<br>
+<br>
+static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)<br>
+{<br>
+=C2=A0 =C2=A0 int imm =3D ((inst &lt;&lt; 51) &gt;&gt; 63) &lt;&lt; 5 |<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (inst &lt;&lt; 57) &gt;&gt; 59;<br>
+=C2=A0 =C2=A0 if (isa =3D=3D rv128) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imm =3D imm | (imm &amp; 32) &lt;&lt; 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imm =3D imm ? imm : 64;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return imm;<br>
=C2=A0}<br>
<br>
=C2=A0static int32_t operand_cimmi(rv_inst inst)<br>
@@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)<br>
<br>
=C2=A0/* decode operands */<br>
<br>
-static void decode_inst_operands(rv_decode *dec)<br>
+static void decode_inst_operands(rv_decode *dec, rv_isa isa)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0rv_inst inst =3D dec-&gt;inst;<br>
=C2=A0 =C2=A0 =C2=A0dec-&gt;codec =3D opcode_data[dec-&gt;op].codec;<br>
@@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)<br>
=C2=A0 =C2=A0 =C2=A0case rv_codec_cb_sh6:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec-&gt;rd =3D dec-&gt;rs1 =3D operand_cr=
s1rdq(inst) + 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec-&gt;rs2 =3D rv_ireg_zero;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dec-&gt;imm =3D operand_cimmsh6(inst);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dec-&gt;imm =3D operand_cimmshr6(inst, isa);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case rv_codec_ci:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec-&gt;rd =3D dec-&gt;rs1 =3D operand_cr=
s1rd(inst);<br>
@@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)<br>
=C2=A0 =C2=A0 =C2=A0case rv_codec_ci_sh6:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec-&gt;rd =3D dec-&gt;rs1 =3D operand_cr=
s1rd(inst);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec-&gt;rs2 =3D rv_ireg_zero;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dec-&gt;imm =3D operand_cimmsh6(inst);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dec-&gt;imm =3D operand_cimmshl6(inst, isa);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case rv_codec_ci_16sp:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dec-&gt;rd =3D rv_ireg_sp;<br>
@@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uin=
t64_t pc, rv_inst inst)<br>
=C2=A0 =C2=A0 =C2=A0dec.pc =3D pc;<br>
=C2=A0 =C2=A0 =C2=A0dec.inst =3D inst;<br>
=C2=A0 =C2=A0 =C2=A0decode_inst_opcode(&amp;dec, isa);<br>
-=C2=A0 =C2=A0 decode_inst_operands(&amp;dec);<br>
+=C2=A0 =C2=A0 decode_inst_operands(&amp;dec, isa);<br>
=C2=A0 =C2=A0 =C2=A0decode_inst_decompress(&amp;dec, isa);<br>
=C2=A0 =C2=A0 =C2=A0decode_inst_lift_pseudo(&amp;dec);<br>
=C2=A0 =C2=A0 =C2=A0format_inst(buf, buflen, 16, &amp;dec);<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index 63b04e8a94..d7c82a9c81 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int reg=
)<br>
=C2=A0 =C2=A0 =C2=A0return 8 + reg;<br>
=C2=A0}<br>
<br>
-static int ex_rvc_shifti(DisasContext *ctx, int imm)<br>
+static int ex_rvc_shiftli(DisasContext *ctx, int imm)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* For RV128 a shamt of 0 means a shift by 64. */<br>
-=C2=A0 =C2=A0 return imm ? imm : 64;<br>
+=C2=A0 =C2=A0 if (get_ol(ctx) =3D=3D MXL_RV128) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imm =3D imm ? imm : 64;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return imm;<br>
+}<br>
+<br>
+static int ex_rvc_shiftri(DisasContext *ctx, int imm)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* For RV128 a shamt of 0 means a shift by 64, furtherm=
ore, for right<br>
+=C2=A0 =C2=A0 =C2=A0* shifts, the shamt is sign-extended.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (get_ol(ctx) =3D=3D MXL_RV128) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imm =3D imm | (imm &amp; 32) &lt;&lt; 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imm =3D imm ? imm : 64;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return imm;<br>
=C2=A0}<br>
<br>
=C2=A0/* Include the auto-generated decoder for 32 bit insn */<br>
-- <br>
2.36.1<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000001b080a05e389cf3a--

