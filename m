Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkcsH-0008Ez-SN
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 23:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkcsF-0008El-Uc; Thu, 06 Apr 2023 23:34:52 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkcsC-0005GJ-OC; Thu, 06 Apr 2023 23:34:51 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACXnp5Sjy9kvS5lAA--.16006S2;
 Fri, 07 Apr 2023 11:34:42 +0800 (CST)
Message-ID: <727caa86-0dbb-67f1-068f-e72f79c5e001@iscas.ac.cn>
Date: Fri, 7 Apr 2023 11:34:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <ac342677-a7f5-52d6-0410-cd1c84b2197e@iscas.ac.cn>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <ac342677-a7f5-52d6-0410-cd1c84b2197e@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXnp5Sjy9kvS5lAA--.16006S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF4DGryxWF1xKw43XFW5ZFb_yoW3JF4DpF
 4kCFy7KrWkJr92yryxKr1UJryUJr4kKa1xJr1vg3W8JrW3Jr4jqr4qqrZagFyDAr4kWr1j
 vF45AF9xZF15AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.224,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 07 Apr 2023 03:34:52 -0000


On 2023/4/7 09:14, liweiwei wrote:
>
> On 2023/4/7 04:22, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This patch is going to break the sifive_u boot if I rebase
>>
>> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation​"
>>
>> on top of it, as it is the case today with the current 
>> riscv-to-apply.next.
>>
>> The reason is that the priv spec version for Zca is marked as 1_12_0, 
>> and
>> the priv spec version for both sifive CPUs is 1_10_0, and both are 
>> enabling
>> RVC.
>>
>> This patch from that series above:
>>
>> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec 
>> validate/disable_exts helpers"
>>
>> Makes the disabling of the extension based on priv version to happen 
>> *after* we
>> do all the validations, instead of before as we're doing today. Zca 
>> (and Zcd) will
>> be manually enabled just to be disabled shortly after by the priv 
>> spec code. And
>> this will happen:
>
> Yeah, I didn't take priv_version into consideration before.
>
> This is a new problem if we disable them at the end and was not 
> triggered in my previous tests.
>
> Not only Zca and Zcd, Zcf also has the same problem.
>
>>
>> qemu-system-riscv64: warning: disabling zca extension for hart 
>> 0x0000000000000000 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 
>> 0x0000000000000001 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 
>> 0x0000000000000001 because privilege spec version does not match
>> (--- hangs ---)
>>
>> This means that the assumption made in this patch - that Zca implies 
>> RVC - is no
>> longer valid, and all these translations won't work.
>>
> As specified in Zc* spec,  Zca is the subset of RVC.  C & F include 
> Zcf  in RV32. C & D include Zcd.
>>
>> Some possible solutions:
>>
>> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We would 
>> need to convert
>> all Zca checks to RVC checks in all translation code.
>
> We should check both Zca and RVC in this way.
>
> Similarly, we also should check both C&F and Zcf for Zcf instructions, 
> C&D and Zcd for Zcd instructions.
>
> I can update this patchset or add a new patch for it if needed.
>
>>
>> - Do not apply patch 5/9 from that series that moves the disable_ext 
>> code to the end
>> of validation. Also a possibility, but we would be sweeping the 
>> problem under the rug.
>> Zca still can't be used as a RVC replacement due to priv spec version 
>> constraints, but
>> we just won't disable Zca because we'll keep validating exts too 
>> early (which is the
>> problem that the patch addresses).
>>
>> - change the priv spec of the sifive CPUs - and everyone that uses 
>> RVC -  to 1_12_0. Not
>> sure if this makes sense.
>>
>> - do not disable any extensions due to privilege spec version 
>> mismatch. This would make
>> all the priv_version related artifacts to be more "educational" than 
>> to be an actual
>> configuration we want to enforce. Not sure if that would do any good 
>> in the end, but
>> it's also a possibility.
>
> I prefer this way. For vendor-specific cpu types, the implicitly 
> implied extensions will have no effect on its function,
>
> and this can be invisible to user if we mask them in isa_string 
> exposed to the kernel.
>
> The question is whether we need constrain the  configuration for 
> general cpu type.

Subset extension for another extension is not a single case in RISC-V. 
such as zaamo is subset of A. Zfhmin is subset of Zfh.

Maybe some of them don't have this problem. However,  I think it's 
better to take the related work away from the developer.

I think we can combine the two method if we want to constrain the 
configuration for general cpu type:

- remain disable  extensions due to privilege spec version mismatch 
before validation to disable the extensions manually set by users

- mask the implicitly enabled extensions in isa_string to make them 
invisible to users (I have sent a new patch to do this, you can pick it 
into

your patchset if this way is acceptable).

Regards,

Weiwei Li

>
> Regards,
>
> Weiwei Li
>
>> I'll hold the rebase of that series until we sort this out. Thanks,
>>
>>
>> Daniel
>>
>>
>>
>> On 3/7/23 05:13, Weiwei Li wrote:
>>> Modify the check for C extension to Zca (C implies Zca).
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>>> ---
>>>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>>   target/riscv/translate.c                | 8 ++++++--
>>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>>> b/target/riscv/insn_trans/trans_rvi.c.inc
>>> index 4ad54e8a49..c70c495fc5 100644
>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr 
>>> *a)
>>>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>>         gen_set_pc(ctx, cpu_pc);
>>> -    if (!has_ext(ctx, RVC)) {
>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>           TCGv t0 = tcg_temp_new();
>>>             misaligned = gen_new_label();
>>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>>> *a, TCGCond cond)
>>>         gen_set_label(l); /* branch taken */
>>>   -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 
>>> 0x3)) {
>>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 
>>> 0x3)) {
>>>           /* misaligned */
>>>           gen_exception_inst_addr_mis(ctx);
>>>       } else {
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 0ee8ee147d..d1fdd0c2d7 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, 
>>> target_ulong imm)
>>>         /* check misaligned: */
>>>       next_pc = ctx->base.pc_next + imm;
>>> -    if (!has_ext(ctx, RVC)) {
>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>           if ((next_pc & 0x3) != 0) {
>>>               gen_exception_inst_addr_mis(ctx);
>>>               return;
>>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, 
>>> DisasContext *ctx, uint16_t opcode)
>>>       if (insn_len(opcode) == 2) {
>>>           ctx->opcode = opcode;
>>>           ctx->pc_succ_insn = ctx->base.pc_next + 2;
>>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
>>> +        /*
>>> +         * The Zca extension is added as way to refer to 
>>> instructions in the C
>>> +         * extension that do not include the floating-point loads 
>>> and stores
>>> +         */
>>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>>>               return;
>>>           }
>>>       } else {


