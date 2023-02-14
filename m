Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRx3K-0004yy-2P
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx3H-0004xo-MR; Tue, 14 Feb 2023 10:17:03 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx3F-0005Oo-Pz; Tue, 14 Feb 2023 10:17:03 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAA3Mz_ppetjqQ0YBQ--.28101S2;
 Tue, 14 Feb 2023 23:16:57 +0800 (CST)
Message-ID: <1ce34c01-83c5-9724-d927-f3e975e3adf4@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:16:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/11] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-7-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAA3Mz_ppetjqQ0YBQ--.28101S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1rJrW5uFW5Aw18WFWktFb_yoW8Gr15pr
 4fua93CrykJr17Ca1fXF4DX345Wr40kay7Gws7Gw17Kr45tFWkurnxK3WSk3WDJ3Z5u3WI
 vF1j9Fy2vw4qyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
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
X-List-Received-Date: Tue, 14 Feb 2023 15:17:04 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
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

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

> ---
>   target/riscv/cpu.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 272cf1a8bf..1e67e72f90 100644
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
>           }
>       }
>   


