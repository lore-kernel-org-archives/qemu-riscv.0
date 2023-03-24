Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfhXO-00017P-NC
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 09:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhXN-000177-Ss; Fri, 24 Mar 2023 09:32:57 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhW3-0001ri-88; Fri, 24 Mar 2023 09:32:57 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowACnlxQiph1k874cCQ--.4557S2;
 Fri, 24 Mar 2023 21:31:14 +0800 (CST)
Message-ID: <3efb804f-4a3a-758e-fb4a-543e10271045@iscas.ac.cn>
Date: Fri, 24 Mar 2023 21:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 alistair.francis@wdc.com, Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH v11 4/5] target/riscv: smstateen check for fcsr
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-5-mchitale@ventanamicro.com>
 <CAKmqyKO+HQ7dtGQwaJFG481vkyMfX-tXrux2rmrGkfAz54dBbQ@mail.gmail.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKO+HQ7dtGQwaJFG481vkyMfX-tXrux2rmrGkfAz54dBbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACnlxQiph1k874cCQ--.4557S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZryDtrWrAF1DKw4DuF1UAwb_yoWrXr4fpw
 4kGFZxC395tryxZanxGF98XF15tw4kK3yI9wnrta1vqF4DtrWrKF1ktwsrKryDXFy7Wr12
 yay09Fnrur47AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbWCJP
 UUUUU==
X-Originating-IP: [180.165.240.150]
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
X-List-Received-Date: Fri, 24 Mar 2023 13:32:58 -0000


On 2022/11/21 07:35, Alistair Francis wrote:
> On Sun, Oct 16, 2022 at 11:09 PM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
>> If smstateen is implemented and sstateen0.fcsr is clear then the floating point
>> operations must return illegal instruction exception or virtual instruction
>> trap, if relevant.
>>
>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> ---
>>   target/riscv/csr.c                        | 23 ++++++++++++
>>   target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++--
>>   target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
>>   3 files changed, 75 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 71236f2b5d..8b25f885ec 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>>           !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>>           return RISCV_EXCP_ILLEGAL_INST;
>>       }
>> +
>> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
>> +    }
>>   #endif
>>       return RISCV_EXCP_NONE;
>>   }
>> @@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>>                                         target_ulong new_val)
>>   {
>>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>> +    if (!riscv_has_ext(env, RVF)) {
>> +        wr_mask |= SMSTATEEN0_FCSR;
>> +    }
>>
>>       return write_mstateen(env, csrno, wr_mask, new_val);
>>   }
>> @@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>>   {
>>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>
>> +    if (!riscv_has_ext(env, RVF)) {
>> +        wr_mask |= SMSTATEEN0_FCSR;
>> +    }
>> +
>>       return write_mstateenh(env, csrno, wr_mask, new_val);
>>   }
>>
>> @@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>>   {
>>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>
>> +    if (!riscv_has_ext(env, RVF)) {
>> +        wr_mask |= SMSTATEEN0_FCSR;
>> +    }
>> +
>>       return write_hstateen(env, csrno, wr_mask, new_val);
>>   }
>>
>> @@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>>   {
>>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>
>> +    if (!riscv_has_ext(env, RVF)) {
>> +        wr_mask |= SMSTATEEN0_FCSR;
>> +    }
>> +
>>       return write_hstateenh(env, csrno, wr_mask, new_val);
>>   }
>>
>> @@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>>   {
>>       uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>>
>> +    if (!riscv_has_ext(env, RVF)) {
>> +        wr_mask |= SMSTATEEN0_FCSR;
>> +    }
>> +
>>       return write_sstateen(env, csrno, wr_mask, new_val);
>>   }
>>
>> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
>> index a1d3eb52ad..93657680c6 100644
>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>> @@ -24,9 +24,46 @@
>>               return false; \
>>   } while (0)
>>
>> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
>> -    if (!ctx->cfg_ptr->ext_zfinx) { \
>> -        REQUIRE_EXT(ctx, RVF); \
>> +#ifndef CONFIG_USER_ONLY
>> +static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
>> +{
>> +    CPUState *cpu = ctx->cs;
>> +    CPURISCVState *env = cpu->env_ptr;
>> +    uint64_t stateen = env->mstateen[index];
> Sorry I missed this the first time around. You can't access env here
>
> Richard pointed it out here:
> https://patchwork.kernel.org/project/qemu-devel/patch/20221117070316.58447-8-liweiwei@iscas.ac.cn/#25095773
>
> I'm going to drop this patch and patch v5
>
> Alistair

Hi, Any new updates for the last two patches after they were dropped?

Regards,

Weiwei Li


