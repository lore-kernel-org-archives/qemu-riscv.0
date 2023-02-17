Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSq74-0007g5-4h
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq72-0007fZ-HM; Thu, 16 Feb 2023 21:04:36 -0500
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq6z-00088s-UQ; Thu, 16 Feb 2023 21:04:36 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R241e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqTTvM_1676599463; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqTTvM_1676599463) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:04:24 +0800
Message-ID: <017221c8-662f-c4b9-cd73-aef046c747ce@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:04:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 8/9] target/riscv: remove RISCV_FEATURE_MMU
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-9-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-9-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:04:36 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
> the flag directly instead.
>
> With this change the enum is also removed. It is worth noticing that
> this enum, and all the RISCV_FEATURES_* that were contained in it,
> predates the existence of the cpu->cfg object. Today, using cpu->cfg is
> an easier way to retrieve all the features and extensions enabled in the
> hart.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c        | 4 ----
>   target/riscv/cpu.h        | 7 -------
>   target/riscv/cpu_helper.c | 2 +-
>   target/riscv/csr.c        | 4 ++--
>   target/riscv/monitor.c    | 2 +-
>   target/riscv/pmp.c        | 2 +-
>   6 files changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7b1360d6ba..075033006c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -919,10 +919,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> -    if (cpu->cfg.mmu) {
> -        riscv_set_feature(env, RISCV_FEATURE_MMU);
> -    }
> -
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 119a022af9..0519d2ab0c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -81,13 +81,6 @@
>   #define RVH RV('H')
>   #define RVJ RV('J')
>   
> -/* S extension denotes that Supervisor mode exists, however it is possible
> -   to have a core that support S mode but does not have an MMU and there
> -   is currently no bit in misa to indicate whether an MMU exists or not
> -   so a cpu features bitfield is required, likewise for optional PMP support */
> -enum {
> -    RISCV_FEATURE_MMU,
> -};
>   
>   /* Privileged specification version */
>   enum {
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 292b6b3168..eda2293470 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -796,7 +796,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           mode = PRV_U;
>       }
>   
> -    if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
>           *physical = addr;
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d0ab00d870..fcc271c93c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2569,7 +2569,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
>   static RISCVException read_satp(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (!riscv_cpu_cfg(env)->mmu) {
>           *val = 0;
>           return RISCV_EXCP_NONE;
>       }
> @@ -2588,7 +2588,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>   {
>       target_ulong vm, mask;
>   
> -    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (!riscv_cpu_cfg(env)->mmu) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 236f93b9f5..f36ddfa967 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -218,7 +218,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
>           return;
>       }
>   
> -    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (!riscv_cpu_cfg(env)->mmu) {
>           monitor_printf(mon, "S-mode MMU unavailable\n");
>           return;
>       }
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 205bfbe090..a08cd95658 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -315,7 +315,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>       }
>   
>       if (size == 0) {
> -        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
> +        if (riscv_cpu_cfg(env)->mmu) {

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>               /*
>                * If size is unknown (0), assume that all bytes
>                * from addr to the end of the page will be accessed.

