Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSplo-0002kG-7p
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 20:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSplc-0002Yt-Oz; Thu, 16 Feb 2023 20:42:30 -0500
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSplZ-00015N-6H; Thu, 16 Feb 2023 20:42:28 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqEMd7_1676598129; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqEMd7_1676598129) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 09:42:10 +0800
Message-ID: <d2eee59a-0611-d260-53e5-fd6349642c21@linux.alibaba.com>
Date: Fri, 17 Feb 2023 09:42:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 1/9] target/riscv: turn write_misa() into an official
 no-op
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-2-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 01:42:34 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
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

Hi Daniel,

I see there has been a discussion on this topic. And as no-op has no 
harmfulness for current implementation.
However, I still think we should make misa writable as default, which is 
also a valid spec implementation.

One reason is that may be we need to dynamic write  access for some cpus 
in the future. The other is we should
make QEMU a more useful implementation, not just a legal implementation. 
We have done in many aspects on this direction.

I prefer your implementation before v4. It's not a complicated 
implementation. And I think the other extensions on QEMU currently
can mostly be configurable already.

Your work is a good step towards to unify the configuration and the 
check.  I think two more steps we can go further.

1) Remove RVI/RVF and the similar macros, and add fields for them in the 
configuration struct.

2) Unify the check about configuration. write_misa and cpu_realize_fn 
can use the same check function.


As we have done these two steps, I think we can go more closely for the 
profile extension.


Zhiwei

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

