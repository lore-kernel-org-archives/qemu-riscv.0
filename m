Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixB3d-0003No-Ub
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 09:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ixB3a-0003Hz-F6
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 09:44:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ixB3Y-0005sw-RO
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 09:44:34 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ixB3Y-0005p7-Hv
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 09:44:32 -0500
Received: by mail-wm1-x341.google.com with SMTP id p17so4535056wma.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jan 2020 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=qvdK5B4XKOkiToFAYkkk7yFU/MqqgXAYKVstcPizdMc=;
 b=kyec8s6Wbznncts8jntQA9U0nIdIa1CtUBICr4rB9cZkeAnKfqxDgGlUTa7jgZGN/d
 eXUqPnW0MiYTL0KgzUDu+EroeW426tdTTKrLH7fFemRY+xBtPYmVZrxzCFWunOQQKWbL
 XZdlszD0fLqojz9fNPOw4kiA8xot8Udn804bLKZ8IE3jtOzp2hcNeBRxlnSfbi85lRyr
 ZsfP1+UT3Uc9jmQOzEHNwiJRujj4S4FflKv4Xito7VePo1h0f5CsdXTIkS/7Nu7WQeil
 9ROvTM/zowYKSlCWBXiUUbyU0T45O3+xez2EYNRZE8EUcXYUNIE/0uUzOh9d3WA09OmP
 wInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=qvdK5B4XKOkiToFAYkkk7yFU/MqqgXAYKVstcPizdMc=;
 b=sk0AL3Fwha+Pq1u2f/WnPkMgIDC3Z1XjNpOEbxed4Sv7LOYYwtyHX9fyX0PFlN2tO8
 5A27dq4h4eVtywrr93piS7wlOSgoamAfyb/CKeRA/Wg95y58Zz02ngsOMFwTz3sSVqDE
 jvXfwAnMl13BHlMhfM1ovapIRbF2wBE7FKWX4+fJ6ocVirs5AM0FUX4Hl/uHBqKlzxkA
 JiILddxe16NgeveL11Kp00bO7/eW9fGESFaZCwjjWz4Qw4RJ2MGiFjIMQp40HZXDtcgr
 NGlwJz+11JmKVJ8ObJaOqKFZsklAnHN4CDgWr73/jhQTzarSdO1tpOSnD7LZx23i5wX9
 AceQ==
X-Gm-Message-State: APjAAAUUA/Esu9Na3wxz8cCVaUNIbu8KtmL3OWpyPz1vvhTK9PVG+afj
 RPACuEaEatz0ykkGxrIcFSu21w==
X-Google-Smtp-Source: APXvYqxS1e6rD0p1CkgzDDXA9E1qXpOYwk0lDnmbZzy9eJZ3pH7p1r+48Rw7VItL4CnZByqmb/sWxQ==
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr6090548wmi.104.1580395470839; 
 Thu, 30 Jan 2020 06:44:30 -0800 (PST)
Received: from localhost ([2a00:79e0:d:11:1da2:3fd4:a302:4fff])
 by smtp.gmail.com with ESMTPSA id z21sm6590494wml.5.2020.01.30.06.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 06:44:30 -0800 (PST)
Date: Thu, 30 Jan 2020 06:44:30 -0800 (PST)
X-Google-Original-Date: Thu, 30 Jan 2020 14:44:24 GMT (+0000)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Emulate TIME CSRs for privileged mode
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, 
 anup@brainfault.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>
To: Anup Patel <Anup.Patel@wdc.com>
In-Reply-To: <20200122112952.94284-2-anup.patel@wdc.com>
References: <20200122112952.94284-2-anup.patel@wdc.com>
 <20200122112952.94284-1-anup.patel@wdc.com>
Message-ID: <mhng-917b8eb4-84ed-4b93-836d-186c70d302e0@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Thu, 30 Jan 2020 14:44:36 -0000

On Wed, 22 Jan 2020 11:30:31 GMT (+0000), Anup Patel wrote:
> Currently, TIME CSRs are emulated only for user-only mode. This
> patch add TIME CSRs emulation for privileged mode.
>
> For privileged mode, the TIME CSRs will return value provided
> by rdtime callback which is registered by QEMU machine/platform
> emulation (i.e. CLINT emulation). If rdtime callback is not
> available then the monitor (i.e. OpenSBI) will trap-n-emulate
> TIME CSRs in software.
>
> We see 25+% performance improvement in hackbench numbers when
> TIME CSRs are not trap-n-emulated.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  5 +++
>  target/riscv/cpu_helper.c |  5 +++
>  target/riscv/csr.c        | 86 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 53bc6af5f7..473e01da6c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -169,6 +169,7 @@ struct CPURISCVState {
>      target_ulong htval;
>      target_ulong htinst;
>      target_ulong hgatp;
> +    uint64_t htimedelta;
>  
>      /* Virtual CSRs */
>      target_ulong vsstatus;
> @@ -204,6 +205,9 @@ struct CPURISCVState {
>      /* physical memory protection */
>      pmp_table_t pmp_state;
>  
> +    /* machine specific rdtime callback */
> +    uint64_t (*rdtime_fn)(void);
> +
>      /* True if in debugger mode.  */
>      bool debugger;
>  #endif
> @@ -325,6 +329,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
>  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void));
>  #endif
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>  
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7166e6199e..c85f44d933 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -250,6 +250,11 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
>      return old;
>  }
>  
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void))
> +{
> +    env->rdtime_fn = fn;
> +}
> +
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>  {
>      if (newpriv > PRV_M) {
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b28058f9d5..44ff1d80ec 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -238,6 +238,32 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>  
>  #else /* CONFIG_USER_ONLY */
>  
> +static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
> +
> +    if (!env->rdtime_fn) {
> +        return -1;
> +    }
> +
> +    *val = env->rdtime_fn() + delta;
> +    return 0;
> +}
> +
> +#if defined(TARGET_RISCV32)
> +static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
> +
> +    if (!env->rdtime_fn) {
> +        return -1;
> +    }
> +
> +    *val = (env->rdtime_fn() + delta) >> 32;
> +    return 0;
> +}
> +#endif
> +
>  /* Machine constants */
>  
>  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
> @@ -931,6 +957,56 @@ static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>  
> +static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    if (!env->rdtime_fn) {
> +        return -1;
> +    }
> +
> +#if defined(TARGET_RISCV32)
> +    *val = env->htimedelta & 0xffffffff;
> +#else
> +    *val = env->htimedelta;
> +#endif
> +    return 0;
> +}
> +
> +static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (!env->rdtime_fn) {
> +        return -1;
> +    }
> +
> +#if defined(TARGET_RISCV32)
> +    env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
> +#else
> +    env->htimedelta = val;
> +#endif
> +    return 0;
> +}

Oh, I guess I missed this when reading Alistair's H extension patches, but it
looks like htimedelta is mandatory.  In other words, these writes should
succeed regardless of whether or not rdtime is implemented.  I opened a
question on the spec to make sure, but if that's the case then it should always
be implemented: https://github.com/riscv/riscv-isa-manual/issues/481

> +
> +#if defined(TARGET_RISCV32)
> +static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    if (!env->rdtime_fn) {
> +        return -1;
> +    }
> +
> +    *val = env->htimedelta >> 32;
> +    return 0;
> +}
> +
> +static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (!env->rdtime_fn) {
> +        return -1;
> +    }
> +
> +    env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
> +    return 0;
> +}
> +#endif
> +
>  /* Virtual CSR Registers */
>  static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1203,14 +1279,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_INSTRETH] =            { ctr,  read_instreth                       },
>  #endif
>  
> -    /* User-level time CSRs are only available in linux-user
> -     * In privileged mode, the monitor emulates these CSRs */
> -#if defined(CONFIG_USER_ONLY)
> +    /* In privileged mode, the monitor will have to emulate TIME CSRs only if
> +     * rdtime callback is not provided by machine/platform emulation */
>      [CSR_TIME] =                { ctr,  read_time                           },
>  #if defined(TARGET_RISCV32)
>      [CSR_TIMEH] =               { ctr,  read_timeh                          },
>  #endif
> -#endif
>  
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */
> @@ -1276,6 +1350,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HTVAL] =               { hmode,   read_htval,       write_htval      },
>      [CSR_HTINST] =              { hmode,   read_htinst,      write_htinst     },
>      [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
> +    [CSR_HTIMEDELTA] =          { hmode,   read_htimedelta,  write_htimedelta },
> +#if defined(TARGET_RISCV32)
> +    [CSR_HTIMEDELTAH] =         { hmode,   read_htimedeltah, write_htimedeltah},
> +#endif
>  
>      [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
>      [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
> -- 
> 2.17.1

