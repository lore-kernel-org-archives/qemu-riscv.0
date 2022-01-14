Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8NgO-0005vZ-Tm
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 09:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8NgL-0005pT-Ez; Fri, 14 Jan 2022 09:35:57 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:44650 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n8NgH-0007SV-IB; Fri, 14 Jan 2022 09:35:56 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAnLn4_iuFhe2U3Bg--.51640S2;
 Fri, 14 Jan 2022 22:35:43 +0800 (CST)
Subject: Re: [PATCH v3 2/3] target/riscv: add support for svinval extension
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 wangjunqiang@iscas.ac.cn, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220114014059.23300-1-liweiwei@iscas.ac.cn>
 <20220114014059.23300-3-liweiwei@iscas.ac.cn>
 <CAAhSdy0KEm=CeG4TCLdyf1i_aO-pKG9N5yYQU6_OLPE44fQi-g@mail.gmail.com>
 <a67b7ae3-e741-487d-765a-9fc98e53ca95@iscas.ac.cn>
 <CAAhSdy0eQ+aX1G0sP8+Q6UQEefrj7Cz4tbyUvkvc4NXxhdFp9g@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <273af9f5-d068-c9b8-c092-4dc368974828@iscas.ac.cn>
Date: Fri, 14 Jan 2022 22:35:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0eQ+aX1G0sP8+Q6UQEefrj7Cz4tbyUvkvc4NXxhdFp9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAnLn4_iuFhe2U3Bg--.51640S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyDXrW5ur4xCrWkAw13urg_yoWxAF1fpF
 4kKFWUCF4kJryxA34Iqr45JFWxKrs3CF4UC3savwn5Zws8GrWkJrykKrW3KrWUJF4v9r1j
 9F4jvr9IyrWFqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jan 2022 14:35:58 -0000


在 2022/1/14 下午10:01, Anup Patel 写道:
> On Fri, Jan 14, 2022 at 7:24 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Thanks for your comments.
>>
>> 在 2022/1/14 下午9:40, Anup Patel 写道:
>>
>> On Fri, Jan 14, 2022 at 7:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
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
>> index ff6c86c85b..45ac98e06b 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -668,6 +668,7 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>
>> +    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>>
>>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index d3d17cde82..c3d1845ca1 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -327,6 +327,7 @@ struct RISCVCPU {
>>           bool ext_counters;
>>           bool ext_ifencei;
>>           bool ext_icsr;
>> +        bool ext_svinval;
>>           bool ext_svnapot;
>>           bool ext_zfh;
>>           bool ext_zfhmin;
>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> index 5bbedc254c..7a0351fde2 100644
>> --- a/target/riscv/insn32.decode
>> +++ b/target/riscv/insn32.decode
>> @@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
>>   fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>>   fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>>   fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
>> +
>> +# *** Svinval Standard Extension ***
>> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
>> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
>> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
>> +hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma
>>
>> s/0011011/0010011/
>>
>> +hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma
>>
>> s/0111011/0110011/
>>
>> Sorry. I didn't find the encodings for svinval instructions from the spec. So I get them from  spike (https://github.com/riscv-software-src/riscv-isa-sim/blob/master/riscv/encoding.h) which are as follows:
>>
>> #define MATCH_HINVAL_VVMA 0x36000073
>> #define MASK_HINVAL_VVMA 0xfe007fff
>> #define MATCH_HINVAL_GVMA 0x76000073
>> #define MASK_HINVAL_GVMA 0xfe007fff
>> Are they not the latest encodings?
> The code in Spike seems to be buggy but that's a separate issue.
>
> Refer, page 138 of
> https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220110-eae4f00/riscv-privileged.pdf
>
> Regards,
> Anup
>
OK. Thanks a lot. I'll fix this.

Regards,

Weiwei Li

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
>> index 615048ec87..4e5a9660a4 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -838,6 +838,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
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
>> Apart from the minor mistake above, it looks good to me.
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>
>> Regards,
>> Anup
>>
>>
>> Regards,
>> Weiwei Li


