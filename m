Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oT0lT-0002ne-Sm
	for mharc-qemu-riscv@gnu.org; Tue, 30 Aug 2022 08:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oT0lS-0002nJ-Pd; Tue, 30 Aug 2022 08:54:46 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oT0lK-0006cW-Ck; Tue, 30 Aug 2022 08:54:42 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VNl7ii0_1661864053; 
Received: from 30.225.65.11(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VNl7ii0_1661864053) by smtp.aliyun-inc.com;
 Tue, 30 Aug 2022 20:54:27 +0800
Message-ID: <b7dd8281-2cd0-8040-c1cd-383eb8e4cdca@linux.alibaba.com>
Date: Tue, 30 Aug 2022 20:54:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [RFC PATCH 4/4] target/riscv: Support Ventana disassemble
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
 <20220824130331.21315-5-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKN7ZWrJW_tJyeqTJxKqSOV=nmXx-hb996EvD_6M5hxhZA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKN7ZWrJW_tJyeqTJxKqSOV=nmXx-hb996EvD_6M5hxhZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Tue, 30 Aug 2022 12:54:47 -0000

Hi Alistair,

Thanks for your comments.

On 2022/8/30 17:03, Alistair Francis wrote:
> On Wed, Aug 24, 2022 at 5:37 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>> Pass through the custom information to disassemble by the target_info
>> field. In disassemble, select the decode path according to the custom
>> extension.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   disas/riscv.c         | 56 +++++++++++++++++++++++++++++++++++++++++--
>>   target/riscv/cpu.c    | 19 +++++++++++++++
>>   target/riscv/custom.h | 25 +++++++++++++++++++
>>   3 files changed, 98 insertions(+), 2 deletions(-)
>>   create mode 100644 target/riscv/custom.h
>>
>> diff --git a/disas/riscv.c b/disas/riscv.c
>> index aaf85b2aba..590cdba0f6 100644
>> --- a/disas/riscv.c
>> +++ b/disas/riscv.c
>> @@ -19,6 +19,7 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "disas/dis-asm.h"
>> +#include "target/riscv/custom.h"
>>
>>
>>   /* types */
>> @@ -562,6 +563,11 @@ typedef enum {
>>       rv_op_xperm8 = 398,
>>   } rv_op;
>>
>> +typedef enum {
>> +    Ventana_op_vt_maskc = 0,
>> +    Ventana_op_vt_maskcn = 1,
>> +} rv_Ventana_op;
> This is unused right?

Ventana_op_vt_maskc and Ventana_op_vt_maskcn have been used in this 
patch.Actually, they will be used as the index of 
Ventana_opcode_data(the custom opcode data for Ventana).
So it should also keep strictly in pace with the items in 
Ventana_opcode_data.

After decode_inst_opcode, there are many use cases of 
"opcode_data[dec->op]" and the dec->op is
the Ventana_op_vt_maskc or Ventana_op_vt_maskcn here.

>> +
>>   /* structures */
>>
>>   typedef struct {
>> @@ -602,6 +608,7 @@ typedef struct {
>>       uint8_t   bs;
>>       uint8_t   rnum;
>>       const rv_opcode_data *used_opcode_data;
>> +    const rv_opcode_data *custom_opcode_data;
>>   } rv_decode;
>>
>>   /* register names */
>> @@ -1287,6 +1294,11 @@ const rv_opcode_data opcode_data[] = {
>>       { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
>>   };
>>
>> +const rv_opcode_data Ventana_opcode_data[] = {
>> +    { "vt.maskc", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>> +    { "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>> +};
> Could we keep this in a vendor file instead?
Yes. If we split it into a file, such as disas/ventana_riscv.c, we will 
have to split some data structures into a header file, because 
Ventana_opcode_data use rv_codec_r and rv_fmt_rd_rs1_rs2.
>
>> +
>>   /* CSR names */
>>
>>   static const char *csr_name(int csrno)
>> @@ -2244,6 +2256,18 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>>               case 0: op = rv_op_addd; break;
>>               case 1: op = rv_op_slld; break;
>>               case 5: op = rv_op_srld; break;
>> +            case 6: /* Todo: Move custom decode to sperate decode function */
>> +                if (dec->custom_opcode_data == Ventana_opcode_data) {
>> +                    op = Ventana_op_vt_maskc;
>> +                    dec->used_opcode_data = dec->custom_opcode_data;
>> +                }
>> +                break;
>> +            case 7:
>> +                if (dec->custom_opcode_data == Ventana_opcode_data) {
>> +                    op = Ventana_op_vt_maskcn;
>> +                    dec->used_opcode_data = dec->custom_opcode_data;
>> +                }
>> +                break;
> This seems like it won't scale very well as we add more custom extensions
Agree.
>>               case 8: op = rv_op_muld; break;
>>               case 12: op = rv_op_divd; break;
>>               case 13: op = rv_op_divud; break;
>> @@ -3190,15 +3214,43 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
>>       }
>>   }
>>
>> +static const struct {
>> +    enum RISCVCustom ext;
>> +    const rv_opcode_data *opcode_data;
>> +} custom_opcode_table[] = {
>> +    { VENTANA_CUSTOM,   Ventana_opcode_data },
>> +};
>> +
>> +static const rv_opcode_data *
>> +get_custom_opcode_data(struct disassemble_info *info)
>> +{
>> +    for (size_t i = 0; i < ARRAY_SIZE(custom_opcode_table); ++i) {
>> +        if (info->target_info & (1ULL << custom_opcode_table[i].ext)) {
>> +            return custom_opcode_table[i].opcode_data;
>> +        }
>> +    }
>> +    return NULL;
>> +}
>> +
>>   /* disassemble instruction */
>>
>>   static void
>> -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
>> +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
>> +            struct disassemble_info *info)
>>   {
>>       rv_decode dec = { 0 };
>>       dec.pc = pc;
>>       dec.inst = inst;
>> +
>> +    /*
>> +     * Set default opcode_data.
>> +     * Only overide the default opcode_data only when
>> +     * 1. There is a custom opcode data.
>> +     * 2. The instruction belongs to the custom extension.
>> +     */
>>       dec.used_opcode_data = opcode_data;
>> +    dec.custom_opcode_data = get_custom_opcode_data(info);
> What if something has two vendor extensions?

This is possible. Strictly, we have no reason to refuse them if two 
vendor extensions don't collide with each other.

But I still have not find a good way to check the collision, except 
decoding and checking one by one.

>
> I'm not sure we need this, it might be better to just check if the
> extension is enabled and then use that decoder

Agree. I will have a try in next version.

Thanks,
Zhiwei

>
> Alistair
>
>> +
>>       decode_inst_opcode(&dec, isa);
>>       decode_inst_operands(&dec);
>>       decode_inst_decompress(&dec, isa);
>> @@ -3253,7 +3305,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
>>           break;
>>       }
>>
>> -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
>> +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst, info);
>>       (*info->fprintf_func)(info->stream, "%s", buf);
>>
>>       return len;
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index a5f84f211d..cc6ef9303f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -31,6 +31,7 @@
>>   #include "fpu/softfloat-helpers.h"
>>   #include "sysemu/kvm.h"
>>   #include "kvm_riscv.h"
>> +#include "custom.h"
>>
>>   /* RISC-V CPU definitions */
>>
>> @@ -504,11 +505,29 @@ static void riscv_cpu_reset(DeviceState *dev)
>>   #endif
>>   }
>>
>> +static bool has_Ventana_ext(const RISCVCPUConfig *cfg_ptr)
>> +{
>> +    return cfg_ptr->ext_XVentanaCondOps;
>> +}
>> +
>>   static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(s);
>>       CPURISCVState *env = &cpu->env;
>>
>> +    static const struct {
>> +        bool (*guard_func)(const RISCVCPUConfig *);
>> +        enum RISCVCustom ext;
>> +    } customs[] = {
>> +        { has_Ventana_ext, VENTANA_CUSTOM },
>> +    };
>> +
>> +    for (size_t i = 0; i < ARRAY_SIZE(customs); ++i) {
>> +        if (customs[i].guard_func(&(cpu->cfg))) {
>> +            info->target_info |= 1ULL << customs[i].ext;
>> +        }
>> +    }
>> +
>>       switch (env->xl) {
>>       case MXL_RV32:
>>           info->print_insn = print_insn_riscv32;
>> diff --git a/target/riscv/custom.h b/target/riscv/custom.h
>> new file mode 100644
>> index 0000000000..1a161984c0
>> --- /dev/null
>> +++ b/target/riscv/custom.h
>> @@ -0,0 +1,25 @@
>> +/*
>> + * QEMU RISC-V CPU -- custom extensions
>> + *
>> + * Copyright (c) 2022 T-Head Semiconductor Co., Ltd. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +#ifndef RISCV_CPU_CUSTOM_H
>> +#define RISCV_CPU_CUSTOM_H
>> +
>> +enum RISCVCustom {
>> +    VENTANA_CUSTOM = 0,
>> +};
>> +
>> +#endif
>> --
>> 2.25.1
>>
>>

