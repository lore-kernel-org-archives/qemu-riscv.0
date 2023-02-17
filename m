Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqS0-00042U-JN
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqRz-00041w-1a; Thu, 16 Feb 2023 21:26:15 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqRw-0002wK-Qo; Thu, 16 Feb 2023 21:26:14 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vbqh7eh_1676600766; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vbqh7eh_1676600766) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:26:07 +0800
Message-ID: <8646fa0b-9d70-5026-7580-3e30368af36e@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:26:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 07/18] target/riscv: Simplify {read,write}_pmpcfg() a
 little bit
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-8-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-8-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:26:15 -0000


On 2023/2/14 2:02, Bin Meng wrote:
> Use the register index that has already been calculated in the
> pmpcfg_csr_{read,write} call.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/csr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8bbc75cbfa..da3b770894 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3363,7 +3363,7 @@ static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
>       if (!check_pmp_reg_index(env, reg_index)) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> -    *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
> +    *val = pmpcfg_csr_read(env, reg_index);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -3375,7 +3375,7 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
>       if (!check_pmp_reg_index(env, reg_index)) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> -    pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
> +    pmpcfg_csr_write(env, reg_index, val);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       return RISCV_EXCP_NONE;
>   }
>   

