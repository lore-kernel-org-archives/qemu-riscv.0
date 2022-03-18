Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nV26J-0000YB-Bw
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 22:12:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV26F-0000UH-Hp; Thu, 17 Mar 2022 22:12:19 -0400
Received: from [2607:f8b0:4864:20::12d] (port=34326
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV26D-0000jR-6h; Thu, 17 Mar 2022 22:12:19 -0400
Received: by mail-il1-x12d.google.com with SMTP id r11so4968071ila.1;
 Thu, 17 Mar 2022 19:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEmXcKMw+MiFEAbF1rdYI4HyHItrfmdkTxeD68n898s=;
 b=LTBHOhkQ3lhh76egkAl4UdzAQT3WPjwDUiJFlRg+QQWb7ng2MjK3ubDsk0k3WFAQM3
 aeP/30tBaeeX+XKg4B0yiIYI2ddNtmIzYMNY3Zs7N43boIl3hyOg2UIYpz+2QuWbRQBa
 6uZ6UNjkTaBp7eLlyLKfuEHWVZojJPajDpbnlGsXBh8ghgYNhXD2yzo+WZPkLcrsipbH
 toqWYFYbztwMACGCobKQsTH5s5tefTMeX3TInnJR4QZ0PuocGDJqUpH0xr4P4O66VSJe
 c9G2UaaJA1rJ33qTx64xN8LcF0D7voENle6dDRtsclkaVi/HYwVVDmLa1Zr3EVHFkmAa
 3dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEmXcKMw+MiFEAbF1rdYI4HyHItrfmdkTxeD68n898s=;
 b=CBgdc1vuX3M6X/VUBiJN855TYmUIMDOOlwggOCxdL/mVuDUh+79tywEDVpR3ZO6U4e
 t6Z1cq3Jw+JMmeCj5cKaRkdX7IvfiP63antwLBRVKL/rCXdNSxKLNNOjx3V/Ia+KKEO+
 zrJd7cQ4Q07uum2IWD3n+BQqHcl6QdBZncBH8pHYeyRvL97hHHVQiyamCOB0qGTqWfpR
 vCvztvr79hCo+xoKAWeCtZCyIxwwi/a9qtJxw4MD753Cob/TosHdCoiXBc+OjR9fxqeh
 fSDyeV/9+UBpp3MmZiRoGZmfly4qxkPrOyYMiHlMN+jODtoPVICBDxC251gf0NmEVkAI
 Z/Ig==
X-Gm-Message-State: AOAM533BDmJs1S1/atxUA0KjcrHk1s6N78tyNvhxWZtUFswfxbrfi/Hc
 Ej7L5PYU/1ZN9LUJxxwI1EjQG3YLCVsvW26g/e8=
X-Google-Smtp-Source: ABdhPJy72mURfpeadFbvtIrlbBE5ugdqT+vCRkszoibxmA62Htnp6bxxL7EepNqgrj9FN5b0IlDfoCLYwle8tXSDWm0=
X-Received: by 2002:a05:6e02:e13:b0:2c7:d7d0:4534 with SMTP id
 a19-20020a056e020e1300b002c7d7d04534mr3419070ilk.310.1647569535755; Thu, 17
 Mar 2022 19:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-2-bmeng.cn@gmail.com>
In-Reply-To: <20220315065529.62198-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Mar 2022 12:11:49 +1000
Message-ID: <CAKmqyKN=-Da7rpdFX9p6v-sVyzGeWgGPRBTiVbJ3dJ-ap-9vOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] target/riscv: Add initial support for the Sdtrig
 extension
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Mar 2022 02:12:19 -0000

On Tue, Mar 15, 2022 at 5:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds initial support for the Sdtrig extension via the Trigger
> Module, as defined in the RISC-V Debug Specification [1].
>
> Only "Address / Data Match" trigger (type 2) is implemented as of now,
> which is mainly used for hardware breakpoint and watchpoint. The number
> of type 2 triggers implemented is 2, which is the number that we can
> find in the SiFive U54/U74 cores.
>
> [1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v4:
> - mention Sdtrig extension in the commit
> - rename 'struct trigger_type2_t' to 'type2_trigger_t'
>
> Changes in v3:
> - drop riscv_trigger_init(), which will be moved to patch #5
>
>  target/riscv/cpu.h       |   5 +
>  target/riscv/debug.h     | 108 +++++++++++++
>  target/riscv/debug.c     | 339 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/meson.build |   1 +
>  4 files changed, 453 insertions(+)
>  create mode 100644 target/riscv/debug.h
>  create mode 100644 target/riscv/debug.c
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c069fe85fa..ad35129239 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -102,6 +102,7 @@ typedef struct CPUArchState CPURISCVState;
>
>  #if !defined(CONFIG_USER_ONLY)
>  #include "pmp.h"
> +#include "debug.h"
>  #endif
>
>  #define RV_VLEN_MAX 1024
> @@ -267,6 +268,10 @@ struct CPUArchState {
>      pmp_table_t pmp_state;
>      target_ulong mseccfg;
>
> +    /* trigger module */
> +    target_ulong trigger_cur;
> +    type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
> +
>      /* machine specific rdtime callback */
>      uint64_t (*rdtime_fn)(uint32_t);
>      uint32_t rdtime_fn_arg;
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> new file mode 100644
> index 0000000000..fbc5f946e2
> --- /dev/null
> +++ b/target/riscv/debug.h
> @@ -0,0 +1,108 @@
> +/*
> + * QEMU RISC-V Native Debug Support
> + *
> + * Copyright (c) 2022 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef RISCV_DEBUG_H
> +#define RISCV_DEBUG_H
> +
> +/* trigger indexes implemented */
> +enum {
> +    TRIGGER_TYPE2_IDX_0 = 0,
> +    TRIGGER_TYPE2_IDX_1,
> +    TRIGGER_TYPE2_NUM,
> +    TRIGGER_NUM = TRIGGER_TYPE2_NUM
> +};
> +
> +/* register index of tdata CSRs */
> +enum {
> +    TDATA1 = 0,
> +    TDATA2,
> +    TDATA3,
> +    TDATA_NUM
> +};
> +
> +typedef enum {
> +    TRIGGER_TYPE_NO_EXIST = 0,      /* trigger does not exist */
> +    TRIGGER_TYPE_AD_MATCH = 2,      /* address/data match trigger */
> +    TRIGGER_TYPE_INST_CNT = 3,      /* instruction count trigger */
> +    TRIGGER_TYPE_INT = 4,           /* interrupt trigger */
> +    TRIGGER_TYPE_EXCP = 5,          /* exception trigger */
> +    TRIGGER_TYPE_AD_MATCH6 = 6,     /* new address/data match trigger */
> +    TRIGGER_TYPE_EXT_SRC = 7,       /* external source trigger */
> +    TRIGGER_TYPE_UNAVAIL = 15       /* trigger exists, but unavailable */
> +} trigger_type_t;
> +
> +typedef struct {
> +    target_ulong mcontrol;
> +    target_ulong maddress;
> +    struct CPUBreakpoint *bp;
> +    struct CPUWatchpoint *wp;
> +} type2_trigger_t;
> +
> +/* tdata field masks */
> +
> +#define RV32_TYPE(t)    ((uint32_t)(t) << 28)
> +#define RV32_TYPE_MASK  (0xf << 28)
> +#define RV32_DMODE      BIT(27)
> +#define RV64_TYPE(t)    ((uint64_t)(t) << 60)
> +#define RV64_TYPE_MASK  (0xfULL << 60)
> +#define RV64_DMODE      BIT_ULL(59)
> +
> +/* mcontrol field masks */
> +
> +#define TYPE2_LOAD      BIT(0)
> +#define TYPE2_STORE     BIT(1)
> +#define TYPE2_EXEC      BIT(2)
> +#define TYPE2_U         BIT(3)
> +#define TYPE2_S         BIT(4)
> +#define TYPE2_M         BIT(6)
> +#define TYPE2_MATCH     (0xf << 7)
> +#define TYPE2_CHAIN     BIT(11)
> +#define TYPE2_ACTION    (0xf << 12)
> +#define TYPE2_SIZELO    (0x3 << 16)
> +#define TYPE2_TIMING    BIT(18)
> +#define TYPE2_SELECT    BIT(19)
> +#define TYPE2_HIT       BIT(20)
> +#define TYPE2_SIZEHI    (0x3 << 21) /* RV64 only */
> +
> +/* access size */
> +enum {
> +    SIZE_ANY = 0,
> +    SIZE_1B,
> +    SIZE_2B,
> +    SIZE_4B,
> +    SIZE_6B,
> +    SIZE_8B,
> +    SIZE_10B,
> +    SIZE_12B,
> +    SIZE_14B,
> +    SIZE_16B,
> +    SIZE_NUM = 16
> +};
> +
> +bool tdata_available(CPURISCVState *env, int tdata_index);
> +
> +target_ulong tselect_csr_read(CPURISCVState *env);
> +void tselect_csr_write(CPURISCVState *env, target_ulong val);
> +
> +target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
> +void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
> +
> +#endif /* RISCV_DEBUG_H */
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> new file mode 100644
> index 0000000000..c8cec39217
> --- /dev/null
> +++ b/target/riscv/debug.c
> @@ -0,0 +1,339 @@
> +/*
> + * QEMU RISC-V Native Debug Support
> + *
> + * Copyright (c) 2022 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This provides the native debug support via the Trigger Module, as defined
> + * in the RISC-V Debug Specification:
> + * https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "cpu.h"
> +#include "trace.h"
> +#include "exec/exec-all.h"
> +
> +/*
> + * The following M-mode trigger CSRs are implemented:
> + *
> + * - tselect
> + * - tdata1
> + * - tdata2
> + * - tdata3
> + *
> + * We don't support writable 'type' field in the tdata1 register, so there is
> + * no need to implement the "tinfo" CSR.
> + *
> + * The following triggers are implemented:
> + *
> + * Index | Type |          tdata mapping | Description
> + * ------+------+------------------------+------------
> + *     0 |    2 |         tdata1, tdata2 | Address / Data Match
> + *     1 |    2 |         tdata1, tdata2 | Address / Data Match
> + */
> +
> +/* tdata availability of a trigger */
> +typedef bool tdata_avail[TDATA_NUM];
> +
> +static tdata_avail tdata_mapping[TRIGGER_NUM] = {
> +    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = { true, true, false },
> +};
> +
> +/* only breakpoint size 1/2/4/8 supported */
> +static int access_size[SIZE_NUM] = {
> +    [SIZE_ANY] = 0,
> +    [SIZE_1B]  = 1,
> +    [SIZE_2B]  = 2,
> +    [SIZE_4B]  = 4,
> +    [SIZE_6B]  = -1,
> +    [SIZE_8B]  = 8,
> +    [6 ... 15] = -1,
> +};
> +
> +static inline target_ulong trigger_type(CPURISCVState *env,
> +                                        trigger_type_t type)
> +{
> +    target_ulong tdata1;
> +
> +    switch (riscv_cpu_mxl(env)) {
> +    case MXL_RV32:
> +        tdata1 = RV32_TYPE(type);
> +        break;
> +    case MXL_RV64:
> +        tdata1 = RV64_TYPE(type);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return tdata1;
> +}
> +
> +bool tdata_available(CPURISCVState *env, int tdata_index)
> +{
> +    if (unlikely(tdata_index >= TDATA_NUM)) {
> +        return false;
> +    }
> +
> +    if (unlikely(env->trigger_cur >= TRIGGER_NUM)) {
> +        return false;
> +    }
> +
> +    return tdata_mapping[env->trigger_cur][tdata_index];
> +}
> +
> +target_ulong tselect_csr_read(CPURISCVState *env)
> +{
> +    return env->trigger_cur;
> +}
> +
> +void tselect_csr_write(CPURISCVState *env, target_ulong val)
> +{
> +    /* all target_ulong bits of tselect are implemented */
> +    env->trigger_cur = val;
> +}
> +
> +static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
> +                                    trigger_type_t t)
> +{
> +    uint32_t type, dmode;
> +    target_ulong tdata1;
> +
> +    switch (riscv_cpu_mxl(env)) {
> +    case MXL_RV32:
> +        type = extract32(val, 28, 4);
> +        dmode = extract32(val, 27, 1);
> +        tdata1 = RV32_TYPE(t);
> +        break;
> +    case MXL_RV64:
> +        type = extract64(val, 60, 4);
> +        dmode = extract64(val, 59, 1);
> +        tdata1 = RV64_TYPE(t);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (type != t) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ignoring type write to tdata1 register\n");
> +    }
> +    if (dmode != 0) {
> +        qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
> +    }
> +
> +    return tdata1;
> +}
> +
> +static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
> +                                        const char *msg)
> +{
> +    if (val & mask) {
> +        qemu_log_mask(LOG_UNIMP, "%s bit is always zero\n", msg);
> +    }
> +}
> +
> +static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
> +{
> +    uint32_t size, sizelo, sizehi = 0;
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV64) {
> +        sizehi = extract32(ctrl, 21, 2);
> +    }
> +    sizelo = extract32(ctrl, 16, 2);
> +    size = (sizehi << 2) | sizelo;
> +
> +    return size;
> +}
> +
> +static inline bool type2_breakpoint_enabled(target_ulong ctrl)
> +{
> +    bool mode = !!(ctrl & (TYPE2_U | TYPE2_S | TYPE2_M));
> +    bool rwx = !!(ctrl & (TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
> +
> +    return mode && rwx;
> +}
> +
> +static target_ulong type2_mcontrol_validate(CPURISCVState *env,
> +                                            target_ulong ctrl)
> +{
> +    target_ulong val;
> +    uint32_t size;
> +
> +    /* validate the generic part first */
> +    val = tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH);
> +
> +    /* validate unimplemented (always zero) bits */
> +    warn_always_zero_bit(ctrl, TYPE2_MATCH, "match");
> +    warn_always_zero_bit(ctrl, TYPE2_CHAIN, "chain");
> +    warn_always_zero_bit(ctrl, TYPE2_ACTION, "action");
> +    warn_always_zero_bit(ctrl, TYPE2_TIMING, "timing");
> +    warn_always_zero_bit(ctrl, TYPE2_SELECT, "select");
> +    warn_always_zero_bit(ctrl, TYPE2_HIT, "hit");
> +
> +    /* validate size encoding */
> +    size = type2_breakpoint_size(env, ctrl);
> +    if (access_size[size] == -1) {
> +        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using SIZE_ANY\n",
> +                      size);
> +    } else {
> +        val |= (ctrl & TYPE2_SIZELO);
> +        if (riscv_cpu_mxl(env) == MXL_RV64) {
> +            val |= (ctrl & TYPE2_SIZEHI);
> +        }
> +    }
> +
> +    /* keep the mode and attribute bits */
> +    val |= (ctrl & (TYPE2_U | TYPE2_S | TYPE2_M |
> +                    TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
> +
> +    return val;
> +}
> +
> +static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
> +{
> +    target_ulong ctrl = env->type2_trig[index].mcontrol;
> +    target_ulong addr = env->type2_trig[index].maddress;
> +    bool enabled = type2_breakpoint_enabled(ctrl);
> +    CPUState *cs = env_cpu(env);
> +    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
> +    uint32_t size;
> +
> +    if (!enabled) {
> +        return;
> +    }
> +
> +    if (ctrl & TYPE2_EXEC) {
> +        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].bp);
> +    }
> +
> +    if (ctrl & TYPE2_LOAD) {
> +        flags |= BP_MEM_READ;
> +    }
> +    if (ctrl & TYPE2_STORE) {
> +        flags |= BP_MEM_WRITE;
> +    }
> +
> +    if (flags & BP_MEM_ACCESS) {
> +        size = type2_breakpoint_size(env, ctrl);
> +        if (size != 0) {
> +            cpu_watchpoint_insert(cs, addr, size, flags,
> +                                  &env->type2_trig[index].wp);
> +        } else {
> +            cpu_watchpoint_insert(cs, addr, 8, flags,
> +                                  &env->type2_trig[index].wp);
> +        }
> +    }
> +}
> +
> +static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
> +{
> +    CPUState *cs = env_cpu(env);
> +
> +    if (env->type2_trig[index].bp) {
> +        cpu_breakpoint_remove_by_ref(cs, env->type2_trig[index].bp);
> +        env->type2_trig[index].bp = NULL;
> +    }
> +
> +    if (env->type2_trig[index].wp) {
> +        cpu_watchpoint_remove_by_ref(cs, env->type2_trig[index].wp);
> +        env->type2_trig[index].wp = NULL;
> +    }
> +}
> +
> +static target_ulong type2_reg_read(CPURISCVState *env,
> +                                   target_ulong trigger_index, int tdata_index)
> +{
> +    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
> +    target_ulong tdata;
> +
> +    switch (tdata_index) {
> +    case TDATA1:
> +        tdata = env->type2_trig[index].mcontrol;
> +        break;
> +    case TDATA2:
> +        tdata = env->type2_trig[index].maddress;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return tdata;
> +}
> +
> +static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
> +                            int tdata_index, target_ulong val)
> +{
> +    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
> +    target_ulong new_val;
> +
> +    switch (tdata_index) {
> +    case TDATA1:
> +        new_val = type2_mcontrol_validate(env, val);
> +        if (new_val != env->type2_trig[index].mcontrol) {
> +            env->type2_trig[index].mcontrol = new_val;
> +            type2_breakpoint_remove(env, index);
> +            type2_breakpoint_insert(env, index);
> +        }
> +        break;
> +    case TDATA2:
> +        if (val != env->type2_trig[index].maddress) {
> +            env->type2_trig[index].maddress = val;
> +            type2_breakpoint_remove(env, index);
> +            type2_breakpoint_insert(env, index);
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return;
> +}
> +
> +typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
> +                                        target_ulong trigger_index,
> +                                        int tdata_index);
> +
> +static tdata_read_func trigger_read_funcs[TRIGGER_NUM] = {
> +    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_read,
> +};
> +
> +typedef void (*tdata_write_func)(CPURISCVState *env,
> +                                 target_ulong trigger_index,
> +                                 int tdata_index,
> +                                 target_ulong val);
> +
> +static tdata_write_func trigger_write_funcs[TRIGGER_NUM] = {
> +    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_write,
> +};
> +
> +target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
> +{
> +    tdata_read_func read_func = trigger_read_funcs[env->trigger_cur];
> +
> +    return read_func(env, env->trigger_cur, tdata_index);
> +}
> +
> +void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
> +{
> +    tdata_write_func write_func = trigger_write_funcs[env->trigger_cur];
> +
> +    return write_func(env, env->trigger_cur, tdata_index, val);
> +}
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 91f0ac32ff..2c20f3dd8e 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -27,6 +27,7 @@ riscv_softmmu_ss = ss.source_set()
>  riscv_softmmu_ss.add(files(
>    'arch_dump.c',
>    'pmp.c',
> +  'debug.c',
>    'monitor.c',
>    'machine.c'
>  ))
> --
> 2.25.1
>
>

