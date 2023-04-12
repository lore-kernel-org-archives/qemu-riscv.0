Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQe1-0007HV-IB
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQdz-0007HI-Hp; Tue, 11 Apr 2023 22:55:35 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmQdw-0003xG-8s; Tue, 11 Apr 2023 22:55:35 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACnrc2WHTZksWVBEQ--.60018S2;
 Wed, 12 Apr 2023 10:55:19 +0800 (CST)
Message-ID: <0f2ebe23-750c-26eb-9d3e-920c80a3c222@iscas.ac.cn>
Date: Wed, 12 Apr 2023 10:55:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, richard.henderson@linaro.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <CAKmqyKP6Omm8HypeRps0xCaZXxw+VXsT0KY2ONtfOZmjR9WnDA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKP6Omm8HypeRps0xCaZXxw+VXsT0KY2ONtfOZmjR9WnDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrc2WHTZksWVBEQ--.60018S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4rWw4rAF1DWrW5KF1DAwb_yoW7Kw1DpF
 4xCF12kr4kJrySyFyIgr4jqr1Utr4S9FWxJwn0gw1rArZxJrWYqrWkKrWSgFyDZFs5Wr4j
 9F4qyFn3ZayYyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.17,
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
X-List-Received-Date: Wed, 12 Apr 2023 02:55:35 -0000


On 2023/4/12 10:12, Alistair Francis wrote:
> On Fri, Apr 7, 2023 at 6:23 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>> Hi,
>>
>> This patch is going to break the sifive_u boot if I rebase
>>
>> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation"
>>
>> on top of it, as it is the case today with the current riscv-to-apply.next.
>>
>> The reason is that the priv spec version for Zca is marked as 1_12_0, and
>> the priv spec version for both sifive CPUs is 1_10_0, and both are enabling
>> RVC.
>>
>> This patch from that series above:
>>
>> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_exts helpers"
>>
>> Makes the disabling of the extension based on priv version to happen *after* we
>> do all the validations, instead of before as we're doing today. Zca (and Zcd) will
>> be manually enabled just to be disabled shortly after by the priv spec code. And
>> this will happen:
>>
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
>> (--- hangs ---)
>>
>> This means that the assumption made in this patch - that Zca implies RVC - is no
>> longer valid, and all these translations won't work.
> Thanks for catching and reporting this
>
>>
>> Some possible solutions:
>>
>> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We would need to convert
>> all Zca checks to RVC checks in all translation code.
> This to me seems like the best solution

I had also implemented a patch for this solution. I'll sent it later.

However, this will introduce additional check. i.e. check both Zca and C 
or , both Zcf/d and CF/CD.

I think this is not very necessary. Implcitly-enabled extensions is 
often the subsets of existed extension.

So enabling them will introduce no additional function to the cpus.

We can just make them invisible to user(mask them in the isa string) 
instead of disabling them  to be compatible with lower priv version.

Regards,

Weiwei Li


>
>> - Do not apply patch 5/9 from that series that moves the disable_ext code to the end
>> of validation. Also a possibility, but we would be sweeping the problem under the rug.
>> Zca still can't be used as a RVC replacement due to priv spec version constraints, but
>> we just won't disable Zca because we'll keep validating exts too early (which is the
>> problem that the patch addresses).
>>
>> - change the priv spec of the sifive CPUs - and everyone that uses RVC -  to 1_12_0. Not
>> sure if this makes sense.
>>
>> - do not disable any extensions due to privilege spec version mismatch. This would make
>> all the priv_version related artifacts to be more "educational" than to be an actual
>> configuration we want to enforce. Not sure if that would do any good in the end, but
>> it's also a possibility.
> This also seems like something we can do. Printing a warning but
> continuing on seems reasonable to me. That allows users to
> enable/disable features even if the versions don't match.
>
> I don't think this is the solution for this problem though
>
> Alistair
>
>>
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
>>>    target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>>    target/riscv/translate.c                | 8 ++++++--
>>>    2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
>>> index 4ad54e8a49..c70c495fc5 100644
>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>>        tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>>
>>>        gen_set_pc(ctx, cpu_pc);
>>> -    if (!has_ext(ctx, RVC)) {
>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>            TCGv t0 = tcg_temp_new();
>>>
>>>            misaligned = gen_new_label();
>>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>>>
>>>        gen_set_label(l); /* branch taken */
>>>
>>> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>>            /* misaligned */
>>>            gen_exception_inst_addr_mis(ctx);
>>>        } else {
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 0ee8ee147d..d1fdd0c2d7 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>>>
>>>        /* check misaligned: */
>>>        next_pc = ctx->base.pc_next + imm;
>>> -    if (!has_ext(ctx, RVC)) {
>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>            if ((next_pc & 0x3) != 0) {
>>>                gen_exception_inst_addr_mis(ctx);
>>>                return;
>>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>>>        if (insn_len(opcode) == 2) {
>>>            ctx->opcode = opcode;
>>>            ctx->pc_succ_insn = ctx->base.pc_next + 2;
>>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
>>> +        /*
>>> +         * The Zca extension is added as way to refer to instructions in the C
>>> +         * extension that do not include the floating-point loads and stores
>>> +         */
>>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>>>                return;
>>>            }
>>>        } else {


