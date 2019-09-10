Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7hRT-0000Sp-TP
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 10:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRD-0000Nn-TD
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRC-0006Q9-GD
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43500)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7hRC-0006Pg-Ad
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so16146345wrx.10
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 07:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WH1RsL+ZdVST+XzQbljMHQiP6aO83DLlrXgF51Tok1Q=;
 b=mIxRMktWcuWTAVV7Zn/cdLjKnhegROk3YznGFdWO3R0nNPd+NaI2s8wLjReTZlaK7R
 f/iPJxFdDy3zS5nYa2dKxsvkJTK8l0QBiSVi8RY/MuBe789QqsPadyqUiG6x/eBTGOlH
 3bFUUHf5h0L+aLH29wUe1HxibPPBWGQq8b6i6w5Fo4rbj1K7kZV5T5RxbaisCG8oO77z
 WfyojEnHBI8kgz0aAqSBStbD0ob5YLjImI1X5vugLt3abpwkK+GbJla1sZKpIC+5KAwV
 H6YbdlQgGiWHghr+xN5p3TlM3tuk1gri+v8bukSloTvzcAGypEBlti6Y5BtSpBVR7Bz5
 F+sw==
X-Gm-Message-State: APjAAAWEoX9GAxkFVW+Srq72mNuJE/zfZCDDqu9p7MjuuFytb5puCqA/
 XRicIGgy05Y+Rox9Hrl8UOi17A==
X-Google-Smtp-Source: APXvYqy0ERn8EWjnKJ+uVA3LC+L1HtJOv1RwmuEivZgZtzMDHMyefIKZQ49uutQWMDqP9QZNVmBwUQ==
X-Received: by 2002:a5d:5606:: with SMTP id l6mr3720814wrv.108.1568126889190; 
 Tue, 10 Sep 2019 07:48:09 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id k9sm34089428wrd.7.2019.09.10.07.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:48:08 -0700 (PDT)
Date: Tue, 10 Sep 2019 07:48:08 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 07:44:11 PDT (-0700)
In-Reply-To: <47e7fd90ce1d2373824799274376b29d751d56c3.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-a0b8f877-5b70-413f-8f5f-5912f49ffcfd@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [PATCH v1 07/28] target/riscv: Dump Hypervisor
 registers if enabled
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
X-List-Received-Date: Tue, 10 Sep 2019 14:48:13 -0000

On Fri, 23 Aug 2019 16:38:07 PDT (-0700), Alistair Francis wrote:
> Dump the Hypervisor registers and the current Hypervisor state.
>
> While we are editing this code let's also dump stvec and scause.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f13e298a36..be8f643fc2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -220,18 +220,52 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      CPURISCVState *env = &cpu->env;
>      int i;
>
> +#if !defined(CONFIG_USER_ONLY)
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
> +    }
> +#endif
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "bstatus ", env->vsstatus);
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ",
>                   (target_ulong)atomic_read(&env->mip));
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsip    ",
> +                     (target_ulong)atomic_read(&env->vsip));
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsie    ", env->vsie);
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstvec);
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsepc);
> +    }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
> +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
> +    if (riscv_has_ext(env, RVH)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
> +    }
>  #endif
>
>      for (i = 0; i < 32; i++) {

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

