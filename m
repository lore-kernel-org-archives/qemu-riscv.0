Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn9EO-0005wb-Ka
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 19:55:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn9EL-0005uS-Lq; Tue, 16 Nov 2021 19:55:17 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=46826
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mn9EJ-000185-Mx; Tue, 16 Nov 2021 19:55:17 -0500
Received: by mail-io1-xd2f.google.com with SMTP id k22so868068iol.13;
 Tue, 16 Nov 2021 16:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NmdEqO1sFkh3en13yjLWkMRl7j0DcC2d3PttldLYPWE=;
 b=l4oT0vlj7Fz0ylPg7SpPVpEK4iEnVSdoqqDgE9tthXPvtYE3aOAcLNMKV3cUqoXiGl
 O5dMlPIPir8aFxIeAEJgwG+M+dFCVBuBA5V9bbWv3vTqFZtPrMmsDyCgSWad7Nb7BLcL
 WboxiPRmRCjYkRmqlSe1BqLYHNVntBboM2qizzyQA4ZFU4Y8yrUQYC4eOrPpUwhyoBry
 dKql7vb2MUW5GSuuoReqmwor/MY2vn71Of960Rc5vQGbp+0yxOkWhfUBJlJpGSLbgY1b
 h6mKh0QGCxRmIZhCViho//aM4+Q2A7NZuE7dNznTb1V1/mz5fS6jyKLrwubdvPGuT1P9
 ByTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NmdEqO1sFkh3en13yjLWkMRl7j0DcC2d3PttldLYPWE=;
 b=mNtTzd0X8BASpJhCO0lgsxjb/su207B8I/F2Dva+feNzkOeWe2r5oTIKm9jfxBOaIL
 nxM7+Nebuo6KV54DXGcQgUGtUXcB8pnPoilEV03rzWouWIEMT6XayN2BX+1RSty749nM
 pPQS1ocgKjGOQ33nTz1VIVvOqo7UKBHMj7DOztSjHMUcp5oPi+ZRarQtZhE+VN7/psio
 CscvT7v/U58C2yGgErLFxxCGQrEOOK3E7oWCrJMgROd4H4jMNlgJgh0hZWxfXOYTlbnW
 xcam6mWJCZxpqsq0US0772HiOw2UMC9D4MC1JfaJYLVpXg5cCI9hecGq0iwgX7py4jcl
 D/Uw==
X-Gm-Message-State: AOAM530M6zy4Ddj9Va+/RO0ZRreW1hoIXxMgimPc9VQ/IFny/PkK9Go8
 kiytIwbrkpDGgzBLFj+5VWds/ow421f4RyNGS8w=
X-Google-Smtp-Source: ABdhPJzrSBAzcF6DKjT1LLDvO2mljkCQVzMMOS0kjhoNVdmsc+m+fhFA5GoNDBw2nFrHDwdgBxLGeqX4hahoLwOuIX0=
X-Received: by 2002:a05:6602:1487:: with SMTP id
 a7mr7908370iow.57.1637110514450; 
 Tue, 16 Nov 2021 16:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20211030135513.18517-1-bin.meng@windriver.com>
 <20211030135513.18517-4-bin.meng@windriver.com>
In-Reply-To: <20211030135513.18517-4-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Nov 2021 10:54:48 +1000
Message-ID: <CAKmqyKOxJEaO5smixS=JLQ4zD9S=nSiSChZyUfE5gkSpuC9YGQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/riscv: debug: Implement debug related
 TCGCPUOps
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 17 Nov 2021 00:55:18 -0000

On Sat, Oct 30, 2021 at 11:59 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Implement .debug_excp_handler, .debug_check_{breakpoint, watchpoint}
> TCGCPUOps and hook them into riscv_tcg_ops.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - use 0 instead of GETPC()
>
>  target/riscv/debug.h |  4 +++
>  target/riscv/cpu.c   |  3 ++
>  target/riscv/debug.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 82 insertions(+)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index cb8a6e0024..fddc103650 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -107,4 +107,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
>
>  void riscv_trigger_init(CPURISCVState *env);
>
> +void riscv_cpu_debug_excp_handler(CPUState *cs);
> +bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
> +bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
> +
>  #endif /* RISCV_DEBUG_H */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d53125dbc..7061ae05fb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -701,6 +701,9 @@ static const struct TCGCPUOps riscv_tcg_ops = {
>      .do_interrupt = riscv_cpu_do_interrupt,
>      .do_transaction_failed = riscv_cpu_do_transaction_failed,
>      .do_unaligned_access = riscv_cpu_do_unaligned_access,
> +    .debug_excp_handler = riscv_cpu_debug_excp_handler,
> +    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
> +    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 9bcca27b72..9cb2a6d7ba 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -364,3 +364,78 @@ void riscv_trigger_init(CPURISCVState *env)
>          env->trigger_type2[i].wp = NULL;
>      }
>  }
> +
> +void riscv_cpu_debug_excp_handler(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (cs->watchpoint_hit) {
> +        if (cs->watchpoint_hit->flags & BP_CPU) {
> +            cs->watchpoint_hit = NULL;
> +            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +        }
> +    } else {
> +        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> +            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +        }
> +    }
> +}
> +
> +bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    CPUBreakpoint *bp;
> +    target_ulong ctrl;
> +    target_ulong pc;
> +    int i;
> +
> +    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> +        for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> +            ctrl = env->trigger_type2[i].mcontrol;
> +            pc = env->trigger_type2[i].maddress;
> +
> +            if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
> +                /* check U/S/M bit against current privilege level */
> +                if ((ctrl >> 3) & BIT(env->priv)) {
> +                    return true;
> +                }
> +            }
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    target_ulong ctrl;
> +    target_ulong addr;
> +    int flags;
> +    int i;
> +
> +    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> +        ctrl = env->trigger_type2[i].mcontrol;
> +        addr = env->trigger_type2[i].maddress;
> +        flags = 0;
> +
> +        if (ctrl & TYPE2_LOAD) {
> +            flags |= BP_MEM_READ;
> +        }
> +        if (ctrl & TYPE2_STORE) {
> +            flags |= BP_MEM_WRITE;
> +        }
> +
> +        if ((wp->flags & flags) && (wp->vaddr == addr)) {
> +            /* check U/S/M bit against current privilege level */
> +            if ((ctrl >> 3) & BIT(env->priv)) {
> +                return true;
> +            }
> +        }
> +    }
> +
> +    return false;
> +}
> --
> 2.25.1
>
>

