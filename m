Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB8A5-0001k3-Me
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 01:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB8A4-0001jo-9m; Tue, 12 Jul 2022 01:10:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB8A2-0005WG-Ae; Tue, 12 Jul 2022 01:10:15 -0400
Received: by mail-pg1-x533.google.com with SMTP id g4so6631965pgc.1;
 Mon, 11 Jul 2022 22:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6SEvyiQKdjhVdlBPZEkj/W1tMoGioU8MRXqX5+sdTDQ=;
 b=oKTRpZPulXxujkv3Rx2H97H8LeKQeQk9uwWV0n4qbH0jJg8qKfxHDqVo4SZKfcfBac
 0CufnJVBo+0iOTknOgZcB+du8wu9z+SEtzEjy5siz4GKuvaDu7fqDrOKF0KBGxGr9LxT
 kiqHA7GQqCtksre25cnS59mQDRMg2ecsJTDO0m2F0kGPhr56Y3TB6omcBUpwvEanLWbh
 QmPxABGksdXq0z0JV24AUkxB2GLWjOdIi5vUmXennnntutCxVAPocS2FBQUQf6yxAHHX
 y3Uw56NXTnI2Vm49oEVT+TtMBHYwfCp5KZ4Plwrmiyl/5Mv7gFVP36gGjwHHNJiLWDLf
 3qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6SEvyiQKdjhVdlBPZEkj/W1tMoGioU8MRXqX5+sdTDQ=;
 b=Dzpi0stAWr0C/eYDlI7zW5+A2Z0+axfAkB0aUgrFw+llKxXDMoekSnd954CGEpRZGd
 yCBnVJD93Sx7O3kRDNBuefq2qJ/s85d+uoh5rMeo8mpLrpYXC1F7If0UKVJGR20WdC+g
 utWL3Adl02OTiyT/QfZ+u2Qm5XXqStqORLNrYouVM2WvjBmiUPCpyUtOZ/YhFEb3gSa8
 3ZhmyQewO3nT9xfUmuKuoWBtfLNFxJfMQziGkt3AzaQTJSA7fq3TwLp8z6mfjkoVQekw
 4oQmTD6mwzdIrpb8jn61A/KDBOMP4v5kzpDfpA7bc1R4pckTlevOWGantE2/HcQ9xQbB
 YRAw==
X-Gm-Message-State: AJIora+sBZSpupxvPP7d1mq/AsrMOvx2ozfdmN4R25uDxqeGfAIE6S0S
 n3d4HRc3TZMd3C04DdZlSwOm5F/FURDix2n/TYs=
X-Google-Smtp-Source: AGRyM1spDqeMI54L+5b30nu1HX04j8j+KHvy4YW4vnQ/r9T2WS4IHtZkxn9UIGedoXy2M/JJ2HiMJniYjCMUfJ/riGE=
X-Received: by 2002:a05:6a00:1303:b0:528:2ed8:7e86 with SMTP id
 j3-20020a056a00130300b005282ed87e86mr21670105pfu.4.1657602612442; Mon, 11 Jul
 2022 22:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Jul 2022 15:09:46 +1000
Message-ID: <CAKmqyKPs2VObeLPPPAKJmAZpD9T-_m4d0tbsVWFWztBN-xBrfA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Tue, 12 Jul 2022 05:10:16 -0000

On Sun, Jul 10, 2022 at 9:05 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c
> it stays 0 and is a hint instruction that does not change processor state=
.
> For rv128c right shifts, the 6-bit shamt is in addition sign extended to
> 7 bits.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Thanks!

Applied to riscv-to-apply.next

Alistair

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
> @@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, u=
int64_t pc, rv_inst inst)
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
> @@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int r=
eg)
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

