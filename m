Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B2DCAC587
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:23:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uxznx-0007YR-FV; Sun, 14 Sep 2025 23:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxznw-0007YC-2E
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:23:00 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxznr-0006ZN-Dr
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:22:59 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b0415e03e25so468025566b.0
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757906567; x=1758511367; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzSieYjn+YPZkmZiNqI7FYMauvbyqHoL0JIML4wB6mE=;
 b=Smy/cRogUi3Sr8EZqIBA48jIEmuG8y3pwP+5xr3TlWVpELy1c1j6oXMW1SeBrj4Q77
 liihhDTYKaLgjc9VwL5hbWRQF3oSGsa2m/qllUtqflVvGrSoiWmqtKQ5b/c+zFFtCWCT
 2SaYx+BqZOM6IKOZ2IOIht/nBOSv650c1Mb+W9CQEVCh6ZXj81H4b3uL8H0XFpds7gea
 NCHCgO2Dg7NbhGdcYx7qDg7uvmVec05CUmFSq9Qbcv12K+W3yhzzT6zWweRsI1MFqPl7
 QjaTqhyDTivWgKX/MQC09o5ug+wWAFHRrwPJw5bKXDCtJrbQvcZG1oXW5slWwa7UsX9n
 5+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757906567; x=1758511367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzSieYjn+YPZkmZiNqI7FYMauvbyqHoL0JIML4wB6mE=;
 b=euwANULJfQmd4vsaYmBYVEEU2kVmPmQH/OG9hGfPJaUW1Q3FnaX+0hRy4gw5AaIodn
 5u19ZYgz3TM3EsREZOoFaHsRuFk6EFbxrk9ZYhWM1h+DoQMXmUwSzHfFNiFlfABAGjVV
 SwW6XNqvV2akqd44pEg6mGbek9XDra++VhmN8IgnhBra7S1u8+4OaQxL39SmIn+kCVrG
 AE6Mz6JbWoQoInVo1CuB447ftPcbxFmzJqjoXlzhfsvRwcyD3WYo6R31K5gsNX6VJisJ
 RlitLOF8vktTmZpkUwCUzpfcNVtU9zVIlQSTKma3WXsW2j6EmvXogGGmGeIgd6jqSE2v
 bcRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX93+Rst/Bv7k5cACjGYiO7nyy+7G/74jveR6DnUM7n4AgLPvjTTLljbnHpaBKDF8+B3x6CK5l1q0BX@nongnu.org
X-Gm-Message-State: AOJu0Yy/9zU5fIKXNccWtgF8limjLX9TRilldK4X23oC+pqfO7PXHDfe
 XmBPjuoaTDOTb55AKAVJs1X1DfSDIf/KdmY8KGELLkgO1c67w28FvhG/rubMwXZ7SYvYuEElHI5
 jLN/9GZuJcMzlbl+cPVrwCZk2QYfrayk=
X-Gm-Gg: ASbGncszliIgu3hqKatJ+FipC1nos7ZCRZPqZAy9bCTGhcUeHLOFmzipxjzi73WsnLG
 0rxnpmktkSi2dLtohlWq/JnRvirSp8ZqjgmrwFg5+ljvDkBAaIxW98PBOaYq9O+EqF27ufds3Wz
 XP203r3RAPsQ3271gqYiRlnSvjBioH7abLYJgk7ZlaQZkOkLo3VfSOVdDsy+9Yar/npwjLB6Orw
 jyq64jRWPv58CDiWyW1LkFLNUQQzk8FYi1fLB6yDEzYNS+9
X-Google-Smtp-Source: AGHT+IEg9fXfrd6LEC5xpvEQE8K6yPhPebeJzaSee/Ewwz1SxIeQrcJMQvYfiXT0QG7P8ERIrsRPAeumk7dJXb/9LFs=
X-Received: by 2002:a17:907:3fa1:b0:b07:88aa:255b with SMTP id
 a640c23a62f3a-b07c354ed12mr1033337066b.11.1757906567408; Sun, 14 Sep 2025
 20:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250623172119.997166-1-dbarboza@ventanamicro.com>
 <20250623172119.997166-4-dbarboza@ventanamicro.com>
In-Reply-To: <20250623172119.997166-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:22:21 +1000
X-Gm-Features: Ac12FXznicl5WyEcFDEb1JqHtX700k4KZY25Q8IifBx3oEdzvx-3duVN2tLG2FY
Message-ID: <CAKmqyKMdio17PjxfRVUbF33Y0p2vk8SxFUCr0WXN_uSDE+25gA@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: print all available CSRs in
 riscv_cpu_dump_state()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 24, 2025 at 3:22=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment we're printing a small selection of CSRs. There's no
> particular reason to not print all of them.

The reason was that there are just so many and printing everything
makes it hard for people to read. So we just print the "main" ones and
people can then probe the more obscure ones they are interested in.

Do we actually want to print all of them?

>
> We're ignoring the note about CSR_SSTATUS being ommited because it can
> be read via CSR_MSTATUS. There's a huge list of CSRs that would fall in
> this category and it would be an extra burden to manage them, not
> mentioning having to document "we're not listing X because it's the same
> value as Y" to users.
>
> Remove 'dump_csrs' and use the existing 'csr_ops' array to print all
> available CSRs. Create two helpers in csr.c to identify FPU and VPU CSRs
> and skip them - they'll be printed in the FPU/VPU blocks later.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

The actual code looks fine though

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 55 ++++++++++++++++------------------------------
>  target/riscv/cpu.h |  2 ++
>  target/riscv/csr.c | 18 +++++++++++++++
>  3 files changed, 39 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 95d0b88937..ed1bf18625 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -544,44 +544,27 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE=
 *f, int flags)
>  #endif
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
>  #ifndef CONFIG_USER_ONLY
> -    {
> -        static const int dump_csrs[] =3D {
> -            CSR_MHARTID,
> -            CSR_MSTATUS,
> -            CSR_MSTATUSH,
> -            /*
> -             * CSR_SSTATUS is intentionally omitted here as its value
> -             * can be figured out by looking at CSR_MSTATUS
> -             */
> -            CSR_HSTATUS,
> -            CSR_VSSTATUS,
> -            CSR_MIP,
> -            CSR_MIE,
> -            CSR_MIDELEG,
> -            CSR_HIDELEG,
> -            CSR_MEDELEG,
> -            CSR_HEDELEG,
> -            CSR_MTVEC,
> -            CSR_STVEC,
> -            CSR_VSTVEC,
> -            CSR_MEPC,
> -            CSR_SEPC,
> -            CSR_VSEPC,
> -            CSR_MCAUSE,
> -            CSR_SCAUSE,
> -            CSR_VSCAUSE,
> -            CSR_MTVAL,
> -            CSR_STVAL,
> -            CSR_HTVAL,
> -            CSR_MTVAL2,
> -            CSR_MSCRATCH,
> -            CSR_SSCRATCH,
> -            CSR_SATP,
> -        };
> +    for (i =3D 0; i < ARRAY_SIZE(csr_ops); i++) {
> +        int csrno =3D i;
>
> -        for (i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> -            riscv_dump_csr(env, dump_csrs[i], f);
> +        /*
> +         * Early skip when possible since we're going
> +         * through a lot of NULL entries.
> +         */
> +        if (csr_ops[csrno].predicate =3D=3D NULL) {
> +            continue;
>          }
> +
> +        /*
> +         * FPU and VPU CSRs will be printed in the
> +         * CPU_DUMP_FPU/CPU_DUMP_VPU blocks later.
> +         */
> +        if (riscv_csr_is_fpu(csrno) ||
> +            riscv_csr_is_vpu(csrno)) {
> +            continue;
> +        }
> +
> +        riscv_dump_csr(env, csrno, f);
>      }
>  #endif
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4a862da615..ecdf709c2d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -967,6 +967,8 @@ bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
>
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> +bool riscv_csr_is_fpu(int csrno);
> +bool riscv_csr_is_vpu(int csrno);
>
>  extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6296ecd1e1..229257b31b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -5799,6 +5799,24 @@ static RISCVException write_jvt(CPURISCVState *env=
, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +bool riscv_csr_is_fpu(int csrno)
> +{
> +    if (!csr_ops[csrno].predicate) {
> +        return false;
> +    }
> +
> +    return csr_ops[csrno].predicate =3D=3D fs;
> +}
> +
> +bool riscv_csr_is_vpu(int csrno)
> +{
> +    if (!csr_ops[csrno].predicate) {
> +        return false;
> +    }
> +
> +    return csr_ops[csrno].predicate =3D=3D vs;
> +}
> +
>  /*
>   * Control and Status Register function table
>   * riscv_csr_operations::predicate() must be provided for an implemented=
 CSR
> --
> 2.49.0
>
>

