Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAWAb-0004dU-Oe
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jul 2022 08:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oAWA2-0004Za-8j; Sun, 10 Jul 2022 08:35:48 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:43390 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oAW9y-000333-Hz; Sun, 10 Jul 2022 08:35:42 -0400
Received: from [192.168.0.104] (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowABnbweOx8piT8hKDg--.50293S2;
 Sun, 10 Jul 2022 20:35:27 +0800 (CST)
Subject: Re: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
References: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <2d3fbd88-b9f3-96ba-a93b-549d5e55ea8b@iscas.ac.cn>
Date: Sun, 10 Jul 2022 20:35:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowABnbweOx8piT8hKDg--.50293S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4fCrW7tF1DJF1UAF1xAFb_yoWrKrWrpF
 48CanxuF1jyFyIv3WSkF45XFyDX3yIgayxK3s3XwsrJrZxJayDJF1xArWa9r4vk39aqr4U
 Xa15ZrWUu39Yyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
 3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [117.151.235.104]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sun, 10 Jul 2022 12:36:16 -0000


在 2022/7/10 下午7:04, Frédéric Pétrot 写道:
> For rv128c shifts, a shamt of 0 is a shamt of 64, while for rv32c/rv64c
> it stays 0 and is a hint instruction that does not change processor state.
> For rv128c right shifts, the 6-bit shamt is in addition sign extended to
> 7 bits.
>
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

> ---
>   target/riscv/insn16.decode |  7 ++++---
>   disas/riscv.c              | 27 +++++++++++++++++++++------
>   target/riscv/translate.c   | 20 ++++++++++++++++++--
>   3 files changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index 02c8f61b48..ccfe59f294 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -31,7 +31,8 @@
>   %imm_cb        12:s1 5:2 2:1 10:2 3:2 !function=ex_shift_1
>   %imm_cj        12:s1 8:1 9:2 6:1 7:1 2:1 11:1 3:3 !function=ex_shift_1
>   
> -%shimm_6bit   12:1 2:5               !function=ex_rvc_shifti
> +%shlimm_6bit  12:1 2:5               !function=ex_rvc_shiftli
> +%shrimm_6bit  12:1 2:5               !function=ex_rvc_shiftri
>   %uimm_6bit_lq 2:4 12:1 6:1           !function=ex_shift_4
>   %uimm_6bit_ld 2:3 12:1 5:2           !function=ex_shift_3
>   %uimm_6bit_lw 2:2 12:1 4:3           !function=ex_shift_2
> @@ -82,9 +83,9 @@
>   @c_addi16sp     ... .  ..... ..... .. &i imm=%imm_addi16sp rs1=2 rd=2
>   
>   @c_shift        ... . .. ... ..... .. \
> -                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shimm_6bit
> +                &shift rd=%rs1_3 rs1=%rs1_3 shamt=%shrimm_6bit
>   @c_shift2       ... . .. ... ..... .. \
> -                &shift rd=%rd rs1=%rd shamt=%shimm_6bit
> +                &shift rd=%rd rs1=%rd shamt=%shlimm_6bit
>   
>   @c_andi         ... . .. ... ..... .. &i imm=%imm_ci rs1=%rs1_3 rd=%rs1_3
>   
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7af6afc8fa..489c2ae5e8 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2402,10 +2402,25 @@ static int32_t operand_sbimm12(rv_inst inst)
>           ((inst << 56) >> 63) << 11;
>   }
>   
> -static uint32_t operand_cimmsh6(rv_inst inst)
> +static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
>   {
> -    return ((inst << 51) >> 63) << 5 |
> +    int imm = ((inst << 51) >> 63) << 5 |
>           (inst << 57) >> 59;
> +    if (isa == rv128) {
> +        imm = imm ? imm : 64;
> +    }
> +    return imm;
> +}
> +
> +static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
> +{
> +    int imm = ((inst << 51) >> 63) << 5 |
> +        (inst << 57) >> 59;
> +    if (isa == rv128) {
> +        imm = imm | (imm & 32) << 1;
> +        imm = imm ? imm : 64;
> +    }
> +    return imm;
>   }
>   
>   static int32_t operand_cimmi(rv_inst inst)
> @@ -2529,7 +2544,7 @@ static uint32_t operand_rnum(rv_inst inst)
>   
>   /* decode operands */
>   
> -static void decode_inst_operands(rv_decode *dec)
> +static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>   {
>       rv_inst inst = dec->inst;
>       dec->codec = opcode_data[dec->op].codec;
> @@ -2652,7 +2667,7 @@ static void decode_inst_operands(rv_decode *dec)
>       case rv_codec_cb_sh6:
>           dec->rd = dec->rs1 = operand_crs1rdq(inst) + 8;
>           dec->rs2 = rv_ireg_zero;
> -        dec->imm = operand_cimmsh6(inst);
> +        dec->imm = operand_cimmshr6(inst, isa);
>           break;
>       case rv_codec_ci:
>           dec->rd = dec->rs1 = operand_crs1rd(inst);
> @@ -2667,7 +2682,7 @@ static void decode_inst_operands(rv_decode *dec)
>       case rv_codec_ci_sh6:
>           dec->rd = dec->rs1 = operand_crs1rd(inst);
>           dec->rs2 = rv_ireg_zero;
> -        dec->imm = operand_cimmsh6(inst);
> +        dec->imm = operand_cimmshl6(inst, isa);
>           break;
>       case rv_codec_ci_16sp:
>           dec->rd = rv_ireg_sp;
> @@ -3193,7 +3208,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
>       dec.pc = pc;
>       dec.inst = inst;
>       decode_inst_opcode(&dec, isa);
> -    decode_inst_operands(&dec);
> +    decode_inst_operands(&dec, isa);
>       decode_inst_decompress(&dec, isa);
>       decode_inst_lift_pseudo(&dec);
>       format_inst(buf, buflen, 16, &dec);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a94..d7c82a9c81 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -705,10 +705,26 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
>       return 8 + reg;
>   }
>   
> -static int ex_rvc_shifti(DisasContext *ctx, int imm)
> +static int ex_rvc_shiftli(DisasContext *ctx, int imm)
>   {
>       /* For RV128 a shamt of 0 means a shift by 64. */
> -    return imm ? imm : 64;
> +    if (get_ol(ctx) == MXL_RV128) {
> +        imm = imm ? imm : 64;
> +    }
> +    return imm;
> +}
> +
> +static int ex_rvc_shiftri(DisasContext *ctx, int imm)
> +{
> +    /*
> +     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
> +     * shifts, the shamt is sign-extended.
> +     */
> +    if (get_ol(ctx) == MXL_RV128) {
> +        imm = imm | (imm & 32) << 1;
> +        imm = imm ? imm : 64;
> +    }
> +    return imm;
>   }
>   
>   /* Include the auto-generated decoder for 32 bit insn */


