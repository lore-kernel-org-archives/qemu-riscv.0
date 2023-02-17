Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSq2j-0003uO-Mj
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq2i-0003u5-6H; Thu, 16 Feb 2023 21:00:08 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq2g-0006wI-7r; Thu, 16 Feb 2023 21:00:07 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqETVf_1676599199; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqETVf_1676599199) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 09:59:59 +0800
Message-ID: <4a23760d-353c-be20-a3b4-3a0e12eeb6e3@linux.alibaba.com>
Date: Fri, 17 Feb 2023 09:59:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 7/9] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-8-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
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
X-List-Received-Date: Fri, 17 Feb 2023 02:00:08 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
> riscv_isa_string().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   hw/riscv/virt.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 86c4adc0c9..49f2c157f7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -232,20 +232,21 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>       bool is_32_bit = riscv_is_32bit(&s->soc[0]);
>   
>       for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> +        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
> +
>           cpu_phandle = (*phandle)++;
>   
>           cpu_name = g_strdup_printf("/cpus/cpu@%d",
>               s->soc[socket].hartid_base + cpu);
>           qemu_fdt_add_subnode(ms->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> +        if (cpu_ptr->cfg.mmu) {
>               qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
>                                       (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
>           } else {
>               qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
>                                       "riscv,none");
>           }
> -        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> +        name = riscv_isa_string(cpu_ptr);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
>           g_free(name);
>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");

