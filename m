Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqXQ-0005rV-Hv
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pSqXL-0005hi-TN; Thu, 16 Feb 2023 21:31:49 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pSqXG-0003vx-2r; Thu, 16 Feb 2023 21:31:44 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABnbkr45u5jEEuQBQ--.14291S2;
 Fri, 17 Feb 2023 10:31:21 +0800 (CST)
Message-ID: <c7e8a4e6-24b4-ec0f-c1a9-b66ab4993af7@iscas.ac.cn>
Date: Fri, 17 Feb 2023 10:31:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/9] target/riscv: turn write_misa() into an official
 no-op
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-2-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230216215550.1011637-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABnbkr45u5jEEuQBQ--.14291S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw45Jw1rCFW5KFWfAF1DKFg_yoWrAryrpF
 WSk34fKrWDta4Ikan7GF1DXr18uw1rKay3Gw4kWr10qwsxArZ5tF9xKa9Yya48Jas3ur1I
 qF45Ar9xAr4jvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:31:50 -0000


On 2023/2/17 05:55, Daniel Henrique Barboza wrote:
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to write this CSR, has always been a
> no-op as well because write_misa() will always exit earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> Before proceeding, let's recap what the spec says about MISA. It is a
> CSR that is divided in 3 fields:
>
> - MXL, Machine XLEN, described as "may be writable";
>
> - MXLEN, the XLEN in M-mode, which is given by the setting of MXL or a
> fixed value if MISA is zero;
>
> - Extensions is defined as "a WARL field that can contain writable bits
> where the implementation allows the supported ISA to be modified"
>
> Thus what we have today (write_misa() being a no-op) is already a valid
> spec implementation. We're not obliged to have a particular set of MISA
> writable bits, and at this moment we have none.
>
> Given that allowing the dormant code to write MISA can cause tricky bugs
> to solve later on, and we don't have a particularly interesting case of
> writing MISA to support today, and we're already not violating the
> specification, let's erase all the body of write_misa() and turn it into
> an official no-op instead of an accidental one. We'll keep consistent
> with what we provide users today but with 50+ less lines to maintain.
>
> RISCV_FEATURE_MISA enum is erased in the process since there's no one
> else using it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li
> ---
>   target/riscv/cpu.h |  1 -
>   target/riscv/csr.c | 55 ----------------------------------------------
>   2 files changed, 56 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..01803a020d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,7 +89,6 @@ enum {
>       RISCV_FEATURE_MMU,
>       RISCV_FEATURE_PMP,
>       RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA,
>       RISCV_FEATURE_DEBUG
>   };
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1b0a0c1693..f7862ff4a4 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1329,61 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> -        /* drop write to misa */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /* 'I' or 'E' must be present */
> -    if (!(val & (RVI | RVE))) {
> -        /* It is not, drop write to misa */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /* 'E' excludes all other extensions */
> -    if (val & RVE) {
> -        /* when we support 'E' we can do "val = RVE;" however
> -         * for now we just drop writes if 'E' is present.
> -         */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * misa.MXL writes are not supported by QEMU.
> -     * Drop writes to those bits.
> -     */
> -
> -    /* Mask extensions that are not supported by this hart */
> -    val &= env->misa_ext_mask;
> -
> -    /* Mask extensions that are not supported by QEMU */
> -    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
> -
> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> -    if ((val & RVD) && !(val & RVF)) {
> -        val &= ~RVD;
> -    }
> -
> -    /* Suppress 'C' if next instruction is not aligned
> -     * TODO: this should check next_pc
> -     */
> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> -        val &= ~RVC;
> -    }
> -
> -    /* If nothing changed, do nothing. */
> -    if (val == env->misa_ext) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    if (!(val & RVF)) {
> -        env->mstatus &= ~MSTATUS_FS;
> -    }
> -
> -    /* flush translation cache */
> -    tb_flush(env_cpu(env));
> -    env->misa_ext = val;
> -    env->xl = riscv_cpu_mxl(env);
>       return RISCV_EXCP_NONE;
>   }
>   


