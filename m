Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAzUk-0005tF-VG
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 15:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAzUj-0005sB-4i; Mon, 11 Jul 2022 15:55:01 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:42374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAzUc-0005ok-KL; Mon, 11 Jul 2022 15:54:57 -0400
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9A7D640277;
 Mon, 11 Jul 2022 21:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1657569286;
 bh=lz2OTPfUcg5Oh1SgR3jDsi1gAaIKt0fA6daES4+4ik4=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=OOKu2HU9vdcOyVdy3qmVZUAK/WJuTRBuTs/I5DCZ5KGA2umzilY0lYUjgNWl7yOS/
 D0v55TTQWafymKIShzLxARIeL5m4TVMaWHZEIGRHfSrLnmnTnLgjHwrPYz796jik+3
 o+pjSwqzJPPl0LLdwL09VQgD9GRcTzNYYJh3bGvpYNWgppf9XbxQ4IRjg7QY6bLgO/
 /DpJaMlJ06TWlQmtVUgUPM7LYItlfLmEzmc5Yo52yOefGvqhH7OyXLsgOGgy0yUL9e
 umY+4d3aFiuWbbqlKgI2rllz1Zu8wWlNlBkqzIR+7SOZd3Lzj/gK1bzK8Pzh+MBTNl
 C9cxeIHmEo0MQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhub.u-ga.fr (Postfix) with ESMTP id 97B4F10005A;
 Mon, 11 Jul 2022 21:54:46 +0200 (CEST)
Received: from [192.168.5.58] (unknown [37.72.194.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id E352B40054;
 Mon, 11 Jul 2022 21:54:36 +0200 (CEST)
Message-ID: <381a2feb-fddc-da5e-c94a-d2f5d3471297@univ-grenoble-alpes.fr>
Date: Mon, 11 Jul 2022 21:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
 <CAFXwXr=OK38-vFo7+1z4RtqKcr9hz74bVxb__q6xi7rkyziMUw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
In-Reply-To: <CAFXwXr=OK38-vFo7+1z4RtqKcr9hz74bVxb__q6xi7rkyziMUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 11 Jul 2022 19:55:01 -0000

Hi Richard,

Le 11/07/2022 à 06:44, Richard Henderson a écrit :
> On Sun, 10 July 2022, 16:36 Frédéric Pétrot, 
> <frederic.petrot@univ-grenoble-alpes.fr 
> <mailto:frederic.petrot@univ-grenoble-alpes.fr>> wrote:
> 
>     For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c
>     it stays 0 and is a hint instruction that does not change processor state.
>     For rv128c right shifts, the 6-bit shamt is in addition sign extended to
>     7 bits.
> 
> 
> Um, what says that? First, it makes no sense — while some systems define 
> negative shifts as opposite direction, riscv is not one of them.

   This is here (I just pulled riscv-isa-manual and recompiled to be right on
   the page): Volume I: RISC-V Unprivileged ISA V20191214-draft (same branch as
   the one you indicate), page 119 & 120.
   This applies *only* to the compressed instructions c.srli and c.srai, not to
   their uncompressed version (the 0 becoming 64 also applies to c.slli).
   "Sign extension" is duplication of the 6th bit on the 7th bit only, and the
   top bits are zeroed, thus leading to shamts of 1-31, 64, 96-127.

> Second, the 20220707 draft spec does not agree with you:
> 
>    Shifts by an immediate (SLLI/SRLI/SRAI)
>    are now encoded using the low 7 bits of
>    the I-immediate.... >
> Nothing about that sentence says "signed".

   Agreed, on the non compressed insns, but the compressed ones have a 6-bit
   shamt only as visible on page 18.6 page 125. The explanation for rv128 shifts
   is further detailed in the emphasized paragraph on top of page 120.

   Frédéric
> 
> 
> r~
> 
> 
>     Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr
>     <mailto:frederic.petrot@univ-grenoble-alpes.fr>>
>     ---
>       target/riscv/insn16.decode |  7 ++++---
>       disas/riscv.c              | 27 +++++++++++++++++++++------
>       target/riscv/translate.c   | 20 ++++++++++++++++++--
>       3 files changed, 43 insertions(+), 11 deletions(-)
> 
>     diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
>     index 02c8f61b48..ccfe59f294 100644
>     --- a/target/riscv/insn16.decode
>     +++ b/target/riscv/insn16.decode
>     @@ -31,7 +31,8 @@
>       %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
>       %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
> 
>     -%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
>     +%shlimm_6bit  12:1 2:5               !function=ex_rvc_shiftli
>     +%shrimm_6bit  12:1 2:5               !function=ex_rvc_shiftri
>       %uimm_6bit_lq 2:4 12:1 6:1           !function=ex_shift_4
>       %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
>       %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
>     @@ -82,9 +83,9 @@
>       @c_addi16sp     ... .  ..... ..... .. &i imm=%imm_addi16sp rs1=2 rd=2
> 
>       @c_shift        ... . .. ... ..... .. \
>     -                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shimm_6bit
>     +                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shrimm_6bit
>       @c_shift2       ... . .. ... ..... .. \
>     -                &shift rd=%rd rs1=%rd shamt=%shimm_6bit
>     +                &shift rd=%rd rs1=%rd shamt=%shlimm_6bit
> 
>       @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
> 
>     diff --git a/disas/riscv.c b/disas/riscv.c
>     index 7af6afc8fa..489c2ae5e8 100644
>     --- a/disas/riscv.c
>     +++ b/disas/riscv.c
>     @@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)
>               ((inst << 56) >> 63) << 11;
>       }
> 
>     -static uint32_t operand_cimmsh6(rv_inst inst)
>     +static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
>       {
>     -    return ((inst << 51) >> 63) << 5 |
>     +    int imm = ((inst << 51) >> 63) << 5 |
>               (inst << 57) >> 59;
>     +    if (isa == rv128) {
>     +        imm = imm ? imm : 64;
>     +    }
>     +    return imm;
>     +}
>     +
>     +static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
>     +{
>     +    int imm = ((inst << 51) >> 63) << 5 |
>     +        (inst << 57) >> 59;
>     +    if (isa == rv128) {
>     +        imm = imm | (imm & 32) << 1;
>     +        imm = imm ? imm : 64;
>     +    }
>     +    return imm;
>       }
> 
>       static int32_t operand_cimmi(rv_inst inst)
>     @@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)
> 
>       /* decode operands */
> 
>     -static void decode_inst_operands(rv_decode *dec)
>     +static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>       {
>           rv_inst inst = dec->inst;
>           dec->codec = opcode_data[dec->op].codec;
>     @@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)
>           case rv_codec_cb_sh6:
>               dec->rd = dec->rs1 = operand_crs1rdq(inst) + 8;
>               dec->rs2 = rv_ireg_zero;
>     -        dec->imm = operand_cimmsh6(inst);
>     +        dec->imm = operand_cimmshr6(inst, isa);
>               break;
>           case rv_codec_ci:
>               dec->rd = dec->rs1 = operand_crs1rd(inst);
>     @@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)
>           case rv_codec_ci_sh6:
>               dec->rd = dec->rs1 = operand_crs1rd(inst);
>               dec->rs2 = rv_ireg_zero;
>     -        dec->imm = operand_cimmsh6(inst);
>     +        dec->imm = operand_cimmshl6(inst, isa);
>               break;
>           case rv_codec_ci_16sp:
>               dec->rd = rv_ireg_sp;
>     @@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa,
>     uint64_t pc, rv_inst inst)
>           dec.pc = pc;
>           dec.inst = inst;
>           decode_inst_opcode(&dec, isa);
>     -    decode_inst_operands(&dec);
>     +    decode_inst_operands(&dec, isa);
>           decode_inst_decompress(&dec, isa);
>           decode_inst_lift_pseudo(&dec);
>           format_inst(buf, buflen, 16, &dec);
>     diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>     index 63b04e8a94..d7c82a9c81 100644
>     --- a/target/riscv/translate.c
>     +++ b/target/riscv/translate.c
>     @@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
>           return 8 + reg;
>       }
> 
>     -static int ex_rvc_shifti(DisasContext *ctx, int imm)
>     +static int ex_rvc_shiftli(DisasContext *ctx, int imm)
>       {
>           /* For RV128 a shamt of 0 means a shift by 64. */
>     -    return imm ? imm : 64;
>     +    if (get_ol(ctx) == MXL_RV128) {
>     +        imm = imm ? imm : 64;
>     +    }
>     +    return imm;
>     +}
>     +
>     +static int ex_rvc_shiftri(DisasContext *ctx, int imm)
>     +{
>     +    /*
>     +     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
>     +     * shifts, the shamt is sign-extended.
>     +     */
>     +    if (get_ol(ctx) == MXL_RV128) {
>     +        imm = imm | (imm & 32) << 1;
>     +        imm = imm ? imm : 64;
>     +    }
>     +    return imm;
>       }
> 
>       /* Include the auto-generated decoder for 32 bit insn */
>     -- 
>     2.36.1
> 
> 

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot,                            Pr. Grenoble INP-Ensimag/TIMA |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

