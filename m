Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkx5N-0008Ld-Ri
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 21:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkx5L-0008LK-MA; Fri, 07 Apr 2023 21:09:43 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkx5I-0006xX-87; Fri, 07 Apr 2023 21:09:43 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAAnL5_HvjBklAHNAA--.25875S2;
 Sat, 08 Apr 2023 09:09:28 +0800 (CST)
Message-ID: <12e6bc22-8de4-2ae3-6a53-d1204b287f84@iscas.ac.cn>
Date: Sat, 8 Apr 2023 09:09:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <ac342677-a7f5-52d6-0410-cd1c84b2197e@iscas.ac.cn>
 <727caa86-0dbb-67f1-068f-e72f79c5e001@iscas.ac.cn>
 <b5dc4c40-f375-89e8-c953-9045211b05d0@ventanamicro.com>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <b5dc4c40-f375-89e8-c953-9045211b05d0@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnL5_HvjBklAHNAA--.25875S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jry5Ww1UZr4fZFyxJrW3trb_yoWfKr1kpF
 18CFy2krWDJrnayryxtr1UJryUtr48Ka1xXrn8t3W8JrZIyr1Yqr4qqr4jgF1kJr4rWr1j
 vF4UAF9xZF1UAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Sat, 08 Apr 2023 01:09:43 -0000


On 2023/4/8 03:25, Daniel Henrique Barboza wrote:
>
>
> On 4/7/23 00:34, liweiwei wrote:
>>
>> On 2023/4/7 09:14, liweiwei wrote:
>>>
>>> On 2023/4/7 04:22, Daniel Henrique Barboza wrote:
>>>> Hi,
>>>>
>>>> This patch is going to break the sifive_u boot if I rebase
>>>>
>>>> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation​"
>>>>
>>>> on top of it, as it is the case today with the current 
>>>> riscv-to-apply.next.
>>>>
>>>> The reason is that the priv spec version for Zca is marked as 
>>>> 1_12_0, and
>>>> the priv spec version for both sifive CPUs is 1_10_0, and both are 
>>>> enabling
>>>> RVC.
>>>>
>>>> This patch from that series above:
>>>>
>>>> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec 
>>>> validate/disable_exts helpers"
>>>>
>>>> Makes the disabling of the extension based on priv version to 
>>>> happen *after* we
>>>> do all the validations, instead of before as we're doing today. Zca 
>>>> (and Zcd) will
>>>> be manually enabled just to be disabled shortly after by the priv 
>>>> spec code. And
>>>> this will happen:
>>>
>>> Yeah, I didn't take priv_version into consideration before.
>>>
>>> This is a new problem if we disable them at the end and was not 
>>> triggered in my previous tests.
>>>
>>> Not only Zca and Zcd, Zcf also has the same problem.
>>>
>>>>
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 
>>>> 0x0000000000000000 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zca extension for hart 
>>>> 0x0000000000000001 because privilege spec version does not match
>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 
>>>> 0x0000000000000001 because privilege spec version does not match
>>>> (--- hangs ---)
>>>>
>>>> This means that the assumption made in this patch - that Zca 
>>>> implies RVC - is no
>>>> longer valid, and all these translations won't work.
>>>>
>>> As specified in Zc* spec,  Zca is the subset of RVC.  C & F include 
>>> Zcf  in RV32. C & D include Zcd.
>>>>
>>>> Some possible solutions:
>>>>
>>>> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We 
>>>> would need to convert
>>>> all Zca checks to RVC checks in all translation code.
>>>
>>> We should check both Zca and RVC in this way.
>>>
>>> Similarly, we also should check both C&F and Zcf for Zcf 
>>> instructions, C&D and Zcd for Zcd instructions.
>>>
>>> I can update this patchset or add a new patch for it if needed.
>>>
>>>>
>>>> - Do not apply patch 5/9 from that series that moves the 
>>>> disable_ext code to the end
>>>> of validation. Also a possibility, but we would be sweeping the 
>>>> problem under the rug.
>>>> Zca still can't be used as a RVC replacement due to priv spec 
>>>> version constraints, but
>>>> we just won't disable Zca because we'll keep validating exts too 
>>>> early (which is the
>>>> problem that the patch addresses).
>>>>
>>>> - change the priv spec of the sifive CPUs - and everyone that uses 
>>>> RVC -  to 1_12_0. Not
>>>> sure if this makes sense.
>>>>
>>>> - do not disable any extensions due to privilege spec version 
>>>> mismatch. This would make
>>>> all the priv_version related artifacts to be more "educational" 
>>>> than to be an actual
>>>> configuration we want to enforce. Not sure if that would do any 
>>>> good in the end, but
>>>> it's also a possibility.
>>>
>>> I prefer this way. For vendor-specific cpu types, the implicitly 
>>> implied extensions will have no effect on its function,
>>>
>>> and this can be invisible to user if we mask them in isa_string 
>>> exposed to the kernel.
>>>
>>> The question is whether we need constrain the  configuration for 
>>> general cpu type.
>>
>> Subset extension for another extension is not a single case in 
>> RISC-V. such as zaamo is subset of A. Zfhmin is subset of Zfh.
>>
>> Maybe some of them don't have this problem. However,  I think it's 
>> better to take the related work away from the developer.
>>
>> I think we can combine the two method if we want to constrain the 
>> configuration for general cpu type:
>>
>> - remain disable  extensions due to privilege spec version mismatch 
>> before validation to disable the extensions manually set by users
>>
>> - mask the implicitly enabled extensions in isa_string to make them 
>> invisible to users (I have sent a new patch to do this, you can pick 
>> it into
>>
>> your patchset if this way is acceptable).
>
> I tested that patch with my series. If we keep the disable extension 
> code to be executed
> before the validation, filtering the extensions that were user enabled 
> only, it fixes
> the problem I reported here.
>
> It's worth noticing though that we would be making the intended, 
> conscious decision of
> hiding extensions from the isa_string that are actually enabled in the 
> hart. And CPUs
> such as SIFIVE_CPU will start working with Z extensions that are 
> beyond their declared
> priv spec. This wouldn't be a problem if we could guarantee that 
> userland would always
> read 'isa_string' before using an extension, but in reality we can't 
> guarantee that.
> Firing an instruction for a given extension and capturing SIGILL to 
> see if the hart supports
> it or not isn't forbidden by the ISA.

The implicitly enabled extensions are mostly subset of its super 
extension, except zfinx (I think it's visible to user,

and we  can change it to check zdinx/zhinx{min} requires it). So 
enabling them when their super subset are enabled will

introduce no additional function to  the cpu. So it's just another 
internal implementation(C is replaced by Zca, Zcf, Zcd)

for SIFIVE_CPU without real function change (neither increase nor  
decrease).

Implicitly enabled extensions may introduce new problem for write_misa: 
C/V function cannot be disabled by it

(I have described before). However,  this is another problem unrelated 
to priv version.

Regards,

Weiwei Li


>
>
> All this said, I don't mind the proposed solution, as long as we're on 
> the same boat
> w.r.t. the design changes and potential userspace impact this might have.
>
>
> Thanks,
>
>
> Daniel
>
>
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>> I'll hold the rebase of that series until we sort this out. Thanks,
>>>>
>>>>
>>>> Daniel
>>>>
>>>>
>>>>
>>>> On 3/7/23 05:13, Weiwei Li wrote:
>>>>> Modify the check for C extension to Zca (C implies Zca).
>>>>>
>>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>>>>> ---
>>>>>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>>>>   target/riscv/translate.c                | 8 ++++++--
>>>>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>>>>> b/target/riscv/insn_trans/trans_rvi.c.inc
>>>>> index 4ad54e8a49..c70c495fc5 100644
>>>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>>>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, 
>>>>> arg_jalr *a)
>>>>>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>>>>         gen_set_pc(ctx, cpu_pc);
>>>>> -    if (!has_ext(ctx, RVC)) {
>>>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>>>           TCGv t0 = tcg_temp_new();
>>>>>             misaligned = gen_new_label();
>>>>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, 
>>>>> arg_b *a, TCGCond cond)
>>>>>         gen_set_label(l); /* branch taken */
>>>>>   -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 
>>>>> 0x3)) {
>>>>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 
>>>>> 0x3)) {
>>>>>           /* misaligned */
>>>>>           gen_exception_inst_addr_mis(ctx);
>>>>>       } else {
>>>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>>>> index 0ee8ee147d..d1fdd0c2d7 100644
>>>>> --- a/target/riscv/translate.c
>>>>> +++ b/target/riscv/translate.c
>>>>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, 
>>>>> target_ulong imm)
>>>>>         /* check misaligned: */
>>>>>       next_pc = ctx->base.pc_next + imm;
>>>>> -    if (!has_ext(ctx, RVC)) {
>>>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>>>           if ((next_pc & 0x3) != 0) {
>>>>>               gen_exception_inst_addr_mis(ctx);
>>>>>               return;
>>>>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, 
>>>>> DisasContext *ctx, uint16_t opcode)
>>>>>       if (insn_len(opcode) == 2) {
>>>>>           ctx->opcode = opcode;
>>>>>           ctx->pc_succ_insn = ctx->base.pc_next + 2;
>>>>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
>>>>> +        /*
>>>>> +         * The Zca extension is added as way to refer to 
>>>>> instructions in the C
>>>>> +         * extension that do not include the floating-point loads 
>>>>> and stores
>>>>> +         */
>>>>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>>>>>               return;
>>>>>           }
>>>>>       } else {
>>


