Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1JE-0006VU-7l
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:06:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1JC-0006Tn-2W; Tue, 18 Jan 2022 22:06:50 -0500
Received: from [2607:f8b0:4864:20::d33] (port=46916
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1J8-0000PN-ML; Tue, 18 Jan 2022 22:06:49 -0500
Received: by mail-io1-xd33.google.com with SMTP id e79so1112110iof.13;
 Tue, 18 Jan 2022 19:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7HwJvxqXKn5XKfK/a63Dzk1w/H20JE9ScCZuZY3PfPs=;
 b=aB1C0lZfwDZ27h6kkCeGHL+EyouL1YmMirRU1vJtL8yYy3x0i6D8GvP9y4WudfDDc5
 xQ6yoe23W1rRELYWyBMDBM6sI5ZUDCVD7UeL/DBo62/nDfD+kWsGmIJohWdivndvRyiW
 wasQ/JG7ftP7KouI7Nh46ISumbY33LMwywmy8voE6+ggQpeyS2EqR1AiVvZj2HKViHb4
 HwZo50uzNq0gKLt85G4x0RZ/lPiLEQCOXO02WtUKHaSMKyalrPa9Mtf1wXgcPMGulEul
 I6+dW3cQSbNPVl/l/a0mUPdre/+srrq+WVJq+qOjziYJNiPMTd70OAcZezJ7z9acXVK0
 YPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HwJvxqXKn5XKfK/a63Dzk1w/H20JE9ScCZuZY3PfPs=;
 b=dwKsi9sqvx7fvRC1j/faOzuE+8YAUJ1fKAiuXvojU2HxieZz4PaWF0ziJytZyoerDj
 i3n6Iun2f3z5tVXjr0AemoMDpnqK7FPcpUwx5qladS08m+SW6u151DTpwbuCPoBlo5Gq
 wqZNL2lMcHEJTQ9rDwn7Pcv+0Bv4gpwntRil7HnAJBoRqOVDWb/TM4ffY30izUrTTLNq
 HvOk8kL0j2oCjMmSizQ1LD0q6G0nF+Cqiu0ws+qHI40UWu0Vlol9/rWFznM6K1lr+ARb
 m9GLYgOEpepbbyNCHv7KyHMpG724t8F8mF68m3Ddk9F1WfqBF6rr7wp0whFBjiiSG7Fq
 zOAA==
X-Gm-Message-State: AOAM5309/0+tsQyL2PUOet4Rix6ptYWM54H6SFurKELqHg0YbJDvyQJS
 30FSkFbRecv0NwcPOEIpYYSM11eGAhuyhwL8hUE=
X-Google-Smtp-Source: ABdhPJyAh4of3/TWuExYzQ2iqBCBSGXnAH2RsgBWgzOz26FgprYcM+v4afXUmGPUvCvv5ojZODUuMsNB+Dct4uDhAGg=
X-Received: by 2002:a02:7702:: with SMTP id g2mr14069914jac.206.1642561605331; 
 Tue, 18 Jan 2022 19:06:45 -0800 (PST)
MIME-Version: 1.0
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
 <20220105030844.780642-6-bmeng.cn@gmail.com>
In-Reply-To: <20220105030844.780642-6-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:06:19 +1000
Message-ID: <CAKmqyKMA-s-1=mhAO3ODMUK00aNJkw5u2H2oOGbjbd9ODKw5=w@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 5/7] target/riscv: csr: Hook debug CSR read/write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 19 Jan 2022 03:06:51 -0000

On Wed, Jan 5, 2022 at 1:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds debug CSR read/write support to the RISC-V CSR RW table.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - add riscv_trigger_init(), moved from patch #1 to this patch
>
>  target/riscv/debug.h |  2 ++
>  target/riscv/cpu.c   |  6 +++++
>  target/riscv/csr.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/debug.c | 27 +++++++++++++++++++++
>  4 files changed, 92 insertions(+)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index d0f63e2414..f4da2db35d 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -109,4 +109,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
>  bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>  bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>
> +void riscv_trigger_init(CPURISCVState *env);
> +
>  #endif /* RISCV_DEBUG_H */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d36c31ce9a..17dcc3c14f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -575,6 +575,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
> +#ifndef CONFIG_USER_ONLY
> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +        riscv_trigger_init(env);
> +    }
> +#endif
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 146447eac5..189b9cc8c6 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -220,6 +220,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> +
> +static RISCVException debug(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
>  #endif
>
>  /* User Floating-Point CSRs */
> @@ -1464,6 +1473,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_tselect(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    *val = tselect_csr_read(env);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_tselect(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    tselect_csr_write(env, val);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_tdata(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    /* return 0 in tdata1 to end the trigger enumeration */
> +    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
> +        *val = 0;
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!tdata_available(env, csrno - CSR_TDATA1)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    *val = tdata_csr_read(env, csrno - CSR_TDATA1);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_tdata(CPURISCVState *env, int csrno,
> +                                  target_ulong val)
> +{
> +    if (!tdata_available(env, csrno - CSR_TDATA1)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    tdata_csr_write(env, csrno - CSR_TDATA1, val);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /*
>   * Functions to access Pointer Masking feature registers
>   * We have to check if current priv lvl could modify
> @@ -1962,6 +2013,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
>      [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
>
> +    /* Debug CSRs */
> +    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
> +    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
> +    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
> +    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
> +
>      /* User Pointer Masking */
>      [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
>      [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 7760c4611f..041a0d3a89 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -412,3 +412,30 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>
>      return false;
>  }
> +
> +void riscv_trigger_init(CPURISCVState *env)
> +{
> +    target_ulong type2 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
> +    int i;
> +
> +    /* type 2 triggers */
> +    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
> +        /*
> +         * type = TRIGGER_TYPE_AD_MATCH
> +         * dmode = 0 (both debug and M-mode can write tdata)
> +         * maskmax = 0 (unimplemented, always 0)
> +         * sizehi = 0 (match against any size, RV64 only)
> +         * hit = 0 (unimplemented, always 0)
> +         * select = 0 (always 0, perform match on address)
> +         * timing = 0 (always 0, trigger before instruction)
> +         * sizelo = 0 (match against any size)
> +         * action = 0 (always 0, raise a breakpoint exception)
> +         * chain = 0 (unimplemented, always 0)
> +         * match = 0 (always 0, when any compare value equals tdata2)
> +         */
> +        env->trigger_type2[i].mcontrol = type2;
> +        env->trigger_type2[i].maddress = 0;
> +        env->trigger_type2[i].bp = NULL;
> +        env->trigger_type2[i].wp = NULL;
> +    }

Should this be called at reset instead?

Alistair

> +}
> --
> 2.25.1
>
>

