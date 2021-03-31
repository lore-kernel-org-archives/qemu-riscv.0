Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRdAN-0000RA-Ry
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRdAL-0000M3-OH; Wed, 31 Mar 2021 11:53:57 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRdAF-0006Sj-Pl; Wed, 31 Mar 2021 11:53:57 -0400
Received: by mail-io1-xd30.google.com with SMTP id k25so20629009iob.6;
 Wed, 31 Mar 2021 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIaPXoZQNM46sZutf+VUaPa0zzyFJFOG1v9LF2gSpfQ=;
 b=WePvoS6ZJ3lfDEn6Rqq5we4UmQrjTRh3j09o4S/PvOO/hlyPIltPwEI1+AIqnUL84y
 Pjqs6ht+9aRXztvXXJSTTH7MszqWsQJKdCwkuPGbiPDhCrwRVEo+tv9ALyrEagHF4s0e
 T1FrMXib8UaX3F+wZr095z9lWfC4WQ3llX8Zt8amagaAadMxNI60h9T0h42ezTT4eCy0
 8b6kYn7QqAEdb4NuQYopi2rtUuFWxTMNv4gDeWAZPjvE+3/tr830fTFZ1sMgZd1UFlrb
 IlQNNzQya1OOqXKIQb6qfQIqrmz36U4tVf8vk4Uhu4N7xK5c/UpmXMToBR0DTjleyDT5
 QaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIaPXoZQNM46sZutf+VUaPa0zzyFJFOG1v9LF2gSpfQ=;
 b=a2P3kyT2PPenAtqCPun3XkqLcoliKfuSQE8CbGIaKyLTgefVsH8x127fLbKnqBd+UZ
 V8ucD6V9hN/+drY/DdkfTDsLZmNpbbyjrbLn4Y5t+mdcqMhcDzZeUpJHIwoMR2Rpcc0X
 y7cLeGb+V0nn+8WbrMDOmzyI9LFYnfjELgRQmzQQyrARgON1kxwfZ3F+VANYhQ2tf+bZ
 UVu5Z7TxrOstejzJAiu8f/Qn9vVfPgoUBJauczAagUZtrC0Xl+Pi3QQNkQotXNNw6jH8
 CLc+svIYQK9yKMJlx5GCooyWk41PiN7+70V8pJxo5lAzxHivG9Q+e3XJ1P98B1NFicZi
 PepA==
X-Gm-Message-State: AOAM531WlY/JVLBOSMzc86HeFwz152bSphGZgFoC75YFVNMzxR6gnsgk
 1XYFuEpjwCltqT2nPe1ZohkSTzMH+YIXAp3Qsdc=
X-Google-Smtp-Source: ABdhPJzq38Iwp31Iu56mr10uL4O5e/2yfNyPmkyXcCUgUXyWKtrC1K3BUBy55zI/0r+GGC8JOP4JHZNTcMDjvIaDmqg=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr2840045iom.118.1617206030248; 
 Wed, 31 Mar 2021 08:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210331021825.537484-1-bmeng.cn@gmail.com>
 <20210331021825.537484-2-bmeng.cn@gmail.com>
In-Reply-To: <20210331021825.537484-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:51:41 -0400
Message-ID: <CAKmqyKMCTFVs9dhFza+GnTM-EqRngPmTEfWbuX=BaVMGAEpbCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Wed, 31 Mar 2021 15:53:58 -0000

On Tue, Mar 30, 2021 at 10:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The following check:
>
>     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>         return -RISCV_EXCP_ILLEGAL_INST;
>     }
>
> is redundant in fflags/frm/fcsr read/write routines, as the check was
> already done in fs().
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/csr.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2bad396f64..7c24318f75 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -193,11 +193,6 @@ static int pmp(CPURISCVState *env, int csrno)
>  /* User Floating-Point CSRs */
>  static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
> -#endif
>      *val = riscv_cpu_get_fflags(env);
>      return 0;
>  }
> @@ -205,9 +200,6 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
> @@ -216,11 +208,6 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>
>  static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
> -#endif
>      *val = env->frm;
>      return 0;
>  }
> @@ -228,9 +215,6 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
> @@ -239,11 +223,6 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>
>  static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
> -#endif
>      *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
>          | (env->frm << FSR_RD_SHIFT);
>      if (vs(env, csrno) >= 0) {
> @@ -256,9 +235,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> --
> 2.25.1
>
>

