Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3tcx-0005Bp-JK
	for mharc-qemu-riscv@gnu.org; Sun, 02 Jan 2022 00:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3tcu-0005BW-IK; Sun, 02 Jan 2022 00:41:52 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:58286 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n3tcr-0006cN-BC; Sun, 02 Jan 2022 00:41:52 -0500
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAAXH1sSO9FhR_wEBQ--.51021S2;
 Sun, 02 Jan 2022 13:41:39 +0800 (CST)
Subject: Re: [PATCH v2 2/3] target/riscv: add support for svinval extension
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20211231080923.24252-1-liweiwei@iscas.ac.cn>
 <20211231080923.24252-3-liweiwei@iscas.ac.cn>
 <CAAhSdy32+q_oT4hE2ohsVnNcaEK29=BWnqyu5V3MQuXUMA7Rvg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4fe6a17f-8470-36d9-3b97-3d287323b73a@iscas.ac.cn>
Date: Sun, 2 Jan 2022 13:41:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy32+q_oT4hE2ohsVnNcaEK29=BWnqyu5V3MQuXUMA7Rvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAAXH1sSO9FhR_wEBQ--.51021S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF13ZFy3JFW7Jr17JF1kKrg_yoW7uryfpF
 18GFW7CF4kJFyfAa4xtr45JFyxGrsaka1UC3say3Z3Xan8Gr4DJrykKrW3KrW5JF4q9r1j
 9F4jvr9IyrWFqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 02 Jan 2022 05:41:53 -0000

Thanks for your comments.

I'll fix the three flags.

在 2022/1/1 下午9:15, Anup Patel 写道:
> On Fri, Dec 31, 2021 at 1:43 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c                          |  1 +
>>   target/riscv/cpu.h                          |  1 +
>>   target/riscv/insn32.decode                  |  7 ++
>>   target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>>   target/riscv/translate.c                    |  1 +
>>   5 files changed, 85 insertions(+)
>>   create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index cbcb7f522b..77ef0f85fe 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -647,6 +647,7 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>>       DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>> +    DEFINE_PROP_BOOL("x-svinval", RISCVCPU, cfg.ext_svinval, false),
> Please drop the "x-" prefix. The Svinval extension is already ratified.
>
> Regards,
> Anup
>
>>       DEFINE_PROP_BOOL("x-svnapot", RISCVCPU, cfg.ext_svnapot, false),
>>       /* ePMP 0.9.3 */
>>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 1fbbde28c6..5dd9e53293 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -315,6 +315,7 @@ struct RISCVCPU {
>>           bool ext_counters;
>>           bool ext_ifencei;
>>           bool ext_icsr;
>> +        bool ext_svinval;
>>           bool ext_svnapot;
>>           bool ext_zfh;
>>           bool ext_zfhmin;
>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> index 8617307b29..809464113a 100644
>> --- a/target/riscv/insn32.decode
>> +++ b/target/riscv/insn32.decode
>> @@ -784,3 +784,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
>>   fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>>   fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>>   fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
>> +
>> +# *** Svinval Standard Extension ***
>> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
>> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
>> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
>> +hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma
>> +hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma
>> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
>> new file mode 100644
>> index 0000000000..1dde665661
>> --- /dev/null
>> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
>> @@ -0,0 +1,75 @@
>> +/*
>> + * RISC-V translation routines for the Svinval Standard Instruction Set.
>> + *
>> + * Copyright (c) 2020-2021 PLCT lab
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
>> +
>> +#define REQUIRE_SVINVAL(ctx) do {                    \
>> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
>> +        return false;                                \
>> +    }                                                \
>> +} while (0)
>> +
>> +static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    /* Do the same as sfence.vma currently */
>> +    REQUIRE_EXT(ctx, RVS);
>> +#ifndef CONFIG_USER_ONLY
>> +    gen_helper_tlb_flush(cpu_env);
>> +    return true;
>> +#endif
>> +    return false;
>> +}
>> +
>> +static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    REQUIRE_EXT(ctx, RVS);
>> +    /* Do nothing currently */
>> +    return true;
>> +}
>> +
>> +static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    REQUIRE_EXT(ctx, RVS);
>> +    /* Do nothing currently */
>> +    return true;
>> +}
>> +
>> +static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    /* Do the same as hfence.vvma currently */
>> +    REQUIRE_EXT(ctx, RVH);
>> +#ifndef CONFIG_USER_ONLY
>> +    gen_helper_hyp_tlb_flush(cpu_env);
>> +    return true;
>> +#endif
>> +    return false;
>> +}
>> +
>> +static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
>> +{
>> +    REQUIRE_SVINVAL(ctx);
>> +    /* Do the same as hfence.gvma currently */
>> +    REQUIRE_EXT(ctx, RVH);
>> +#ifndef CONFIG_USER_ONLY
>> +    gen_helper_hyp_gvma_tlb_flush(cpu_env);
>> +    return true;
>> +#endif
>> +    return false;
>> +}
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 5df6c0d800..47541a4db0 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -651,6 +651,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>>   #include "insn_trans/trans_rvb.c.inc"
>>   #include "insn_trans/trans_rvzfh.c.inc"
>>   #include "insn_trans/trans_privileged.c.inc"
>> +#include "insn_trans/trans_svinval.c.inc"
>>
>>   /* Include the auto-generated decoder for 16 bit insn */
>>   #include "decode-insn16.c.inc"
>> --
>> 2.17.1
>>
>>


