Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgPtb-00077v-R8
	for mharc-qemu-riscv@gnu.org; Sun, 26 Mar 2023 08:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgPtZ-00077h-Vn; Sun, 26 Mar 2023 08:54:50 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgPtX-0006rJ-45; Sun, 26 Mar 2023 08:54:49 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAB3kNSEQCBkRWUqFw--.60159S2;
 Sun, 26 Mar 2023 20:54:30 +0800 (CST)
Message-ID: <19e510b0-96dd-b839-c7fa-e7164b425170@iscas.ac.cn>
Date: Sun, 26 Mar 2023 20:54:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 02/25] target/riscv: Add a general status enum for
 extensions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com, liweiwei@iscas.ac.cn
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-3-richard.henderson@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230325105429.1142530-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAB3kNSEQCBkRWUqFw--.60159S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr1UGF13WF18Xr18Xr1xuFg_yoW7uFW3pr
 4kCayfKrW8ta9rCa4Syw1DGr1rJr13KFWDCws7W3yrKFWrJ3y5CFnrtws3ZryDWF48Gw4j
 vF4ruw1vyr42yrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
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
X-List-Received-Date: Sun, 26 Mar 2023 12:54:50 -0000


On 2023/3/25 18:54, Richard Henderson wrote:
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> The pointer masking is the only extension that directly use status.
> The vector or float extension uses the status in an indirect way.
>
> Replace the pointer masking extension special status fields with
> the general status.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Message-Id: <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
> [rth: Add a typedef for the enum]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/cpu.h      |  8 ++++++++
>   target/riscv/cpu_bits.h | 12 ++++--------
>   target/riscv/cpu.c      |  2 +-
>   target/riscv/csr.c      | 14 +++++++-------
>   4 files changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 12fe8d8546..30d9828d59 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -99,6 +99,14 @@ enum {
>       TRANSLATE_G_STAGE_FAIL
>   };
>   
> +/* Extension context status */
> +typedef enum {
> +    EXT_STATUS_DISABLED = 0,
> +    EXT_STATUS_INITIAL,
> +    EXT_STATUS_CLEAN,
> +    EXT_STATUS_DIRTY,
> +} RISCVExtStatus;
> +
>   #define MMU_USER_IDX 3
>   
>   #define MAX_RISCV_PMPS (16)
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..b84f62f8d6 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -9,6 +9,9 @@
>                    (((uint64_t)(val) * ((mask) & ~((mask) << 1))) & \
>                    (uint64_t)(mask)))
>   
> +/* Extension context status mask */
> +#define EXT_STATUS_MASK     0x3ULL
> +
>   /* Floating point round mode */
>   #define FSR_RD_SHIFT        5
>   #define FSR_RD              (0x7 << FSR_RD_SHIFT)
> @@ -734,13 +737,6 @@ typedef enum RISCVException {
>   #define PM_ENABLE       0x00000001ULL
>   #define PM_CURRENT      0x00000002ULL
>   #define PM_INSN         0x00000004ULL
> -#define PM_XS_MASK      0x00000003ULL
> -
> -/* PointerMasking XS bits values */
> -#define PM_EXT_DISABLE  0x00000000ULL
> -#define PM_EXT_INITIAL  0x00000001ULL
> -#define PM_EXT_CLEAN    0x00000002ULL
> -#define PM_EXT_DIRTY    0x00000003ULL
>   
>   /* Execution enviornment configuration bits */
>   #define MENVCFG_FIOM                       BIT(0)
> @@ -780,7 +776,7 @@ typedef enum RISCVException {
>   #define S_OFFSET     5ULL
>   #define M_OFFSET     8ULL
>   
> -#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
> +#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
>   #define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
>   #define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
>   #define U_PM_INSN    (PM_INSN    << U_OFFSET)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..1135106b3e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,7 +764,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>           i++;
>       }
>       /* mmte is supposed to have pm.current hardwired to 1 */
> -    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> +    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
>   #endif
>       env->xl = riscv_cpu_mxl(env);
>       riscv_cpu_update_mask(env);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..abea7b749e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3513,7 +3513,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
>   
>       /* hardwiring pm.instruction bit to 0, since it's not supported yet */
>       wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> -    env->mmte = wpri_val | PM_EXT_DIRTY;
> +    env->mmte = wpri_val | EXT_STATUS_DIRTY;
>       riscv_cpu_update_mask(env);
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -3593,7 +3593,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3621,7 +3621,7 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3649,7 +3649,7 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3673,7 +3673,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3701,7 +3701,7 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3729,7 +3729,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;


