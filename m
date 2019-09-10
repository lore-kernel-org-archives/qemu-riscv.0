Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7gRC-0002rb-40
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 09:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7gR9-0002ql-J2
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:44:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7gR8-0001si-Gp
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:44:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7gR8-0001sC-BR
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:44:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id a11so10614646wrx.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 06:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/4OkgJziaKwjIQFzG61gd7GlNf0TQErMlPLfvfJBuoU=;
 b=KapDZ36dl1VfLSYAvVL53Wwap7LMwEqrhmUCEp1NHLwm4xUKB539391X64IocpNR9c
 arIkJouraZ8t67tMIIBysFuldzh8pEsyn+21Fm1ahX3OeRQKbXy6dfDDxfztKabm/ETz
 EMBLWYgu7HAXTipDgfjFwMKiPXXOlvLqp9WwlfSo11kfm+q4HjfTafSLaRvKGMd8P7wT
 SZKMFXtbhosWB+I6xuPudTSebF2kJhXvmnSxqEVRI3aSzmda0f/qRtAuzMvgemKgJKcT
 Moea2AsTAYdO8R4v6MNWNXeM1ZvTnXiVivKHo/H1XM/tW1o0A3X1Ai92cyEWPEN+WXne
 ckBA==
X-Gm-Message-State: APjAAAV2o4/BZCJaX+nK8oNkjOZO3EVVKv43RXc0JbCvJ3bhRZwqO1m3
 djF+pfSSabidnIWzect4DrBmC/pym9hvHg==
X-Google-Smtp-Source: APXvYqzFm1inD8iIEtQMYvPUUMEDyLzVo3O0qet6aRUzVDTDPMtzevPhc00peXbUjZOAKnldQbZ54w==
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr17677790wrs.223.1568123041069; 
 Tue, 10 Sep 2019 06:44:01 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id q15sm3003818wmb.28.2019.09.10.06.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 06:44:00 -0700 (PDT)
Date: Tue, 10 Sep 2019 06:44:00 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 06:22:25 PDT (-0700)
In-Reply-To: <1c1d359caa6633349158debc38e07156a10b63e8.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-9017291b-1ed2-4cea-ab34-03825a8c8a8c@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [PATCH v1 02/28] target/riscv: Add the
 virtulisation mode
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
X-List-Received-Date: Tue, 10 Sep 2019 13:44:04 -0000

On Fri, 23 Aug 2019 16:37:54 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  4 ++++
>  target/riscv/cpu_bits.h   |  6 ++++++
>  target/riscv/cpu_helper.c | 23 +++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7f54fb8c87..0ef1ecb0e0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -117,6 +117,8 @@ struct CPURISCVState {
>
>  #ifndef CONFIG_USER_ONLY
>      target_ulong priv;
> +    /* This contains QEMU specific information about the virt state. */
> +    target_ulong virt;
>      target_ulong resetvec;
>
>      target_ulong mhartid;
> @@ -257,6 +259,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
> +bool riscv_cpu_virt_enabled(CPURISCVState *env);
> +void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index e99834856c..1fbde516be 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -422,6 +422,12 @@
>  #define PRV_H 2 /* Reserved */
>  #define PRV_M 3
>
> +/* Virtulisation modes */
> +#define VIRT_OFF            0
> +#define VIRT_ON             1
> +#define VIRT_MODE_SHIFT     0
> +#define VIRT_MODE_MASK      (1 << VIRT_MODE_SHIFT)
> +
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
>  #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 225e407cff..7b0bb14c01 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -81,6 +81,29 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>      return false;
>  }
>
> +bool riscv_cpu_virt_enabled(CPURISCVState *env)
> +{
> +    bool tmp;
> +
> +    if (!riscv_has_ext(env, RVH)) {
> +        return false;
> +    }
> +
> +    tmp = (env->virt & VIRT_MODE_MASK) >> VIRT_MODE_SHIFT;
> +
> +    return tmp == VIRT_ON;
> +}

extract64() is a bit cleaner.

> +
> +void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
> +{
> +    if (!riscv_has_ext(env, RVH)) {
> +        return;
> +    }
> +
> +    env->virt &= ~VIRT_MODE_MASK;
> +    env->virt |= enable << VIRT_MODE_SHIFT;
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env = &cpu->env;

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

