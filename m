Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A295C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 13:05:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7FKe-0007jN-5r; Thu, 08 Jun 2023 09:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q7FKH-0007gG-MZ; Thu, 08 Jun 2023 09:05:17 -0400
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q7FKE-0006Dn-4Q; Thu, 08 Jun 2023 09:05:17 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R511e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VkeSq1y_1686229495; 
Received: from 30.221.99.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VkeSq1y_1686229495) by smtp.aliyun-inc.com;
 Thu, 08 Jun 2023 21:04:57 +0800
Message-ID: <8b073dc8-982b-b4e1-9ee4-cbfb2d4feae6@linux.alibaba.com>
Date: Thu, 8 Jun 2023 21:04:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/9] disas/riscv: Provide infrastructure for vendor
 extensions
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-8-christoph.muellner@vrull.eu>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230530131843.1186637-8-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/5/30 21:18, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> A previous patch provides a pointer to the RISCVCPUConfig data.
> Let's use this to add the necessary code for vendor extensions.
> This patch does not change the current behaviour, but clearly
> defines how vendor extension support can be added to the disassembler.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   disas/riscv.c | 34 ++++++++++++++++++++++++++++++----
>   1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 086edee6a2..db98e3ea6a 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include "disas/dis-asm.h"
>   #include "disas/riscv.h"
> +#include "target/riscv/cpu-config.h"
>   
>   typedef enum {
>       /* 0 is reserved for rv_op_illegal. */
> @@ -4599,13 +4600,38 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
>   /* disassemble instruction */
>   
>   static void
> -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
> +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
> +            struct disassemble_info *info)
>   {
> +    RISCVCPUConfig *cfg = info->private_data;
>       rv_decode dec = { 0 };
>       dec.pc = pc;
>       dec.inst = inst;
> -    dec.opcode_data = rvi_opcode_data;
> -    decode_inst_opcode(&dec, isa);
> +
> +    static const struct {
> +        bool (*guard_func)(const RISCVCPUConfig *);
> +        const rv_opcode_data *opcode_data;
> +        void (*decode_func)(rv_decode *, rv_isa);
> +    } decoders[] = {
> +        { always_true_p, rvi_opcode_data, decode_inst_opcode },
> +    };
> +
> +    for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
> +        bool (*guard_func)(const RISCVCPUConfig *) = decoders[i].guard_func;
> +        const rv_opcode_data *opcode_data = decoders[i].opcode_data;
> +        void (*decode_func)(rv_decode *, rv_isa) = decoders[i].decode_func;
> +
> +        if (guard_func(cfg)) {
> +            dec.opcode_data = opcode_data;
> +            decode_func(&dec, isa);
> +            if (dec.op != rv_op_illegal)
> +                break;
> +        }
> +    }
> +
> +    if (dec.op == rv_op_illegal)
> +        dec.opcode_data = rvi_opcode_data;

Always enclose the if sentence.

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

> +
>       decode_inst_operands(&dec, isa);
>       decode_inst_decompress(&dec, isa);
>       decode_inst_lift_pseudo(&dec);
> @@ -4659,7 +4685,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
>           break;
>       }
>   
> -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
> +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst, info);
>       (*info->fprintf_func)(info->stream, "%s", buf);
>   
>       return len;

