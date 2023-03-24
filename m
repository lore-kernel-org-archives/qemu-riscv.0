Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfidv-0007WC-7g
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 10:43:48 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfidt-0007Vw-SN; Fri, 24 Mar 2023 10:43:45 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfidq-0002J0-CN; Fri, 24 Mar 2023 10:43:45 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowADHzMwLtx1kmWUjCQ--.52930S2;
 Fri, 24 Mar 2023 22:43:24 +0800 (CST)
Message-ID: <a1ccf992-8ed5-efc9-fa5e-a1648833ae17@iscas.ac.cn>
Date: Fri, 24 Mar 2023 22:43:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v4 14/25] target/riscv: add RVG
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-15-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322222004.357013-15-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADHzMwLtx1kmWUjCQ--.52930S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW7uFW3GF13uryUXw17GFg_yoW8ur17pr
 4kCayYkrZ8JF9F9an3tF15Wrn5Zr4IgrW0gw1v9w17GFZ8JrZxKFnrKw47GFyUJF4rCF4Y
 9Fn5Cw13ZrZ7Ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 14:43:46 -0000


On 2023/3/23 06:19, Daniel Henrique Barboza wrote:
> The 'G' bit in misa_ext is a virtual extension that enables a set of
> extensions (i, m, a, f, d, icsr and ifencei). We're already have code to
> handle it but no bit definition. Add it.
>
> Add RVG to set_misa() in rv64_thead_c906_cpu_init() and remove the
> manual cpu->cfg.ext_g assignment while we're at it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 8 ++++++--
>   target/riscv/cpu.h | 1 +
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c4f18d0436..f41888baa0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -274,6 +274,9 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>       if (cfg->ext_j) {
>           ext |= RVJ;
>       }
> +    if (cfg->ext_g) {
> +        ext |= RVG;
> +    }
>   
>       return ext;
>   }
> @@ -293,6 +296,7 @@ static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>       cfg->ext_u = misa_ext & RVU;
>       cfg->ext_h = misa_ext & RVH;
>       cfg->ext_j = misa_ext & RVJ;
> +    cfg->ext_g = misa_ext & RVG;
>   }
>   
>   static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
> @@ -474,10 +478,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD |
> +                            RVC | RVS | RVU | RVG);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   
> -    cpu->cfg.ext_g = true;
>       cpu->cfg.ext_icsr = true;

Assignment for ext_icsr and ext_ifencei also can be deleted when RVG is set.

Regards,

Weiwei Li

>       cpu->cfg.ext_zfh = true;
>       cpu->cfg.mmu = true;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2263629332..dbb4df9df0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -82,6 +82,7 @@
>   #define RVU RV('U')
>   #define RVH RV('H')
>   #define RVJ RV('J')
> +#define RVG RV('G')
>   
>   
>   /* Privileged specification version */


