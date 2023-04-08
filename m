Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl7ir-000736-No
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 08:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pl7ip-00072D-Ac; Sat, 08 Apr 2023 08:31:11 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pl7ik-0004fM-NC; Sat, 08 Apr 2023 08:31:10 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAD3_2N6XjFkwOUCAQ--.31232S2;
 Sat, 08 Apr 2023 20:30:51 +0800 (CST)
Message-ID: <da9f34ac-3c40-de1f-5e3e-942b93b7a42e@iscas.ac.cn>
Date: Sat, 8 Apr 2023 20:30:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH v2] target/riscv: Fix Guest Physical Address Translation
Content-Language: en-US
To: Irina Ryapolova <irina.ryapolova@syntacore.com>, qemu-devel@nongnu.org
References: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3_2N6XjFkwOUCAQ--.31232S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy3Gw18XryUKF13ZF45GFg_yoW5Ww1xp3
 97C3yakFs5t3ZIyan2qr1jgas0kFZ7Kr48Xw4xtr1ruws8G348uryxK3ySk3sxXr1xZF1I
 vr4qkr109w1qqa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.113,
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
X-List-Received-Date: Sat, 08 Apr 2023 12:31:12 -0000


On 2023/4/7 23:32, Irina Ryapolova wrote:
> Before changing the flow check for sv39/48/57.
>
> According to specification (for Supervisor mode):
> Sv39 implementations support a 39-bit virtual address space, divided into 4 KiB pages.
> Instruction fetch addresses and load and store effective addresses, which are 64 bits,
> must have bits 63–39 all equal to bit 38, or else a page-fault exception will occur.
> Likewise for Sv48 and Sv57.
>
> So the high bits are equal to bit 38 for sv39.
>
> According to specification (for Hypervisor mode):
> For Sv39x4, address bits of the guest physical address 63:41 must all be zeros, or else a
> guest-page-fault exception occurs.
>
> Likewise for Sv48x4 and Sv57x4.
> For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fault exception occurs.
> For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fault exception occurs.
>
> For example we are trying to access address 0xffff_ffff_ff01_0000 with only G-translation enabled.
> So expected behavior is to generate exception. But qemu doesn't generate such exception.
>
> For the old check, we get
> va_bits == 41, mask == (1 << 24) - 1, masked_msbs == (0xffff_ffff_ff01_0000 >> 40) & mask == mask.
> Accordingly, the condition masked_msbs != 0 && masked_msbs != mask is not fulfilled
> and the check passes.
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---
> Changes for v2:
>    -Add more detailed commit message
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

I remember I have sent Reviewed-by for last version of this patch.  And 
it seems no change in following code.

Weiwei Li

> ---
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


