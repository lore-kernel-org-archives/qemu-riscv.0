Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1RyB-0006Qr-SF
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 08:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1Ry9-0006Pr-S8; Wed, 15 Jun 2022 08:17:57 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1Ry7-0001B6-Go; Wed, 15 Jun 2022 08:17:57 -0400
Received: by mail-qk1-x735.google.com with SMTP id d128so8545915qkg.8;
 Wed, 15 Jun 2022 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmQ00cVMRBNQaCk8A4Fk3X2bqWqhkIx10jO3+zWVpYA=;
 b=ff9c/4NtjroRMkVAEWb9uWWt/p8LZJrLY8nznqFHC0+j84wk/vj7rqtgXXHxAPhl0F
 7B5NqZc0FEuSs4+iud3awP+1UYzJr4Bo8cZvD5Vya7sNB6xyFwURjYgavJYqRjVFEwdh
 YAyYEh8sDHKanVydmAmlRj7m320G697b3gFclVIbSoepxtl+C6vsu43VQVQVq2kJuv0w
 ch7bv8oXq5PuBijmccoN/SFCmA2Kzy+GL067oLrbPeiimlKYhQQINk0DiskE8lkdL855
 xvUTozgVQ+Db9aj1ExcgUSzgjwTumspyA/SQXT4ZyEyx2pjW0lN1ypsZchfpZpRJUxvU
 WJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmQ00cVMRBNQaCk8A4Fk3X2bqWqhkIx10jO3+zWVpYA=;
 b=a88D2xySZbfI8ZVCabOmbLM1avABXEY2uZLSr9mRcPNCxcYh2sWFRsyVrtK7wNjMYZ
 xiw+H7SGxXyXZKjrfZkV/xcJkbQhLKJtJxbTo4P34bcchfTFx24XK9DWyH7G2eredILk
 Yvnj2wjkdXJ35mapbM8iTovS8QQFyDfzM0Ip0xwSzHXs3tXJxxb3phLRl8oi6afMUsU/
 cltYfacs4mtApeSdO/n2Wqr2RWj9eFO4N+UQrzLO73z2xAuBSr6GQ4HXt9MM7oDlA6m5
 BUQojjJnv4U32y7G7ivs08eea/qO1gesD/6anOOmbRxuZAwpx3QsIooBSiMgLDFpP9EE
 xrtw==
X-Gm-Message-State: AOAM533pqF9Ph7/Zy5137eEy8ku6ck8dGIuFB0i1e026RnwqNbWkckbk
 KVoiX3KVu7xk+g7rY8sfdqNBnzKeyq+rDBfjyH0=
X-Google-Smtp-Source: ABdhPJzOWloLcB7mF+YY8dM3oms3iJJ4dZgzeNtJxRjDwUraCD19nrM0ZYH7vdDa+VUJ/afN1u/J5Dujo1nKOUeAx3I=
X-Received: by 2002:a05:620a:2409:b0:6a7:641:a9d7 with SMTP id
 d9-20020a05620a240900b006a70641a9d7mr7705238qkn.132.1655295473695; Wed, 15
 Jun 2022 05:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-4-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-4-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 20:17:42 +0800
Message-ID: <CAEUhbmV20AEwOzUKY6aAJ2u8n21czzw6BCFX+PO8EH8_j7yGYQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] target/riscv: debug: Introduce tdata1, tdata2, and
 tdata3 CSRs
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 12:17:58 -0000

On Fri, Jun 10, 2022 at 1:15 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Replace type2_trigger_t with the real tdata1, tdata2, and tdata3 CSRs,
> which allows us to support more types of triggers in the future.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h     |   6 ++-
>  target/riscv/debug.c   | 101 ++++++++++++++++-------------------------
>  target/riscv/debug.h   |   7 ---
>  target/riscv/machine.c |  20 ++------
>  4 files changed, 48 insertions(+), 86 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 535123a989..bac5f00722 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -289,7 +289,11 @@ struct CPUArchState {
>
>      /* trigger module */
>      target_ulong trigger_cur;
> -    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
> +    target_ulong tdata1[RV_MAX_TRIGGERS];
> +    target_ulong tdata2[RV_MAX_TRIGGERS];
> +    target_ulong tdata3[RV_MAX_TRIGGERS];
> +    struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
> +    struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];

I believe the breakpoint and watchpoint here does not make sense to
every type of trigger. It only makes sense to type 2, 6. Type 3 only
has breakpoint.

>
>      /* machine specific rdtime callback */
>      uint64_t (*rdtime_fn)(void *);
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 089aae0696..6913682f75 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -90,8 +90,7 @@ static inline target_ulong extract_trigger_type(CPURISCVState *env,
>  static inline target_ulong get_trigger_type(CPURISCVState *env,
>                                              target_ulong trigger_index)
>  {
> -    target_ulong tdata1 = env->type2_trig[trigger_index].mcontrol;
> -    return extract_trigger_type(env, tdata1);
> +    return extract_trigger_type(env, env->tdata1[trigger_index]);
>  }
>
>  static inline target_ulong build_tdata1(CPURISCVState *env,
> @@ -187,6 +186,8 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
>      }
>  }
>
> +/* type 2 trigger */
> +
>  static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
>  {
>      uint32_t size, sizelo, sizehi = 0;
> @@ -246,8 +247,8 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
>
>  static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>  {
> -    target_ulong ctrl = env->type2_trig[index].mcontrol;
> -    target_ulong addr = env->type2_trig[index].maddress;
> +    target_ulong ctrl = env->tdata1[index];
> +    target_ulong addr = env->tdata2[index];
>      bool enabled = type2_breakpoint_enabled(ctrl);
>      CPUState *cs = env_cpu(env);
>      int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
> @@ -258,7 +259,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>      }
>
>      if (ctrl & TYPE2_EXEC) {
> -        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].bp);
> +        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
>      }
>
>      if (ctrl & TYPE2_LOAD) {
> @@ -272,10 +273,10 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
>          size = type2_breakpoint_size(env, ctrl);
>          if (size != 0) {
>              cpu_watchpoint_insert(cs, addr, size, flags,
> -                                  &env->type2_trig[index].wp);
> +                                  &env->cpu_watchpoint[index]);
>          } else {
>              cpu_watchpoint_insert(cs, addr, 8, flags,
> -                                  &env->type2_trig[index].wp);
> +                                  &env->cpu_watchpoint[index]);
>          }
>      }
>  }
> @@ -284,34 +285,15 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
>  {
>      CPUState *cs = env_cpu(env);
>
> -    if (env->type2_trig[index].bp) {
> -        cpu_breakpoint_remove_by_ref(cs, env->type2_trig[index].bp);
> -        env->type2_trig[index].bp = NULL;
> +    if (env->cpu_breakpoint[index]) {
> +        cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
> +        env->cpu_breakpoint[index] = NULL;
>      }
>
> -    if (env->type2_trig[index].wp) {
> -        cpu_watchpoint_remove_by_ref(cs, env->type2_trig[index].wp);
> -        env->type2_trig[index].wp = NULL;
> -    }
> -}
> -
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
> +    if (env->cpu_watchpoint[index]) {
> +        cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
> +        env->cpu_watchpoint[index] = NULL;
>      }
> -
> -    return tdata;
>  }
>
>  static void type2_reg_write(CPURISCVState *env, target_ulong index,
> @@ -322,19 +304,23 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
>      switch (tdata_index) {
>      case TDATA1:
>          new_val = type2_mcontrol_validate(env, val);
> -        if (new_val != env->type2_trig[index].mcontrol) {
> -            env->type2_trig[index].mcontrol = new_val;
> +        if (new_val != env->tdata1[index]) {
> +            env->tdata1[index] = new_val;
>              type2_breakpoint_remove(env, index);
>              type2_breakpoint_insert(env, index);
>          }
>          break;
>      case TDATA2:
> -        if (val != env->type2_trig[index].maddress) {
> -            env->type2_trig[index].maddress = val;
> +        if (val != env->tdata2[index]) {
> +            env->tdata2[index] = val;
>              type2_breakpoint_remove(env, index);
>              type2_breakpoint_insert(env, index);
>          }
>          break;
> +    case TDATA3:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "tdata3 is not supported for type 2 trigger\n");
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -344,28 +330,16 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
>
>  target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>  {
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
> -        break;
> +    switch (tdata_index) {
> +    case TDATA1:
> +        return env->tdata1[env->trigger_cur];
> +    case TDATA2:
> +        return env->tdata2[env->trigger_cur];
> +    case TDATA3:
> +        return env->tdata3[env->trigger_cur];
>      default:
>          g_assert_not_reached();
>      }
> -
> -    return 0;
>  }
>
>  void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
> @@ -431,8 +405,8 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>
>              switch (trigger_type) {
>              case TRIGGER_TYPE_AD_MATCH:
> -                ctrl = env->type2_trig[i].mcontrol;
> -                pc = env->type2_trig[i].maddress;
> +                ctrl = env->tdata1[i];
> +                pc = env->tdata2[i];
>
>                  if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
>                      /* check U/S/M bit against current privilege level */
> @@ -466,8 +440,8 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>
>          switch (trigger_type) {
>          case TRIGGER_TYPE_AD_MATCH:
> -            ctrl = env->type2_trig[i].mcontrol;
> -            addr = env->type2_trig[i].maddress;
> +            ctrl = env->tdata1[i];
> +            addr = env->tdata2[i];
>              flags = 0;
>
>              if (ctrl & TYPE2_LOAD) {
> @@ -513,9 +487,10 @@ void riscv_trigger_init(CPURISCVState *env)
>           * chain = 0 (unimplemented, always 0)
>           * match = 0 (always 0, when any compare value equals tdata2)
>           */
> -        env->type2_trig[i].mcontrol = tdata1;
> -        env->type2_trig[i].maddress = 0;
> -        env->type2_trig[i].bp = NULL;
> -        env->type2_trig[i].wp = NULL;
> +        env->tdata1[i] = tdata1;
> +        env->tdata2[i] = 0;
> +        env->tdata3[i] = 0;
> +        env->cpu_breakpoint[i] = NULL;
> +        env->cpu_watchpoint[i] = NULL;
>      }
>  }
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c422553c27..76146f373a 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -44,13 +44,6 @@ typedef enum {
>      TRIGGER_TYPE_NUM
>  } trigger_type_t;
>
> -typedef struct {
> -    target_ulong mcontrol;
> -    target_ulong maddress;
> -    struct CPUBreakpoint *bp;
> -    struct CPUWatchpoint *wp;
> -} type2_trigger_t;
> -
>  /* tdata1 field masks */
>
>  #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 54e523c26c..a1db8b9559 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -228,26 +228,16 @@ static bool debug_needed(void *opaque)
>      return riscv_feature(env, RISCV_FEATURE_DEBUG);
>  }
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
>  static const VMStateDescription vmstate_debug = {
>      .name = "cpu/debug",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .needed = debug_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
> -        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
> -                             0, vmstate_debug_type2, type2_trigger_t),
> +        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
> +        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
> +        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
>

Regards,
Bin

