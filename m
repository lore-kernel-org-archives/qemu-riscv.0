Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHuLv-00076a-Tm
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 14:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHuLt-00075y-59
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 14:36:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHuLr-0001ky-MJ
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 14:36:53 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39608)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHuLr-0001kP-Fi
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 14:36:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id s17so8836188plp.6
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 11:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1p5wtpKDczKiRs05oJflv+Gkh5Itnx00+VwT+r5Xi7Q=;
 b=oo+kJKC4igT68fW3siOgjmPZXo9284kFeV0RI6p/7pVRi2H9uPMlAsnAAggwGgD9qn
 qegLrdiAK5pmtxbQGr5tc62sGIWfV0JLmF+RkjEVzctSL95+/U0QHqGQQYEuxZ1J2nG8
 IeCv8km+dkVzbtcA8aA/ycBLQf+eoxVOO4/vI++UbePUltcfP/XAHGCSniVsRi3Lqugb
 b3or485U5M1D1A3Po5HG4rHAnW7diBladv7p3h5nKZSGteVWez2clAGf+PA5ipkB6CGh
 DjT1VIY0u5AXk9BxqHNdr/4l358srd/ksm1bG0Hr0RTl6hD5kH7fl+IN/gXhLmQKq8uL
 Eh4w==
X-Gm-Message-State: APjAAAU5MN868OQGyySIkqTLHtkcIfaNcAveMTZNrSbry/5q6m8+equg
 e4cs9LA997LtbYFOP/Wf51rdxw==
X-Google-Smtp-Source: APXvYqwb6ly2xe5WIntHCkDIF1kuWNe+xbABVhggcUHVW6R5U/QxHy8UymSMu+P4ry6Jlu0W4B/2Ig==
X-Received: by 2002:a17:902:8e8b:: with SMTP id
 bg11mr5465062plb.326.1570559809994; 
 Tue, 08 Oct 2019 11:36:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f14sm20673585pfq.187.2019.10.08.11.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 11:36:49 -0700 (PDT)
Date: Tue, 08 Oct 2019 11:36:49 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 11:34:45 PDT (-0700)
Subject: Re: [PATCH v1 26/28] target/riscv: Add support for the 32-bit
 MSTATUSH CSR
In-Reply-To: <f4e877ca1f9fece2e25f1b8bc655d6e240208ae5.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-95ae283b-4369-4508-ab27-784960597e72@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
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
X-List-Received-Date: Tue, 08 Oct 2019 18:36:54 -0000

On Fri, 23 Aug 2019 16:38:58 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  6 ++++++
>  target/riscv/cpu.h        |  7 +++++++
>  target/riscv/cpu_bits.h   |  3 +++
>  target/riscv/cpu_helper.c |  7 +++++++
>  target/riscv/csr.c        | 23 +++++++++++++++++++++++
>  target/riscv/op_helper.c  |  4 ++++
>  6 files changed, 50 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 371d5845af..06ee551ebe 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -229,6 +229,9 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", *env->mstatus);
> +#ifdef TARGET_RISCV32
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ", *env->mstatush);
> +#endif
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bstatus ", env->vsstatus);
> @@ -468,6 +471,9 @@ static void riscv_cpu_init(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      env->mie = &env->mie_novirt;
>      env->mstatus = &env->mstatus_novirt;
> +# ifdef TARGET_RISCV32
> +    env->mstatush = &env->mstatush_novirt;
> +# endif
>  #endif
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 05957f32a8..b63f1f3cdc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -124,6 +124,10 @@ struct CPURISCVState {
>      target_ulong mhartid;
>      target_ulong *mstatus;
>
> +#ifdef TARGET_RISCV32
> +    target_ulong *mstatush;
> +#endif
> +
>      /*
>       * CAUTION! Unlike the rest of this struct, mip and mip_novirt is accessed
>       * asynchonously by I/O threads. It should be read with atomic_read. It should
> @@ -164,6 +168,9 @@ struct CPURISCVState {
>       */
>      target_ulong mie_novirt;
>      target_ulong mstatus_novirt;
> +#ifdef TARGET_RISCV32
> +    target_ulong mstatush_novirt;
> +#endif
>
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 353fc9a24a..55e20af6d9 100644
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
> index 0761191f11..8c80486dd0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -949,10 +949,17 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              if (riscv_cpu_virt_enabled(env)) {
>                  riscv_cpu_swap_hypervisor_regs(env);
>              }
> +#ifdef TARGET_RISCV32
> +            *env->mstatush = set_field(*env->mstatush, MSTATUS_MPV,
> +                                       riscv_cpu_virt_enabled(env));
> +            *env->mstatush = set_field(*env->mstatush, MSTATUS_MTL,
> +                                       riscv_cpu_force_hs_excep_enabled(env));
> +#else
>              *env->mstatus = set_field(*env->mstatus, MSTATUS_MPV,
>                                        riscv_cpu_virt_enabled(env));
>              *env->mstatus = set_field(*env->mstatus, MSTATUS_MTL,
>                                        riscv_cpu_force_hs_excep_enabled(env));
> +#endif
>
>              /* Trapping to M mode, virt is disabled */
>              riscv_cpu_set_virt_enabled(env, VIRT_OFF);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 47be4b1d42..b7d6d009dc 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -364,6 +364,25 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +#ifdef TARGET_RISCV32
> +static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = *env->mstatush;
> +    return 0;
> +}
> +
> +static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if ((val ^ *env->mstatush) & (MSTATUS_MPV)) {
> +        tlb_flush(env_cpu(env));
> +    }
> +
> +    *env->mstatush = val;

The unsupported bits need to be masked off before writing them in.

> +
> +    return 0;
> +}
> +#endif
> +
>  static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->misa;
> @@ -1095,6 +1114,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> index 5bcf5d2ff7..8dec1aee99 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -153,7 +153,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>          get_field(mstatus, MSTATUS_MPIE));
>      mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>      mstatus = set_field(mstatus, MSTATUS_MPP, 0);
> +#ifdef TARGET_RISCV32
> +    *env->mstatush = set_field(*env->mstatush, MSTATUS_MPV, 0);
> +#else
>      mstatus = set_field(mstatus, MSTATUS_MPV, 0);
> +#endif
>      *env->mstatus = mstatus;
>      riscv_cpu_set_mode(env, prev_priv);



