Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzZbM-00043J-VW
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 02:30:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZbH-00041W-IF; Tue, 21 Dec 2021 02:30:21 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=44642
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZbG-0004eY-2P; Tue, 21 Dec 2021 02:30:19 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id q74so36058262ybq.11;
 Mon, 20 Dec 2021 23:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xoKN0sh9lCpiFkWkAPCFiVoexWA3jULDnjQPgjyjq0=;
 b=qQZIpHOofRpJ/VBOSMW6OUmde4kqIJz+vtvZUbiosBIOVHAnxEjwlCn2y/6ikYRN2j
 fMGAhkxHvbHgp3k+M4iVHbPRiNgkrA74TiaBXi6bJthVP9jq5llMBfnUhLpfZNltW2RI
 kOcohpedRl2AcdTAjGJjBcIHy+vgSEMQ2V4VvCoFSSORil7b5Aks7pnF70oQP/WzL6lx
 N+RAsrareXGDB+bMumNQXSNccEPt9j6l7oR+oyur4828b0yoL8yxLPC4NXES5zThaL6N
 2BLt5AEJQyZ6Yi0qxedIfmHIMPYbq1qMSrSpNDjGrtf6Rq7FHgeCHFx9ML72K7xPMhDe
 2odA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xoKN0sh9lCpiFkWkAPCFiVoexWA3jULDnjQPgjyjq0=;
 b=11Run9yNVRw5qctUUE2Xz2oVGFqTyxVWjfpo6R/SCLiHNNxfAQFQgX6pRFY2PU1ccu
 lH1a0d84s+U6kgySURBEhdGCICNq+F0dkYT7AEKPPOjPjnTrmOHQ49fXmOzaqa8PibAr
 mqI5JEFjRBVSrt3SJux+43cT6rlZ0S30+RrE7yftSWbBmY/aKFhv1csQ0aqAGwedYQ7H
 LOBdsXLbpXyyRe6MwrYgPXXeFWGxph9fII6h69Zg9Ih0J8UNo8vbQoeA6izsWNwoYh/m
 1QuDrX0Tb4YsQhyhVTnbfwERjW28D4qiXcs4hOuXnararQ4F9Mfj/jKaqbDsxZdSSQXR
 Yq0g==
X-Gm-Message-State: AOAM532r5ozTPjjUV7EOQuNHyslqqzuRvrEu22E4AdyRi721B112rVVm
 Vl7d+BoHJbl7rB1G327ma+FvJvcEcacWQPOwGz8=
X-Google-Smtp-Source: ABdhPJy6HNErM+2jM8iYzhuF3xHJpXnuO2Ac4tYNiXBMh4FC9cEiIUND2a3Q/lI6wIFIkZjFPcfiqqhD/42xE4749tA=
X-Received: by 2002:a25:c783:: with SMTP id w125mr2554349ybe.622.1640071816844; 
 Mon, 20 Dec 2021 23:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Dec 2021 15:30:05 +0800
Message-ID: <CAEUhbmU7Z7sbgE934=R+UV3XvOjoG5hOC_DqA7OscRLppcAtSw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/riscv: Fixup setting GVA
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Dec 2021 07:30:21 -0000

On Mon, Dec 20, 2021 at 2:49 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> In preperation for adding support for the illegal instruction address

typo: preparation

> let's fixup the Hypervisor extension setting GVA logic and improve the
> variable names.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..9e1f5ee177 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -967,6 +967,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> +    bool write_gva = false;
>      uint64_t s;
>
>      /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
> @@ -975,7 +976,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
>      target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
>      target_ulong deleg = async ? env->mideleg : env->medeleg;
> -    bool write_tval = false;
>      target_ulong tval = 0;
>      target_ulong htval = 0;
>      target_ulong mtval2 = 0;
> @@ -1004,7 +1004,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_INST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_PAGE_FAULT:
>          case RISCV_EXCP_STORE_PAGE_FAULT:
> -            write_tval  = true;
> +            write_gva = true;
>              tval = env->badaddr;
>              break;
>          default:
> @@ -1041,18 +1041,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          if (riscv_has_ext(env, RVH)) {
>              target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
>
> -            if (env->two_stage_lookup && write_tval) {
> -                /*
> -                 * If we are writing a guest virtual address to stval, set
> -                 * this to 1. If we are trapping to VS we will set this to 0
> -                 * later.
> -                 */
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 1);
> -            } else {
> -                /* For other HS-mode traps, we set this to 0. */
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
> -            }
> -
>              if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) {
>                  /* Trap to VS mode */
>                  /*
> @@ -1063,7 +1051,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                      cause == IRQ_VS_EXT) {
>                      cause = cause - 1;
>                  }
> -                env->hstatus = set_field(env->hstatus, HSTATUS_GVA, 0);
> +                write_gva = false;
>              } else if (riscv_cpu_virt_enabled(env)) {
>                  /* Trap into HS mode, from virt */
>                  riscv_cpu_swap_hypervisor_regs(env);
> @@ -1072,6 +1060,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
>                                           riscv_cpu_virt_enabled(env));
>
> +
>                  htval = env->guest_phys_fault_addr;
>
>                  riscv_cpu_set_virt_enabled(env, 0);
> @@ -1079,7 +1068,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  /* Trap into HS mode */
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
>                  htval = env->guest_phys_fault_addr;
> +                write_gva = false;
>              }
> +            env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);

This does not look correct to me.

The env->hstatus[GVA] should remain untouched in the 2nd and 3rd
branch. It only needs to be set in the first branch.

>          }
>
>          s = env->mstatus;

Regards,
Bin

