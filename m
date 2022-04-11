Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ndlwe-0000yX-LW
	for mharc-qemu-riscv@gnu.org; Mon, 11 Apr 2022 00:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ndlwc-0000xz-Es; Mon, 11 Apr 2022 00:46:30 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:55258 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ndlwZ-0004ad-8h; Mon, 11 Apr 2022 00:46:29 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnR0yRslNiYo7lAA--.24156S2;
 Mon, 11 Apr 2022 12:46:11 +0800 (CST)
Subject: Re: [PATCH v9 12/14] target/riscv: rvk: add CSR support for Zkr
To: richard.henderson@linaro.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220318041944.19859-1-liweiwei@iscas.ac.cn>
 <20220318041944.19859-13-liweiwei@iscas.ac.cn>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <e00bf2b4-3c33-ffef-93a2-338917ff50b3@iscas.ac.cn>
Date: Mon, 11 Apr 2022 12:46:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220318041944.19859-13-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowABnR0yRslNiYo7lAA--.24156S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww4rtF45KFW8JFy5tr17Awb_yoWxGr43pr
 4UCay5GrW8ZFZrCw1ftF15WF15Gr4rGa15Gws7W3yUAr43J3yrAF1vg390qF1kXa1kGr4j
 9F4j9r1F9r42vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28Icx
 kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 11 Apr 2022 04:46:30 -0000

Hi, any comments on this patch or patchset?

Currently, read-only instruction to access Seed CSR is checked as a 
special case in helper_csrr as suggested in

https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00146.html.

(The new version for that patch is in 
https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00156.html)

Regards,

Weiwei Li

ÔÚ 2022/3/18 ÏÂÎç12:19, Weiwei Li Ð´µÀ:
>   - add SEED CSR which must be accessed with a read-write instruction:
>     A read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/CSRRCI
> with uimm=0 will raise an illegal instruction exception.
>   - add USEED, SSEED fields for MSECCFG CSR
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_bits.h  |  9 ++++++
>   target/riscv/csr.c       | 68 ++++++++++++++++++++++++++++++++++++++++
>   target/riscv/op_helper.c |  9 ++++++
>   target/riscv/pmp.h       |  8 +++--
>   4 files changed, 91 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index bb47cf7e77..d401100f47 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -458,6 +458,9 @@
>   #define CSR_VSPMMASK        0x2c1
>   #define CSR_VSPMBASE        0x2c2
>   
> +/* Crypto Extension */
> +#define CSR_SEED            0x015
> +
>   /* mstatus CSR bits */
>   #define MSTATUS_UIE         0x00000001
>   #define MSTATUS_SIE         0x00000002
> @@ -800,4 +803,10 @@ typedef enum RISCVException {
>   #define HVICTL_VALID_MASK                  \
>       (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
>   
> +/* seed CSR bits */
> +#define SEED_OPST                        (0b11 << 30)
> +#define SEED_OPST_BIST                   (0b00 << 30)
> +#define SEED_OPST_WAIT                   (0b01 << 30)
> +#define SEED_OPST_ES16                   (0b10 << 30)
> +#define SEED_OPST_DEAD                   (0b11 << 30)
>   #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3c61dd69af..5717a51f56 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -24,6 +24,8 @@
>   #include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
>   #include "sysemu/cpu-timers.h"
> +#include "qemu/guest-random.h"
> +#include "qapi/error.h"
>   
>   /* CSR function table public API */
>   void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
> @@ -292,6 +294,40 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>   }
>   #endif
>   
> +static RISCVException seed(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_zkr) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    if (riscv_has_ext(env, RVS) && riscv_has_ext(env, RVH)) {
> +        /* Hypervisor extension is supported */
> +        if (riscv_cpu_virt_enabled(env) && (env->priv != PRV_M)) {
> +            if (env->mseccfg & MSECCFG_SSEED) {
> +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +            } else {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +        }
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    } else if (env->priv == PRV_S && (env->mseccfg & MSECCFG_SSEED)) {
> +        return RISCV_EXCP_NONE;
> +    } else if (env->priv == PRV_U && (env->mseccfg & MSECCFG_USEED)) {
> +        return RISCV_EXCP_NONE;
> +    } else {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +#else
> +    return RISCV_EXCP_NONE;
> +#endif
> +}
> +
>   /* User Floating-Point CSRs */
>   static RISCVException read_fflags(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
> @@ -2961,6 +2997,35 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>   
>   #endif
>   
> +/* Crypto Extension */
> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_value,
> +                              target_ulong new_value, target_ulong write_mask)
> +{
> +    uint16_t random_v;
> +    Error *random_e = NULL;
> +    int random_r;
> +
> +    random_r = qemu_guest_getrandom(&random_v, 2, &random_e);
> +    if (unlikely(random_r < 0)) {
> +        /*
> +         * Failed, for unknown reasons in the crypto subsystem.
> +         * The best we can do is log the reason and return a
> +         * failure indication to the guest.  There is no reason
> +         * we know to expect the failure to be transitory, so
> +         * indicate DEAD to avoid having the guest spin on WAIT.
> +         */
> +        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
> +                      __func__, error_get_pretty(random_e));
> +        error_free(random_e);
> +        *ret_value = SEED_OPST_DEAD;
> +    } else {
> +        *ret_value = random_v | SEED_OPST_ES16;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   /*
>    * riscv_csrrw - read and/or update control and status register
>    *
> @@ -3205,6 +3270,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_TIME]  = { "time",  ctr,   read_time  },
>       [CSR_TIMEH] = { "timeh", ctr32, read_timeh },
>   
> +    /* Crypto Extension */
> +    [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
> +
>   #if !defined(CONFIG_USER_ONLY)
>       /* Machine Timers and Counters */
>       [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index e0d708091e..3d8443416d 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -39,6 +39,15 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
>   
>   target_ulong helper_csrr(CPURISCVState *env, int csr)
>   {
> +    /*
> +     * The seed CSR must be accessed with a read-write instruction. A
> +     * read-only instruction such as CSRRS/CSRRC with rs1=x0 or CSRRSI/
> +     * CSRRCI with uimm=0 will raise an illegal instruction exception.
> +     */
> +    if (csr == CSR_SEED) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +
>       target_ulong val = 0;
>       RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0, false);
>   
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index fcb6b7c467..a8dd797476 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -39,9 +39,11 @@ typedef enum {
>   } pmp_am_t;
>   
>   typedef enum {
> -    MSECCFG_MML  = 1 << 0,
> -    MSECCFG_MMWP = 1 << 1,
> -    MSECCFG_RLB  = 1 << 2
> +    MSECCFG_MML   = 1 << 0,
> +    MSECCFG_MMWP  = 1 << 1,
> +    MSECCFG_RLB   = 1 << 2,
> +    MSECCFG_USEED = 1 << 8,
> +    MSECCFG_SSEED = 1 << 9
>   } mseccfg_field_t;
>   
>   typedef struct {


