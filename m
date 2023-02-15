Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSBFU-0004kx-9K
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 01:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSBFP-0004fM-MP; Wed, 15 Feb 2023 01:26:34 -0500
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSBFN-0001Nr-DL; Wed, 15 Feb 2023 01:26:31 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VbiwHtb_1676442380; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbiwHtb_1676442380) by smtp.aliyun-inc.com;
 Wed, 15 Feb 2023 14:26:20 +0800
Message-ID: <52823708-4a64-cba9-ef7a-408ffde21b31@linux.alibaba.com>
Date: Wed, 15 Feb 2023 14:26:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 RFC Zisslpcfi 4/9] target/riscv: helper functions for
 forward and backward cfi
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-5-debug@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230209062404.3582018-5-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.35, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 06:26:34 -0000


On 2023/2/9 14:23, Deepak Gupta wrote:
> Implementation for forward cfi and backward cfi needs helper function
> to determine if currently fcfi and bcfi are enabled. Enable depends on
> privilege mode and settings in sstatus/menvcfg/henvcfg/mseccfg CSRs.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c | 51 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 18db61a06a..d14ea4f91d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -568,6 +568,8 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
>   void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>   bool riscv_cpu_two_stage_lookup(int mmu_idx);
>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
> +bool cpu_get_fcfien(CPURISCVState *env);
> +bool cpu_get_bcfien(CPURISCVState *env);
>   hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                                  MMUAccessType access_type, int mmu_idx,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9a28816521..a397023840 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -30,6 +30,7 @@
>   #include "sysemu/cpu-timers.h"
>   #include "cpu_bits.h"
>   #include "debug.h"
> +#include "pmp.h"
>   
>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   {
> @@ -40,6 +41,56 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #endif
>   }
>   
> +bool cpu_get_fcfien(CPURISCVState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return false;
> +#else
> +    /* no cfi extension, return false */
> +    if (!env_archcpu(env)->cfg.ext_cfi) {
> +        return false;
> +    }
> +
> +    switch (env->priv) {
> +    case PRV_U:
> +        return (env->mstatus & MSTATUS_UFCFIEN) ? true : false;

It's not right. We should also check for menvcfg.cfie. The same to other 
checks in S mode or U mode.

Zhiwei

> +    case PRV_S:
> +        return (env->menvcfg & MENVCFG_SFCFIEN) ? true : false;
> +    case PRV_M:
> +        return (env->mseccfg & MSECCFG_MFCFIEN) ? true : false;
> +    default:
> +        g_assert_not_reached();
> +    }
> +#endif
> +}
> +
> +bool cpu_get_bcfien(CPURISCVState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    return false;
> +#else
> +    /* no cfi extension, return false */
> +    if (!env_archcpu(env)->cfg.ext_cfi) {
> +        return false;
> +    }
> +
> +    switch (env->priv) {
> +    case PRV_U:
> +        return (env->mstatus & MSTATUS_UBCFIEN) ? true : false;
> +
> +        /*
> +         * no gating for back cfi in M/S mode. back cfi is always on for
> +         * M/S mode
> +         */
> +    case PRV_S:
> +    case PRV_M:
> +        return true;
> +    default:
> +        g_assert_not_reached();
> +    }
> +#endif
> +}
> +
>   void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                             target_ulong *cs_base, uint32_t *pflags)
>   {

