Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa9V3-0007XM-4r
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 01:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pa9V1-0007X9-NE; Thu, 09 Mar 2023 01:11:35 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pa9Ux-0003zF-Vm; Thu, 09 Mar 2023 01:11:35 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R761e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VdSEgcl_1678342282; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdSEgcl_1678342282) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 14:11:23 +0800
Message-ID: <87bbfaef-92df-52d7-da48-ff25a3c508a4@linux.alibaba.com>
Date: Thu, 9 Mar 2023 14:11:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 03/10] target/riscv: allow MISA writes as experimental
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-riscv@nongnu.org, bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 palmer@rivosinc.com
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
 <20230222185205.355361-4-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230222185205.355361-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 06:11:36 -0000


On 2023/2/23 2:51, Daniel Henrique Barboza wrote:
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> After discussions in the mailing list, most notably in [1], we reached
> the consensus that this code is not suited to be exposed to users
> because it's not well tested, but at the same time removing it is a bit
> extreme because we would like to fix it, and it's easier to do so with
> the code available to use instead of fetching it from git log.
>
> The approach taken here is to get rid of RISCV_FEATURE_MISA altogether
> and use a new experimental flag called x-misa-w. The default value is
> false, meaning that we're keeping the existing behavior of doing nothing
> if a write_misa() is attempted. As with any existing experimental flag,
> x-misa-w is also a temporary flag that we need to remove once we fix
> write_misa().
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 6 ++++++
>   target/riscv/cpu.h | 2 +-
>   target/riscv/csr.c | 2 +-
>   3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 93b52b826c..1d637b1acd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1210,6 +1210,12 @@ static Property riscv_cpu_properties[] = {
>   
>       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>       DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +
> +    /*
> +     * write_misa() is marked as experimental for now so mark
> +     * it with -x and default to 'false'.
> +     */
> +    DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),

Just a question  I got when I reviewed another patch set:

Why put x-misa-w to riscv_cpu_properties instead of riscv_cpu_extensions?

I think this property should have a fixed value for a named cpu(such as 
sifive_e). Therefore IMHO, putting x-misa-w into riscv_cpu_extensions is 
more proper. At the same time,  the debug, rvv_ta_all_1s,  
rvv_ma_all_1s, resetvec properties should be moved to 
riscv_cpu_extentions. I am not sure why we should give the 
marchid/mipid/mvendorid option for named cpus. Maybe @Frank knows.

Have I missed something?

Zhiwei

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 215423499e..9d3304bcda 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,7 +89,6 @@ enum {
>       RISCV_FEATURE_MMU,
>       RISCV_FEATURE_PMP,
>       RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA,
>       RISCV_FEATURE_DEBUG
>   };
>   
> @@ -498,6 +497,7 @@ struct RISCVCPUConfig {
>       bool pmp;
>       bool epmp;
>       bool debug;
> +    bool misa_w;
>   
>       bool short_isa_string;
>   };
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e149b453da..3cb8d2ffad 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1329,7 +1329,7 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> +    if (!riscv_cpu_cfg(env)->misa_w) {
>           /* drop write to misa */
>           return RISCV_EXCP_NONE;
>       }

