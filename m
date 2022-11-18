Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ow01h-0002M9-O0
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 06:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ow01g-0002Lf-J7; Fri, 18 Nov 2022 06:59:20 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ow01d-0006yr-RL; Fri, 18 Nov 2022 06:59:20 -0500
Received: from [192.168.3.6] (unknown [180.165.240.202])
 by APP-05 (Coremail) with SMTP id zQCowABnbraKc3djYGkrCg--.21366S2;
 Fri, 18 Nov 2022 19:59:08 +0800 (CST)
Message-ID: <7af51b39-79b1-b2d8-a2a2-0d27a26b3701@iscas.ac.cn>
Date: Fri, 18 Nov 2022 19:59:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221118071704.26959-1-liweiwei@iscas.ac.cn>
 <20221118071704.26959-8-liweiwei@iscas.ac.cn>
 <f3525752-ac4b-f355-7ed5-3e9cf88e3116@linaro.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <f3525752-ac4b-f355-7ed5-3e9cf88e3116@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnbraKc3djYGkrCg--.21366S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFyDXFyDGF4fKF4fJrW5KFg_yoW5WF1rpF
 1ktrWUAFWUJr95Xw1UGryDJFy5Ar18G3WUXr48XFyUJay7Ar1Fgr1UXrZ09r1UCr4kZr4U
 AF15ZFnrur13XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Nov 2022 11:59:20 -0000


On 2022/11/18 18:24, Richard Henderson wrote:
> On 11/17/22 23:17, Weiwei Li wrote:
>> +target_ulong HELPER(cm_jalt)(CPURISCVState *env, target_ulong index,
>> +                             target_ulong next_pc)
>> +{
>> +
>> +#if !defined(CONFIG_USER_ONLY)
>> +    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
>> +    if (ret != RISCV_EXCP_NONE) {
>> +        riscv_raise_exception(env, ret, GETPC());
>> +    }
>> +#endif
>> +
>> +    target_ulong target = next_pc;
>> +    target_ulong val = 0;
>> +    int xlen = riscv_cpu_xlen(env);
>> +
>> +    val = env->jvt;
>> +
>> +    uint8_t mode = get_field(val, JVT_MODE);
>> +    target_ulong base = get_field(val, JVT_BASE);
>> +    target_ulong t0;
>> +
>> +    if (mode != 0) {
>> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>> +    }
>> +
>> +    if (xlen == 32) {
>> +        t0 = base + (index << 2);
>> +        target = cpu_ldl_code(env, t0);
>> +    } else {
>> +        t0 = base + (index << 3);
>> +        target = cpu_ldq_code(env, t0);
>> +    }
>
> Much better.  The only problem is here where cpu_ld*_code does not 
> have support for unwind from exception.  If this load faults, we won't 
> update env->pc on the way out (we are normally loading for code during 
> translation, where pc is perforce up to date).  I should have noticed 
> this before.
>
> The way to fix this is to update cpu_pc to the current instruction 
> before calling the helper.  At which point none of the other exception 
> exits need to unwind either, so you can replace all of the GETPC() 
> with 0.
OK.  I'll fix it.
>
>> +
>> +    /* index >= 32 for cm.jalt, otherwise for cm.jt */
>> +    if (index >= 32) {
>> +        env->gpr[1] = next_pc;
>> +    }
>
> This is simple enough to do in the caller, and then you don't need to 
> pass in next_pc.
> And since you don't modify xRA in the helper you can do
>
> DEF_HELPER_FLAGS_3(cm_jt, TCG_CALL_NO_WG, tl, env, tl, tl)
>
> static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
> {
>     REQUIRE_ZCMT(ctx);
>
>     /*
>      * Update pc to current for the non-unwinding exception
>      * that might come from cpu_ld*_code() in the helper.
>      */
>     tcg_gen_movi_tl(cpu_pc, s->base.pc_next);
>     gen_helper_cm_jt(cpu_pc, cpu_env, tcg_constant_i32(a->index))
>
>     /* c.jt vs c.jalt depends on the index. */
>     if (a->index >= 32) {
>         gen_set_gpri(ctx, xRA, ctx->pc_succ_insn);
>     }
>     tcg_gen_lookup_and_goto_ptr();
>     ctx->base.is_jmp = DISAS_NORETURN;
>     return true;
> }
>
OK. I'll update it. Thanks a lot.

Regards,

Weiwei Li

>
> r~


