Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phgns-0000qJ-Ez
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 21:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phgnq-0000pm-FI; Wed, 29 Mar 2023 21:10:10 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phgnn-0002XZ-Ec; Wed, 29 Mar 2023 21:10:10 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAA3PFRl4SRkh+MFDA--.25721S2;
 Thu, 30 Mar 2023 09:09:58 +0800 (CST)
Message-ID: <3fdf9a33-767a-53f9-c222-ef9cd39f0689@iscas.ac.cn>
Date: Thu, 30 Mar 2023 09:09:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 4/5] target/riscv: Add support for PC-relative
 translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-5-liweiwei@iscas.ac.cn>
 <08b81942-a356-51c2-9de1-6e057a2ca8b1@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <08b81942-a356-51c2-9de1-6e057a2ca8b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3PFRl4SRkh+MFDA--.25721S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1UAr48CrWkWF15WF4rKrg_yoWrGr1fpF
 n5GryUWFyUJr95JF4UGw4UAFy5Ar4UG3WDJr1rX3WUKF47tr1jgr4UXrn0934Uur4fXr4Y
 yFWUJrnrZF17Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Thu, 30 Mar 2023 01:10:10 -0000


On 2023/3/30 00:27, Richard Henderson wrote:
> On 3/28/23 20:23, Weiwei Li wrote:
>>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>>   {
>> -    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>> +    assert(ctx->pc_save != -1);
>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>> +        TCGv target_pc = tcg_temp_new();
>
> dest_gpr(s, a->rd)
OK. I'll fix this.
>
>> @@ -51,26 +59,43 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
>>   static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>   {
>>       TCGLabel *misaligned = NULL;
>> +    TCGv succ_pc = tcg_temp_new();
>
> succ_pc can by null for !CF_PCREL...
I think this is OK since it's only used for CF_PCREL.
>
>> +    TCGv target_pc = tcg_temp_new();
>> +
>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - 
>> ctx->pc_save);
>> +    }
>
> ... or initialized like
>
>        } else {
>            succ_pc = tcg_constant_tl(ctx->pc_succ_insn);
>        }
>
>> -    gen_set_pc(ctx, cpu_pc);
>>       if (!has_ext(ctx, RVC)) {
>>           TCGv t0 = tcg_temp_new();
>>             misaligned = gen_new_label();
>> -        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
>> +        tcg_gen_andi_tl(t0, target_pc, 0x2);
>>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
>>       }
> ...
>>       if (misaligned) {
>>           gen_set_label(misaligned);
>> -        gen_exception_inst_addr_mis(ctx);
>> +        gen_exception_inst_addr_mis(ctx, target_pc);
>>       }
>
> This is what I expected from patch 3: cpu_pc is unchanged, with the 
> new (incorrect) address passed to inst_addr_mis for assigning to 
> badaddr.  Bug being fixed here, thus should really be a separate patch.

It's OK to update cpu_pc before gen_exception_inst_addr_mis() since it 
will restore the current pc by gen_set_pc_imm() after update cpu_pc into 
badaddr.

However, after PC-relative translation is enabled, we cannot use 
gen_set_pc to directly update cpu_pc in above case, since gen_set_pc() 
will break the pc_save, and make gen_set_pc_imm() in 
gen_exception_inst_addr_mis() failed. So we introduce a temp target_pc  
instead of cpu_pc to compute the destination pc and use it to do 
misaligned check.

>
>> @@ -172,7 +197,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>       if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>           /* misaligned */
>>           gen_set_pc_imm(ctx, ctx->base.pc_next + a->imm);
>> -        gen_exception_inst_addr_mis(ctx);
>> +        gen_exception_inst_addr_mis(ctx, cpu_pc);
>
> But this one's different and (probably) incorrect.
>
>> @@ -552,13 +567,21 @@ static void gen_jal(DisasContext *ctx, int rd, 
>> target_ulong imm)
>>       if (!has_ext(ctx, RVC)) {
>>           if ((next_pc & 0x3) != 0) {
>>               gen_set_pc_imm(ctx, next_pc);
>> -            gen_exception_inst_addr_mis(ctx);
>> +            gen_exception_inst_addr_mis(ctx, cpu_pc);
>
> Likewise.
>
>> +    assert(ctx->pc_save != -1);
>> +    if (tb_cflags(ctx->base.tb) & CF_PCREL) {
>> +        TCGv succ_pc = tcg_temp_new();
>> +        tcg_gen_addi_tl(succ_pc, cpu_pc, ctx->pc_succ_insn - 
>> ctx->pc_save);
>> +        gen_set_gpr(ctx, rd, succ_pc);
>
> dest_gpr.

OK. I'll fix this.

Regards,

Weiwei Li

>
>
>
> r~


