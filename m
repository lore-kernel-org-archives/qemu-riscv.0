Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAIsO-0007gI-Op
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jul 2022 18:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAIsK-0007fk-7Y; Sat, 09 Jul 2022 18:24:32 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1oAIsB-0003bP-BT; Sat, 09 Jul 2022 18:24:30 -0400
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 9A60440243;
 Sun, 10 Jul 2022 00:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1657405456;
 bh=TAAz3/NqUq5OEZdtYrPrYHHEXePTDxqnnpValXZH4UA=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=NL/lIWoYVm7B7d/yYhXbBkkXMX73XI/ZQ5NuvOW87mX19rx9k+Il24EnmgA46yReT
 iwFOuzzF3gf/6kgU/bkTWMiUuGwe5bky0IKQGoWzXb5eZHbrK4EKBkjNjMGne9S1+p
 +/KqHzk9LvJSENc5CoBInsTdeHPeNmpNUu2I67cb39AzBMg8eYrs47SYrWxGVw4Hck
 fzk5zf0Pizc3CFRIxe6rqYy3PJZfzWcxp3iGOoe58J7aUarQo2qjPdE2rg7U8WAh/Q
 1qmPu8wQLDH3dKfpBJ9j+Ys3xsv8k006RADmRR6hje5vjjhpyLJ2F5ofWWej7bB5TX
 UD/dwC2iQrjJw==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhub.u-ga.fr (Postfix) with ESMTP id 97DBF10005A;
 Sun, 10 Jul 2022 00:24:16 +0200 (CEST)
Received: from [192.168.5.58] (unknown [37.72.194.135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 9DBE0140059;
 Sun, 10 Jul 2022 00:24:08 +0200 (CEST)
Message-ID: <032ab978-6fa6-4e42-b9cb-6ce6751f74c9@univ-grenoble-alpes.fr>
Date: Sun, 10 Jul 2022 00:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: fr
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
References: <20220708150038.216575-1-frederic.petrot@univ-grenoble-alpes.fr>
 <96d10e26-9ab2-593d-fda7-40b14d706056@iscas.ac.cn>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH] target/riscv: fix right shifts shamt value for rv128c
In-Reply-To: <96d10e26-9ab2-593d-fda7-40b14d706056@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 09 Jul 2022 22:24:34 -0000

Le 09/07/2022 à 10:52, Weiwei Li a écrit :
> 
> 在 2022/7/8 下午11:00, Frédéric Pétrot 写道:
>> For rv128c right shifts, the 6-bit shamt is sign extended to 7 bits.
>>
>> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
>> ---
>>   target/riscv/insn16.decode |  7 ++++---
>>   disas/riscv.c              | 27 +++++++++++++++++++++------
>>   target/riscv/translate.c   | 12 +++++++++++-
>>   3 files changed, 36 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
>> index 02c8f61b48..ea3c5a0411 100644
>> --- a/target/riscv/insn16.decode
>> +++ b/target/riscv/insn16.decode
>> @@ -31,7 +31,8 @@
>>   %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
>>   %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
>>   
>> -%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
>> +%shlimm_6bit   12:1 2:5              !function=ex_rvc_shiftli
>> +%shrimm_6bit   12:1 2:5              !function=ex_rvc_shiftri
>>   %uimm_6bit_lq 2:4 12:1 6:1           !function=ex_shift_4
>>   %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
>>   %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
> 
> It's better to maintain the alignment here.

   Ooups! I'll do that.

> 
>> @@ -82,9 +83,9 @@
>>   @c_addi16sp     ... .  ..... ..... .. &i imm=%imm_addi16sp rs1=2 rd=2
>>   
>>   @c_shift        ... . .. ... ..... .. \
>> -                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shimm_6bit
>> +                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shrimm_6bit
>>   @c_shift2       ... . .. ... ..... .. \
>> -                &shift rd=%rd rs1=%rd shamt=%shimm_6bit
>> +                &shift rd=%rd rs1=%rd shamt=%shlimm_6bit
>>   
>>   @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
>>   
>> diff --git a/disas/riscv.c b/disas/riscv.c
>> index 7af6afc8fa..489c2ae5e8 100644
>> --- a/disas/riscv.c
>> +++ b/disas/riscv.c
>> @@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)
>>           ((inst << 56) >> 63) << 11;
>>   }
>>   
>> -static uint32_t operand_cimmsh6(rv_inst inst)
>> +static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
>>   {
>> -    return ((inst << 51) >> 63) << 5 |
>> +    int imm = ((inst << 51) >> 63) << 5 |
>>           (inst << 57) >> 59;
>> +    if (isa == rv128) {
>> +        imm = imm ? imm : 64;
>> +    }
>> +    return imm;
>> +}
>> +
>> +static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
>> +{
>> +    int imm = ((inst << 51) >> 63) << 5 |
>> +        (inst << 57) >> 59;
>> +    if (isa == rv128) {
>> +        imm = imm | (imm & 32) << 1;
>> +        imm = imm ? imm : 64;
>> +    }
>> +    return imm;
>>   }
>>   
>>   static int32_t operand_cimmi(rv_inst inst)
>> @@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)
>>   
>>   /* decode operands */
>>   
>> -static void decode_inst_operands(rv_decode *dec)
>> +static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>>   {
>>       rv_inst inst = dec->inst;
>>       dec->codec = opcode_data[dec->op].codec;
>> @@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)
>>       case rv_codec_cb_sh6:
>>           dec->rd = dec->rs1 = operand_crs1rdq(inst) + 8;
>>           dec->rs2 = rv_ireg_zero;
>> -        dec->imm = operand_cimmsh6(inst);
>> +        dec->imm = operand_cimmshr6(inst, isa);
>>           break;
>>       case rv_codec_ci:
>>           dec->rd = dec->rs1 = operand_crs1rd(inst);
>> @@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)
>>       case rv_codec_ci_sh6:
>>           dec->rd = dec->rs1 = operand_crs1rd(inst);
>>           dec->rs2 = rv_ireg_zero;
>> -        dec->imm = operand_cimmsh6(inst);
>> +        dec->imm = operand_cimmshl6(inst, isa);
>>           break;
>>       case rv_codec_ci_16sp:
>>           dec->rd = rv_ireg_sp;
>> @@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
>>       dec.pc = pc;
>>       dec.inst = inst;
>>       decode_inst_opcode(&dec, isa);
>> -    decode_inst_operands(&dec);
>> +    decode_inst_operands(&dec, isa);
>>       decode_inst_decompress(&dec, isa);
>>       decode_inst_lift_pseudo(&dec);
>>       format_inst(buf, buflen, 16, &dec);
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 63b04e8a94..af3a2cd68c 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -705,12 +705,22 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
>>       return 8 + reg;
>>   }
>>   
>> -static int ex_rvc_shifti(DisasContext *ctx, int imm)
>> +static int ex_rvc_shiftli(DisasContext *ctx, int imm)
>>   {
>>       /* For RV128 a shamt of 0 means a shift by 64. */
>>       return imm ? imm : 64;
>>   }
>>   
>> +static int ex_rvc_shiftri(DisasContext *ctx, int imm)
>> +{
>> +    /*
>> +     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
>> +     * shifts, the shamt is sign-extended.
>> +     */
>> +    imm = imm | (imm & 32) << 1;
>> +    return imm ? imm : 64;
>> +}
>> +
> 
> This calculation didn't add limitation for only working in RV128, and may 
> trigger fault in RV32/RV64,
> 
> such as following check in gen_shift_imm_fn:
> 
> if (a->shamt >= max_len) {
> return false;
> }

   Indeed! Thanks for pointing that mistake out.
   Also 0 becoming 64 is a rv128 only thing, and a shamt of zero should be a
   hint in rv64/rv32, so I believe the immediat should not be changed.

   Yours,
   Frédéric

> Regards,
> Weiwei Li
>>   /* Include the auto-generated decoder for 32 bit insn */
>>   #include "decode-insn32.c.inc"
>>   

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot,                            Pr. Grenoble INP-Ensimag/TIMA |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

