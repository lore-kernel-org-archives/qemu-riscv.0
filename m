Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hbiMX-0005hz-0e
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jun 2019 05:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37746)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hbiMP-0005gq-6p
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hbiMN-0002Wl-Ez
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:19:01 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:44141)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hbiMN-0002WJ-9r
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:18:59 -0400
Received: by mail-yb1-f194.google.com with SMTP id x187so786231ybc.11
 for <qemu-riscv@nongnu.org>; Fri, 14 Jun 2019 02:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MKSedTkp3zp/P8418U7boPHVAMWNJ3vSIOJ9sfGhz5Y=;
 b=JA7cP/ALBpyyuJ41KuhD/fZvrQrlYqVgEhxUZrS14roE5TXpgWZsSjcdtvTz+jPxfq
 WiwCuuJBAn2Iy10jP98AyErBWOgR1AKjF0t846tMRQCVfaJW4o9r+Uf3ErUc0J2OK+oB
 vqsZvVz2bKnumU95R7QRfzz9fD7/x9lJDkEHBh3PIm2Uo4Dz3/bfGpcWMh/x/fwTRDfU
 NYez4oupyJ5U7xdL9LwJE6EEuH87clpLy1JuWAY6oMdR5mU6RwmazNxngXpDCSWse/fQ
 JTcF3sGsJ1YsCmthL84iwYHFSIcILMXplYBfmxUPqUwuwlkil++1dhUlWNUbG7EXahkU
 2yWA==
X-Gm-Message-State: APjAAAUdr/6r5nmRu8PQI2oXupACU4Wwdj4aNTNdtPz4zgZVsOEdvgFV
 ZqbRe/dg0/nsDUk/S6L6cXFR6A==
X-Google-Smtp-Source: APXvYqzKyum+4MrYgB/8cBiGlOeh9rNFVhcF3bdMP/Y4kcdxxVsnPAQb5Pwgapbmt+44TaehdrkfvA==
X-Received: by 2002:a25:9d84:: with SMTP id v4mr44655139ybp.88.1560503937950; 
 Fri, 14 Jun 2019 02:18:57 -0700 (PDT)
Received: from localhost ([83.137.6.186])
 by smtp.gmail.com with ESMTPSA id 205sm621229yws.46.2019.06.14.02.18.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 02:18:57 -0700 (PDT)
Date: Fri, 14 Jun 2019 02:18:57 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Jun 2019 02:18:48 PDT (-0700)
In-Reply-To: <4e552352bb35b1f4b086e260be369464df7c490e.1558131003.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-96573692-b788-4185-85a6-435e87a7d7eb@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.219.194
Subject: Re: [Qemu-riscv] [PATCH v1 2/4] disas/riscv: Disassemble reserved
 compressed encodings as illegal
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jun 2019 09:19:03 -0000

On Fri, 17 May 2019 15:11:01 PDT (-0700), Alistair Francis wrote:
> From: Michael Clark <mjc@sifive.com>
>
> Due to the design of the disassembler, the immediate is not
> known during decoding of the opcode; so to handle compressed
> encodings with reserved immediate values (non-zero), we need
> to add an additional check during decompression to match
> reserved encodings with zero immediates and translate them
> into the illegal instruction.
>
> The following compressed opcodes have reserved encodings with
> zero immediates: c.addi4spn, c.addi, c.lui, c.addi16sp, c.srli,
> c.srai, c.andi and c.slli
>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  disas/riscv.c | 51 ++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 59a9b0437a..3ab4586f0a 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -504,14 +504,19 @@ typedef struct {
>      const rvc_constraint *constraints;
>  } rv_comp_data;
>
> +enum {
> +    rvcd_imm_nz = 0x1
> +};
> +
>  typedef struct {
>      const char * const name;
>      const rv_codec codec;
>      const char * const format;
>      const rv_comp_data *pseudo;
> -    const int decomp_rv32;
> -    const int decomp_rv64;
> -    const int decomp_rv128;
> +    const short decomp_rv32;
> +    const short decomp_rv64;
> +    const short decomp_rv128;
> +    const short decomp_data;
>  } rv_opcode_data;
>
>  /* register names */
> @@ -1011,7 +1016,7 @@ const rv_opcode_data opcode_data[] = {
>      { "fcvt.q.lu", rv_codec_r_m, rv_fmt_rm_frd_rs1, NULL, 0, 0, 0 },
>      { "fmv.x.q", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
>      { "fmv.q.x", rv_codec_r, rv_fmt_frd_rs1, NULL, 0, 0, 0 },
> -    { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> +    { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi, rvcd_imm_nz },
>      { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld, rv_op_fld, 0 },
>      { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_op_lw, rv_op_lw },
>      { "c.flw", rv_codec_cl_lw, rv_fmt_frd_offset_rs1, NULL, rv_op_flw, 0, 0 },
> @@ -1019,14 +1024,14 @@ const rv_opcode_data opcode_data[] = {
>      { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_op_sw, rv_op_sw },
>      { "c.fsw", rv_codec_cs_sw, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw, 0, 0 },
>      { "c.nop", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> -    { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> +    { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi, rvcd_imm_nz },
>      { "c.jal", rv_codec_cj_jal, rv_fmt_rd_offset, NULL, rv_op_jal, 0, 0 },
>      { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> -    { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> -    { "c.lui", rv_codec_ci_lui, rv_fmt_rd_imm, NULL, rv_op_lui, rv_op_lui, rv_op_lui },
> -    { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srli, rv_op_srli, rv_op_srli },
> -    { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai, rv_op_srai, rv_op_srai },
> -    { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi, rv_op_andi, rv_op_andi },
> +    { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi, rvcd_imm_nz },
> +    { "c.lui", rv_codec_ci_lui, rv_fmt_rd_imm, NULL, rv_op_lui, rv_op_lui, rv_op_lui, rvcd_imm_nz },
> +    { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srli, rv_op_srli, rv_op_srli, rvcd_imm_nz },
> +    { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai, rv_op_srai, rv_op_srai, rvcd_imm_nz },
> +    { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi, rv_op_andi, rv_op_andi, rvcd_imm_nz },

Unless I'm missing something, c.andi can have a zero immediate.

>      { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_sub, rv_op_sub },
>      { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xor, rv_op_xor },
>      { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or, rv_op_or },
> @@ -1036,7 +1041,7 @@ const rv_opcode_data opcode_data[] = {
>      { "c.j", rv_codec_cj, rv_fmt_rd_offset, NULL, rv_op_jal, rv_op_jal, rv_op_jal },
>      { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_beq, rv_op_beq, rv_op_beq },
>      { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne, rv_op_bne, rv_op_bne },
> -    { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_slli, rv_op_slli, rv_op_slli },
> +    { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_slli, rv_op_slli, rv_op_slli, rvcd_imm_nz },
>      { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fld, rv_op_fld, rv_op_fld },
>      { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_op_lw, rv_op_lw },
>      { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, NULL, rv_op_flw, 0, 0 },
> @@ -2795,8 +2800,12 @@ static void decode_inst_decompress_rv32(rv_decode *dec)
>  {
>      int decomp_op = opcode_data[dec->op].decomp_rv32;
>      if (decomp_op != rv_op_illegal) {
> -        dec->op = decomp_op;
> -        dec->codec = opcode_data[decomp_op].codec;
> +        if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz) && dec->imm == 0) {
> +            dec->op = rv_op_illegal;
> +        } else {
> +            dec->op = decomp_op;
> +            dec->codec = opcode_data[decomp_op].codec;
> +        }
>      }
>  }
>
> @@ -2804,8 +2813,12 @@ static void decode_inst_decompress_rv64(rv_decode *dec)
>  {
>      int decomp_op = opcode_data[dec->op].decomp_rv64;
>      if (decomp_op != rv_op_illegal) {
> -        dec->op = decomp_op;
> -        dec->codec = opcode_data[decomp_op].codec;
> +        if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz) && dec->imm == 0) {
> +            dec->op = rv_op_illegal;
> +        } else {
> +            dec->op = decomp_op;
> +            dec->codec = opcode_data[decomp_op].codec;
> +        }
>      }
>  }
>
> @@ -2813,8 +2826,12 @@ static void decode_inst_decompress_rv128(rv_decode *dec)
>  {
>      int decomp_op = opcode_data[dec->op].decomp_rv128;
>      if (decomp_op != rv_op_illegal) {
> -        dec->op = decomp_op;
> -        dec->codec = opcode_data[decomp_op].codec;
> +        if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz) && dec->imm == 0) {
> +            dec->op = rv_op_illegal;
> +        } else {
> +            dec->op = decomp_op;
> +            dec->codec = opcode_data[decomp_op].codec;
> +        }
>      }
>  }

