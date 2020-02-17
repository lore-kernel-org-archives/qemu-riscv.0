Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3lgf-0005f9-My
	for mharc-qemu-riscv@gnu.org; Mon, 17 Feb 2020 14:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j3lgc-0005bX-GH
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2020 14:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j3lgb-0003D8-1L
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2020 14:04:06 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40247)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j3lga-0003Cd-PX
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2020 14:04:04 -0500
Received: by mail-pg1-x542.google.com with SMTP id z7so9684554pgk.7
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2020 11:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=k8uh/bDNPDx1ickQNNWgr7If09VzLiGM2e6eeOy7NWU=;
 b=pT+IE0XJvofe8rVyFoAbrGB9rPsHrbwCX6P0illGorLew91Uar4d33pnSl1DMKtnG1
 /jXC+YhKHQ+ejbXiEFPDrv1VUemzy+MVu002+Uat1H6twjNmehiWWNnAVNwe+y3yA90+
 REMH+yRK2ekiLc21zsq8vb1SoKrkrzm00JMbICaNrPCcXIx3MUrYxg6EAgaG4dYirdz9
 xvrOWNkX7LKP5RrG9TCGVn4l8IyREGjH6QDjRmdxmwaq61W3wett5bfB8zUJ0vaWJxxO
 3HObbZ7m7idlqV7NZaSMJv2Ze1VYdPSgLr0Zc9HBsPFYdG9OxCrtokSopi9PRUgJHkEI
 GHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=k8uh/bDNPDx1ickQNNWgr7If09VzLiGM2e6eeOy7NWU=;
 b=CX8RWRrxTVLyxXS4cB5425iPfUcbYyR0vSlSKbIU5cmrZeq9XGWoLG5mYGbnkurQIR
 GXx7u0HpP6lwS3K+Toto/x7sEL4A2KNvSeApzN9blhochit3M6QCvzTyrRJuU4ppgd2C
 iQeCo+4G2KpFMBq2czR/rpTUQIag9agMD5gKzMD4i3wAnaZZxnrQAzKXij8f39bzS2O7
 RMv8z8U9jgiVC+n+wWqj8Ma04omjpbXIcNHuFuV8zhaJ/mFmlI9ga+72Y9JG5yAPZzxK
 nmNCCXWHdmx/TCuJGZC9P534SqDL44uJxMMsv1OhRLtxo9hkAuA+sClYEvaMO1MRMfio
 jyeA==
X-Gm-Message-State: APjAAAWLs0spQ3UAkb6h6eTDl8GZRKrSKAH14yW2PjIkRR7rHutD9pU0
 m5EXZnpaROOnbTKvAxzRI2MUnQ==
X-Google-Smtp-Source: APXvYqx/QapGKGu7aBXDZBjHnavz2Uki802HMhrv2tgxg2nufROkRxu206+CZEy+B7XbTMBTzLLGnQ==
X-Received: by 2002:a62:6342:: with SMTP id x63mr17765156pfb.103.1581966243244; 
 Mon, 17 Feb 2020 11:04:03 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id w8sm1105431pfn.186.2020.02.17.11.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 11:04:02 -0800 (PST)
Date: Mon, 17 Feb 2020 11:04:02 -0800 (PST)
X-Google-Original-Date: Mon, 17 Feb 2020 11:02:42 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 33/35] target/riscv: Add support for the 32-bit
 MSTATUSH CSR
In-Reply-To: <b1650e8b542ebea1cf949dc2a66a4cfb46a2f49d.1580518859.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-87b5e850-a81a-499e-888f-24e1331b0ba2@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Mon, 17 Feb 2020 19:04:08 -0000

On Fri, 31 Jan 2020 17:03:05 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  3 +++
>  target/riscv/cpu.h        | 10 ++++++++++
>  target/riscv/cpu_bits.h   |  3 +++
>  target/riscv/cpu_helper.c | 17 +++++++++++++++++
>  target/riscv/csr.c        | 25 +++++++++++++++++++++++++
>  target/riscv/op_helper.c  |  4 ++++
>  6 files changed, 62 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 44ad768a84..b27066f6a7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -237,6 +237,9 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> +#ifdef TARGET_RISCV32
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ", env->mstatush);
> +#endif
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a8534fdf2b..6f9c29322a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -127,6 +127,10 @@ struct CPURISCVState {
>
>      target_ulong mip;
>
> +#ifdef TARGET_RISCV32
> +    target_ulong mstatush;
> +#endif
> +
>      uint32_t miclaim;
>
>      target_ulong mie;
> @@ -164,6 +168,9 @@ struct CPURISCVState {
>      target_ulong vscause;
>      target_ulong vstval;
>      target_ulong vsatp;
> +#ifdef TARGET_RISCV32
> +    target_ulong vsstatush;
> +#endif
>
>      target_ulong mtval2;
>      target_ulong mtinst;
> @@ -176,6 +183,9 @@ struct CPURISCVState {
>      target_ulong stval_hs;
>      target_ulong satp_hs;
>      target_ulong mstatus_hs;
> +#ifdef TARGET_RISCV32
> +    target_ulong mstatush_hs;
> +#endif
>
>      target_ulong scounteren;
>      target_ulong mcounteren;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index a24654d137..049032f2ae 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -135,6 +135,9 @@
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
>
> +/* 32-bit only */
> +#define CSR_MSTATUSH        0x310
> +
>  /* Legacy Counter Setup (priv v1.9.1) */
>  /* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
>  #define CSR_MUCOUNTEREN     0x320
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 10786a077b..e04545adf7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -126,6 +126,11 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>          env->mstatus &= ~mstatus_mask;
>          env->mstatus |= env->mstatus_hs;
>
> +#if defined(TARGET_RISCV32)
> +        env->vsstatush = env->mstatush;
> +        env->mstatush |= env->mstatush_hs;
> +#endif
> +
>          env->vstvec = env->stvec;
>          env->stvec = env->stvec_hs;
>
> @@ -149,6 +154,11 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>          env->mstatus &= ~mstatus_mask;
>          env->mstatus |= env->vsstatus;
>
> +#if defined(TARGET_RISCV32)
> +        env->mstatush_hs = env->mstatush;
> +        env->mstatush |= env->vsstatush;
> +#endif
> +
>          env->stvec_hs = env->stvec;
>          env->stvec = env->vstvec;
>
> @@ -937,10 +947,17 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              if (riscv_cpu_virt_enabled(env)) {
>                  riscv_cpu_swap_hypervisor_regs(env);
>              }
> +#ifdef TARGET_RISCV32
> +            env->mstatush = set_field(env->mstatush, MSTATUS_MPV,
> +                                       riscv_cpu_virt_enabled(env));
> +            env->mstatush = set_field(env->mstatush, MSTATUS_MTL,
> +                                       riscv_cpu_force_hs_excep_enabled(env));
> +#else
>              env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
>                                        riscv_cpu_virt_enabled(env));
>              env->mstatus = set_field(env->mstatus, MSTATUS_MTL,
>                                        riscv_cpu_force_hs_excep_enabled(env));
> +#endif
>
>              mtval2 = env->guest_phys_fault_addr;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2e6700bbeb..572a478e8c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -371,6 +371,27 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +#ifdef TARGET_RISCV32
> +static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->mstatush;
> +    return 0;
> +}
> +
> +static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if ((val ^ env->mstatush) & (MSTATUS_MPV)) {
> +        tlb_flush(env_cpu(env));
> +    }
> +
> +    val &= MSTATUS_MPV | MSTATUS_MTL;
> +
> +    env->mstatush = val;
> +
> +    return 0;
> +}
> +#endif
> +
>  static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->misa;
> @@ -1214,6 +1235,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
>      [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
>
> +#if defined(TARGET_RISCV32)
> +    [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
> +#endif
> +
>      /* Legacy Counter Setup (priv v1.9.1) */
>      [CSR_MUCOUNTEREN] =         { any,  read_mucounteren, write_mucounteren },
>      [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 804936e9d5..dca68fa96e 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -153,7 +153,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>          get_field(mstatus, MSTATUS_MPIE));
>      mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
> +#ifdef TARGET_RISCV32
> +    env->mstatush = set_field(env->mstatush, MSTATUS_MPV, 0);
> +#else
>      mstatus = set_field(mstatus, MSTATUS_MPV, 0);
> +#endif
>      env->mstatus = mstatus;
>      riscv_cpu_set_mode(env, prev_priv);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

