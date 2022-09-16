Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ0dk-0004Ll-6H
	for mharc-qemu-riscv@gnu.org; Thu, 15 Sep 2022 21:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ0dj-0004L9-24; Thu, 15 Sep 2022 21:59:35 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:51035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oZ0dX-0003Ag-S4; Thu, 15 Sep 2022 21:59:29 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R771e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VPv.e.y_1663293556; 
Received: from 30.225.65.194(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VPv.e.y_1663293556) by smtp.aliyun-inc.com;
 Fri, 16 Sep 2022 09:59:17 +0800
Message-ID: <470e7d6a-72a6-93e8-649d-c67d46d23dd0@linux.alibaba.com>
Date: Fri, 16 Sep 2022 09:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/8] target/riscv: debug: Introduce tdata1, tdata2, and
 tdata3 CSRs
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
 <20220909134215.1843865-4-bmeng.cn@gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220909134215.1843865-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
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
X-List-Received-Date: Fri, 16 Sep 2022 01:59:35 -0000


On 2022/9/9 21:42, Bin Meng wrote:
> From: Frank Chang <frank.chang@sifive.com>
>
> Replace type2_trigger_t with the real tdata1, tdata2, and tdata3 CSRs,
> which allows us to support more types of triggers in the future.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
> (no changes since v1)
>
>   target/riscv/cpu.h     |   6 ++-
>   target/riscv/debug.h   |   7 ---
>   target/riscv/debug.c   | 103 +++++++++++++++--------------------------
>   target/riscv/machine.c |  20 ++------
>   4 files changed, 48 insertions(+), 88 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4d82a3250b..b0b05c19ca 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -324,7 +324,11 @@ struct CPUArchState {
>   
>       /* trigger module */
>       target_ulong trigger_cur;
> -    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
> +    target_ulong tdata1[RV_MAX_TRIGGERS];
> +    target_ulong tdata2[RV_MAX_TRIGGERS];
> +    target_ulong tdata3[RV_MAX_TRIGGERS];
> +    struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
> +    struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];

These fields should not packed into env.  As it had already existed  
before this patch set,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   
>       /* machine specific rdtime callback */
>       uint64_t (*rdtime_fn)(void *);
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c422553c27..76146f373a 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -44,13 +44,6 @@ typedef enum {
>       TRIGGER_TYPE_NUM
>   } trigger_type_t;
>   
> -typedef struct {
> -    target_ulong mcontrol;
> -    target_ulong maddress;
> -    struct CPUBreakpoint *bp;
> -    struct CPUWatchpoint *wp;
> -} type2_trigger_t;
> -
>   /* tdata1 field masks */
>   
>   #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 45aae87ec3..06feef7d67 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -91,8 +91,7 @@ static inline target_ulong extract_trigger_type(CPURISCVState *env,
>   static inline target_ulong get_trigger_type(CPURISCVState *env,
>                                               target_ulong trigger_index)
>   {
> -    target_ulong tdata1 = env->type2_trig[trigger_index].mcontrol;
> -    return extract_trigger_type(env, tdata1);
> +    return extract_trigger_type(env, env->tdata1[trigger_index]);
>   }
>   
>   static inline target_ulong build_tdata1(CPURISCVState *env,
> @@ -188,6 +187,8 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
>       }
>   }
>   
> +/* type 2 trigger */
> +
>   static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
>   {
>       uint32_t size, sizelo, sizehi = 0;
> @@ -247,8 +248,8 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
>   
>   static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>   {
> -    target_ulong ctrl = env->type2_trig[index].mcontrol;
> -    target_ulong addr = env->type2_trig[index].maddress;
> +    target_ulong ctrl = env->tdata1[index];
> +    target_ulong addr = env->tdata2[index];
>       bool enabled = type2_breakpoint_enabled(ctrl);
>       CPUState *cs = env_cpu(env);
>       int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
> @@ -259,7 +260,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>       }
>   
>       if (ctrl & TYPE2_EXEC) {
> -        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].bp);
> +        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
>       }
>   
>       if (ctrl & TYPE2_LOAD) {
> @@ -273,10 +274,10 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>           size = type2_breakpoint_size(env, ctrl);
>           if (size != 0) {
>               cpu_watchpoint_insert(cs, addr, size, flags,
> -                                  &env->type2_trig[index].wp);
> +                                  &env->cpu_watchpoint[index]);
>           } else {
>               cpu_watchpoint_insert(cs, addr, 8, flags,
> -                                  &env->type2_trig[index].wp);
> +                                  &env->cpu_watchpoint[index]);
>           }
>       }
>   }
> @@ -285,36 +286,17 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
>   {
>       CPUState *cs = env_cpu(env);
>   
> -    if (env->type2_trig[index].bp) {
> -        cpu_breakpoint_remove_by_ref(cs, env->type2_trig[index].bp);
> -        env->type2_trig[index].bp = NULL;
> +    if (env->cpu_breakpoint[index]) {
> +        cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
> +        env->cpu_breakpoint[index] = NULL;
>       }
>   
> -    if (env->type2_trig[index].wp) {
> -        cpu_watchpoint_remove_by_ref(cs, env->type2_trig[index].wp);
> -        env->type2_trig[index].wp = NULL;
> +    if (env->cpu_watchpoint[index]) {
> +        cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
> +        env->cpu_watchpoint[index] = NULL;
>       }
>   }
>   
> -static target_ulong type2_reg_read(CPURISCVState *env,
> -                                   target_ulong index, int tdata_index)
> -{
> -    target_ulong tdata;
> -
> -    switch (tdata_index) {
> -    case TDATA1:
> -        tdata = env->type2_trig[index].mcontrol;
> -        break;
> -    case TDATA2:
> -        tdata = env->type2_trig[index].maddress;
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
> -    return tdata;
> -}
> -
>   static void type2_reg_write(CPURISCVState *env, target_ulong index,
>                               int tdata_index, target_ulong val)
>   {
> @@ -323,19 +305,23 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
>       switch (tdata_index) {
>       case TDATA1:
>           new_val = type2_mcontrol_validate(env, val);
> -        if (new_val != env->type2_trig[index].mcontrol) {
> -            env->type2_trig[index].mcontrol = new_val;
> +        if (new_val != env->tdata1[index]) {
> +            env->tdata1[index] = new_val;
>               type2_breakpoint_remove(env, index);
>               type2_breakpoint_insert(env, index);
>           }
>           break;
>       case TDATA2:
> -        if (val != env->type2_trig[index].maddress) {
> -            env->type2_trig[index].maddress = val;
> +        if (val != env->tdata2[index]) {
> +            env->tdata2[index] = val;
>               type2_breakpoint_remove(env, index);
>               type2_breakpoint_insert(env, index);
>           }
>           break;
> +    case TDATA3:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "tdata3 is not supported for type 2 trigger\n");
> +        break;
>       default:
>           g_assert_not_reached();
>       }
> @@ -345,30 +331,16 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
>   
>   target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>   {
> -    int trigger_type = get_trigger_type(env, env->trigger_cur);
> -
> -    switch (trigger_type) {
> -    case TRIGGER_TYPE_AD_MATCH:
> -        return type2_reg_read(env, env->trigger_cur, tdata_index);
> -        break;
> -    case TRIGGER_TYPE_INST_CNT:
> -    case TRIGGER_TYPE_INT:
> -    case TRIGGER_TYPE_EXCP:
> -    case TRIGGER_TYPE_AD_MATCH6:
> -    case TRIGGER_TYPE_EXT_SRC:
> -        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
> -                      trigger_type);
> -        break;
> -    case TRIGGER_TYPE_NO_EXIST:
> -    case TRIGGER_TYPE_UNAVAIL:
> -        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
> -                      trigger_type);
> -        break;
> +    switch (tdata_index) {
> +    case TDATA1:
> +        return env->tdata1[env->trigger_cur];
> +    case TDATA2:
> +        return env->tdata2[env->trigger_cur];
> +    case TDATA3:
> +        return env->tdata3[env->trigger_cur];
>       default:
>           g_assert_not_reached();
>       }
> -
> -    return 0;
>   }
>   
>   void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
> @@ -436,8 +408,8 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>   
>               switch (trigger_type) {
>               case TRIGGER_TYPE_AD_MATCH:
> -                ctrl = env->type2_trig[i].mcontrol;
> -                pc = env->type2_trig[i].maddress;
> +                ctrl = env->tdata1[i];
> +                pc = env->tdata2[i];
>   
>                   if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
>                       /* check U/S/M bit against current privilege level */
> @@ -471,8 +443,8 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>   
>           switch (trigger_type) {
>           case TRIGGER_TYPE_AD_MATCH:
> -            ctrl = env->type2_trig[i].mcontrol;
> -            addr = env->type2_trig[i].maddress;
> +            ctrl = env->tdata1[i];
> +            addr = env->tdata2[i];
>               flags = 0;
>   
>               if (ctrl & TYPE2_LOAD) {
> @@ -518,9 +490,10 @@ void riscv_trigger_init(CPURISCVState *env)
>            * chain = 0 (unimplemented, always 0)
>            * match = 0 (always 0, when any compare value equals tdata2)
>            */
> -        env->type2_trig[i].mcontrol = tdata1;
> -        env->type2_trig[i].maddress = 0;
> -        env->type2_trig[i].bp = NULL;
> -        env->type2_trig[i].wp = NULL;
> +        env->tdata1[i] = tdata1;
> +        env->tdata2[i] = 0;
> +        env->tdata3[i] = 0;
> +        env->cpu_breakpoint[i] = NULL;
> +        env->cpu_watchpoint[i] = NULL;
>       }
>   }
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index b8173394a2..cb1c4b83b7 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -229,26 +229,16 @@ static bool debug_needed(void *opaque)
>       return riscv_feature(env, RISCV_FEATURE_DEBUG);
>   }
>   
> -static const VMStateDescription vmstate_debug_type2 = {
> -    .name = "cpu/debug/type2",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
> -        VMSTATE_UINTTL(maddress, type2_trigger_t),
> -        VMSTATE_END_OF_LIST()
> -   }
> -};
> -
>   static const VMStateDescription vmstate_debug = {
>       .name = "cpu/debug",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>       .needed = debug_needed,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
> -        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
> -                             0, vmstate_debug_type2, type2_trigger_t),
> +        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
> +        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
> +        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
>           VMSTATE_END_OF_LIST()
>       }
>   };

