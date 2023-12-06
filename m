Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54576C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:25:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAfip-0006gD-Gp; Tue, 05 Dec 2023 19:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfin-0006YS-A1; Tue, 05 Dec 2023 19:25:01 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAfil-0008Po-BU; Tue, 05 Dec 2023 19:25:00 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso8000620a12.1; 
 Tue, 05 Dec 2023 16:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701822297; x=1702427097; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWScdywkfFb76Vj2EMKdAjVcWPxLAaI8Mm5VbIFOUMc=;
 b=MXz+HndmyPepCkWF+3uoALDcQvcx9Xyf2ydU724OfJJrwnbzGEuZNXcOzAWa3kpXrl
 mow3lVJnuNrZcak5eGr6vu6BTdQOocT7IwoQO1k4h8xOvjvvYprKhZu7VzO4+uBwr6oG
 frGDGYrl/b663Tl/ARj0y1JXId9TKENiXMKw4VwZlhKwnrKtU0KHrlwzvixyZyEmwUNW
 HarDW2mADB6JAZp6gyVMHQ1bTWL9ux6PkqWz2fdASk+BWfHNDAB0YDvyj1X7HGTAG555
 R2KjvL0Gzl5P5eq/bP4WKObvGCG1Da3i0vpzB07mVbRdNv10y05WB1fFneHJ8Afn/MLT
 MmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701822297; x=1702427097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWScdywkfFb76Vj2EMKdAjVcWPxLAaI8Mm5VbIFOUMc=;
 b=k4b/xOp/EoI6W8PjRPqBPD2XsIlTS1Zyvt5avf+BCdXKoSzQsfFhKNMzIoPT69Xtyq
 AWruvpKzGkUi05u5R7RfdbGz4dDtGoGTCCDGjhXZ9V9tRXyB9SQxquGLUnZdNzz+sMQz
 V7gRh0MfSGc7Xic2zKAYO3xOqXfsTiUT0EXCpVcn3IDrCpcBsZIhHMytK1goi5cQgB7M
 orJlT0BMC0BG7/qk6jIUC4cbCl7807aTqbjFTK6UfmygkCgKORpYEnGMuNYL2lcV8rwn
 Nf1vrSOJLQbXUn+6ukGCM6rlBRSq03tcm5+0OsSrsSBm6vyopMOuDByeG6BNwk8lPBAF
 BW1Q==
X-Gm-Message-State: AOJu0YyCVf1cT3jt7v+xKn97nZGI8nT3i9a8OItGjUT6prfOphKiinn8
 nr0hKs+a+KK0lAkjLYly6KZ++X3B0SQrrfrBRnQ=
X-Google-Smtp-Source: AGHT+IEoPFEcUlqhfk4pjUtJWTiDD3IX5M/wyYZOHS3L0atac9rDLnPnzdfaoZYRsfgWImNitnAgTmlcdB8WFyzI8dA=
X-Received: by 2002:a50:9997:0:b0:54c:526d:52c with SMTP id
 m23-20020a509997000000b0054c526d052cmr41321edb.85.1701822297194; Tue, 05 Dec
 2023 16:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
 <20231130182748.1894790-3-dbarboza@ventanamicro.com>
In-Reply-To: <20231130182748.1894790-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:24:29 +1000
Message-ID: <CAKmqyKPxL_ajNd-1dh-zg6FVigRGABpZ79caiGNrBYjMtotcyw@mail.gmail.com>
Subject: Re: [PATCH for-9.0 2/4] linux-headers: riscv: add ptrace.h
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Dec 1, 2023 at 4:29=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> KVM vector support for RISC-V requires the linux-header ptrace.h.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-headers/asm-riscv/ptrace.h | 132 +++++++++++++++++++++++++++++++
>  scripts/update-linux-headers.sh  |   3 +
>  2 files changed, 135 insertions(+)
>  create mode 100644 linux-headers/asm-riscv/ptrace.h
>
> diff --git a/linux-headers/asm-riscv/ptrace.h b/linux-headers/asm-riscv/p=
trace.h
> new file mode 100644
> index 0000000000..1e3166caca
> --- /dev/null
> +++ b/linux-headers/asm-riscv/ptrace.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + */
> +
> +#ifndef _ASM_RISCV_PTRACE_H
> +#define _ASM_RISCV_PTRACE_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +
> +#define PTRACE_GETFDPIC                33
> +
> +#define PTRACE_GETFDPIC_EXEC   0
> +#define PTRACE_GETFDPIC_INTERP 1
> +
> +/*
> + * User-mode register state for core dumps, ptrace, sigcontext
> + *
> + * This decouples struct pt_regs from the userspace ABI.
> + * struct user_regs_struct must form a prefix of struct pt_regs.
> + */
> +struct user_regs_struct {
> +       unsigned long pc;
> +       unsigned long ra;
> +       unsigned long sp;
> +       unsigned long gp;
> +       unsigned long tp;
> +       unsigned long t0;
> +       unsigned long t1;
> +       unsigned long t2;
> +       unsigned long s0;
> +       unsigned long s1;
> +       unsigned long a0;
> +       unsigned long a1;
> +       unsigned long a2;
> +       unsigned long a3;
> +       unsigned long a4;
> +       unsigned long a5;
> +       unsigned long a6;
> +       unsigned long a7;
> +       unsigned long s2;
> +       unsigned long s3;
> +       unsigned long s4;
> +       unsigned long s5;
> +       unsigned long s6;
> +       unsigned long s7;
> +       unsigned long s8;
> +       unsigned long s9;
> +       unsigned long s10;
> +       unsigned long s11;
> +       unsigned long t3;
> +       unsigned long t4;
> +       unsigned long t5;
> +       unsigned long t6;
> +};
> +
> +struct __riscv_f_ext_state {
> +       __u32 f[32];
> +       __u32 fcsr;
> +};
> +
> +struct __riscv_d_ext_state {
> +       __u64 f[32];
> +       __u32 fcsr;
> +};
> +
> +struct __riscv_q_ext_state {
> +       __u64 f[64] __attribute__((aligned(16)));
> +       __u32 fcsr;
> +       /*
> +        * Reserved for expansion of sigcontext structure.  Currently zer=
oed
> +        * upon signal, and must be zero upon sigreturn.
> +        */
> +       __u32 reserved[3];
> +};
> +
> +struct __riscv_ctx_hdr {
> +       __u32 magic;
> +       __u32 size;
> +};
> +
> +struct __riscv_extra_ext_header {
> +       __u32 __padding[129] __attribute__((aligned(16)));
> +       /*
> +        * Reserved for expansion of sigcontext structure.  Currently zer=
oed
> +        * upon signal, and must be zero upon sigreturn.
> +        */
> +       __u32 reserved;
> +       struct __riscv_ctx_hdr hdr;
> +};
> +
> +union __riscv_fp_state {
> +       struct __riscv_f_ext_state f;
> +       struct __riscv_d_ext_state d;
> +       struct __riscv_q_ext_state q;
> +};
> +
> +struct __riscv_v_ext_state {
> +       unsigned long vstart;
> +       unsigned long vl;
> +       unsigned long vtype;
> +       unsigned long vcsr;
> +       unsigned long vlenb;
> +       void *datap;
> +       /*
> +        * In signal handler, datap will be set a correct user stack offs=
et
> +        * and vector registers will be copied to the address of datap
> +        * pointer.
> +        */
> +};
> +
> +struct __riscv_v_regset_state {
> +       unsigned long vstart;
> +       unsigned long vl;
> +       unsigned long vtype;
> +       unsigned long vcsr;
> +       unsigned long vlenb;
> +       char vreg[];
> +};
> +
> +/*
> + * According to spec: The number of bits in a single vector register,
> + * VLEN >=3D ELEN, which must be a power of 2, and must be no greater th=
an
> + * 2^16 =3D 65536bits =3D 8192bytes
> + */
> +#define RISCV_MAX_VLENB (8192)
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_PTRACE_H */
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
> index 34295c0fe5..a0006eec6f 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -156,6 +156,9 @@ for arch in $ARCHLIST; do
>          cp_portable "$tmpdir/bootparam.h" \
>                      "$output/include/standard-headers/asm-$arch"
>      fi
> +    if [ $arch =3D riscv ]; then
> +        cp "$tmpdir/include/asm/ptrace.h" "$output/linux-headers/asm-ris=
cv/"
> +    fi
>  done
>
>  rm -rf "$output/linux-headers/linux"
> --
> 2.41.0
>
>

