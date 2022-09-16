Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ0a0-0001oV-PY
	for mharc-qemu-riscv@gnu.org; Thu, 15 Sep 2022 21:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ0Zy-0001iT-Qi; Thu, 15 Sep 2022 21:55:42 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:51743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ0Zp-0002Ph-QE; Thu, 15 Sep 2022 21:55:36 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VPuvdhT_1663293325; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPuvdhT_1663293325) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 09:55:25 +0800
Message-ID: <f4a69cac-6e3a-4f11-cfc5-08613175df3a@linux.alibaba.com>
Date: Fri, 16 Sep 2022 09:55:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/8] target/riscv: debug: Introduce build_tdata1() to
 build tdata1 register content
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
 <20220909134215.1843865-3-bmeng.cn@gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220909134215.1843865-3-bmeng.cn@gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2022 01:55:43 -0000

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

On 2022/9/9 21:42, Bin Meng wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> Introduce build_tdata1() to build tdata1 register content, which can be
> shared among all types of triggers.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> [bmeng: moved RV{32,64}_DATA_MASK definition to this patch]
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
> Changes in v2:
> - moved RV{32,64}_DATA_MASK definition to this patch
>
>   target/riscv/debug.h |  2 ++
>   target/riscv/debug.c | 15 ++++++++++-----
>   2 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 72e4edcd8c..c422553c27 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -56,9 +56,11 @@ typedef struct {
>   #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
>   #define RV32_TYPE_MASK  (0xf << 28)
>   #define RV32_DMODE      BIT(27)
> +#define RV32_DATA_MASK  0x7ffffff
>   #define RV64_TYPE(t)    ((uint64_t)(t) << 60)
>   #define RV64_TYPE_MASK  (0xfULL << 60)
>   #define RV64_DMODE      BIT_ULL(59)
> +#define RV64_DATA_MASK  0x7ffffffffffffff
>   
>   /* mcontrol field masks */
>   
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 9dd468753a..45aae87ec3 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -95,18 +95,23 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
>       return extract_trigger_type(env, tdata1);
>   }
>   
> -static inline target_ulong trigger_type(CPURISCVState *env,
> -                                        trigger_type_t type)
> +static inline target_ulong build_tdata1(CPURISCVState *env,
> +                                        trigger_type_t type,
> +                                        bool dmode, target_ulong data)
>   {
>       target_ulong tdata1;
>   
>       switch (riscv_cpu_mxl(env)) {
>       case MXL_RV32:
> -        tdata1 = RV32_TYPE(type);
> +        tdata1 = RV32_TYPE(type) |
> +                 (dmode ? RV32_DMODE : 0) |
> +                 (data & RV32_DATA_MASK);
>           break;
>       case MXL_RV64:
>       case MXL_RV128:
> -        tdata1 = RV64_TYPE(type);
> +        tdata1 = RV64_TYPE(type) |
> +                 (dmode ? RV64_DMODE : 0) |
> +                 (data & RV64_DATA_MASK);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -495,7 +500,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   
>   void riscv_trigger_init(CPURISCVState *env)
>   {
> -    target_ulong tdata1 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
> +    target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
>       int i;
>   
>       /* init to type 2 triggers */

