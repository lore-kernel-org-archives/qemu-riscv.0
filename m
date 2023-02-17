Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqQl-0002xu-14
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqQj-0002w4-Ry; Thu, 16 Feb 2023 21:24:57 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqQg-0002WU-UX; Thu, 16 Feb 2023 21:24:56 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqZzPT_1676600688; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqZzPT_1676600688) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:24:49 +0800
Message-ID: <48c756a4-91c2-f605-f951-6aae00b9c908@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 06/18] target/riscv: Use 'bool' type for read_only
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-7-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-7-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:24:58 -0000


On 2023/2/14 2:02, Bin Meng wrote:
> The read_only variable is currently declared as an 'int', but it
> should really be a 'bool'.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/csr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index cc74819759..8bbc75cbfa 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3778,7 +3778,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>                                                  RISCVCPU *cpu)
>   {
>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
> -    int read_only = get_field(csrno, 0xC00) == 3;
> +    bool read_only = get_field(csrno, 0xC00) == 3;

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       int csr_min_priv = csr_ops[csrno].min_priv_ver;
>   
>       /* ensure the CSR extension is enabled. */

