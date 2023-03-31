Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pi3f5-0004ZU-PY
	for mharc-qemu-riscv@gnu.org; Thu, 30 Mar 2023 21:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pi3f4-0004Z8-9n; Thu, 30 Mar 2023 21:34:38 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pi3f2-00045p-6b; Thu, 30 Mar 2023 21:34:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vf05cDw_1680226464; 
Received: from 30.221.97.117(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vf05cDw_1680226464) by smtp.aliyun-inc.com;
 Fri, 31 Mar 2023 09:34:25 +0800
Message-ID: <51afd8dd-be0c-045d-eabf-47e6d07eccbd@linux.alibaba.com>
Date: Fri, 31 Mar 2023 09:34:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] target/riscv: Update cur_pmmask/base when xl
 changes
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-3-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230329032346.55185-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 31 Mar 2023 01:34:38 -0000


On 2023/3/29 11:23, Weiwei Li wrote:
> write_mstatus() can only change current xl when in debug mode.
> And we need update cur_pmmask/base in this case.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/csr.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..43b9ad4500 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1277,8 +1277,15 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>           mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
>       }
>       env->mstatus = mstatus;
> -    env->xl = cpu_recompute_xl(env);
>   
> +    /*
> +     * Except in debug mode, UXL/SXL can only be modified by higher
> +     * privilege mode. So xl will not be changed in normal mode.
> +     */
> +    if (env->debugger) {
> +        env->xl = cpu_recompute_xl(env);
> +        riscv_cpu_update_mask(env);
> +    }
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei
>       return RISCV_EXCP_NONE;
>   }
>   

