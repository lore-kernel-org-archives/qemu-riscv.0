Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfjKw-0000nN-AN
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 11:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfjKv-0000lV-4C; Fri, 24 Mar 2023 11:28:13 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfjKp-0005yF-6g; Fri, 24 Mar 2023 11:28:12 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAAHHhZsvB1kuLIlCQ--.5166S2;
 Fri, 24 Mar 2023 23:06:21 +0800 (CST)
Message-ID: <367c8be2-354b-0e40-187d-7f28d18ee0bd@iscas.ac.cn>
Date: Fri, 24 Mar 2023 23:06:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v4 22/25] target/riscv: use misa_ext val in
 riscv_cpu_validate_extensions()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-23-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322222004.357013-23-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAHHhZsvB1kuLIlCQ--.5166S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw15Gw1Duw1ruryxJw43KFg_yoW5KFWkpr
 W7G390kryDJr1UJ3yxJFn7tF1Uur4Iq3yxK3saqw17WFZa9ryrWwnYkr13urWxtF95Za1f
 ua1UGFnFvanFqa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHnQUUUU
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
X-List-Received-Date: Fri, 24 Mar 2023 15:28:13 -0000


On 2023/3/23 06:20, Daniel Henrique Barboza wrote:
> Similar to what we did with riscv_cpu_validate_misa_ext(), let's read
> all MISA bits from a misa_ext val instead of reading from the cpu->cfg
> object.
>
> This will allow write_misa() to use riscv_cpu_validate_extensions().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ed02332093..0e6b8fb45e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1109,10 +1109,13 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>   }
>   
>   /*
> - * Check consistency between chosen extensions. No changes
> - * in env->misa_ext are made.
> + * Check consistency between cpu->cfg extensions and a
> + * candidate misa_ext value. No changes in env->misa_ext
> + * are made.
>    */
> -static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
> +static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
> +                                          uint32_t misa_ext,
> +                                          Error **errp)
>   {
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
> @@ -1123,12 +1126,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> +    if (misa_ext & RVF && !cpu->cfg.ext_icsr) {
>           error_setg(errp, "F extension requires Zicsr");
>           return;
>       }

This check needn't be done for write_misa. Similar to several other checks.

Maybe we can take them out as a new function to share between 
validate_extensions and write_misa.

In fact, only a few check should be done for write_misa when 
multi-letter extensions require single-letter extensions.

Regards,

Weiwei Li

>   
> -    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
> +    if ((cpu->cfg.ext_zawrs) && !(misa_ext & RVA)) {
>           error_setg(errp, "Zawrs extension requires A extension");
>           return;
>       }
> @@ -1137,13 +1140,13 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_zfhmin = true;
>       }
>   
> -    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zfhmin && !(misa_ext & RVF)) {
>           error_setg(errp, "Zfh/Zfhmin extensions require F extension");
>           return;
>       }
>   
>       /* The V vector extension depends on the Zve64d extension */
> -    if (cpu->cfg.ext_v) {
> +    if (misa_ext & RVV) {
>           cpu->cfg.ext_zve64d = true;
>       }
>   
> @@ -1157,12 +1160,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_zve32f = true;
>       }
>   
> -    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
> +    if (cpu->cfg.ext_zve64d && !(misa_ext & RVD)) {
>           error_setg(errp, "Zve64d/V extensions require D extension");
>           return;
>       }
>   
> -    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zve32f && !(misa_ext & RVF)) {
>           error_setg(errp, "Zve32f/Zve64f extensions require F extension");
>           return;
>       }
> @@ -1195,7 +1198,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
>               error_setg(errp, "Zfinx extension requires Zicsr");
>               return;
>           }
> -        if (cpu->cfg.ext_f) {
> +        if (misa_ext & RVF) {
>               error_setg(errp,
>                          "Zfinx cannot be supported together with F extension");
>               return;
> @@ -1367,7 +1370,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    riscv_cpu_validate_extensions(cpu, &local_err);
> +    riscv_cpu_validate_extensions(cpu, env->misa_ext, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);
>           return;


