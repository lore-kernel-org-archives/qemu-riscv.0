Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peR9Z-0002Cc-Ru
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 21:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR9V-00026A-VQ; Mon, 20 Mar 2023 21:51:07 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR9T-0003V3-WC; Mon, 20 Mar 2023 21:51:05 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VeKxAQ8_1679363457; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeKxAQ8_1679363457) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 09:50:57 +0800
Message-ID: <9325d41a-09cd-b790-a4a2-01799190b26c@linux.alibaba.com>
Date: Tue, 21 Mar 2023 09:50:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v3 04/26] target/riscv: add PRIV_VERSION_LATEST
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-5-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230318200436.299464-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 21 Mar 2023 01:51:08 -0000


On 2023/3/19 4:04, Daniel Henrique Barboza wrote:
> All these generic CPUs are using the latest priv available, at this
> moment PRIV_VERSION_1_12_0:
>
> - riscv_any_cpu_init()
> - rv32_base_cpu_init()
> - rv64_base_cpu_init()
> - rv128_base_cpu_init()
>
> Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
> make it easier to update everything at once when a new priv version is
> available.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 8 ++++----
>   target/riscv/cpu.h | 2 ++
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 18032dfd4e..1ee322001b 100644
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
> index 638e47c75a..76f81c6b68 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -88,6 +88,8 @@ enum {
>       PRIV_VERSION_1_10_0 = 0,
>       PRIV_VERSION_1_11_0,
>       PRIV_VERSION_1_12_0,
> +
> +    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0,
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei
>   };
>   
>   #define VEXT_VERSION_1_00_0 0x00010000

