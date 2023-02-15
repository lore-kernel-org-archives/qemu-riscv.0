Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSB0d-0000Z3-Fx
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 01:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSB0b-0000Yf-Oq; Wed, 15 Feb 2023 01:11:13 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSB0Z-0000F7-53; Wed, 15 Feb 2023 01:11:13 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VbiwCK7_1676441460; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbiwCK7_1676441460) by smtp.aliyun-inc.com;
 Wed, 15 Feb 2023 14:11:01 +0800
Message-ID: <ab4b143a-0fac-dbd5-7e35-46e8433a1644@linux.alibaba.com>
Date: Wed, 15 Feb 2023 14:10:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 RFC Zisslpcfi 5/9] target/riscv: state save and restore
 of zisslppcfi state
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-6-debug@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230209062404.3582018-6-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 06:11:14 -0000


On 2023/2/9 14:24, Deepak Gupta wrote:
> zisslpcfi's forward cfi if enabled on a hart, enables tracking of
> indirect branches. CPU/hart internally keeps a state `elp` short
> for expecting landing pad instruction. This state goes into
> LP_EXPECTED on an indirect branch. But an interrupt/exception can occur
> before target instruction is executed. In such a case this state must be
> preserved so that it can be restored later. zisslpcfi saves elp state in
> `sstatus` CSR.

And mstatus CSR.

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

> This patch saves elp state in sstatus CSR on trap delivery
> while restores from sstatus CSR on trap return.
>
> Additionally state in sstatus CSR must have save and restore zisslpcfi
> state on exiting from hypervisor and entering into hypervisor.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/cpu_bits.h   |  5 +++++
>   target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
>   target/riscv/op_helper.c  | 12 ++++++++++++
>   3 files changed, 43 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 1663ba5775..37100ec8f6 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -594,6 +594,11 @@ typedef enum {
>   
>   #define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
>                                SSTATUS_SPELP)
> +/* enum for branch tracking state in cpu/hart */
> +typedef enum {
> +    NO_LP_EXPECTED = 0,
> +    LP_EXPECTED = 1,
> +} cfi_elp;
>   
>   /* hstatus CSR bits */
>   #define HSTATUS_VSBE         0x00000020
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a397023840..fc188683c9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -534,6 +534,16 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>       if (riscv_has_ext(env, RVF)) {
>           mstatus_mask |= MSTATUS_FS;
>       }
> +
> +    /*
> +     * If cfi extension available, menvcfg.CFI = 1 and henvcfg.CFI = 1,
> +     * then apply CFI mask on mstatus
> +     */
> +    if (env_archcpu(env)->cfg.ext_cfi &&
> +        get_field(env->menvcfg, MENVCFG_CFI) &&
> +        get_field(env->henvcfg, HENVCFG_CFI)) {
> +        mstatus_mask |= CFISTATUS_S_MASK;
> +    }
>       bool current_virt = riscv_cpu_virt_enabled(env);
>   
>       g_assert(riscv_has_ext(env, RVH));
> @@ -1723,6 +1733,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       if (env->priv <= PRV_S &&
>               cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
>           /* handle the trap in S-mode */
> +        /* save elp status */
> +        if (cpu_get_fcfien(env)) {
> +            env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, env->elp);
> +        }
>           if (riscv_has_ext(env, RVH)) {
>               uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
>   
> @@ -1772,6 +1786,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           riscv_cpu_set_mode(env, PRV_S);
>       } else {
>           /* handle the trap in M-mode */
> +        /* save elp status */
> +        if (cpu_get_fcfien(env)) {
> +            env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
> +        }
>           if (riscv_has_ext(env, RVH)) {
>               if (riscv_cpu_virt_enabled(env)) {
>                   riscv_cpu_swap_hypervisor_regs(env);
> @@ -1803,6 +1821,14 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>           riscv_cpu_set_mode(env, PRV_M);
>       }
>   
> +    /*
> +     * Interrupt/exception/trap delivery is asynchronous event and as per
> +     * Zisslpcfi spec CPU should clear up the ELP state. If cfi extension is
> +     * available, clear ELP state.
> +     */
> +    if (cpu->cfg.ext_cfi) {
> +        env->elp = NO_LP_EXPECTED;
> +    }
>       /* NOTE: it is not necessary to yield load reservations here. It is only
>        * necessary for an SC from "another hart" to cause a load reservation
>        * to be yielded. Refer to the memory consistency model section of the
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 878bcb03b8..d15893aa82 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -176,6 +176,12 @@ target_ulong helper_sret(CPURISCVState *env)
>           riscv_cpu_set_virt_enabled(env, prev_virt);
>       }
>   
> +    /* If forward cfi enabled for target, restore elp status */
> +    if (cpu_get_fcfien(env)) {
> +        env->elp = get_field(env->mstatus, MSTATUS_SPELP);
> +        env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, 0);
> +    }
> +
>       riscv_cpu_set_mode(env, prev_priv);
>   
>       return retpc;
> @@ -220,6 +226,12 @@ target_ulong helper_mret(CPURISCVState *env)
>           riscv_cpu_set_virt_enabled(env, prev_virt);
>       }
>   
> +    /* If forward cfi enabled for target, restore elp status */
> +    if (cpu_get_fcfien(env)) {
> +        env->elp = get_field(env->mstatus, MSTATUS_MPELP);
> +        env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, 0);
> +    }
> +
>       return retpc;
>   }
>   

