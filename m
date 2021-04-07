Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUC7E-0000HC-JW
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 13:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUC76-0000Eq-J3; Wed, 07 Apr 2021 13:37:14 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUC73-0006Rr-LM; Wed, 07 Apr 2021 13:37:12 -0400
Received: by mail-io1-xd30.google.com with SMTP id k25so13358427iob.6;
 Wed, 07 Apr 2021 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bo4oj7a45IfhqHAyQLGs4S/HZHsQ0q9GFSYo6YLsPsQ=;
 b=Uo+gQYKBrVu3Nx/2E7zRHKXBd0ak1jMwcZhJiyAXVsMveiLBNI0ZT06gVF+wPbc2fL
 UAgAdAtJ7Hu2ZYkvbPoqNsFydnF0q7864hKBItguxNRn4x8PSkTqxFtoVV7eliup9KVe
 YhBBjKLOkvpn1o/g/PbMPUb0DWvMoXbkdom99C6Z7k7N14uSH6tFp5WKcl1S5enV87I+
 8Virm03ZmY7P3xY/Zcd5Y3xJeetpJ6NjXyfIGHY93UOlh/arvEPP/1aKIbBma3NgnJP+
 PtlXoHlMUGGeo7h0wf/md1v78uFMdI8uAjWi0tsx89wb0lasWJ8yoHJAwO8jCGgAbXlB
 3bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bo4oj7a45IfhqHAyQLGs4S/HZHsQ0q9GFSYo6YLsPsQ=;
 b=pAdGWs1k2OUK3dtfh/RUtA7z5ldt5t0KRn5YM54jS9sCAulaWwn6jPT3AID90sY093
 IcOd7AkJL9u9gDk4jH32/ZIx6I2oj6uN9j+1tEXhsmMGpHMFfLDaY6P/rpirUDJDPivM
 RsZNtOai0ltm2dSwGbuAizb2yU9ZNQ1woTJ8MpaE/dri8i3sQLQDXzIJC0RlXQ/vSK1l
 JI9K24rbGhcyow6KrSZTu/VwrMSoL5aws3yHkfZ5CY1nhQ22GmF1w525PzbJ4X/tRzVA
 EtzuIcSQ68FyuJAAcSC8/mW8o/YaF9Bjz+cOgwOyWSIRah/fNPB+oBccxD3MxY6Vn7cx
 J1Ig==
X-Gm-Message-State: AOAM533Czlev77CqwYocSGo2nmRMkxUI98r+x6TV4S+n8uvrs5N2XVQQ
 Plhi0KtYab7zUUqWv/Uy1MGDQgupf3SHxXJPDXA=
X-Google-Smtp-Source: ABdhPJwRKBdqLhdgbE2DNWiS3YiZPH5d0twjZ3PSgaajuTrPLTB2J/bn4PYjqWXmB5SWXgM8K7GtndHj2lrd4yr8+v4=
X-Received: by 2002:a6b:d60c:: with SMTP id w12mr3359982ioa.105.1617817027402; 
 Wed, 07 Apr 2021 10:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210319194534.2082397-1-atish.patra@wdc.com>
 <20210319194534.2082397-4-atish.patra@wdc.com>
In-Reply-To: <20210319194534.2082397-4-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 13:34:46 -0400
Message-ID: <CAKmqyKPfVQow=STFkx0jeAE4dkWkGMtUHTmpXkmhNhCdgA0nPw@mail.gmail.com>
Subject: Re: [ RFC 3/6] target/riscv: Support mcycle/minstret write operation
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Apr 2021 17:37:18 -0000

On Fri, Mar 19, 2021 at 3:49 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> mcycle/minstret are actually WARL registers and can be written with any
> given value. With SBI PMU extension, it will be used to store a initial
> value provided from supervisor OS. The Qemu also need prohibit the counter
> increment if mcountinhibit is set.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.h     |   8 +++
>  target/riscv/csr.c     | 111 ++++++++++++++++++++++++++++++++++-------
>  target/riscv/machine.c |   4 ++
>  3 files changed, 105 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ef2a7fdc3980..47d6caeb7354 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -216,6 +216,14 @@ struct CPURISCVState {
>
>      target_ulong mcountinhibit;
>
> +    /* Snapshot values for mcycle & minstret */
> +    target_ulong mcycle_prev;
> +    target_ulong minstret_prev;
> +
> +    /* for RV32 */
> +    target_ulong mcycleh_prev;
> +    target_ulong minstreth_prev;
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b9d795389532..61036649b044 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -319,31 +319,106 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
>  }
>
>  /* User Timers and Counters */
> -static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
> +
> +static target_ulong get_icount_ticks(bool brv32)
>  {
> +    int64_t val;
> +    target_ulong result;
> +
>  #if !defined(CONFIG_USER_ONLY)
>      if (icount_enabled()) {
> -        *val = icount_get();
> +        val = icount_get();
>      } else {
> -        *val = cpu_get_host_ticks();
> +        val = cpu_get_host_ticks();
>      }
>  #else
> -    *val = cpu_get_host_ticks();
> +    val = cpu_get_host_ticks();
>  #endif
> +
> +    if (brv32) {
> +        result = val >> 32;
> +    } else {
> +        result = val;
> +    }
> +
> +    return result;
> +}
> +
> +static int read_cycle(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    if (get_field(env->mcountinhibit, HCOUNTEREN_CY)) {
> +        /**
> +         * Counter should not increment if inhibit bit is set. We can't really
> +         * stop the icount counting. Just return the previous value to indicate
> +         * that counter was not incremented.
> +         */
> +        *val = env->mcycle_prev;
> +        return 0;
> +    }
> +
> +    *val = get_icount_ticks(false);
> +
> +    if (*val > env->mcycle_prev)
> +        *val = *val - env->mcycle_prev + env->mphmcounter_val[0];
> +    else
> +        /* Overflow scenario */
> +        *val = UINT64_MAX - env->mcycle_prev + 1 + env->mphmcounter_val[0] + *val;

QEMU expects brackets even on single line if statements.

Otherwise:

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair


> +
> +    return 0;
> +}
> +
> +static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    if (get_field(env->mcountinhibit, HCOUNTEREN_IR)) {
> +        *val = env->minstret_prev;
> +        return 0;
> +    }
> +
> +    *val = get_icount_ticks(false);
> +
> +    if (*val > env->minstret_prev)
> +        *val = *val - env->minstret_prev + env->mphmcounter_val[2];
> +    else
> +        /* Overflow scenario */
> +        *val = UINT64_MAX - env->minstret_prev + 1 + env->mphmcounter_val[2] + *val;
> +
> +    return 0;
> +}
> +
> +static int read_cycleh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +
> +    if (get_field(env->mcountinhibit, HCOUNTEREN_CY)) {
> +        *val = env->mcycleh_prev;
> +        return 0;
> +    }
> +
> +    *val = get_icount_ticks(true);
> +
> +    if (*val > env->mcycleh_prev)
> +        *val = *val - env->mcycleh_prev + env->mphmcounterh_val[0];
> +    else
> +        /* Overflow scenario */
> +        *val = UINT32_MAX - env->mcycleh_prev + 1 + env->mphmcounterh_val[0] + *val;
> +
>      return 0;
>  }
>
>  static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (icount_enabled()) {
> -        *val = icount_get() >> 32;
> -    } else {
> -        *val = cpu_get_host_ticks() >> 32;
> +    if (get_field(env->mcountinhibit, HCOUNTEREN_IR)) {
> +        *val = env->minstreth_prev;
> +        return 0;
>      }
> -#else
> -    *val = cpu_get_host_ticks() >> 32;
> -#endif
> +
> +    *val = get_icount_ticks(true);
> +
> +    if (*val > env->minstreth_prev)
> +        *val = *val - env->minstreth_prev + env->mphmcounterh_val[2];
> +    else
> +        /* Overflow scenario */
> +        *val = UINT32_MAX - env->minstreth_prev + 1 + env->mphmcounterh_val[2] + *val;
> +
>      return 0;
>  }
>
> @@ -1383,9 +1458,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VL]       = { "vl",       vs,     read_vl                    },
>      [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
>      /* User Timers and Counters */
> -    [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
> +    [CSR_CYCLE]    = { "cycle",    ctr,    read_cycle  },
>      [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
> -    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_instreth },
> +    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_cycleh },
>      [CSR_INSTRETH] = { "instreth", ctr32,  read_instreth },
>
>      /*
> @@ -1397,10 +1472,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
> -    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
> -    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
> -    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
> -    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
> +    [CSR_MCYCLE]    = { "mcycle",    any,   read_cycle  , write_mhpmcounter},
> +    [CSR_MINSTRET]  = { "minstret",  any,   read_instret, write_mhpmcounter},
> +    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_cycleh , write_mhpmcounterh},
> +    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth , write_mhpmcounterh},
>
>      /* Machine Information Registers */
>      [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index cb7ec8a4c656..b1410419cc1f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -178,6 +178,10 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> +        VMSTATE_UINTTL(env.mcycle_prev, RISCVCPU),
> +        VMSTATE_UINTTL(env.mcycleh_prev, RISCVCPU),
> +        VMSTATE_UINTTL(env.minstret_prev, RISCVCPU),
> +        VMSTATE_UINTTL(env.minstreth_prev, RISCVCPU),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> --
> 2.25.1
>
>

