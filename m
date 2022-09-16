Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ0eL-0004oD-Dm
	for mharc-qemu-riscv@gnu.org; Thu, 15 Sep 2022 22:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ0eF-0004md-PA; Thu, 15 Sep 2022 22:00:07 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:52928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ0eE-00041w-45; Thu, 15 Sep 2022 22:00:07 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VPv.eJ5_1663293599; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPv.eJ5_1663293599) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 10:00:00 +0800
Message-ID: <2e602ad1-2e46-3390-77be-3535700b18d6@linux.alibaba.com>
Date: Fri, 16 Sep 2022 09:59:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 4/8] target/riscv: debug: Restrict the range of tselect
 value can be written
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
 <20220909134215.1843865-5-bmeng.cn@gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220909134215.1843865-5-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -116
X-Spam_score: -11.7
X-Spam_bar: -----------
X-Spam_report: (-11.7 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.816, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 16 Sep 2022 02:00:13 -0000

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

On 2022/9/9 21:42, Bin Meng wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> The value of tselect CSR can be written should be limited within the
> range of supported triggers number.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> (no changes since v1)
>
>   target/riscv/debug.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 06feef7d67..d6666164cd 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -127,10 +127,6 @@ bool tdata_available(CPURISCVState *env, int tdata_index)
>           return false;
>       }
>   
> -    if (unlikely(env->trigger_cur >= RV_MAX_TRIGGERS)) {
> -        return false;
> -    }
> -
>       return tdata_mapping[trigger_type][tdata_index];
>   }
>   
> @@ -141,8 +137,9 @@ target_ulong tselect_csr_read(CPURISCVState *env)
>   
>   void tselect_csr_write(CPURISCVState *env, target_ulong val)
>   {
> -    /* all target_ulong bits of tselect are implemented */
> -    env->trigger_cur = val;
> +    if (val < RV_MAX_TRIGGERS) {
> +        env->trigger_cur = val;
> +    }
>   }
>   
>   static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,

