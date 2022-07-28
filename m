Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGyb1-0006uP-MM
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jul 2022 04:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1oGyam-0006ry-89; Thu, 28 Jul 2022 04:10:11 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171]:51804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1oGyai-0000gz-Qc; Thu, 28 Jul 2022 04:09:58 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.17])
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oGyac-007muH-2i; Thu, 28 Jul 2022 09:09:50 +0100
Message-ID: <a0267001-a369-cfab-40ac-05037649166c@codethink.co.uk>
Date: Thu, 28 Jul 2022 09:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
Content-Language: en-GB
To: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
 <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
 <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
 <edef6a28-6378-59a6-5fa8-4f3b0be76b71@iscas.ac.cn>
 <62e5130693cbdbb32355001469f267f63d0311c0.camel@ventanamicro.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <62e5130693cbdbb32355001469f267f63d0311c0.camel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Jul 2022 08:10:14 -0000

On 28/07/2022 07:15, Mayuresh Chitale wrote:
> On Mon, 2022-07-25 at 15:23 +0800, Weiwei Li wrote:
>>
>> 在 2022/7/24 下午11:49, Mayuresh Chitale 写道:
>>> On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
>>>> 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
>>>>> If smstateen is implemented and sstateen0.fcsr is clear then
>>>>> the
>>>>> floating point operations must return illegal instruction
>>>>> exception.
>>>>>
>>>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>>>> ---
>>>>>    target/riscv/csr.c                        | 23 ++++++++++++++
>>>>>    target/riscv/insn_trans/trans_rvf.c.inc   | 38
>>>>> +++++++++++++++++++++--
>>>>>    target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
>>>>>    3 files changed, 63 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>>> index ab06b117f9..a597b6cbc7 100644
>>>>> --- a/target/riscv/csr.c
>>>>> +++ b/target/riscv/csr.c
>>>>> @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env,
>>>>> int
>>>>> csrno)
>>>>>            !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>>>>>            return RISCV_EXCP_ILLEGAL_INST;
>>>>>        }
>>>>> +
>>>>> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>>>>> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
>>>>> +    }
>>>>>    #endif
>>>>>        return RISCV_EXCP_NONE;
>>>>>    }
>>>>> @@ -1876,6 +1880,9 @@ static RISCVException
>>>>> write_mstateen0(CPURISCVState *env, int csrno,
>>>>>                                          target_ulong new_val)
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>>    
>>>>>        return write_mstateen(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>> @@ -1924,6 +1931,10 @@ static RISCVException
>>>>> write_mstateen0h(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_mstateenh(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> @@ -1973,6 +1984,10 @@ static RISCVException
>>>>> write_hstateen0(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_hstateen(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> @@ -2024,6 +2039,10 @@ static RISCVException
>>>>> write_hstateen0h(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_hstateenh(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> @@ -2083,6 +2102,10 @@ static RISCVException
>>>>> write_sstateen0(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_sstateen(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> b/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> index a1d3eb52ad..c43c48336b 100644
>>>>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> @@ -24,9 +24,43 @@
>>>>>                return false; \
>>>>>    } while (0)
>>>>>    
>>>>> +#ifndef CONFIG_USER_ONLY
>>>>> +#define SMSTATEEN_CHECK(ctx) do {\
>>>>> +    CPUState *cpu = ctx->cs; \
>>>>> +    CPURISCVState *env = cpu->env_ptr; \
>>>>> +    if (ctx->cfg_ptr->ext_smstateen && \
>>>>> +        (env->priv < PRV_M)) { \
>>>>> +        uint64_t stateen = env->mstateen[0]; \
>>>>> +        uint64_t hstateen = env->hstateen[0]; \
>>>>> +        uint64_t sstateen = env->sstateen[0]; \
>>>>> +        if (!(stateen & SMSTATEEN_STATEN)) {\
>>>>> +            hstateen = 0; \
>>>>> +            sstateen = 0; \
>>>>> +        } \
>>>>> +        if (ctx->virt_enabled) { \
>>>>> +            stateen &= hstateen; \
>>>>> +            if (!(hstateen & SMSTATEEN_STATEN)) {\
>>>>> +                sstateen = 0; \
>>>>> +            } \
>>>>> +        } \
>>>>> +        if (env->priv == PRV_U && has_ext(ctx, RVS))
>>>>> {\eventually
>>>>> meaning
>>>>> +            stateen &= sstateen; \
>>>>> +        } \
>>>>> +        if (!(stateen & SMSTATEEN0_FCSR)) { \
>>>>> +            return false; \
>>>>> +        } \
>>>>> +    } \

given the size of that I would have thought an "static inline"
function would be easier to write and maintain for SMSTATEEN_CHECK


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

