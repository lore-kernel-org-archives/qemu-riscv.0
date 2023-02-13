Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRQMo-0001Jd-J2
	for mharc-qemu-riscv@gnu.org; Sun, 12 Feb 2023 23:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pRQMn-0001JL-EF; Sun, 12 Feb 2023 23:23:01 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pRQMk-0005Ly-UP; Sun, 12 Feb 2023 23:23:01 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VbSvqUv_1676262158; 
Received: from 30.221.96.206(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbSvqUv_1676262158) by smtp.aliyun-inc.com;
 Mon, 13 Feb 2023 12:22:39 +0800
Message-ID: <5428dd5e-2772-2332-6b39-07a82e14e71b@linux.alibaba.com>
Date: Mon, 13 Feb 2023 12:22:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: qemu-devel@nongnu.org
References: <20230209055206.229392-1-hchauhan@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230209055206.229392-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 13 Feb 2023 04:23:01 -0000


On 2023/2/9 13:52, Himanshu Chauhan wrote:
> When MSECCFG.MML is set, after checking the address range in PMP if the
> asked permissions are not same as programmed in PMP, the default
> permissions are applied. This should only be the case when there
> is no matching address is found.
>
> This patch skips applying default rules when matching address range
> is found. It returns the index of the match PMP entry.
>
> fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>   target/riscv/pmp.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index d85ad07caa..0dfdb35828 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                   }
>               }
>   
> -            if ((privs & *allowed_privs) == privs) {
> -                ret = i;
> -            }
> +            /*
> +             * If matching address range was found, the protection bits
> +             * defined with PMP must be used. We shouldn't fallback on
> +             * finding default privileges.
> +             */
> +            ret = i;

Notice the return value is the matching rule index, which includes

1) the address range is matching.

2) the permission of the PMP rule and the memory access type are matching.


So we can't simply remove the second check.  I think the right fix is:

            if ((privs & *allowed_privs) == privs) {
                 ret = i;
  -         }
  +         } else {
  +		ret = -2;
  +         }

The -2 return value avoids finding the default privileges. And it implies no matching rule is found.

Zhiwei

>               break;
>           }
>       }

