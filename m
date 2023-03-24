Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfiqd-0007J1-Iu
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfiqb-0007Hf-EX; Fri, 24 Mar 2023 10:56:53 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfiqQ-0008VN-5r; Fri, 24 Mar 2023 10:56:52 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAAXHzsPuh1kwaUkCQ--.53638S2;
 Fri, 24 Mar 2023 22:56:16 +0800 (CST)
Message-ID: <420592cf-cd82-0b24-9176-9887392d0a3a@iscas.ac.cn>
Date: Fri, 24 Mar 2023 22:56:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v4 18/25] target/riscv: error out on priv failure
 for RVH
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-19-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322222004.357013-19-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAXHzsPuh1kwaUkCQ--.53638S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW7uFWUWw1xXFyDKryUWrg_yoW8CF18pF
 ZrG3s0kr95JF9rA34fJF1UJF15urs5WFWxWa93KwnrGr43ArWUGrykKr43uF1xJFn5uw1a
 q3WjgFnxuayDXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkrcfUUU
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
X-List-Received-Date: Fri, 24 Mar 2023 14:56:54 -0000


On 2023/3/23 06:19, Daniel Henrique Barboza wrote:
> riscv_cpu_disable_priv_spec_isa_exts(), at the end of
> riscv_cpu_validate_set_extensions(), will disable cpu->cfg.ext_h and
> cpu->cfg.ext_v if priv_ver check fails.
>
> This check can be done in riscv_cpu_validate_misa_ext(). The difference
> here is that we're not silently disable it: we'll error out. Silently
> disabling a MISA extension after all the validation is completed can can
> cause inconsistencies that we don't have to deal with. Verify ealier and
> fail faster.
>
> Note that we're ignoring RVV priv_ver validation since its minimal priv
> is also the minimal value we support. RVH will error out if enabled
> under priv_ver under 1_12_0.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 399f63b42f..d2eb2b3ba1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1055,6 +1055,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    /*
> +     * Check for priv spec version. RVH is 1_12_0, RVV is 1_10_0.
> +     * We don't support anything under 1_10_0 so skip checking
> +     * priv for RVV.
> +     *
> +     * We're hardcoding it here to avoid looping into the
> +     * 50+ entries of isa_edata_arr[] just to check the RVH
> +     * entry.
> +     */
> +    if (cpu->cfg.ext_h && env->priv_ver < PRIV_VERSION_1_12_0) {
> +        error_setg(errp, "H extension requires priv spec 1.12.0");
> +        return;
> +    }
The other multi-letter extensions are directly disabled for lower priv 
version with warning message.

Whether we should do the similar action here?

Regards,

Weiwei Li

> +
>       if (cpu->cfg.ext_v) {
>           riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
>           if (local_err != NULL) {


