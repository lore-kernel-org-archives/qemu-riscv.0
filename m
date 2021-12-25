Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0xfl-0003wR-Pc
	for mharc-qemu-riscv@gnu.org; Fri, 24 Dec 2021 22:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0xfk-0003wB-Q0; Fri, 24 Dec 2021 22:24:40 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:42156 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0xfi-00065s-AO; Fri, 24 Dec 2021 22:24:40 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAD3_p7vjsZhPvEdBQ--.1504S2;
 Sat, 25 Dec 2021 11:24:32 +0800 (CST)
Subject: Re: [PATCH 3/6] target/riscv: add support for zfinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-4-liweiwei@iscas.ac.cn>
 <a075e163-820e-d6ee-149d-1311af9dcc0a@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <5afd3037-a3c2-6dc3-5a70-9f8b8e061c8c@iscas.ac.cn>
Date: Sat, 25 Dec 2021 11:24:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a075e163-820e-d6ee-149d-1311af9dcc0a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3_p7vjsZhPvEdBQ--.1504S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfWw4kGFWDJr4kuryfWFg_yoW5trW7pr
 n5JrW8JFyUJF95JryUtF1UJFy5Ar1UJ3WUJr18X3WUtrW3Jr1jgry5Wr1qgr15A3ykXr15
 JryUJrnrZr47Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28Icx
 kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjdHUDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Sat, 25 Dec 2021 03:24:41 -0000


在 2021/12/25 上午6:26, Richard Henderson 写道:
> On 12/23/21 7:49 PM, liweiwei wrote:
>>   static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
>>   {
>>       REQUIRE_FPU;
>> -    REQUIRE_EXT(ctx, RVF);
>> +    REQUIRE_ZFINX_OR_F(ctx);
>>   +    TCGv_i64 dest = dest_fpr(ctx, a->rd);
>>       if (a->rs1 == a->rs2) { /* FMOV */
>> -        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
>> +        TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>> +        if (ctx->ext_zfinx) {
>> +            gen_nanbox_s(dest, src1);
>
> Sign-extend, not nanbox.  Or, since you handle sign-extension in 
> gen_set_gpr_hs, nothing at all -- just tcg_gen_mov_i64.

Yeah. I did gen_nanbox_s here is to make the dest nan-boxing just as 
other instructions. It's truely unnecessary here. I'll try maximize the 
reuse of code here.

>
>>       } else { /* FSGNJ */
>> -        TCGv_i64 rs1 = tcg_temp_new_i64();
>> -        TCGv_i64 rs2 = tcg_temp_new_i64();
>> -
>> -        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
>> -        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
>> -
>> -        /* This formulation retains the nanboxing of rs2. */
>> -        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
>> -        tcg_temp_free_i64(rs1);
>> -        tcg_temp_free_i64(rs2);
>> +        TCGv_i64 rs1, rs2;
>> +        if (!ctx->ext_zfinx) {
>> +            TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>> +            TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>> +            rs1 = tcg_temp_new_i64();
>> +            rs2 = tcg_temp_new_i64();
>> +            gen_check_nanbox_s(rs1, src1);
>> +            gen_check_nanbox_s(rs2, src2);
>> +        } else {
>> +            rs1 = get_fpr_hs(ctx, a->rs1);
>> +            rs2 = get_fpr_hs(ctx, a->rs2);
>> +        }
>> +
>> +        /* This formulation retains the nanboxing of rs2 in normal 
>> 'F'. */
>> +        tcg_gen_deposit_i64(dest, rs2, rs1, 0, 31);
>> +        if (!ctx->ext_zfinx) {
>> +            tcg_temp_free_i64(rs1);
>> +            tcg_temp_free_i64(rs2);
>> +        } else {
>> +            gen_nanbox_s(dest, dest);
>> +        }
>
> This is tangled enough that I think you should check zfinx at one 
> higher indent level, and not do conditional allocate followed by 
> conditional free.
OK, I'll divide them. By the way I did in this way to maximize the reuse 
of code.
>
>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>> index 065e8162a2..9f3f3319f2 100644
>> --- a/target/riscv/internals.h
>> +++ b/target/riscv/internals.h
>> @@ -51,8 +51,12 @@ static inline uint64_t nanbox_s(float32 f)
>>       return f | MAKE_64BIT_MASK(32, 32);
>>   }
>>   -static inline float32 check_nanbox_s(uint64_t f)
>> +static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
>>   {
>> +    /* Disable nanbox check when enable zfinx */
>> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx)
>> +        return (uint32_t)f;
>> +
>
> Braces.
>
>
> r~


