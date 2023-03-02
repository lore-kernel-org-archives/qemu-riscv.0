Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYwM-0008D6-27
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:45:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYwJ-00087W-R2; Wed, 01 Mar 2023 21:45:03 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYwH-0000Vt-Pc; Wed, 01 Mar 2023 21:45:03 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VcvIm1g_1677725095; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvIm1g_1677725095) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:44:56 +0800
Message-ID: <be956865-fa0d-26fc-7eef-6a5009487286@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:44:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 16/18] target/riscv: Allow debugger to access sstc CSRs
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
References: <20230228104035.1879882-13-bmeng@tinylab.org>
 <20230228104035.1879882-17-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230228104035.1879882-17-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:45:04 -0000


On 2023/2/28 21:45, Bin Meng wrote:
> From: Bin Meng <bmeng@tinylab.org>
>
> At present with a debugger attached sstc CSRs can only be accssed
> when CPU is in M-mode, or configured correctly.
>
> Fix it by adjusting their predicate() routine logic so that the
> static config check comes before the run-time check, as well as
> adding a debugger check.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>
> (no changes since v1)
>
>   target/riscv/csr.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a0e70f5ba0..020c3f524f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -952,6 +952,19 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> +        hmode_check = true;
> +    }
> +
> +    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
>       if (env->priv == PRV_M) {
>           return RISCV_EXCP_NONE;
>       }
> @@ -972,11 +985,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>           }
>       }
>   
> -    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> -        hmode_check = true;
> -    }
> -
> -    return hmode_check ? hmode(env, csrno) : smode(env, csrno);
> +    return RISCV_EXCP_NONE;

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   }
>   
>   static RISCVException sstc_32(CPURISCVState *env, int csrno)

