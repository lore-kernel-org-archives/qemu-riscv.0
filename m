Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRxBY-00055N-6D
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRxBW-000555-ON; Tue, 14 Feb 2023 10:25:34 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRxBT-0003bm-Q5; Tue, 14 Feb 2023 10:25:34 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAC3vEjkp+tjIS8YBQ--.28478S2;
 Tue, 14 Feb 2023 23:25:24 +0800 (CST)
Message-ID: <0cae6435-63e2-5c78-50d4-e937b377129e@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:25:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 10/11] target/riscv: remove RISCV_FEATURE_MMU
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-11-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-11-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAC3vEjkp+tjIS8YBQ--.28478S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCry8WFWxGFWkGw4UWr1xXwb_yoWrWr45pr
 4kGayakrWDJrZ2ya4xtF1Utr15Zw45GF4Ykws3uw1UJa13JrW5CrnrKay7CFnrXa18ur1I
 9F1j9F9Iyw4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjTKZJUUUU
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
X-List-Received-Date: Tue, 14 Feb 2023 15:25:35 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li
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
> index a803395ed1..2859ebc3e6 100644
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
> index 62919cd5cc..83a9fa38d9 100644
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
> index 15d9542691..e76b206191 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -796,7 +796,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           mode = PRV_U;
>       }
>   
> -    if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (mode == PRV_M || !riscv_cpu_cfg(env).mmu) {
>           *physical = addr;
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3d55b1b138..9fb8e86b70 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2623,7 +2623,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
>   static RISCVException read_satp(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (!riscv_cpu_cfg(env).mmu) {
>           *val = 0;
>           return RISCV_EXCP_NONE;
>       }
> @@ -2642,7 +2642,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
>   {
>       target_ulong vm, mask;
>   
> -    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (!riscv_cpu_cfg(env).mmu) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 236f93b9f5..b7b8d0614f 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -218,7 +218,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
>           return;
>       }
>   
> -    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +    if (!riscv_cpu_cfg(env).mmu) {
>           monitor_printf(mon, "S-mode MMU unavailable\n");
>           return;
>       }
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 1e7903dffa..c67de36942 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -315,7 +315,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>       }
>   
>       if (size == 0) {
> -        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
> +        if (riscv_cpu_cfg(env).mmu) {
>               /*
>                * If size is unknown (0), assume that all bytes
>                * from addr to the end of the page will be accessed.


