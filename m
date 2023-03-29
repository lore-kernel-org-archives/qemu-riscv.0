Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phSFJ-0001mZ-CY
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 05:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phSFH-0001mE-1A; Wed, 29 Mar 2023 05:37:31 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phSFE-0003OP-B4; Wed, 29 Mar 2023 05:37:30 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowADHzMzOBiRkVfrACw--.21287S2;
 Wed, 29 Mar 2023 17:37:18 +0800 (CST)
Message-ID: <692593a5-c19c-8991-8e59-fb63dd30a877@iscas.ac.cn>
Date: Wed, 29 Mar 2023 17:37:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH] target/riscv: Fix Guest Physical Address Translation
Content-Language: en-US
To: Irina Ryapolova <irina.ryapolova@syntacore.com>, qemu-devel@nongnu.org
References: <0> <20230328165406.271528-1-irina.ryapolova@syntacore.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230328165406.271528-1-irina.ryapolova@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADHzMzOBiRkVfrACw--.21287S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyDZw4xGr1rAFW8AF18Krg_yoW8Aw4fpr
 Z7CFWakrZaqFnxtanaqFyjq3s8CrnxKr4vgw1kJr1rurs8J3y8ur1kK3yF9343XrW8ZF1j
 vr1DCF109rWqq37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Wed, 29 Mar 2023 09:37:31 -0000


On 2023/3/29 00:54, Irina Ryapolova wrote:
> According to specification:
> For Sv39x4, address bits of the guest physical address 63:41 must all be zeros, or else a
> guest-page-fault exception occurs.
>
> Likewise for Sv48x4 and Sv57x4.
> For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fault exception occurs.
> For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fault exception occurs.
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..27289f2305 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -863,17 +863,24 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>   
>       CPUState *cs = env_cpu(env);
>       int va_bits = PGSHIFT + levels * ptidxbits + widened;
> -    target_ulong mask, masked_msbs;
>   
> -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> -        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> -    } else {
> -        mask = 0;
> -    }
> -    masked_msbs = (addr >> (va_bits - 1)) & mask;
> +    if (first_stage == true) {
> +        target_ulong mask, masked_msbs;
> +
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask = 0;
> +        }
> +        masked_msbs = (addr >> (va_bits - 1)) & mask;
>   
> -    if (masked_msbs != 0 && masked_msbs != mask) {
> -        return TRANSLATE_FAIL;
> +        if (masked_msbs != 0 && masked_msbs != mask) {
> +            return TRANSLATE_FAIL;
> +        }
> +    } else {
> +        if (vm != VM_1_10_SV32 && addr >> va_bits != 0) {
> +            return TRANSLATE_FAIL;
> +        }
>       }
>   
>       int ptshift = (levels - 1) * ptidxbits;


