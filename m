Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfA8f-0002dn-62
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 21:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfA8d-0002dX-MT; Wed, 22 Mar 2023 21:53:11 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfA8b-0007a8-0I; Wed, 22 Mar 2023 21:53:11 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeSP57U_1679536376; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeSP57U_1679536376) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 09:52:57 +0800
Message-ID: <30c5656f-e19c-2f4c-8ec9-b6730303d7f5@linux.alibaba.com>
Date: Thu, 23 Mar 2023 09:52:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 08/25] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-9-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230322222004.357013-9-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 23 Mar 2023 01:53:12 -0000


On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
> There is no need to init timers if we're not even sure that our
> extensions are valid. Execute riscv_cpu_validate_set_extensions() before
> riscv_timer_init().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7458845fec..fef55d7d79 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1237,12 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -#ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.ext_sstc) {
> -        riscv_timer_init(cpu);
> -    }
> -#endif /* CONFIG_USER_ONLY */
> -
>       riscv_cpu_validate_set_extensions(cpu, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);
> @@ -1250,6 +1244,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       }
>   
>   #ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.ext_sstc) {
> +        riscv_timer_init(cpu);
> +    }
> +

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       if (cpu->cfg.pmu_num) {
>           if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
>               cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,

