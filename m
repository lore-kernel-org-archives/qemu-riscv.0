Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf9yj-00018k-Ob
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 21:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pf9yi-00018V-Im; Wed, 22 Mar 2023 21:42:56 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pf9yg-00050u-1V; Wed, 22 Mar 2023 21:42:56 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VeSA7.x_1679535764; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeSA7.x_1679535764) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 09:42:44 +0800
Message-ID: <01a23061-b638-261d-f825-ad6fc3e501f8@linux.alibaba.com>
Date: Thu, 23 Mar 2023 09:42:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 v4 07/25] target/riscv: move pmp and epmp
 validations to validate_set_extensions()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-8-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230322222004.357013-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 23 Mar 2023 01:42:57 -0000


On 2023/3/23 6:19, Daniel Henrique Barboza wrote:
> In the near future, write_misa() will use a variation of what we have
> now as riscv_cpu_validate_set_extensions(). The pmp and epmp validation
> will be required in write_misa()

I don't know why pmp and epmp should be checked in write_misa().
As write_misa can't alter the pmp and epmp setting, the check for 
pmp/epmp should only be at cpu object initialization time for one time.

Zhiwei

> and it's already required here in
> riscv_cpu_realize(), so move it to riscv_cpu_validate_set_extensions().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1a298e5e55..7458845fec 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -916,6 +916,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>       Error *local_err = NULL;
>       uint32_t ext = 0;
>   
> +    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> +        /*
> +         * Enhanced PMP should only be available
> +         * on harts with PMP support
> +         */
> +        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> +        return;
> +    }
> +
>       /* Do some ISA extension error checking */
>       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>                               cpu->cfg.ext_a && cpu->cfg.ext_f &&
> @@ -1228,16 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> -        /*
> -         * Enhanced PMP should only be available
> -         * on harts with PMP support
> -         */
> -        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> -        return;
> -    }
> -
> -
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->cfg.ext_sstc) {
>           riscv_timer_init(cpu);

