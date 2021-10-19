Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcxLY-0003El-Jv
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 18:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxLW-0003Cx-Rj; Tue, 19 Oct 2021 18:12:34 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:41568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxLU-0002Tm-Cj; Tue, 19 Oct 2021 18:12:33 -0400
Received: by mail-il1-x136.google.com with SMTP id l7so6673357iln.8;
 Tue, 19 Oct 2021 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4S16KQ5HC+kE///LvCFZHKGwhRBCMWMDD+Ii2HEdibc=;
 b=jGiDBnt+zp+RKeiaDT2sl8IJ5Wj/rzj2JPMfJWkSskRDH12NR8SmVLXpygPqTn7nAe
 gYfhIDNgBjxclD0JM2jDJQ8HDQbtuVPvaMWH90nPfWpGtIjJO/bJ0Wi6JSsjhqER/L59
 VfhYnSYJkNzxKbGXUoaAF/JH4/Yk2a/rTbex2ZA4cn8+nDmFulzY7pf/BAkEZw6mjMBq
 s16dYwpl0O7OXvhHGTKSSsT/upE7qkOEMfXXewRpRIxdvkgSSCwK9gvAWIjdIlFiNbXK
 4WXa5LolBEhD3a3pv69riRDBQJqESmaHO0VE0d9BNKvGenqLCXOPuzp+HK2thewqKOck
 mALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4S16KQ5HC+kE///LvCFZHKGwhRBCMWMDD+Ii2HEdibc=;
 b=kQZ583Y3iTESDPrjRbVd84Mstzt6yrfosZHnFnzu3PQV1VU7e60z3VCIfbYlFKQ/Ac
 mUHphgpgUvYQ7gOdTnvj9ZddCmJUVMJohEt2gvI+8exTlF0bpQ+CL2CVxFAH7wE8daNv
 3YbLaSE75a44Trz8xBou3n6uKvrddihUgxUVrqPZcOKomVS9hkdJttEohD0GN1pfnzDy
 KfLjuAvN+Zgt8Z+RmXFZ0lvgZ3P7vs6UTNKBsjjYbgqlmi0/P3Sc9OrZJPJvso0gZga5
 EtaH7BCF2cwvRb3EWGrlOUhDdRzkavo4URNgZj8LF6JH3NAZ4i8e4E4ehhbqLut4+Ffb
 1W9g==
X-Gm-Message-State: AOAM531pp5mRa9MwqfMfE2bl9XZ1qoS9CeurK1eGLbe+LZR/FCtsWnn+
 IWezw76Kp1ZyEWs7yuTn+YZJ+6CPxTlG0F4jPcM=
X-Google-Smtp-Source: ABdhPJwG/VHzhvsBDt5hn/MDpLK1LQhrAZcgwPkKA/ITjPg3XPSQy3Ww6ASiygt6+2cl+FEPM0f0RoS+dMl7/sSUYRc=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr21057445ilv.290.1634681550760; 
 Tue, 19 Oct 2021 15:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211019152438.269077-1-richard.henderson@linaro.org>
 <20211019152438.269077-16-richard.henderson@linaro.org>
In-Reply-To: <20211019152438.269077-16-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 08:12:04 +1000
Message-ID: <CAKmqyKNiXJvy-W+rtT306CG1qWsqpM2=mJ9nK66tHhbcj3fGZg@mail.gmail.com>
Subject: Re: [PATCH v5 15/16] target/riscv: Use riscv_csrrw_debug for cpu_dump
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 22:12:35 -0000

On Wed, Oct 20, 2021 at 2:50 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the official debug read interface to the csrs,
> rather than referencing the env slots directly.
> Put the list of csrs to dump into a table.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 90 +++++++++++++++++++++++-----------------------
>  1 file changed, 46 insertions(+), 44 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f352c2b74c..3454b19c17 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -241,52 +241,54 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      }
>  #endif
>      qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n", "pc", env->pc);
> +
>  #ifndef CONFIG_USER_ONLY
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
> -                     (target_ulong)(env->mstatus >> 32));
> +    {
> +        static const int dump_csrs[] = {
> +            CSR_MHARTID,
> +            CSR_MSTATUS,
> +            CSR_MSTATUSH,
> +            CSR_HSTATUS,
> +            CSR_VSSTATUS,
> +            CSR_MIP,
> +            CSR_MIE,
> +            CSR_MIDELEG,
> +            CSR_HIDELEG,
> +            CSR_MEDELEG,
> +            CSR_HEDELEG,
> +            CSR_MTVEC,
> +            CSR_STVEC,
> +            CSR_VSTVEC,
> +            CSR_MEPC,
> +            CSR_SEPC,
> +            CSR_VSEPC,
> +            CSR_MCAUSE,
> +            CSR_SCAUSE,
> +            CSR_VSCAUSE,
> +            CSR_MTVAL,
> +            CSR_STVAL,
> +            CSR_HTVAL,
> +            CSR_MTVAL2,
> +            CSR_MSCRATCH,
> +            CSR_SSCRATCH,
> +            CSR_SATP,
> +        };
> +
> +        for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> +            int csrno = dump_csrs[i];
> +            target_ulong val = 0;
> +            RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> +
> +            /*
> +             * Rely on the smode, hmode, etc, predicates within csr.c
> +             * to do the filtering of the registers that are present.
> +             */
> +            if (res == RISCV_EXCP_NONE) {
> +                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
> +                             csr_ops[csrno].name, val);
> +            }
> +        }
>      }
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> -                     (target_ulong)env->vsstatus);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hedeleg);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstvec);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsepc);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
> -    if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
> -    }
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
>  #endif
>
>      for (i = 0; i < 32; i++) {
> --
> 2.25.1
>
>

