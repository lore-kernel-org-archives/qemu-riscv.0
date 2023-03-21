Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peR7q-0000jF-Ug
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 21:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR7o-0000eZ-V0; Mon, 20 Mar 2023 21:49:20 -0400
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1peR7m-0002yB-Vs; Mon, 20 Mar 2023 21:49:20 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeKx9wF_1679363351; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeKx9wF_1679363351) by smtp.aliyun-inc.com;
 Tue, 21 Mar 2023 09:49:12 +0800
Message-ID: <5c7cf1a6-cfc6-3da7-f3d4-85182cd1140d@linux.alibaba.com>
Date: Tue, 21 Mar 2023 09:49:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v3 02/26] target/riscv/cpu.c: remove
 set_vext_version()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-3-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230318200436.299464-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
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
X-List-Received-Date: Tue, 21 Mar 2023 01:49:21 -0000


On 2023/3/19 4:04, Daniel Henrique Barboza wrote:
> This setter is doing nothing else but setting env->vext_ver. Assign the
> value directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 18591aa53a..2752efe1eb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -245,11 +245,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
>       env->priv_ver = priv_ver;
>   }
>   
> -static void set_vext_version(CPURISCVState *env, int vext_ver)
> -{
> -    env->vext_ver = vext_ver;
> -}
> -
>   #ifndef CONFIG_USER_ONLY
>   static uint8_t satp_mode_from_str(const char *satp_mode_str)
>   {
> @@ -839,7 +834,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>           qemu_log("vector version is not specified, "
>                    "use the default value v1.0\n");
>       }
> -    set_vext_version(env, vext_version);
> +    env->vext_ver = vext_version;
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei
>   }
>   
>   /*

