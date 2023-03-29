Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phRfV-0001sC-Bv
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 05:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phRfM-0001rb-Nt; Wed, 29 Mar 2023 05:00:31 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phRfJ-0006Dr-Rk; Wed, 29 Mar 2023 05:00:24 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACXl0Ma_iNkyNGNGA--.25489S2;
 Wed, 29 Mar 2023 17:00:11 +0800 (CST)
Message-ID: <30288034-8ca0-7e5f-84bc-f2c5f8c6b602@iscas.ac.cn>
Date: Wed, 29 Mar 2023 17:00:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v5 9/9] target/riscv: rework write_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
 <20230328173543.431342-10-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230328173543.431342-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXl0Ma_iNkyNGNGA--.25489S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1rXF45try7Wr4UuFWDtwb_yoW7Zr45p3
 y3C3y3K3yDJrnFv34fJF4DXF18ursYgrWxKwn3W3WrWFZ8JrW0gFnxtwnakFy7CF95Wr4S
 va18Cry7uF4UCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 29 Mar 2023 09:00:31 -0000


On 2023/3/29 01:35, Daniel Henrique Barboza wrote:
> write_misa() must use as much common logic as possible. We want to open
> code just the bits that are exclusive to the CSR write operation and TCG
> internals.
>
> Our validation is done with riscv_cpu_validate_set_extensions(), but we
> need a small tweak first. When enabling RVG we're doing:
>
>          env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>          env->misa_ext_mask = env->misa_ext;
>
> This works fine for realize() time but this can potentially overwrite
> env->misa_ext_mask if we reutilize the function for write_misa().
> Instead of doing misa_ext_mask = misa_ext, sum up the RVG extensions in
> misa_ext_mask as well. This won't change realize() time behavior
> (misa_ext_mask is still == misa_ext)  and will ensure that write_misa()
> won't change misa_ext_mask by accident.
>
> After that, rewrite write_misa() to work as follows:
>
> - mask the write using misa_ext_mask to avoid enabling unsupported
>    extensions;
>
> - suppress RVC if the next insn isn't aligned;
>
> - disable RVG if any of RVG dependencies are being disabled by the user;
>
> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
>    error, rollback to the previous values of misa_ext and misa_ext_mask;
>
> - on success, check if there's a chance that misa_ext_mask was
>    overwritten during the process and restore it;
>
> - handle RVF and MSTATUS_FS and continue as usual.
>
> Let's keep write_misa() as experimental for now until this logic gains
> enough mileage.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c |  4 ++--
>   target/riscv/cpu.h |  1 +
>   target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
>   3 files changed, 23 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cd924029d4..d722674791 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -939,7 +939,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>    * Check consistency between chosen extensions while setting
>    * cpu->cfg accordingly.
>    */
> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
>       Error *local_err = NULL;
> @@ -955,7 +955,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_ifencei = true;
>   
>           env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
> -        env->misa_ext_mask = env->misa_ext;
> +        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>       }
>   
>       if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 03b5cc2cf4..13f6566962 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -575,6 +575,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           bool probe, uintptr_t retaddr);
>   char *riscv_isa_string(RISCVCPU *cpu);
>   void riscv_cpu_list(void);
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>   
>   #define cpu_list riscv_cpu_list
>   #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..37fd619b17 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1343,39 +1343,18 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> +    RISCVCPU *cpu = env_archcpu(env);
> +    uint32_t orig_misa_ext = env->misa_ext;
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
> @@ -1384,18 +1363,32 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           val &= ~RVC;
>       }
>   
> +    /* Disable RVG if any of its dependencies are disabled */
> +    if (!(val & RVI && val & RVM && val & RVA &&
> +          val & RVF && val & RVD)) {
> +        val &= ~RVG;
> +    }
> +
>       /* If nothing changed, do nothing. */
>       if (val == env->misa_ext) {
>           return RISCV_EXCP_NONE;
>       }
>   
> -    if (!(val & RVF)) {
> +    env->misa_ext = val;
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);

This is acceptable to me. However, The check for write_misa can be 
simpler than

riscv_cpu_validate_set_extensions.

After small fix for patch 8,  the all patchset is LGTM.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

> +    if (local_err != NULL) {
> +        /* Rollback on validation error */
> +        env->misa_ext = orig_misa_ext;
> +
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->misa_ext & RVF)) {
>           env->mstatus &= ~MSTATUS_FS;
>       }
>   
>       /* flush translation cache */
>       tb_flush(env_cpu(env));
> -    env->misa_ext = val;
>       env->xl = riscv_cpu_mxl(env);
>       return RISCV_EXCP_NONE;
>   }


