Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1Lmi-0001ps-8r
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 01:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1LmT-0001o8-Cc; Wed, 15 Jun 2022 01:41:32 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1LmG-00036a-3F; Wed, 15 Jun 2022 01:41:28 -0400
Received: by mail-qk1-x736.google.com with SMTP id 68so7993408qkk.9;
 Tue, 14 Jun 2022 22:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xX+L5VSKm0s7ZGEwVu5Wyxge9OemB5hSX9Z9Ah9/gZY=;
 b=h3DJsljqVgJCK4EX7p4wdVEettwG23JFFzh2DJc0tO3Ldhl7/ndmFsZsNKhAgzU3ka
 7aXBt+BtAUHY+9RJMZywIk+9FybKszIsEZoAvvHWhy6FVBX1zgACq6EO1dhl28clrICr
 k3Ihi9wPpnUMQkxzHnVfIG1i25bHRkYgIIQ8JMnzxqE5gWYlqYSZ1hwfgrNzXob2jpMD
 gqmM9Arxh5/OwoAW//oW60xmVTGgcZWkRq5Ab804t0wAUrvUQPFVJ3UHyVX6EqJXRwNr
 urSppp8PtQ403weCKih9BGdemqe500wmRJW4OWi3KKIPkmHBw4HyvxI4vT0UhLs8rJQs
 ISkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xX+L5VSKm0s7ZGEwVu5Wyxge9OemB5hSX9Z9Ah9/gZY=;
 b=1fFNInmHcTPVEwpAnfbiiEKnBI+Xb8m4fKpnSklO2+UrNNVzcWOzhyFK6ciQdCTceL
 s7ExR63kSeUfmZ+gxAWNDkoG2nlNyQ6kr7iVWGHB8hdgsfvHD5am4CVlec+eir8AtquY
 1k3SBrrxCzt1oD8DU50kE90Mnf9TKp3zvgiK7Q9oVoxHXt6E10ltf/W0r4u6YJsXqLbS
 S0IeR+VOzvrUQMmubUunUCBf/5uoPWNNJm0fYGiB+jgY8a77rvRZvTOdOGJ7Cm2yTVV5
 UD8igjpprPL1jnRFa0Ah8AM1CoXL0i+WLwjz2bmyMfbMvrscBbJi3wSjR1cYyxu4lYzo
 /PXg==
X-Gm-Message-State: AOAM532skYjEWFtDy0SdqGczAjk5Z4ajKqLsQaYt11H6zQ8biouGxla9
 uSikkApdz6olKPi4A2wW6ONIx97CVaHuKYpqdW8=
X-Google-Smtp-Source: ABdhPJz1DYCxavA8EAJQx2dQ0neUvdoiaXlkM/22I0DQwCxvURrwuIwKw0T6KiYHxz23hjRbXOClbWYrQRJtnXT8gEs=
X-Received: by 2002:a05:620a:683:b0:6a6:93aa:8559 with SMTP id
 f3-20020a05620a068300b006a693aa8559mr7057891qkh.94.1655271672297; Tue, 14 Jun
 2022 22:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-2-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-2-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 13:41:00 +0800
Message-ID: <CAEUhbmV9cc7uTOFfR765BGm4gmGTk9JXpo=pk9NdJ4UZ_=oucg@mail.gmail.com>
Subject: Re: [PATCH 1/9] target/riscv: debug: Determine the trigger type from
 tdata1.type
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
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
X-List-Received-Date: Wed, 15 Jun 2022 05:41:35 -0000

On Fri, Jun 10, 2022 at 1:20 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Current RISC-V debug assumes that only type 2 trigger is supported.
> To allow more types of triggers to be supported in the future
> (e.g. type 6 trigger, which is similar to type 2 trigger with additional
>  functionality), we should determine the trigger type from tdata1.type.
>
> RV_MAX_TRIGGERS is also introduced in replacement of TRIGGER_TYPE2_NUM.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h     |   2 +-
>  target/riscv/csr.c     |   2 +-
>  target/riscv/debug.c   | 183 ++++++++++++++++++++++++++++-------------
>  target/riscv/debug.h   |  15 ++--
>  target/riscv/machine.c |   2 +-
>  5 files changed, 137 insertions(+), 67 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..535123a989 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -289,7 +289,7 @@ struct CPUArchState {
>
>      /* trigger module */
>      target_ulong trigger_cur;
> -    type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
> +    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
>
>      /* machine specific rdtime callback */
>      uint64_t (*rdtime_fn)(void *);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6dbe9b541f..005ae31a01 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2776,7 +2776,7 @@ static RISCVException read_tdata(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
>      /* return 0 in tdata1 to end the trigger enumeration */
> -    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
> +    if (env->trigger_cur >= RV_MAX_TRIGGERS && csrno == CSR_TDATA1) {
>          *val = 0;
>          return RISCV_EXCP_NONE;
>      }
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index fc6e13222f..abbcd38a17 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -52,8 +52,15 @@
>  /* tdata availability of a trigger */
>  typedef bool tdata_avail[TDATA_NUM];
>
> -static tdata_avail tdata_mapping[TRIGGER_NUM] = {
> -    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = { true, true, false },
> +static tdata_avail tdata_mapping[TRIGGER_TYPE_NUM] = {
> +    [TRIGGER_TYPE_NO_EXIST] = { false, false, false },
> +    [TRIGGER_TYPE_AD_MATCH] = { true, true, true },
> +    [TRIGGER_TYPE_INST_CNT] = { true, false, true },
> +    [TRIGGER_TYPE_INT] = { true, true, true },
> +    [TRIGGER_TYPE_EXCP] = { true, true, true },
> +    [TRIGGER_TYPE_AD_MATCH6] = { true, true, true },
> +    [TRIGGER_TYPE_EXT_SRC] = { true, false, false },
> +    [TRIGGER_TYPE_UNAVAIL] = { true, true, true }
>  };
>
>  /* only breakpoint size 1/2/4/8 supported */
> @@ -67,6 +74,26 @@ static int access_size[SIZE_NUM] = {
>      [6 ... 15] = -1,
>  };
>
> +static inline target_ulong extract_trigger_type(CPURISCVState *env,
> +                                                target_ulong tdata1)
> +{
> +    switch (riscv_cpu_mxl(env)) {
> +    case MXL_RV32:
> +        return extract32(tdata1, 28, 4);
> +    case MXL_RV64:
> +        return extract64(tdata1, 60, 4);

I guess we should add a "case MXL_RV128" here so that it won't break rv128.
See commit d1d8541217ce8a23e9e751cd868c7d618817134a

> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static inline target_ulong get_trigger_type(CPURISCVState *env,
> +                                            target_ulong trigger_index)
> +{
> +    target_ulong tdata1 = env->type2_trig[trigger_index].mcontrol;
> +    return extract_trigger_type(env, tdata1);
> +}
> +
>  static inline target_ulong trigger_type(CPURISCVState *env,
>                                          trigger_type_t type)
>  {
> @@ -89,15 +116,17 @@ static inline target_ulong trigger_type(CPURISCVState *env,
>
>  bool tdata_available(CPURISCVState *env, int tdata_index)
>  {
> +    int trigger_type = get_trigger_type(env, env->trigger_cur);
> +
>      if (unlikely(tdata_index >= TDATA_NUM)) {
>          return false;
>      }
>
> -    if (unlikely(env->trigger_cur >= TRIGGER_NUM)) {
> +    if (unlikely(env->trigger_cur >= RV_MAX_TRIGGERS)) {
>          return false;
>      }
>
> -    return tdata_mapping[env->trigger_cur][tdata_index];
> +    return tdata_mapping[trigger_type][tdata_index];
>  }
>
>  target_ulong tselect_csr_read(CPURISCVState *env)
> @@ -137,6 +166,7 @@ static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "ignoring type write to tdata1 register\n");
>      }
> +
>      if (dmode != 0) {
>          qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
>      }
> @@ -261,9 +291,8 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
>  }
>
>  static target_ulong type2_reg_read(CPURISCVState *env,
> -                                   target_ulong trigger_index, int tdata_index)
> +                                   target_ulong index, int tdata_index)
>  {
> -    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
>      target_ulong tdata;
>
>      switch (tdata_index) {
> @@ -280,10 +309,9 @@ static target_ulong type2_reg_read(CPURISCVState *env,
>      return tdata;
>  }
>
> -static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
> +static void type2_reg_write(CPURISCVState *env, target_ulong index,
>                              int tdata_index, target_ulong val)
>  {
> -    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
>      target_ulong new_val;
>
>      switch (tdata_index) {
> @@ -309,35 +337,60 @@ static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
>      return;
>  }
>
> -typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
> -                                        target_ulong trigger_index,
> -                                        int tdata_index);
> -
> -static tdata_read_func trigger_read_funcs[TRIGGER_NUM] = {
> -    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_read,
> -};
> -
> -typedef void (*tdata_write_func)(CPURISCVState *env,
> -                                 target_ulong trigger_index,
> -                                 int tdata_index,
> -                                 target_ulong val);
> -
> -static tdata_write_func trigger_write_funcs[TRIGGER_NUM] = {
> -    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_write,
> -};
> -
>  target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>  {
> -    tdata_read_func read_func = trigger_read_funcs[env->trigger_cur];
> +    int trigger_type = get_trigger_type(env, env->trigger_cur);
>
> -    return read_func(env, env->trigger_cur, tdata_index);
> +    switch (trigger_type) {
> +    case TRIGGER_TYPE_AD_MATCH:
> +        return type2_reg_read(env, env->trigger_cur, tdata_index);
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
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return 0;
>  }
>
>  void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>  {
> -    tdata_write_func write_func = trigger_write_funcs[env->trigger_cur];
> +    int trigger_type;
> +
> +    if (tdata_index == TDATA1) {
> +        trigger_type = extract_trigger_type(env, val);
> +    } else {
> +        trigger_type = get_trigger_type(env, env->trigger_cur);
> +    }
>
> -    return write_func(env, env->trigger_cur, tdata_index, val);
> +    switch (trigger_type) {
> +    case TRIGGER_TYPE_AD_MATCH:
> +        type2_reg_write(env, env->trigger_cur, tdata_index, val);
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
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
>
>  void riscv_cpu_debug_excp_handler(CPUState *cs)
> @@ -364,18 +417,28 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>      CPUBreakpoint *bp;
>      target_ulong ctrl;
>      target_ulong pc;
> +    int trigger_type;
>      int i;
>
>      QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> -        for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> -            ctrl = env->type2_trig[i].mcontrol;
> -            pc = env->type2_trig[i].maddress;
> -
> -            if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
> -                /* check U/S/M bit against current privilege level */
> -                if ((ctrl >> 3) & BIT(env->priv)) {
> -                    return true;
> +        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> +            trigger_type = get_trigger_type(env, i);
> +
> +            switch (trigger_type) {
> +            case TRIGGER_TYPE_AD_MATCH:
> +                ctrl = env->type2_trig[i].mcontrol;
> +                pc = env->type2_trig[i].maddress;
> +
> +                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
> +                    /* check U/S/M bit against current privilege level */
> +                    if ((ctrl >> 3) & BIT(env->priv)) {
> +                        return true;
> +                    }
>                  }
> +                break;
> +            default:
> +                /* other trigger types are not supported or irrelevant */
> +                break;
>              }
>          }
>      }
> @@ -389,26 +452,36 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>      CPURISCVState *env = &cpu->env;
>      target_ulong ctrl;
>      target_ulong addr;
> +    int trigger_type;
>      int flags;
>      int i;
>
> -    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> -        ctrl = env->type2_trig[i].mcontrol;
> -        addr = env->type2_trig[i].maddress;
> -        flags = 0;
> +    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        trigger_type = get_trigger_type(env, i);
>
> -        if (ctrl & TYPE2_LOAD) {
> -            flags |= BP_MEM_READ;
> -        }
> -        if (ctrl & TYPE2_STORE) {
> -            flags |= BP_MEM_WRITE;
> -        }
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +            ctrl = env->type2_trig[i].mcontrol;
> +            addr = env->type2_trig[i].maddress;
> +            flags = 0;
> +
> +            if (ctrl & TYPE2_LOAD) {
> +                flags |= BP_MEM_READ;
> +            }
> +            if (ctrl & TYPE2_STORE) {
> +                flags |= BP_MEM_WRITE;
> +            }
>
> -        if ((wp->flags & flags) && (wp->vaddr == addr)) {
> -            /* check U/S/M bit against current privilege level */
> -            if ((ctrl >> 3) & BIT(env->priv)) {
> -                return true;
> +            if ((wp->flags & flags) && (wp->vaddr == addr)) {
> +                /* check U/S/M bit against current privilege level */
> +                if ((ctrl >> 3) & BIT(env->priv)) {
> +                    return true;
> +                }
>              }
> +            break;
> +        default:
> +            /* other trigger types are not supported */
> +            break;
>          }
>      }
>
> @@ -417,11 +490,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>
>  void riscv_trigger_init(CPURISCVState *env)
>  {
> -    target_ulong type2 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
> +    target_ulong tdata1 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
>      int i;
>
> -    /* type 2 triggers */
> -    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> +    /* init to type 2 triggers */
> +    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
>          /*
>           * type = TRIGGER_TYPE_AD_MATCH
>           * dmode = 0 (both debug and M-mode can write tdata)
> @@ -435,7 +508,7 @@ void riscv_trigger_init(CPURISCVState *env)
>           * chain = 0 (unimplemented, always 0)
>           * match = 0 (always 0, when any compare value equals tdata2)
>           */
> -        env->type2_trig[i].mcontrol = type2;
> +        env->type2_trig[i].mcontrol = tdata1;
>          env->type2_trig[i].maddress = 0;
>          env->type2_trig[i].bp = NULL;
>          env->type2_trig[i].wp = NULL;
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 27b9cac6b4..c422553c27 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -22,13 +22,7 @@
>  #ifndef RISCV_DEBUG_H
>  #define RISCV_DEBUG_H
>
> -/* trigger indexes implemented */
> -enum {
> -    TRIGGER_TYPE2_IDX_0 = 0,
> -    TRIGGER_TYPE2_IDX_1,
> -    TRIGGER_TYPE2_NUM,
> -    TRIGGER_NUM = TRIGGER_TYPE2_NUM
> -};
> +#define RV_MAX_TRIGGERS         2
>
>  /* register index of tdata CSRs */
>  enum {
> @@ -46,7 +40,8 @@ typedef enum {
>      TRIGGER_TYPE_EXCP = 5,          /* exception trigger */
>      TRIGGER_TYPE_AD_MATCH6 = 6,     /* new address/data match trigger */
>      TRIGGER_TYPE_EXT_SRC = 7,       /* external source trigger */
> -    TRIGGER_TYPE_UNAVAIL = 15       /* trigger exists, but unavailable */
> +    TRIGGER_TYPE_UNAVAIL = 15,      /* trigger exists, but unavailable */
> +    TRIGGER_TYPE_NUM
>  } trigger_type_t;
>
>  typedef struct {
> @@ -56,14 +51,16 @@ typedef struct {
>      struct CPUWatchpoint *wp;
>  } type2_trigger_t;
>
> -/* tdata field masks */
> +/* tdata1 field masks */
>
>  #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
>  #define RV32_TYPE_MASK  (0xf << 28)
>  #define RV32_DMODE      BIT(27)
> +#define RV32_DATA_MASK  0x7ffffff
>  #define RV64_TYPE(t)    ((uint64_t)(t) << 60)
>  #define RV64_TYPE_MASK  (0xfULL << 60)
>  #define RV64_DMODE      BIT_ULL(59)
> +#define RV64_DATA_MASK  0x7ffffffffffffff

It looks the 2 macros added here were used in patch2, so please move
the macro definition in patch 2.

>
>  /* mcontrol field masks */
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 2a437b29a1..54e523c26c 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -246,7 +246,7 @@ static const VMStateDescription vmstate_debug = {
>      .needed = debug_needed,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
> -        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM,
> +        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
>                               0, vmstate_debug_type2, type2_trigger_t),
>          VMSTATE_END_OF_LIST()
>      }
> --

Regards,
Bin

