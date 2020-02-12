Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1yEm-0006aF-4B
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 15:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1yEj-0006a0-Vn
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 15:03:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1yEi-00020b-NG
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 15:03:53 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1yEi-00020C-FF
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 15:03:52 -0500
Received: by mail-pg1-x543.google.com with SMTP id b35so1625519pgm.13
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2020 12:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ku0u44AaXoWhDq+EGfoD3hhpjQe5d615GZuiFC5+jSA=;
 b=Ae0cQpHxGFtKGvlbMZLYFXBCzA4+0XVN1wH5eVR0pxQsUcTivZoI0HYzDWz3g3bTvt
 vkoSLquSjQnLfjHNhfaNWBsBmQZfYccxAmQL56M0aZ7xMm8pHtYNBzVLGvvVOvFC5309
 QWtlQQs0UDdUQ8ReSE/ii6YvxrCNo2Qm9etaevZlBPQIN6wGgs97uCJe0yMheAuwDRdg
 YAHIYLgaIvEDBMDrSwrwD5hs+61u0bT8NWfnmpiccqXEQfqFjaGNgrPgaJbPoN4BDvcW
 7flzD8PeSyuL1VP+MW9Cf3psBlC2jpJKUs8BrgI6yVryYu8pC9H48LcSMazTneFrL0Il
 as/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ku0u44AaXoWhDq+EGfoD3hhpjQe5d615GZuiFC5+jSA=;
 b=R05DWDHq2NLUNadGsY3dDxfILACZvSo2PUDk2dS+mildT4wz7flsuaxHrK2WSWhe97
 YmXFMb2dAPWDuoRbzKGOFKVLw7vSs4MdNFqtyG2VNzY27vxdY7EGIv8ZpnGaUPVWm6v9
 d+cLJ+Oyhjqjro+XZ0pbftUFE/If5d29erkxsR6FZBHZB01pUysPKHp1SOa1gqfgqnbd
 yKvuTqq8BT0SkBDKwFE3BDV7k0SqpV+l5uwWpzrUtPLpyoARhimhrirGahMwLS1i0I/M
 BrUSFOLZ8QHaQUsvLy4afsfM6D89w/k+3y9jlK68t8ttBR9iSExTwsgFequxHCERuFdY
 nlHg==
X-Gm-Message-State: APjAAAXDTfnQHlXYmldyscNxz18uPbAZg0I++ybO00jxmsXat8XOLXdA
 T5JFn7h5r6M0kkbQWz/akSTZYQ==
X-Google-Smtp-Source: APXvYqybEyBz6aZCFIco49ZXh1fSVeezuSMKPMUySe5EwzVt3DY/FyxkZlAiYcCH+jrIfdTOdbLFJg==
X-Received: by 2002:a62:790e:: with SMTP id u14mr13693447pfc.174.1581537830747; 
 Wed, 12 Feb 2020 12:03:50 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id b24sm73925pfo.84.2020.02.12.12.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 12:03:50 -0800 (PST)
Date: Wed, 12 Feb 2020 12:03:50 -0800 (PST)
X-Google-Original-Date: Wed, 12 Feb 2020 12:03:47 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 21/35] target/riscv: Add hypvervisor trap support
In-Reply-To: <7ee4badbb4dfc33ab2e75151b69559f09d733575.1580518859.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-d32ca7fd-b39f-45d3-a373-ff66d707397b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Wed, 12 Feb 2020 20:03:55 -0000

On Fri, 31 Jan 2020 17:02:30 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 69 +++++++++++++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 98017df33b..e7728cb0ca 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -639,6 +639,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> +    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
> +    target_ulong s;
>
>      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
>       * so we mask off the MSB and separate into trap type and cause.
> @@ -648,19 +650,14 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong deleg = async ? env->mideleg : env->medeleg;
>      target_ulong tval = 0;
>
> -    static const int ecall_cause_map[] = {
> -        [PRV_U] = RISCV_EXCP_U_ECALL,
> -        [PRV_S] = RISCV_EXCP_S_ECALL,
> -        [PRV_H] = RISCV_EXCP_VS_ECALL,
> -        [PRV_M] = RISCV_EXCP_M_ECALL
> -    };
> -
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
>          case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> +            force_hs_execp = true;
> +            /* fallthrough */
>          case RISCV_EXCP_INST_ADDR_MIS:
>          case RISCV_EXCP_INST_ACCESS_FAULT:
>          case RISCV_EXCP_LOAD_ADDR_MIS:
> @@ -678,7 +675,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          /* ecall is dispatched as one cause so translate based on mode */
>          if (cause == RISCV_EXCP_U_ECALL) {
>              assert(env->priv <= 3);
> -            cause = ecall_cause_map[env->priv];
> +
> +            if (env->priv == PRV_M) {
> +                cause = RISCV_EXCP_M_ECALL;
> +            } else if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
> +                cause = RISCV_EXCP_VS_ECALL;
> +            } else if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) {
> +                cause = RISCV_EXCP_S_ECALL;
> +            } else if (env->priv == PRV_U) {
> +                cause = RISCV_EXCP_U_ECALL;
> +            }
>          }
>      }
>
> @@ -688,7 +694,36 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      if (env->priv <= PRV_S &&
>              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
>          /* handle the trap in S-mode */
> -        target_ulong s = env->mstatus;
> +        if (riscv_has_ext(env, RVH)) {
> +            target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
> +
> +            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
> +                !force_hs_execp) {
> +                /* Trap to VS mode */
> +            } else if (riscv_cpu_virt_enabled(env)) {
> +                /* Trap into HS mode, from virt */
> +                riscv_cpu_swap_hypervisor_regs(env);
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SP2V,
> +                                         get_field(env->hstatus, HSTATUS_SPV));
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SP2P,
> +                                         get_field(env->mstatus, SSTATUS_SPP));
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
> +                                         riscv_cpu_virt_enabled(env));
> +
> +                riscv_cpu_set_virt_enabled(env, 0);
> +                riscv_cpu_set_force_hs_excep(env, 0);
> +            } else {
> +                /* Trap into HS mode */
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SP2V,
> +                                         get_field(env->hstatus, HSTATUS_SPV));
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SP2P,
> +                                         get_field(env->mstatus, SSTATUS_SPP));
> +                env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
> +                                         riscv_cpu_virt_enabled(env));
> +            }
> +        }
> +
> +        s = env->mstatus;
>          s = set_field(s, MSTATUS_SPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
>              get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE << env->priv));
>          s = set_field(s, MSTATUS_SPP, env->priv);
> @@ -702,7 +737,21 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          riscv_cpu_set_mode(env, PRV_S);
>      } else {
>          /* handle the trap in M-mode */
> -        target_ulong s = env->mstatus;
> +        if (riscv_has_ext(env, RVH)) {
> +            if (riscv_cpu_virt_enabled(env)) {
> +                riscv_cpu_swap_hypervisor_regs(env);
> +            }
> +            env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
> +                                      riscv_cpu_virt_enabled(env));
> +            env->mstatus = set_field(env->mstatus, MSTATUS_MTL,
> +                                      riscv_cpu_force_hs_excep_enabled(env));
> +
> +            /* Trapping to M mode, virt is disabled */
> +            riscv_cpu_set_virt_enabled(env, 0);
> +            riscv_cpu_set_force_hs_excep(env, 0);
> +        }
> +
> +        s = env->mstatus;
>          s = set_field(s, MSTATUS_MPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
>              get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE << env->priv));
>          s = set_field(s, MSTATUS_MPP, env->priv);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

