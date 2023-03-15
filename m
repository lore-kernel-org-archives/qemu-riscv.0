Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcJe2-0002dY-TM
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 01:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcJdz-0002Zn-9V; Wed, 15 Mar 2023 01:25:47 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcJdv-0008TG-3q; Wed, 15 Mar 2023 01:25:45 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowACXnxfOVhFkK7AzAw--.955S2;
 Wed, 15 Mar 2023 13:25:35 +0800 (CST)
Message-ID: <dcb258d6-411c-27bc-794b-c928b8484cdc@iscas.ac.cn>
Date: Wed, 15 Mar 2023 13:25:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v2 25/26] target/riscv: rework write_misa()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-26-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230314164948.539135-26-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACXnxfOVhFkK7AzAw--.955S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr15Zry3ZrW8tF48Kw43GFg_yoW7CFykpr
 43G39Ik3srJF9Fv3y3tr1DJF18uwsYgFWxKwn7W3yfAFZ5ArWrGFnxKw1Skry7uF95Wr4S
 va15CFy2vF4jka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [180.165.240.243]
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
X-List-Received-Date: Wed, 15 Mar 2023 05:25:49 -0000


On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
> write_misa() must use as much common logic as possible. We want to open
> code just the bits that are exclusive to the CSR write operation and TCG
> internals.
>
> Rewrite write_misa() to work as follows:
>
> - supress RVC right after verifying that we're not updating RVG;
>
> - mask the write using misa_ext_mask to avoid enabling unsupported
>    extensions;
>
> - emulate the steps done by realize(): validate the candidate misa_ext
>    val, then validate the configuration with the candidate misa_ext val,
>    and finally commit the changes to cpu->cfg.
>
> If any of the validation steps fails simply ignore the write operation.
>
> Let's keep write_misa() as experimental for now until this logic gains
> enough mileage.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 12 +++++-------
>   target/riscv/cpu.h |  6 ++++++
>   target/riscv/csr.c | 47 +++++++++++++++++++++-------------------------
>   3 files changed, 32 insertions(+), 33 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5bd92e1cda..4789a7b70d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1027,9 +1027,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
> @@ -1134,9 +1133,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
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
> @@ -1227,7 +1225,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
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
> index 918d442ebd..6f26e7dbcd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1343,6 +1343,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> +    RISCVCPU *cpu = env_archcpu(env);
> +    Error *local_err = NULL;
> +
>       if (!riscv_cpu_cfg(env)->misa_w) {
>           /* drop write to misa */
>           return RISCV_EXCP_NONE;
> @@ -1353,47 +1356,39 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
>       /*
> -     * misa.MXL writes are not supported by QEMU.
> -     * Drop writes to those bits.
> +     * Suppress 'C' if next instruction is not aligned
> +     * TODO: this should check next_pc
>        */
> +    if ((val & RVC) && (GETPC() & ~3) != 0) {
> +        val &= ~RVC;
> +    }
>   
>       /* Mask extensions that are not supported by this hart */
>       val &= env->misa_ext_mask;
>   
> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> -    if ((val & RVD) && !(val & RVF)) {
> -        val &= ~RVD;
> +    /* If nothing changed, do nothing. */
> +    if (val == env->misa_ext) {
> +        return RISCV_EXCP_NONE;
>       }
>   
>       /*
> -     * Suppress 'C' if next instruction is not aligned
> -     * TODO: this should check next_pc
> +     * This flow is similar to what riscv_cpu_realize() does,
> +     * with the difference that we will update env->misa_ext
> +     * value if everything is ok.
>        */
> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> -        val &= ~RVC;
> +    riscv_cpu_validate_misa_ext(env, val, &local_err);
> +    if (local_err != NULL) {
> +        return RISCV_EXCP_NONE;
>       }
>   
> -    /* If nothing changed, do nothing. */
> -    if (val == env->misa_ext) {
> +    riscv_cpu_validate_extensions(cpu, val, &local_err);
> +    if (local_err != NULL) {
>           return RISCV_EXCP_NONE;
>       }
>   
> +    riscv_cpu_commit_cpu_cfg(cpu);
> +

In this way, it seems that Disabling V in misa may be enabled but will 
not work, since Zve64d/f... is still true.

The similar questions for C when Zc* extension is supported.

And in this way, if multi-letter extensions(such as Zfh) which depend on 
misa extensions(F) are supported, whether the misa extensions can be 
disabled? The answer is 'NO' in current implementation.

Regards,

Weiwei Li

>       if (!(val & RVF)) {
>           env->mstatus &= ~MSTATUS_FS;
>       }


