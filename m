Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSpy3-0001PI-SE
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 20:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSpy1-0001Op-W8; Thu, 16 Feb 2023 20:55:18 -0500
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSpy0-00052h-1B; Thu, 16 Feb 2023 20:55:17 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqERK9_1676598909; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqERK9_1676598909) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 09:55:09 +0800
Message-ID: <f1b40181-e098-60b7-0149-bfca561e8fb4@linux.alibaba.com>
Date: Fri, 17 Feb 2023 09:55:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 4/9] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-5-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 01:55:18 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> Instead of silently ignoring the EPMP setting if there is no PMP
> available, error out informing the user that EPMP depends on PMP
> support:
>
> $ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
> qemu-system-riscv64: Invalid configuration: EPMP requires PMP support
>
> This will force users to pick saner options in the QEMU command line.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e34a5e3f11..4585ca74dc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -925,13 +925,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   
>       if (cpu->cfg.pmp) {
>           riscv_set_feature(env, RISCV_FEATURE_PMP);
> +    }
> +
> +    if (cpu->cfg.epmp) {
> +        riscv_set_feature(env, RISCV_FEATURE_EPMP);
>   
>           /*
>            * Enhanced PMP should only be available
>            * on harts with PMP support
>            */
> -        if (cpu->cfg.epmp) {
> -            riscv_set_feature(env, RISCV_FEATURE_EPMP);
> +        if (!cpu->cfg.pmp) {
> +            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> +            return;

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           }
>       }
>   

