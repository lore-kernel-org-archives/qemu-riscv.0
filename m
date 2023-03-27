Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgcHP-0002WU-21
	for mharc-qemu-riscv@gnu.org; Sun, 26 Mar 2023 22:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgcHN-0002W5-2Z; Sun, 26 Mar 2023 22:08:13 -0400
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgcHJ-0007SK-IR; Sun, 26 Mar 2023 22:08:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VeebsXm_1679882866; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeebsXm_1679882866) by smtp.aliyun-inc.com;
 Mon, 27 Mar 2023 10:07:46 +0800
Message-ID: <a4e87eab-aace-a17b-fef5-5c5b1118a561@linux.alibaba.com>
Date: Mon, 27 Mar 2023 10:07:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-14-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230325105429.1142530-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 02:08:13 -0000


On 2023/3/25 18:54, Richard Henderson wrote:
> Use the priv level encoded into the mmu_idx, rather than
> starting from env->priv.  We have already checked MPRV+MPP
> in riscv_cpu_mmu_index -- no need to repeat that.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/internals.h  | 9 +++++++++
>   target/riscv/cpu_helper.c | 6 +-----
>   2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 0b61f337dd..4aa1cb409f 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -37,6 +37,15 @@
>   #define MMUIdx_M            3
>   #define MMU_2STAGE_BIT      (1 << 2)
>   
> +static inline int mmuidx_priv(int mmu_idx)
> +{
> +    int ret = mmu_idx & 3;
> +    if (ret == MMUIdx_S_SUM) {
> +        ret = PRV_S;
> +    }
> +    return ret;
> +}
> +

Can we remove the PRIV from the tb flags after we have this function?

Best Regards,
Zhiwei

>   static inline bool mmuidx_sum(int mmu_idx)
>   {
>       return (mmu_idx & 3) == MMUIdx_S_SUM;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7e6cd8e0fd..cb260b88ea 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -771,7 +771,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>        * (riscv_cpu_do_interrupt) is correct */
>       MemTxResult res;
>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> -    int mode = env->priv;
> +    int mode = mmuidx_priv(mmu_idx);
>       bool use_background = false;
>       hwaddr ppn;
>       RISCVCPU *cpu = env_archcpu(env);
> @@ -793,10 +793,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>          instructions, HLV, HLVX, and HSV. */
>       if (riscv_cpu_two_stage_lookup(mmu_idx)) {
>           mode = get_field(env->hstatus, HSTATUS_SPVP);
> -    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> -            mode = get_field(env->mstatus, MSTATUS_MPP);
> -        }
>       }
>   
>       if (first_stage == false) {

