Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paAkX-0006kl-Uk
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAkW-0006kO-2f; Thu, 09 Mar 2023 02:31:40 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAkU-0002im-2r; Thu, 09 Mar 2023 02:31:39 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VdSaESj_1678347089; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdSaESj_1678347089) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 15:31:29 +0800
Message-ID: <3b81d5ff-b5f5-e8bb-3838-44b57c4acf93@linux.alibaba.com>
Date: Thu, 9 Mar 2023 15:31:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 04/17] target/riscv: add PRIV_VERSION_LATEST macro
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-5-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230308201925.258223-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 07:31:40 -0000


On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
> PRIV_VERSION_LATEST, at this moment assigned to PRIV_VERSION_1_12_0, is
> used in all generic CPUs:
>
> - riscv_any_cpu_init()
> - rv32_base_cpu_init()
> - rv64_base_cpu_init()
> - rv128_base_cpu_init()
>
> When a new PRIV version is made available we can just update the LATEST
> macro.

IMHO, we should remove the privileged version check in the future. It is 
a combination of many extensions and should not be a constraint as every 
extension has its own name.

Zhiwei

>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 8 ++++----
>   target/riscv/cpu.h | 1 +
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 964817b9d2..62ef11180f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
>                                       VM_1_10_SV32 : VM_1_10_SV57);
>   #endif
>   
> -    env->priv_ver = PRIV_VERSION_1_12_0;
> +    env->priv_ver = PRIV_VERSION_LATEST;
>       register_cpu_props(obj);
>   }
>   
> @@ -350,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
>       set_misa(env, MXL_RV64, 0);
>       register_cpu_props(obj);
>       /* Set latest version of privileged specification */
> -    env->priv_ver = PRIV_VERSION_1_12_0;
> +    env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>   #endif
> @@ -426,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
>       set_misa(env, MXL_RV128, 0);
>       register_cpu_props(obj);
>       /* Set latest version of privileged specification */
> -    env->priv_ver = PRIV_VERSION_1_12_0;
> +    env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>   #endif
> @@ -439,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
>       set_misa(env, MXL_RV32, 0);
>       register_cpu_props(obj);
>       /* Set latest version of privileged specification */
> -    env->priv_ver = PRIV_VERSION_1_12_0;
> +    env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>   #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..af2e4b7695 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,6 +89,7 @@ enum {
>       PRIV_VERSION_1_11_0,
>       PRIV_VERSION_1_12_0,
>   };
> +#define PRIV_VERSION_LATEST PRIV_VERSION_1_12_0
>   
>   #define VEXT_VERSION_1_00_0 0x00010000
>   

