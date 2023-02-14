Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRx9V-0002LP-S3
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx9U-0002Ke-96; Tue, 14 Feb 2023 10:23:28 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx9R-0002mi-KE; Tue, 14 Feb 2023 10:23:28 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAB3+NZnp+tjNScYBQ--.28844S2;
 Tue, 14 Feb 2023 23:23:19 +0800 (CST)
Message-ID: <463b6eb6-be77-5bdd-feb3-96bc18d9921a@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:23:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
 create_fdt_socket_cpus()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-10-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAB3+NZnp+tjNScYBQ--.28844S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw17Gw4rWFyfGw4UKFyxuFg_yoW8WF4rpF
 W8Gan8ua48JFn7ZasFgrWYyr1xtrsIkw15Jw47Jr1fGr4qvw15XFsrua18Aw40ya4rZ3WU
 ZF4kWF90k3ZF9FUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUU
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
X-List-Received-Date: Tue, 14 Feb 2023 15:23:28 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
> Read cpu_ptr->cfg.mmu directly. As a bonus, use cpu_ptr in
> riscv_isa_string().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/virt.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 86c4adc0c9..8ab6a3ec16 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -232,20 +232,21 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>       bool is_32_bit = riscv_is_32bit(&s->soc[0]);
>   
>       for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> +        RISCVCPU *cpu_ptr = &s->soc[socket].harts[cpu];
> +        RISCVCPUConfig cpu_cfg = cpu_ptr->cfg;

Adding cpu_cfg seems not very necessary.

Otherwise, Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

>           cpu_phandle = (*phandle)++;
>   
>           cpu_name = g_strdup_printf("/cpus/cpu@%d",
>               s->soc[socket].hartid_base + cpu);
>           qemu_fdt_add_subnode(ms->fdt, cpu_name);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_MMU)) {
> +        if (cpu_cfg.mmu) {
>               qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
>                                       (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
>           } else {
>               qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type",
>                                       "riscv,none");
>           }
> -        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
> +        name = riscv_isa_string(cpu_ptr);
>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
>           g_free(name);
>           qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");


