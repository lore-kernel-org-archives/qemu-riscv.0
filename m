Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nV29T-00031c-0r
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 22:15:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV29R-00031H-7K; Thu, 17 Mar 2022 22:15:37 -0400
Received: from [2607:f8b0:4864:20::d35] (port=33693
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nV29H-0001Ba-Nj; Thu, 17 Mar 2022 22:15:30 -0400
Received: by mail-io1-xd35.google.com with SMTP id 195so8031015iou.0;
 Thu, 17 Mar 2022 19:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFhdy3QN/o4ozZ33Z9rtKB8Kh+R4enB1hDvfoaw3df4=;
 b=YZqB+yARBWtME6WTk9cfg8hFVialrEKFUke7l+MX54wAp3E+KtBcTiq6fu2pen/Vlh
 tsOMwlKvHhlejVSK9v0cTs+RCEGJdrjMiu6CcdV4cpxu2s49S4+vBjOy2StaooedV0PK
 0343WnQ6a+Q28v690DOQmYWyvdimKqm0X4IWOQMFtr/xS8dfXtfJNS5xYJgk++TpgPgC
 H20PRnNgdXmzk+an/CNHdlXWn9LlZz3JNq7GdZvuTc2kqg94NS8SJ0IvRhhUlvNakIMv
 8EndU0sYgk1HoLLqNzR0a7TKnNCcJWJ0Wa7UOCwrbwUQbtYatTB9qI0EmyFfK6RIKrS2
 s4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFhdy3QN/o4ozZ33Z9rtKB8Kh+R4enB1hDvfoaw3df4=;
 b=XYWgCnAUxYfuTfgIBKSzvOHfM5AraYCr7MNf+tVHIizsFghqF9cvawQIa1XQLiowjr
 8T8iG8BbAGX+TzZMz7icZ6QPvv5Rz3/dVsC7c5O+iDRlUPTYEzqYkbM7gqAKJ53nfkRJ
 bEcPClleyfs56cq0D/wAsC/84E7ADnDeDjj3DNHDkji1wFB/zZeTRCvSCSun91wDrUC8
 WQPkVSWOKaesOTbOq+KiXOgPn9i02YAP3akbt9881cVYrmovwSDm3BpnZonOEme8wVTI
 ClMKB9gUXeacFxbh15d7UsHKWPnv5i++plyjrBrVds04EGLCj8p6Ns7Sy6aUtZbGppps
 SQvQ==
X-Gm-Message-State: AOAM533TOrRTpZj6M9sSjq+gF+vqCXZSYdRIZzCNK0KKTb9BOn9LxAC5
 OgZkmZeqQxy5hyjgWz97DDYrwzhxiVkVqZv7Axo=
X-Google-Smtp-Source: ABdhPJzYzSRZRJYzSKm1UQXN8BrSAZAHemzfYLjDmiX70SNKpuscltZJTpbmMvCvAozVDoGa58YqF6OxoYxxQO7yg3E=
X-Received: by 2002:a05:6638:24cd:b0:31a:607c:4434 with SMTP id
 y13-20020a05663824cd00b0031a607c4434mr2886636jat.267.1647569711865; Thu, 17
 Mar 2022 19:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-6-bmeng.cn@gmail.com>
In-Reply-To: <20220315065529.62198-6-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Mar 2022 12:14:46 +1000
Message-ID: <CAKmqyKOzyB3UHTZhKLvNFta8PmYB2LDbzafbK2gkuF+pO9-s9A@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] target/riscv: csr: Hook debug CSR read/write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Fri, 18 Mar 2022 02:15:37 -0000

On Tue, Mar 15, 2022 at 5:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds debug CSR read/write support to the RISC-V CSR RW table.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v4:
> - move riscv_trigger_init() call to riscv_cpu_reset()
>
> Changes in v3:
> - add riscv_trigger_init(), moved from patch #1 to this patch
>
>  target/riscv/debug.h |  2 ++
>  target/riscv/cpu.c   |  4 ++++
>  target/riscv/csr.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++
>  target/riscv/debug.c | 27 +++++++++++++++++++++
>  4 files changed, 90 insertions(+)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index fb21706e1c..27b9cac6b4 100644
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
> index eb2be5fa05..ba9cc3bcd6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -461,6 +461,10 @@ static void riscv_cpu_reset(DeviceState *dev)
>      set_default_nan_mode(1, &env->fp_status);
>
>  #ifndef CONFIG_USER_ONLY
> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +        riscv_trigger_init(env);
> +    }
> +
>      if (kvm_enabled()) {
>          kvm_riscv_reset_vcpu(cpu);
>      }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0606cd0ea8..3b9008709d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -290,6 +290,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
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
> @@ -2576,6 +2585,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
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
> @@ -3265,6 +3316,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> index 1a9392645e..2f2a51c732 100644
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
> +        env->type2_trig[i].mcontrol = type2;
> +        env->type2_trig[i].maddress = 0;
> +        env->type2_trig[i].bp = NULL;
> +        env->type2_trig[i].wp = NULL;
> +    }
> +}
> --
> 2.25.1
>
>

