Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXZ1s-0007MU-Hu
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXZ1g-0007Fr-RW; Wed, 01 Mar 2023 21:50:39 -0500
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXZ1c-0002yz-0d; Wed, 01 Mar 2023 21:50:34 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VcvKh4h_1677725425; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvKh4h_1677725425) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:50:25 +0800
Message-ID: <710cf86a-f4f4-ba42-75bf-4a397116af85@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:50:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/18] target/riscv: Use g_assert() for the predicate()
 NULL check
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230228104035.1879882-1-bmeng@tinylab.org>
 <20230228104035.1879882-4-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230228104035.1879882-4-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:50:42 -0000


On 2023/2/28 18:40, Bin Meng wrote:
> At present riscv_csrrw_check() checks the CSR predicate() against
> NULL and throws RISCV_EXCP_ILLEGAL_INST if it is NULL. But this is
> a pure software check, and has nothing to do with the emulation of
> the hardware behavior, thus it is inappropriate to return illegal
> instruction exception when software forgets to install the hook.
>
> Change to use g_assert() instead.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
> Changes in v2:
> - new patch: Use assert() for the predicate() NULL check
>
>   target/riscv/csr.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4cc2c6370f..cfd7ffc5c2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3786,11 +3786,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> -    /* check predicate */
> -    if (!csr_ops[csrno].predicate) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
>       /* read / write check */
>       if (write_mask && read_only) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -3803,6 +3798,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>        * illegal instruction exception should be triggered instead of virtual
>        * instruction exception. Hence this comes after the read / write check.
>        */
> +    g_assert(csr_ops[csrno].predicate != NULL);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;

