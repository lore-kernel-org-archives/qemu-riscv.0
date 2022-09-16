Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ1Hs-00014H-L9
	for mharc-qemu-riscv@gnu.org; Thu, 15 Sep 2022 22:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ1Hq-0000rW-H5; Thu, 15 Sep 2022 22:41:02 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:44254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ1Hb-0006Ez-8z; Thu, 15 Sep 2022 22:40:53 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VPv.xwl_1663296038; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPv.xwl_1663296038) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 10:40:39 +0800
Message-ID: <0cbdb4f3-ceed-923c-1d89-a86c83a9ef48@linux.alibaba.com>
Date: Fri, 16 Sep 2022 10:40:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 6/8] target/riscv: debug: Create common trigger actions
 function
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
 <20220909134215.1843865-7-bmeng.cn@gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220909134215.1843865-7-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -116
X-Spam_score: -11.7
X-Spam_bar: -----------
X-Spam_report: (-11.7 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.816, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 16 Sep 2022 02:41:02 -0000

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

On 2022/9/9 21:42, Bin Meng wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> Trigger actions are shared among all triggers. Extract to a common
> function.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> [bmeng: handle the DBG_ACTION_NONE case]
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
> Changes in v2:
> - add handling of the DBG_ACTION_NONE case in do_trigger_action()
>
>   target/riscv/debug.h | 13 ++++++++++
>   target/riscv/debug.c | 59 ++++++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 9f69c64591..0e4859cf74 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -44,6 +44,19 @@ typedef enum {
>       TRIGGER_TYPE_NUM
>   } trigger_type_t;
>   
> +/* actions */
> +typedef enum {
> +    DBG_ACTION_NONE = -1,           /* sentinel value */
> +    DBG_ACTION_BP = 0,
> +    DBG_ACTION_DBG_MODE,
> +    DBG_ACTION_TRACE0,
> +    DBG_ACTION_TRACE1,
> +    DBG_ACTION_TRACE2,
> +    DBG_ACTION_TRACE3,
> +    DBG_ACTION_EXT_DBG0 = 8,
> +    DBG_ACTION_EXT_DBG1
> +} trigger_action_t;
> +
>   /* tdata1 field masks */
>   
>   #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 7d546ace42..7a8910f980 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -92,6 +92,37 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
>       return extract_trigger_type(env, env->tdata1[trigger_index]);
>   }
>   
> +static trigger_action_t get_trigger_action(CPURISCVState *env,
> +                                           target_ulong trigger_index)
> +{
> +    target_ulong tdata1 = env->tdata1[trigger_index];
> +    int trigger_type = get_trigger_type(env, trigger_index);
> +    trigger_action_t action = DBG_ACTION_NONE;
> +
> +    switch (trigger_type) {
> +    case TRIGGER_TYPE_AD_MATCH:
> +        action = (tdata1 & TYPE2_ACTION) >> 12;
> +        break;
> +    case TRIGGER_TYPE_INST_CNT:
> +    case TRIGGER_TYPE_INT:
> +    case TRIGGER_TYPE_EXCP:
> +    case TRIGGER_TYPE_AD_MATCH6:
> +    case TRIGGER_TYPE_EXT_SRC:
> +        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
> +                      trigger_type);
> +        break;
> +    case TRIGGER_TYPE_NO_EXIST:
> +    case TRIGGER_TYPE_UNAVAIL:
> +        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
> +                      trigger_type);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return action;
> +}
> +
>   static inline target_ulong build_tdata1(CPURISCVState *env,
>                                           trigger_type_t type,
>                                           bool dmode, target_ulong data)
> @@ -182,6 +213,30 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
>       }
>   }
>   
> +static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
> +{
> +    trigger_action_t action = get_trigger_action(env, trigger_index);
> +
> +    switch (action) {
> +    case DBG_ACTION_NONE:
> +        break;
> +    case DBG_ACTION_BP:
> +        riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +        break;
> +    case DBG_ACTION_DBG_MODE:
> +    case DBG_ACTION_TRACE0:
> +    case DBG_ACTION_TRACE1:
> +    case DBG_ACTION_TRACE2:
> +    case DBG_ACTION_TRACE3:
> +    case DBG_ACTION_EXT_DBG0:
> +    case DBG_ACTION_EXT_DBG1:
> +        qemu_log_mask(LOG_UNIMP, "action: %d is not supported\n", action);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>   /* type 2 trigger */
>   
>   static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
> @@ -384,11 +439,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>       if (cs->watchpoint_hit) {
>           if (cs->watchpoint_hit->flags & BP_CPU) {
>               cs->watchpoint_hit = NULL;
> -            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +            do_trigger_action(env, DBG_ACTION_BP);
>           }
>       } else {
>           if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> -            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +            do_trigger_action(env, DBG_ACTION_BP);
>           }
>       }
>   }

