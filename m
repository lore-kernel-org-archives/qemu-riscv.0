Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfjKx-0000oq-Fb
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfjKv-0000lX-8C; Fri, 24 Mar 2023 11:28:13 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfjKp-0005yG-6h; Fri, 24 Mar 2023 11:28:13 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAAHHhYpvR1kwxYmCQ--.5178S2;
 Fri, 24 Mar 2023 23:09:30 +0800 (CST)
Message-ID: <9997a7ae-f45b-d4b3-9173-66eb48267720@iscas.ac.cn>
Date: Fri, 24 Mar 2023 23:09:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v4 23/25] target/riscv: rework write_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-24-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322222004.357013-24-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAHHhYpvR1kwxYmCQ--.5178S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1rWF4rXF4kZw13Zw18Zrb_yoW7WF4xpr
 W3G39Ik3yDJFy7Z3y3tr1DJF18uw4vgrWfKws3W3yfAFZ5ArW8KFnxKw1Syry7CF95XF1F
 va15CFy2vF4jka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkrcfUUU
 UU=
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
X-List-Received-Date: Fri, 24 Mar 2023 15:28:13 -0000


On 2023/3/23 06:20, Daniel Henrique Barboza wrote:
> write_misa() must use as much common logic as possible. We want to open
> code just the bits that are exclusive to the CSR write operation and TCG
> internals.
>
> Rewrite write_misa() to work as follows:
>
> - mask the write using misa_ext_mask to avoid enabling unsupported
>    extensions;
>
> - suppress RVC if the next insn isn't aligned;
>
> - handle RVE. This is done by filtering all bits but RVE from 'val'.
>    Setting RVE will forcefully set only RVE - assuming it gets
>    validated afterwards;
>
> - emulate the steps done by realize(): validate the candidate misa_ext
>    val, then validate the configuration with the candidate misa_ext val,
>    and finally commit the changes to cpu->cfg.
>
> If any of the validation steps fails, the write operation is a no-op.
>
> Let's keep write_misa() as experimental for now until this logic gains
> enough mileage.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 12 ++++------
>   target/riscv/cpu.h |  6 +++++
>   target/riscv/csr.c | 59 ++++++++++++++++++++++++++--------------------
>   3 files changed, 45 insertions(+), 32 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0e6b8fb45e..41b17ba0c3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1018,9 +1018,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>   }
>   
>   
> -static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
> -                                        uint32_t misa_ext,
> -                                        Error **errp)
> +void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
> +                                 Error **errp)
>   {
>       Error *local_err = NULL;
>   
> @@ -1113,9 +1112,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>    * candidate misa_ext value. No changes in env->misa_ext
>    * are made.
>    */
> -static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
> -                                          uint32_t misa_ext,
> -                                          Error **errp)
> +void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
> +                                   Error **errp)
>   {
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
> @@ -1206,7 +1204,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
>       }
>   }
>   
> -static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
>   {
>       if (cpu->cfg.ext_zk) {
>           cpu->cfg.ext_zkn = true;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dbb4df9df0..ca2ba6a647 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -593,6 +593,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>   char *riscv_isa_string(RISCVCPU *cpu);
>   void riscv_cpu_list(void);
>   
> +void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
> +                                 Error **errp);
> +void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
> +                                   Error **errp);
> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
> +
>   #define cpu_list riscv_cpu_list
>   #define cpu_mmu_index riscv_cpu_mmu_index
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..8d5e8f9ad1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1343,39 +1343,17 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> +    RISCVCPU *cpu = env_archcpu(env);
> +    Error *local_err = NULL;
> +
>       if (!riscv_cpu_cfg(env)->misa_w) {
>           /* drop write to misa */
>           return RISCV_EXCP_NONE;
>       }
>   
> -    /* 'I' or 'E' must be present */
> -    if (!(val & (RVI | RVE))) {
> -        /* It is not, drop write to misa */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /* 'E' excludes all other extensions */
> -    if (val & RVE) {
> -        /*
> -         * when we support 'E' we can do "val = RVE;" however
> -         * for now we just drop writes if 'E' is present.
> -         */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * misa.MXL writes are not supported by QEMU.
> -     * Drop writes to those bits.
> -     */
> -
>       /* Mask extensions that are not supported by this hart */
>       val &= env->misa_ext_mask;
>   
> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> -    if ((val & RVD) && !(val & RVF)) {
> -        val &= ~RVD;
> -    }
> -
>       /*
>        * Suppress 'C' if next instruction is not aligned
>        * TODO: this should check next_pc
> @@ -1389,6 +1367,37 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>   
> +    /*
> +     * We'll handle special cases in separate. If one
> +     * of these bits are enabled we'll handle them and
> +     * end the CSR write.
> +     */
> +    if (val & RVE && !(env->misa_ext & RVE)) {
> +        /*
> +         * RVE must be enabled by itself. Clear all other
> +         * misa_env bits and let the validation do its
> +         * job.
> +         */
> +        val &= RVE;

It can just be val = RVE here.

Regards,

Weiwei Li

> +    }
> +
> +    /*
> +     * This flow is similar to what riscv_cpu_realize() does,
> +     * with the difference that we will update env->misa_ext
> +     * value if everything is ok.
> +     */
> +    riscv_cpu_validate_misa_ext(env, val, &local_err);
> +    if (local_err != NULL) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    riscv_cpu_validate_extensions(cpu, val, &local_err);
> +    if (local_err != NULL) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    riscv_cpu_commit_cpu_cfg(cpu);
> +
>       if (!(val & RVF)) {
>           env->mstatus &= ~MSTATUS_FS;
>       }


