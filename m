Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iPQEE-0004j5-J1
	for mharc-qemu-riscv@gnu.org; Tue, 29 Oct 2019 08:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iPQEB-0004gq-7l
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2019 08:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iPQE9-0001W2-58
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2019 08:03:58 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iPQE8-0001VB-VI
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2019 08:03:57 -0400
Received: by mail-wm1-x341.google.com with SMTP id 11so2303349wmk.0
 for <qemu-riscv@nongnu.org>; Tue, 29 Oct 2019 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=1EfezWfQS4/maBDvfQ+2CoBQC3UGh2pF5F3aMbBn1QI=;
 b=PnSairzH1S+bowlIRuciH6B+PnCNEx3ue5Xb9BJdl1WYM3c9W9XZeC8NbIkYWWlgDf
 b5hHFVyZ+aAdJ60AIIModUY+7LU31wXbsBLGz/KHBQCPhzIjuhaLqzx3FsA7GPzSrs3R
 XyuwJcgXdv5/bClkfhEqqar/KeSPe5b4OrAJxBp3BIvQw8ktMjH0BUypV5La972vnz/q
 uHvuCQC8zpTw5gqRgpa4CIMwwoM19OrTVJ1yWXevQjzRVvzhnrQ7D3cPGFhOwIKdl1mw
 RONb2x/R1krKWBzVF9LDA+nV/V51sjq9C8ks1weyjO7PUAejOuo62XLffad+juuF+2mU
 AomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=1EfezWfQS4/maBDvfQ+2CoBQC3UGh2pF5F3aMbBn1QI=;
 b=tauo6EXiHCMQhJndYNNLoya/XT8bUR4TDIh/4CHT2ZbYuiF1dU9wSC5ThvdFXK3+2U
 mLCMP4Da2EiY7PsKSpBh7eYdqvfEI00Dh1/5jWCE2OIwxb2pshE+hC9VoZn5959tc0w9
 PnDC1TqgaEMPbGxbQHCLPADYhnq5uXlpwZBs9Vuu3eH0YYnfkqHiHvEZa4OkxNBqSDLD
 +TLhBbmQPfKeG6E7lFgZzoTuPlrU2nZ8oTyB8SJcvufJfjje64GPqdJRH6tY8yKgubpJ
 Xniimn6oC6jUokCLZdfiY7i1NHnk7UWi1cyhzjsrO6Alpvao1shj/omuvlvqfhI3bePW
 EMdg==
X-Gm-Message-State: APjAAAXTlEc6SbjUWKJ4EcDdT0SMONuL+W+WO17IhrETjoanHR1Eszg9
 4phkFWJkPsS2pbglL669YZg8bf+jWLQ=
X-Google-Smtp-Source: APXvYqwhNaqfwi40GOPvYkm6XVWISVSV0KEQ6/cwQcSUCE2F/1j6Wo7+POOr7hGWA+R6cVa2AJoY4A==
X-Received: by 2002:a1c:9601:: with SMTP id y1mr3608867wmd.157.1572350633108; 
 Tue, 29 Oct 2019 05:03:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i3sm14863366wrw.69.2019.10.29.05.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 05:03:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA1751FF87;
 Tue, 29 Oct 2019 12:03:50 +0000 (GMT)
References: <34350af3b53fadc50bfe4f1fbc452c7d3a8fe8f7.1570572202.git.alistair.francis@wdc.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@sifive.com,
 alistair.francis@wdc.com
Subject: Re: [PATCH v1 1/1] target/riscv: Remove atomic accesses to MIP CSR
In-reply-to: <34350af3b53fadc50bfe4f1fbc452c7d3a8fe8f7.1570572202.git.alistair.francis@wdc.com>
Date: Tue, 29 Oct 2019 12:03:50 +0000
Message-ID: <87v9s792s9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 29 Oct 2019 12:04:01 -0000


Alistair Francis <alistair.francis@wdc.com> writes:

> Instead of relying on atomics to access the MIP register let's update
> our helper function to instead just lock the IO mutex thread before
> writing. This follows the same concept as used in PPC for handling
> interrupts
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Generally anything that can trigger an IRQ or IO type activity should be
locking with the BQL. MMIO accesses are automatically locked by the
memory sub-system but you need to take special care with system
registers that have cross vCPU effects.

> ---
>  target/riscv/cpu.c        |  5 ++--
>  target/riscv/cpu.h        |  9 --------
>  target/riscv/cpu_helper.c | 48 +++++++++++++++------------------------
>  target/riscv/csr.c        |  2 +-
>  4 files changed, 21 insertions(+), 43 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f13e298a36..e09dd7aa23 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -224,8 +224,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ",
> -                 (target_ulong)atomic_read(&env->mip));
> +    qemu_fprintf(f, " %s 0x%x\n", "mip     ", env->mip);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
> @@ -275,7 +274,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
>       * Definition of the WFI instruction requires it to ignore the privi=
lege
>       * mode and delegation registers, but respect individual enables
>       */
> -    return (atomic_read(&env->mip) & env->mie) !=3D 0;
> +    return (env->mip & env->mie) !=3D 0;
>  #else
>      return true;
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 124ed33ee4..a71473b243 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -121,15 +121,6 @@ struct CPURISCVState {
>      target_ulong mhartid;
>      target_ulong mstatus;
>
> -    /*
> -     * CAUTION! Unlike the rest of this struct, mip is accessed asynchon=
ously
> -     * by I/O threads. It should be read with atomic_read. It should be =
updated
> -     * using riscv_cpu_update_mip with the iothread mutex held. The ioth=
read
> -     * mutex must be held because mip must be consistent with the CPU in=
turrept
> -     * state. riscv_cpu_update_mip calls cpu_interrupt or cpu_reset_inte=
rrupt
> -     * wuth the invariant that CPU_INTERRUPT_HARD is set iff mip is non-=
zero.
> -     * mip is 32-bits to allow atomic_read on 32-bit hosts.
> -     */
>      uint32_t mip;
>      uint32_t miclaim;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 87dd6a6ece..4334978c2e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -19,6 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "tcg-op.h"
> @@ -38,7 +39,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *e=
nv)
>  {
>      target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
>      target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
> -    target_ulong pending =3D atomic_read(&env->mip) & env->mie;
> +    target_ulong pending =3D env->mip & env->mie;
>      target_ulong mie =3D env->priv < PRV_M || (env->priv =3D=3D PRV_M &&=
 mstatus_mie);
>      target_ulong sie =3D env->priv < PRV_S || (env->priv =3D=3D PRV_S &&=
 mstatus_sie);
>      target_ulong irqs =3D (pending & ~env->mideleg & -mie) |
> @@ -92,42 +93,29 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_=
t interrupts)
>      }
>  }
>
> -struct CpuAsyncInfo {
> -    uint32_t new_mip;
> -};
> -
> -static void riscv_cpu_update_mip_irqs_async(CPUState *target_cpu_state,
> -                                            run_on_cpu_data data)
> -{
> -    struct CpuAsyncInfo *info =3D (struct CpuAsyncInfo *) data.host_ptr;
> -
> -    if (info->new_mip) {
> -        cpu_interrupt(target_cpu_state, CPU_INTERRUPT_HARD);
> -    } else {
> -        cpu_reset_interrupt(target_cpu_state, CPU_INTERRUPT_HARD);
> -    }
> -
> -    g_free(info);
> -}
> -
>  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t val=
ue)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      CPUState *cs =3D CPU(cpu);
> -    struct CpuAsyncInfo *info;
> -    uint32_t old, new, cmp =3D atomic_read(&env->mip);
> +    uint32_t old =3D env->mip;
> +    bool locked =3D false;
> +
> +    if (!qemu_mutex_iothread_locked()) {
> +        locked =3D true;
> +        qemu_mutex_lock_iothread();
> +    }
>
> -    do {
> -        old =3D cmp;
> -        new =3D (old & ~mask) | (value & mask);
> -        cmp =3D atomic_cmpxchg(&env->mip, old, new);
> -    } while (old !=3D cmp);
> +    env->mip =3D (env->mip & ~mask) | (value & mask);
>
> -    info =3D g_new(struct CpuAsyncInfo, 1);
> -    info->new_mip =3D new;
> +    if (env->mip) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
>
> -    async_run_on_cpu(cs, riscv_cpu_update_mip_irqs_async,
> -                     RUN_ON_CPU_HOST_PTR(info));
> +    if (locked) {
> +        qemu_mutex_unlock_iothread();
> +    }
>
>      return old;
>  }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f767ad24be..db0cc6ef55 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -579,7 +579,7 @@ static int rmw_mip(CPURISCVState *env, int csrno, tar=
get_ulong *ret_value,
>      if (mask) {
>          old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
>      } else {
> -        old_mip =3D atomic_read(&env->mip);
> +        old_mip =3D env->mip;
>      }
>
>      if (ret_value) {


--
Alex Benn=C3=A9e

