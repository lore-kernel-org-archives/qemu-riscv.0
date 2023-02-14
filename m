Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRrYV-0007zh-84
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 04:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrYP-0007yx-Gj; Tue, 14 Feb 2023 04:24:51 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrYL-0007MG-Ie; Tue, 14 Feb 2023 04:24:48 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADn7PRSU+tjZl8tBQ--.42269S2;
 Tue, 14 Feb 2023 17:24:34 +0800 (CST)
Message-ID: <6ef549de-7427-dbc0-956b-fff4e1565765@iscas.ac.cn>
Date: Tue, 14 Feb 2023 17:24:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 14/18] target/riscv: Allow debugger to access {h, s}stateen
 CSRs
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-15-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-15-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADn7PRSU+tjZl8tBQ--.42269S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rtw4kCw4xtr17Gr13XFb_yoW8CFW7pw
 48K3sxG39aqF9Fyanxtrn8tF1fuw18JayUZw17Ww4kAF15JrW5Ar1DWasIqa95XryDGr42
 vF4jkF1xCr42ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUY18BUU
 UUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
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
X-List-Received-Date: Tue, 14 Feb 2023 09:24:53 -0000


On 2023/2/14 11:06, Bin Meng wrote:
> At present {h,s}stateen CSRs are not reported in the CSR XML
> hence gdb cannot access them.
>
> Fix it by adjusting their predicate() routine logic so that the
> static config check comes before the run-time check, as well as
> addding a debugger check.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Similar typo,

Otherwise, Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li

> ---
>
>   target/riscv/csr.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f1075b5728..d6bcb7f275 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -337,13 +337,22 @@ static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    RISCVException ret = hmode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
>       if (env->priv < PRV_M) {
>           if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
>               return RISCV_EXCP_ILLEGAL_INST;
>           }
>       }
>   
> -    return hmode(env, csrno);
> +    return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException hstateen(CPURISCVState *env, int csrno)
> @@ -366,6 +375,15 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    RISCVException ret = smode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
>       if (env->priv < PRV_M) {
>           if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
>               return RISCV_EXCP_ILLEGAL_INST;
> @@ -378,7 +396,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>           }
>       }
>   
> -    return smode(env, csrno);
> +    return RISCV_EXCP_NONE;
>   }
>   
>   /* Checks if PointerMasking registers could be accessed */


