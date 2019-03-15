Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4eEE-00007g-9d
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 00:13:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4eE9-00005h-Km
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 00:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4dzz-0000eQ-C8
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 23:59:14 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h4dzy-0000dy-P9
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 23:59:11 -0400
Received: by mail-pg1-x542.google.com with SMTP id e17so5469165pgd.2
	for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2019 20:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=nfGSJGq9GKZv0TIRIudJVlPt8Qde1fPSiawgxF+vXy4=;
	b=ZoL1SkF4L7emOYT/T1XNzBsTI0sO7dD4L2PGm0ExDexQbRuCqWdjZW58itlNcp1TWj
	V86ZTlwKoXypya9J45CdvdU86xi5vUi6NX0/oRAoJLNCm6R2JjFmET1f2jXmyYE9VDFe
	Kio5ahTv9SoLflWXbkDzEot3pVHO52vKqRE1w8UFFOA050W3+AjIT++IZYnRnkr3WqDs
	fSshuWrKZHHc+4/FiNuY/M4JusOHLmeVYGKYi3pow3DB1dbEhfxZVkiEgiZwljeU4DtQ
	u8QzzWnancW1c4AvdJ41ZoOMpSteE/SFFgPFPxgwqfRF6bH7cIdhEgGbF/bR7sfHLZqT
	c/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=nfGSJGq9GKZv0TIRIudJVlPt8Qde1fPSiawgxF+vXy4=;
	b=G/R6192n57jACs0LrhQChuzJ9+frMgfi9lc5rJUbIDp5JfERC9rmevYy1LHTw41QGG
	vG19YktD/UkHCQEIGbE/KFQOBJMvyM4m8QZg6F+vM5SGFKu7vQfoI8/Da/hU40QiBjV8
	g8egjWFe8V3mC7S6p8CRRxhXzN/oRDE6CPeDx50p4cWx5HhT8aYM/Zq0ipuIip8jAXoo
	dR6Nntw17IA4BGWsF98iFxhEmia9a7vIL3M8+2fQyfLqbAZOtmntUWWpEGNqX6oU5A8t
	neL55YyfoobdRL2Rs0pQwlU/+mnDkXlVcYJcIM6n6ZDDYbrbBAg/w7vSUbs9qcWkXTEW
	o6bw==
X-Gm-Message-State: APjAAAVhecz/mJyhNKtn67B4NTmJuVeIOfSK3QBKRLT7Irqkg23Ekmtl
	RZC+pJLmYB+FzGmdlTQymXh/eg==
X-Google-Smtp-Source: APXvYqxHEbeBgtlBCHfxlsO6zeYaDi5wvqAfwTjnX2xTOjvmtdAAO5IAJnEKlxRD8c15g2BKeypaEQ==
X-Received: by 2002:a17:902:2ba7:: with SMTP id
	l36mr716474plb.237.1552622349457; 
	Thu, 14 Mar 2019 20:59:09 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1b83-111e-e05a-fecf-ca59.dynamic-ip6.hinet.net.
	[2001:b011:7001:1b83:111e:e05a:fecf:ca59])
	by smtp.gmail.com with ESMTPSA id y7sm1010060pgf.42.2019.03.14.20.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 20:59:08 -0700 (PDT)
Date: Thu, 14 Mar 2019 20:59:08 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Mar 2019 20:58:57 PDT (-0700)
In-Reply-To: <CAKmqyKPAFOBfppfozwNfJ=TS6kC=+x1VPDB2OxQ7SHYkpT1kvQ@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	peer.adelt@hni.uni-paderborn.de, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-730b69a2-8553-411c-8584-3b2a2201b392@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 17/29] target/riscv: Convert
 quadrant 1 of RVXC insns to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 04:13:52 -0000

On Thu, 14 Mar 2019 13:28:37 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Mar 13, 2019 at 7:53 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>
> This commit is the first bad commit in breaking 32-bit boot.
>
> It looks like the jal doesn't jump to the correct address:
>
> ----------------
> IN:
> 0x80000022:  00050433          add             s0,a0,zero
> 0x80000026:  000584b3          add             s1,a1,zero
> 0x8000002a:  2c79              jal             ra,670          # 0x800002c8
>
> ----------------
> IN:
> 0x800002c8:  00000533          add             a0,zero,zero
> 0x800002cc:  8082              ret


Sorry, for some reason I thought you'd tested this on 32-bit?  Do you have a 
workflow that I can use to reproduce the bug?

>
>
> Alistair
>
>> ---
>>  target/riscv/insn16.decode              |  43 +++++++
>>  target/riscv/insn_trans/trans_rvc.inc.c | 151 ++++++++++++++++++++++++
>>  target/riscv/translate.c                | 118 +-----------------
>>  3 files changed, 195 insertions(+), 117 deletions(-)
>>
>> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
>> index 558c0c41f0b5..45109301c6d4 100644
>> --- a/target/riscv/insn16.decode
>> +++ b/target/riscv/insn16.decode
>> @@ -22,28 +22,53 @@
>>  %rs2_3     2:3                !function=ex_rvc_register
>>
>>  # Immediates:
>> +%imm_ci        12:s1 2:5
>>  %nzuimm_ciw    7:4 11:2 5:1 6:1   !function=ex_shift_2
>>  %uimm_cl_d     5:2 10:3           !function=ex_shift_3
>>  %uimm_cl_w     5:1 10:3 6:1       !function=ex_shift_2
>> +%imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
>> +%imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
>> +
>> +%nzuimm_6bit   12:1 2:5
>> +
>> +%imm_addi16sp  12:s1 3:2 5:1 2:1 6:1 !function=ex_shift_4
>> +%imm_lui       12:s1 2:5             !function=ex_shift_12
>> +
>>
>>
>>  # Argument sets:
>>  &cl               rs1 rd
>>  &cl_dw     uimm   rs1 rd
>> +&ci        imm        rd
>>  &ciw       nzuimm     rd
>>  &cs               rs1 rs2
>>  &cs_dw     uimm   rs1 rs2
>> +&cb        imm    rs1
>> +&cr               rd  rs2
>> +&cj       imm
>> +&c_shift   shamt      rd
>> +
>>
>> +&caddi16sp_lui  imm_lui imm_addi16sp rd
>>
>>  # Formats 16:
>> +@ci        ... . ..... .....  .. &ci     imm=%imm_ci                  %rd
>>  @ciw       ...   ........ ... .. &ciw    nzuimm=%nzuimm_ciw           rd=%rs2_3
>>  @cl_d      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rd=%rs2_3
>>  @cl_w      ... ... ... .. ... .. &cl_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rd=%rs2_3
>>  @cl        ... ... ... .. ... .. &cl                      rs1=%rs1_3  rd=%rs2_3
>>  @cs        ... ... ... .. ... .. &cs                      rs1=%rs1_3  rs2=%rs2_3
>> +@cs_2      ... ... ... .. ... .. &cr                      rd=%rs1_3   rs2=%rs2_3
>>  @cs_d      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_d  rs1=%rs1_3  rs2=%rs2_3
>>  @cs_w      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_w  rs1=%rs1_3  rs2=%rs2_3
>> +@cb        ... ... ... .. ... .. &cb     imm=%imm_cb      rs1=%rs1_3
>> +@cj        ...    ........... .. &cj     imm=%imm_cj
>>
>> +@c_addi16sp_lui ... .  ..... ..... .. &caddi16sp_lui %imm_lui %imm_addi16sp %rd
>> +
>> +@c_shift        ... . .. ... ..... .. &c_shift rd=%rs1_3 shamt=%nzuimm_6bit
>> +
>> +@c_andi         ... . .. ... ..... .. &ci imm=%imm_ci rd=%rs1_3
>>
>>  # *** RV64C Standard Extension (Quadrant 0) ***
>>  c_addi4spn        000    ........ ... 00 @ciw
>> @@ -53,3 +78,21 @@ c_flw_ld          011  --- ... -- ... 00 @cl    #Note: Must parse uimm manually
>>  c_fsd             101  ... ... .. ... 00 @cs_d
>>  c_sw              110  ... ... .. ... 00 @cs_w
>>  c_fsw_sd          111  --- ... -- ... 00 @cs    #Note: Must parse uimm manually
>> +
>> +# *** RV64C Standard Extension (Quadrant 1) ***
>> +c_addi            000 .  .....  ..... 01 @ci
>> +c_jal_addiw       001 .  .....  ..... 01 @ci #Note: parse rd and/or imm manually
>> +c_li              010 .  .....  ..... 01 @ci
>> +c_addi16sp_lui    011 .  .....  ..... 01 @c_addi16sp_lui # shares opc with C.LUI
>> +c_srli            100 . 00 ...  ..... 01 @c_shift
>> +c_srai            100 . 01 ...  ..... 01 @c_shift
>> +c_andi            100 . 10 ...  ..... 01 @c_andi
>> +c_sub             100 0 11 ... 00 ... 01 @cs_2
>> +c_xor             100 0 11 ... 01 ... 01 @cs_2
>> +c_or              100 0 11 ... 10 ... 01 @cs_2
>> +c_and             100 0 11 ... 11 ... 01 @cs_2
>> +c_subw            100 1 11 ... 00 ... 01 @cs_2
>> +c_addw            100 1 11 ... 01 ... 01 @cs_2
>> +c_j               101     ........... 01 @cj
>> +c_beqz            110  ... ...  ..... 01 @cb
>> +c_bnez            111  ... ...  ..... 01 @cb
>> diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
>> index 93ec8aa30b95..b06c435c9800 100644
>> --- a/target/riscv/insn_trans/trans_rvc.inc.c
>> +++ b/target/riscv/insn_trans/trans_rvc.inc.c
>> @@ -73,3 +73,154 @@ static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
>>      return false;
>>  #endif
>>  }
>> +
>> +static bool trans_c_addi(DisasContext *ctx, arg_c_addi *a)
>> +{
>> +    if (a->imm == 0) {
>> +        /* Hint: insn is valid but does not affect state */
>> +        return true;
>> +    }
>> +    arg_addi arg = { .rd = a->rd, .rs1 = a->rd, .imm = a->imm };
>> +    return trans_addi(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
>> +{
>> +#ifdef TARGET_RISCV32
>> +    /* C.JAL */
>> +    arg_jal arg = { .rd = 1, .imm = a->imm };
>> +    return trans_jal(ctx, &arg);
>> +#else
>> +    /* C.ADDIW */
>> +    arg_addiw arg = { .rd = a->rd, .rs1 = a->rd, .imm = a->imm };
>> +    return trans_addiw(ctx, &arg);
>> +#endif
>> +}
>> +
>> +static bool trans_c_li(DisasContext *ctx, arg_c_li *a)
>> +{
>> +    if (a->rd == 0) {
>> +        /* Hint: insn is valid but does not affect state */
>> +        return true;
>> +    }
>> +    arg_addi arg = { .rd = a->rd, .rs1 = 0, .imm = a->imm };
>> +    return trans_addi(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_addi16sp_lui(DisasContext *ctx, arg_c_addi16sp_lui *a)
>> +{
>> +    if (a->rd == 2) {
>> +        /* C.ADDI16SP */
>> +        arg_addi arg = { .rd = 2, .rs1 = 2, .imm = a->imm_addi16sp };
>> +        return trans_addi(ctx, &arg);
>> +    } else if (a->imm_lui != 0) {
>> +        /* C.LUI */
>> +        if (a->rd == 0) {
>> +            /* Hint: insn is valid but does not affect state */
>> +            return true;
>> +        }
>> +        arg_lui arg = { .rd = a->rd, .imm = a->imm_lui };
>> +        return trans_lui(ctx, &arg);
>> +    }
>> +    return false;
>> +}
>> +
>> +static bool trans_c_srli(DisasContext *ctx, arg_c_srli *a)
>> +{
>> +    int shamt = a->shamt;
>> +    if (shamt == 0) {
>> +        /* For RV128 a shamt of 0 means a shift by 64 */
>> +        shamt = 64;
>> +    }
>> +    /* Ensure, that shamt[5] is zero for RV32 */
>> +    if (shamt >= TARGET_LONG_BITS) {
>> +        return false;
>> +    }
>> +
>> +    arg_srli arg = { .rd = a->rd, .rs1 = a->rd, .shamt = a->shamt };
>> +    return trans_srli(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_srai(DisasContext *ctx, arg_c_srai *a)
>> +{
>> +    int shamt = a->shamt;
>> +    if (shamt == 0) {
>> +        /* For RV128 a shamt of 0 means a shift by 64 */
>> +        shamt = 64;
>> +    }
>> +    /* Ensure, that shamt[5] is zero for RV32 */
>> +    if (shamt >= TARGET_LONG_BITS) {
>> +        return false;
>> +    }
>> +
>> +    arg_srai arg = { .rd = a->rd, .rs1 = a->rd, .shamt = a->shamt };
>> +    return trans_srai(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_andi(DisasContext *ctx, arg_c_andi *a)
>> +{
>> +    arg_andi arg = { .rd = a->rd, .rs1 = a->rd, .imm = a->imm };
>> +    return trans_andi(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_sub(DisasContext *ctx, arg_c_sub *a)
>> +{
>> +    arg_sub arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
>> +    return trans_sub(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_xor(DisasContext *ctx, arg_c_xor *a)
>> +{
>> +    arg_xor arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
>> +    return trans_xor(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_or(DisasContext *ctx, arg_c_or *a)
>> +{
>> +    arg_or arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
>> +    return trans_or(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_and(DisasContext *ctx, arg_c_and *a)
>> +{
>> +    arg_and arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
>> +    return trans_and(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_subw(DisasContext *ctx, arg_c_subw *a)
>> +{
>> +#ifdef TARGET_RISCV64
>> +    arg_subw arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
>> +    return trans_subw(ctx, &arg);
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>> +static bool trans_c_addw(DisasContext *ctx, arg_c_addw *a)
>> +{
>> +#ifdef TARGET_RISCV64
>> +    arg_addw arg = { .rd = a->rd, .rs1 = a->rd, .rs2 = a->rs2 };
>> +    return trans_addw(ctx, &arg);
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>> +static bool trans_c_j(DisasContext *ctx, arg_c_j *a)
>> +{
>> +    arg_jal arg = { .rd = 0, .imm = a->imm };
>> +    return trans_jal(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_beqz(DisasContext *ctx, arg_c_beqz *a)
>> +{
>> +    arg_beq arg = { .rs1 = a->rs1, .rs2 = 0, .imm = a->imm };
>> +    return trans_beq(ctx, &arg);
>> +}
>> +
>> +static bool trans_c_bnez(DisasContext *ctx, arg_c_bnez *a)
>> +{
>> +    arg_bne arg = { .rs1 = a->rs1, .rs2 = 0, .imm = a->imm };
>> +    return trans_bne(ctx, &arg);
>> +}
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 0106fa8d51b3..a584c24fbf6b 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -828,120 +828,6 @@ static void decode_RV32_64C0(DisasContext *ctx)
>>      }
>>  }
>>
>> -static void decode_RV32_64C1(DisasContext *ctx)
>> -{
>> -    uint8_t funct3 = extract32(ctx->opcode, 13, 3);
>> -    uint8_t rd_rs1 = GET_C_RS1(ctx->opcode);
>> -    uint8_t rs1s, rs2s;
>> -    uint8_t funct2;
>> -
>> -    switch (funct3) {
>> -    case 0:
>> -        /* C.ADDI -> addi rd, rd, nzimm[5:0] */
>> -        gen_arith_imm(ctx, OPC_RISC_ADDI, rd_rs1, rd_rs1,
>> -                      GET_C_IMM(ctx->opcode));
>> -        break;
>> -    case 1:
>> -#if defined(TARGET_RISCV64)
>> -        /* C.ADDIW (RV64/128) -> addiw rd, rd, imm[5:0]*/
>> -        gen_arith_imm(ctx, OPC_RISC_ADDIW, rd_rs1, rd_rs1,
>> -                      GET_C_IMM(ctx->opcode));
>> -#else
>> -        /* C.JAL(RV32) -> jal x1, offset[11:1] */
>> -        gen_jal(ctx, 1, GET_C_J_IMM(ctx->opcode));
>> -#endif
>> -        break;
>> -    case 2:
>> -        /* C.LI -> addi rd, x0, imm[5:0]*/
>> -        gen_arith_imm(ctx, OPC_RISC_ADDI, rd_rs1, 0, GET_C_IMM(ctx->opcode));
>> -        break;
>> -    case 3:
>> -        if (rd_rs1 == 2) {
>> -            /* C.ADDI16SP -> addi x2, x2, nzimm[9:4]*/
>> -            gen_arith_imm(ctx, OPC_RISC_ADDI, 2, 2,
>> -                          GET_C_ADDI16SP_IMM(ctx->opcode));
>> -        } else if (rd_rs1 != 0) {
>> -            /* C.LUI (rs1/rd =/= {0,2}) -> lui rd, nzimm[17:12]*/
>> -            tcg_gen_movi_tl(cpu_gpr[rd_rs1],
>> -                            GET_C_IMM(ctx->opcode) << 12);
>> -        }
>> -        break;
>> -    case 4:
>> -        funct2 = extract32(ctx->opcode, 10, 2);
>> -        rs1s = GET_C_RS1S(ctx->opcode);
>> -        switch (funct2) {
>> -        case 0: /* C.SRLI(RV32) -> srli rd', rd', shamt[5:0] */
>> -            gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, rs1s, rs1s,
>> -                               GET_C_ZIMM(ctx->opcode));
>> -            /* C.SRLI64(RV128) */
>> -            break;
>> -        case 1:
>> -            /* C.SRAI -> srai rd', rd', shamt[5:0]*/
>> -            gen_arith_imm(ctx, OPC_RISC_SHIFT_RIGHT_I, rs1s, rs1s,
>> -                            GET_C_ZIMM(ctx->opcode) | 0x400);
>> -            /* C.SRAI64(RV128) */
>> -            break;
>> -        case 2:
>> -            /* C.ANDI -> andi rd', rd', imm[5:0]*/
>> -            gen_arith_imm(ctx, OPC_RISC_ANDI, rs1s, rs1s,
>> -                          GET_C_IMM(ctx->opcode));
>> -            break;
>> -        case 3:
>> -            funct2 = extract32(ctx->opcode, 5, 2);
>> -            rs2s = GET_C_RS2S(ctx->opcode);
>> -            switch (funct2) {
>> -            case 0:
>> -                /* C.SUB -> sub rd', rd', rs2' */
>> -                if (extract32(ctx->opcode, 12, 1) == 0) {
>> -                    gen_arith(ctx, OPC_RISC_SUB, rs1s, rs1s, rs2s);
>> -                }
>> -#if defined(TARGET_RISCV64)
>> -                else {
>> -                    gen_arith(ctx, OPC_RISC_SUBW, rs1s, rs1s, rs2s);
>> -                }
>> -#endif
>> -                break;
>> -            case 1:
>> -                /* C.XOR -> xor rs1', rs1', rs2' */
>> -                if (extract32(ctx->opcode, 12, 1) == 0) {
>> -                    gen_arith(ctx, OPC_RISC_XOR, rs1s, rs1s, rs2s);
>> -                }
>> -#if defined(TARGET_RISCV64)
>> -                else {
>> -                    /* C.ADDW (RV64/128) */
>> -                    gen_arith(ctx, OPC_RISC_ADDW, rs1s, rs1s, rs2s);
>> -                }
>> -#endif
>> -                break;
>> -            case 2:
>> -                /* C.OR -> or rs1', rs1', rs2' */
>> -                gen_arith(ctx, OPC_RISC_OR, rs1s, rs1s, rs2s);
>> -                break;
>> -            case 3:
>> -                /* C.AND -> and rs1', rs1', rs2' */
>> -                gen_arith(ctx, OPC_RISC_AND, rs1s, rs1s, rs2s);
>> -                break;
>> -            }
>> -            break;
>> -        }
>> -        break;
>> -    case 5:
>> -        /* C.J -> jal x0, offset[11:1]*/
>> -        gen_jal(ctx, 0, GET_C_J_IMM(ctx->opcode));
>> -        break;
>> -    case 6:
>> -        /* C.BEQZ -> beq rs1', x0, offset[8:1]*/
>> -        rs1s = GET_C_RS1S(ctx->opcode);
>> -        gen_branch(ctx, OPC_RISC_BEQ, rs1s, 0, GET_C_B_IMM(ctx->opcode));
>> -        break;
>> -    case 7:
>> -        /* C.BNEZ -> bne rs1', x0, offset[8:1]*/
>> -        rs1s = GET_C_RS1S(ctx->opcode);
>> -        gen_branch(ctx, OPC_RISC_BNE, rs1s, 0, GET_C_B_IMM(ctx->opcode));
>> -        break;
>> -    }
>> -}
>> -
>>  static void decode_RV32_64C2(DisasContext *ctx)
>>  {
>>      uint8_t rd, rs2;
>> @@ -1028,9 +914,6 @@ static void decode_RV32_64C(DisasContext *ctx)
>>      case 0:
>>          decode_RV32_64C0(ctx);
>>          break;
>> -    case 1:
>> -        decode_RV32_64C1(ctx);
>> -        break;
>>      case 2:
>>          decode_RV32_64C2(ctx);
>>          break;
>> @@ -1045,6 +928,7 @@ static void decode_RV32_64C(DisasContext *ctx)
>>  EX_SH(1)
>>  EX_SH(2)
>>  EX_SH(3)
>> +EX_SH(4)
>>  EX_SH(12)
>>
>>  #define REQUIRE_EXT(ctx, ext) do { \
>> --
>> 2.19.2
>>
>>

