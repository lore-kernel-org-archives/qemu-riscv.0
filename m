Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqbp-0008PF-NC
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqbo-0008Ow-Jl; Thu, 16 Feb 2023 21:36:24 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqbm-0007W4-5Y; Thu, 16 Feb 2023 21:36:24 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R931e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqSYNX_1676601373; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqSYNX_1676601373) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:36:14 +0800
Message-ID: <05076972-870c-ef85-a07b-28ee3ef768bc@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:36:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 09/18] target/riscv: Avoid reporting odd-numbered pmpcfgX
 in the CSR XML for RV64
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-10-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-10-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:36:25 -0000


On 2023/2/14 2:02, Bin Meng wrote:
> At present the odd-numbered PMP configuration registers for RV64 are
> reported in the CSR XML by QEMU gdbstub. However these registers do
> not exist on RV64 so trying to access them from gdb results in 'E14'.
>
> Move the pmpcfgX index check from the actual read/write routine to
> the PMP CSR predicate() routine, so that non-existent pmpcfgX won't
> be reported in the CSR XML for RV64.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/csr.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0a3f2bef6f..749d0ef83e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -412,6 +412,14 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
>   static RISCVException pmp(CPURISCVState *env, int csrno)
>   {
>       if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> +        if (csrno <= CSR_PMPCFG3) {
> +            uint32_t reg_index = csrno - CSR_PMPCFG0;
> +
> +            if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +        }
> +
>           return RISCV_EXCP_NONE;
>       }
>   
> @@ -3334,23 +3342,11 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> -static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
> -{
> -    /* TODO: RV128 restriction check */

Should keep this comment. Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> -    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
> -        return false;
> -    }
> -    return true;
> -}
> -
>   static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>   {
>       uint32_t reg_index = csrno - CSR_PMPCFG0;
>   
> -    if (!check_pmp_reg_index(env, reg_index)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>       *val = pmpcfg_csr_read(env, reg_index);
>       return RISCV_EXCP_NONE;
>   }
> @@ -3360,9 +3356,6 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
>   {
>       uint32_t reg_index = csrno - CSR_PMPCFG0;
>   
> -    if (!check_pmp_reg_index(env, reg_index)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>       pmpcfg_csr_write(env, reg_index, val);
>       return RISCV_EXCP_NONE;
>   }

