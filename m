Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRx5D-0000Jc-8j
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx5B-0000Ir-Sf; Tue, 14 Feb 2023 10:19:01 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx59-0005mg-Nu; Tue, 14 Feb 2023 10:19:01 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABXcNRfputjyRYYBQ--.27414S2;
 Tue, 14 Feb 2023 23:18:55 +0800 (CST)
Message-ID: <6f932a5d-8b58-fdf2-606d-6a81ce9a7405@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:18:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/11] target/riscv: remove RISCV_FEATURE_PMP
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-9-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-9-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABXcNRfputjyRYYBQ--.27414S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1DAry5WF1Dur18CF4fuFg_yoWrXF1fpr
 4kGayfCFWDJFZ7Aa1ftF4UWr15Zr1YgF4Ykws7Cw48GF45GrW5urnrK3W2kF1DXayUur4I
 9F1j9F1ayw40vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 15:19:02 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_PMP is being set via riscv_set_feature() by mirroring the
> cpu->cfg.pmp flag. Use the flag instead.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

> ---
>   target/riscv/cpu.c        | 4 ----
>   target/riscv/cpu.h        | 1 -
>   target/riscv/cpu_helper.c | 2 +-
>   target/riscv/csr.c        | 2 +-
>   target/riscv/machine.c    | 3 +--
>   target/riscv/op_helper.c  | 2 +-
>   target/riscv/pmp.c        | 2 +-
>   7 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 430b6adccb..a803395ed1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -923,10 +923,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           riscv_set_feature(env, RISCV_FEATURE_MMU);
>       }
>   
> -    if (cpu->cfg.pmp) {
> -        riscv_set_feature(env, RISCV_FEATURE_PMP);
> -    }
> -
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d0de11fd41..62919cd5cc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -87,7 +87,6 @@
>      so a cpu features bitfield is required, likewise for optional PMP support */
>   enum {
>       RISCV_FEATURE_MMU,
> -    RISCV_FEATURE_PMP,
>   };
>   
>   /* Privileged specification version */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4cdd247c6c..15d9542691 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -706,7 +706,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>       pmp_priv_t pmp_priv;
>       int pmp_index = -1;
>   
> -    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
> +    if (!riscv_cpu_cfg(env).pmp) {
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
>       }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5b974dad6b..3d55b1b138 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -419,7 +419,7 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
>   
>   static RISCVException pmp(CPURISCVState *env, int csrno)
>   {
> -    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> +    if (riscv_cpu_cfg(env).pmp) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 4634968898..67e9e56853 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -27,9 +27,8 @@
>   static bool pmp_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> -    CPURISCVState *env = &cpu->env;
>   
> -    return riscv_feature(env, RISCV_FEATURE_PMP);
> +    return cpu->cfg.pmp;
>   }
>   
>   static int pmp_post_load(void *opaque, int version_id)
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 48f918b71b..f34701b443 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -195,7 +195,7 @@ target_ulong helper_mret(CPURISCVState *env)
>       uint64_t mstatus = env->mstatus;
>       target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
>   
> -    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +    if (riscv_cpu_cfg(env).pmp &&
>           !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
>           riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
>       }
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index bb54899635..1e7903dffa 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -265,7 +265,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>           }
>       }
>   
> -    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
> +    if (!riscv_cpu_cfg(env).pmp || (mode == PRV_M)) {
>           /*
>            * Privileged spec v1.10 states if HW doesn't implement any PMP entry
>            * or no PMP entry matches an M-Mode access, the access succeeds.


