Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXZ1R-0007Cc-CZ
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXZ1O-0007Bk-5l; Wed, 01 Mar 2023 21:50:18 -0500
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXZ1L-0002pf-Qd; Wed, 01 Mar 2023 21:50:17 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R621e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VcvKgwT_1677725404; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvKgwT_1677725404) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:50:04 +0800
Message-ID: <5d7a369f-150e-a0ed-4f26-bd06782b28a6@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:50:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/18] target/riscv: Add some comments to clarify the
 priority policy of riscv_csrrw_check()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230228104035.1879882-1-bmeng@tinylab.org>
 <20230228104035.1879882-3-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230228104035.1879882-3-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:50:19 -0000


On 2023/2/28 18:40, Bin Meng wrote:
> The priority policy of riscv_csrrw_check() was once adjusted in
> commit eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
> whose commit message says the CSR existence check should come before
> the access control check, but the code changes did not agree with
> the commit message, that the predicate() check actually came after
> the read / write check.
>
> In fact this was intentional. Add some comments there so that people
> won't bother trying to change it without a solid reason.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
> Changes in v2:
> - Keep the original priority policy, instead add some comments for clarification
>
>   target/riscv/csr.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 75a540bfcb..4cc2c6370f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3776,11 +3776,12 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>       int read_only = get_field(csrno, 0xC00) == 3;
>       int csr_min_priv = csr_ops[csrno].min_priv_ver;
>   
> -    /* ensure the CSR extension is enabled. */
> +    /* ensure the CSR extension is enabled */
>       if (!cpu->cfg.ext_icsr) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /* privileged spec version check */
>       if (env->priv_ver < csr_min_priv) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> @@ -3790,10 +3791,18 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /* read / write check */
>       if (write_mask && read_only) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /*
> +     * The predicate() not only does existence check but also does some
> +     * access control check which triggers for example virtual instruction
> +     * exception in some cases. When writing read-only CSRs in those cases
> +     * illegal instruction exception should be triggered instead of virtual
> +     * instruction exception. Hence this comes after the read / write check.
> +     */

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;

