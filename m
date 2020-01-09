Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipNZY-0007fx-Gn
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 21:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipNZR-0007bO-HZ
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipNZP-0007Ll-6v
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39289)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipNZO-0007Kd-VQ
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:11 -0500
Received: by mail-pf1-x443.google.com with SMTP id q10so2585896pfs.6
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 18:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=OJpwUxUV10+vYr6gKA66GfXYLyKZRcdceafVK3pMzf4=;
 b=uPaKxCIpLMrk1B1WrHhkLmamcqi1KwRR/nIl6ofwPRCvC434ssobdaa9EPjpjFLUYe
 R6xplOu7d8/pLGVrObtCzY5CDobE23AZeM8m39gHtc4LrEAZajsJXiA/DZw9ImWnKXoH
 GhdPVYCzQRiClg01jzY6+IVkkbJnQdL9usfmZVwpp4umBDKZdqAiOw7YXSULtD3X+0Tj
 Pz52eaLWLzglgFuyAiAd0IyLKSSfMLPUqxgzHqK1fp8BgOrgLnD16BWxwOuY+xc9+Nz/
 d6taNTqszSArQw7vSFYPu0ePEA8Ord4uOHnTwX1K3oda+9xc/YZEAA4fqO1E7jaCRUfu
 wMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=OJpwUxUV10+vYr6gKA66GfXYLyKZRcdceafVK3pMzf4=;
 b=fWNbU77aL/Iu5HbgXhuhoKGWCQ/f3/3tQEN/GMTW5eB2BHC5rBm2gMrYlPdn4o+9+Q
 i0VPkDBAL7TNkhT2L4Fx1jkgg5uJuLB1JDCV1JQBLUxXhou1IZFVm7RFeDjpeHYEJRSZ
 FBZFuDGbOmjKhNHTulWZzaiFKtxfNvVI0w+U2XeUed4XRUlixJkt1XCUKJ/T/4dyQd1I
 Jn4hsjUVahgKbmOIGQJePNfUoREmZe0VvQc8Zeo296P7eHRmXGuWhpZ94xF/q01mpTrC
 cOei87qilReMZJZSBQ0+n2TG8WAa0yokORNF4mOUwX8g7gpRzOkJqxlRctC/wzyOZGt4
 QdGg==
X-Gm-Message-State: APjAAAWuw0bPWZoD8mebGS1XXloQ+8NkOELnwx6otKFosvo+gg8lab3I
 uUrLUqgnttVC2OLRUYzKMfvzBg==
X-Google-Smtp-Source: APXvYqx+Hk9fT5wt6feQ3aa/ekhsI6vr5lF2BIrfp05Gw9rGN0TpNJDpDqSnA+R3d/qZaRLp7JbNNA==
X-Received: by 2002:a62:33c6:: with SMTP id z189mr8699089pfz.246.1578536949965; 
 Wed, 08 Jan 2020 18:29:09 -0800 (PST)
Received: from localhost (189.8.197.35.bc.googleusercontent.com.
 [35.197.8.189])
 by smtp.gmail.com with ESMTPSA id a6sm4847000pgg.25.2020.01.08.18.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 18:29:09 -0800 (PST)
Date: Wed, 08 Jan 2020 18:29:09 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 18:29:00 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 34/36] target/riscv: Add support for the 32-bit
 MSTATUSH CSR
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <2c161240299cf0f78fe676ec6b1c59e94203c324.1575914822.git.alistair.francis@wdc.com>
References: <2c161240299cf0f78fe676ec6b1c59e94203c324.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-ed859073-c5ab-407c-a322-480fee5a730d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Thu, 09 Jan 2020 02:29:19 -0000

On Mon, 09 Dec 2019 10:12:09 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  6 ++++++
>  target/riscv/cpu.h        |  7 +++++++
>  target/riscv/cpu_bits.h   |  3 +++
>  target/riscv/cpu_helper.c |  7 +++++++
>  target/riscv/csr.c        | 25 +++++++++++++++++++++++++
>  target/riscv/op_helper.c  |  4 ++++
>  6 files changed, 52 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e61cf46a73..ac8f53a49d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -237,6 +237,9 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", *env->mstatus);
> +#ifdef TARGET_RISCV32
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ", *env->mstatush);
> +#endif
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
> @@ -473,6 +476,9 @@ static void riscv_cpu_init(Object *obj)
>
>  #ifndef CONFIG_USER_ONLY
>      env->mstatus = &env->mstatus_novirt;
> +# ifdef TARGET_RISCV32
> +    env->mstatush = &env->mstatush_novirt;
> +# endif
>  #endif
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b411a1f900..84a07971dc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -127,6 +127,10 @@ struct CPURISCVState {
>
>      target_ulong mip;
>
> +#ifdef TARGET_RISCV32
> +    target_ulong *mstatush;
> +#endif
> +
>      uint32_t miclaim;
>
>      target_ulong mie;
> @@ -153,6 +157,9 @@ struct CPURISCVState {
>       * required to handle the Hypervisor register swapping.
>       */
>      target_ulong mstatus_novirt;
> +#ifdef TARGET_RISCV32
> +    target_ulong mstatush_novirt;
> +#endif
>
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
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
> index aa033b8590..c2ad0bbce7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -938,10 +938,17 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
>              mtval2 = env->guest_phys_fault_addr;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d028dfb60b..b28058f9d5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -372,6 +372,27 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
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
> +    val &= MSTATUS_MPV | MSTATUS_MTL;
> +
> +    *env->mstatush = val;
> +
> +    return 0;
> +}
> +#endif
> +
>  static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->misa;
> @@ -1215,6 +1236,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
> index e5128570e6..a0a631d722 100644
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

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

