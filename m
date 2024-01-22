Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF85C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:31:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmtY-00086e-QW; Mon, 22 Jan 2024 00:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmtW-00085q-J3; Mon, 22 Jan 2024 00:30:51 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmtU-00028W-RT; Mon, 22 Jan 2024 00:30:50 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4b87d79a7d8so325002e0c.3; 
 Sun, 21 Jan 2024 21:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705901447; x=1706506247; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FEMzo3cjCKfAZdaBPJScWoKwqB5YlS2REUsWNVHOd+M=;
 b=BZ5wWDE+CN+2dybzILctOvV8dE7jdD9Cb7n5DOcTI9WZGmXniECrhLeRs9qOiEkDIr
 ZcmjEGTL7ZiEmJxIysIUH4NKQJz1xuUX32aE2/bkK4BIFaiezrhPVBFszeoqkpU0xlYO
 sbReMmV0e0765YQbrU0sB6kWHR//y9suwxvYRLEv1O9818Aos5ilMlMbt0nGYKDclZ1w
 +wObiSUddabADX7rlkPF4IbVFAjq1KwGgMemrelabLCzhkblyf6GzNRWG8rf/8SNlQk5
 OETKOg2rFUyg4WZpi8g3KESYTjLfpGcOTHKZuJvsfFzslTT0fBTW3+ySPeI+zLN9XxaL
 lpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705901447; x=1706506247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FEMzo3cjCKfAZdaBPJScWoKwqB5YlS2REUsWNVHOd+M=;
 b=iKkrT5yZ3TnakCrERBl050xIP8LPt95rHYz2wRXH93z/IkmiBmIbRvh1V2H6tJqzZv
 AOWSxmFNwHCSjcvMCLbvHxlb0bjWR08jRcj+u2e5SQaPh77R3NQq6rJol6WD7IEPhQsb
 uDT0TqW1YcoR1CL/ONWF1xafKmEfFJAMadM7M0nHjNywail7U2GfhBfyRfsF6zmKvYtO
 DbCPR5MXNoW1Xs/K9kZao7MN7yQfs5aZhMRZH5J2+MtElEd2SRUoNn0o7J6UKnaorQQH
 HBUXlfdA76w9zQJ5iBD8PG74jtkKkUGkTl9taSeqPyTpqkeOk5aFCiaFdGIo27B3V2ir
 ye7Q==
X-Gm-Message-State: AOJu0YzlYFulVq/hLws3ixbCB/f5xTIW/+mDFEGOcQtWWVZMK86kPJDZ
 AGgHRynWC4HUPWKQ4RHfFLckU/f2rT9bE3cJHJ/IGKAbwJ76IoeS3Kcxyi00xRBbaEhlkQS9CBH
 yahzRxD1Hw2WK3sroTHP0PP+ngV9+g3dC
X-Google-Smtp-Source: AGHT+IEBaiUHSGt8Jy+vI17Gav+HpH3Dwfg7+HY6sZq6+wsuhXKraUgLenM5NnJ/2Z2blfB8ocQlA+jKvrBQAFixulo=
X-Received: by 2002:a05:6122:2092:b0:4b6:f0f7:1b53 with SMTP id
 i18-20020a056122209200b004b6f0f71b53mr750236vkd.15.1705901447481; Sun, 21 Jan
 2024 21:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20231219123244.290935-1-alvinga@andestech.com>
In-Reply-To: <20231219123244.290935-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:30:21 +1000
Message-ID: <CAKmqyKNcc=PaAOoBSWZd=arQyRwX=3+JOMfMv=umd4GtXLVSXg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
To: Alvin Chang <alvinga@andestech.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Tue, Dec 19, 2023 at 10:34=E2=80=AFPM Alvin Chang via <qemu-devel@nongnu=
.org> wrote:
>
> The debug Sdtrig extension defines an CSR "mcontext". This commit
> implements its predicate and read/write operations into CSR table.
> Its value is reset as 0 when the trigger module is reset.
>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes from v1: Remove dedicated cfg, always implement mcontext.
>
>  target/riscv/cpu.h      |  1 +
>  target/riscv/cpu_bits.h |  7 +++++++
>  target/riscv/csr.c      | 36 +++++++++++++++++++++++++++++++-----
>  target/riscv/debug.c    |  2 ++
>  4 files changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361..e117641 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -345,6 +345,7 @@ struct CPUArchState {
>      target_ulong tdata1[RV_MAX_TRIGGERS];
>      target_ulong tdata2[RV_MAX_TRIGGERS];
>      target_ulong tdata3[RV_MAX_TRIGGERS];
> +    target_ulong mcontext;
>      struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
>      struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
>      QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ebd7917..3296648 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -361,6 +361,7 @@
>  #define CSR_TDATA2          0x7a2
>  #define CSR_TDATA3          0x7a3
>  #define CSR_TINFO           0x7a4
> +#define CSR_MCONTEXT        0x7a8
>
>  /* Debug Mode Registers */
>  #define CSR_DCSR            0x7b0
> @@ -905,4 +906,10 @@ typedef enum RISCVException {
>  /* JVT CSR bits */
>  #define JVT_MODE                           0x3F
>  #define JVT_BASE                           (~0x3F)
> +
> +/* Debug Sdtrig CSR masks */
> +#define MCONTEXT32                         0x0000003F
> +#define MCONTEXT64                         0x0000000000001FFFULL
> +#define MCONTEXT32_HCONTEXT                0x0000007F
> +#define MCONTEXT64_HCONTEXT                0x0000000000003FFFULL
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1..ff1e128 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3900,6 +3900,31 @@ static RISCVException read_tinfo(CPURISCVState *en=
v, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mcontext(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val =3D env->mcontext;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mcontext(CPURISCVState *env, int csrno,
> +                                     target_ulong val)
> +{
> +    bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
> +    int32_t mask;
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        /* Spec suggest 7-bit for RV32 and 14-bit for RV64 w/ H extensio=
n */
> +        mask =3D rv32 ? MCONTEXT32_HCONTEXT : MCONTEXT64_HCONTEXT;
> +    } else {
> +        /* Spec suggest 6-bit for RV32 and 13-bit for RV64 w/o H extensi=
on */
> +        mask =3D rv32 ? MCONTEXT32 : MCONTEXT64;
> +    }
> +
> +    env->mcontext =3D val & mask;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /*
>   * Functions to access Pointer Masking feature registers
>   * We have to check if current priv lvl could modify
> @@ -4794,11 +4819,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>      [CSR_PMPADDR15] =3D  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr=
 },
>
>      /* Debug CSRs */
> -    [CSR_TSELECT]   =3D  { "tselect", debug, read_tselect, write_tselect=
 },
> -    [CSR_TDATA1]    =3D  { "tdata1",  debug, read_tdata,   write_tdata  =
 },
> -    [CSR_TDATA2]    =3D  { "tdata2",  debug, read_tdata,   write_tdata  =
 },
> -    [CSR_TDATA3]    =3D  { "tdata3",  debug, read_tdata,   write_tdata  =
 },
> -    [CSR_TINFO]     =3D  { "tinfo",   debug, read_tinfo,   write_ignore =
 },
> +    [CSR_TSELECT]   =3D  { "tselect",  debug, read_tselect,  write_tsele=
ct  },
> +    [CSR_TDATA1]    =3D  { "tdata1",   debug, read_tdata,    write_tdata=
    },
> +    [CSR_TDATA2]    =3D  { "tdata2",   debug, read_tdata,    write_tdata=
    },
> +    [CSR_TDATA3]    =3D  { "tdata3",   debug, read_tdata,    write_tdata=
    },
> +    [CSR_TINFO]     =3D  { "tinfo",    debug, read_tinfo,    write_ignor=
e   },
> +    [CSR_MCONTEXT]  =3D  { "mcontext", debug, read_mcontext, write_mcont=
ext },
>
>      /* User Pointer Masking */
>      [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,  write=
_umte },
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 4945d1a..e30d99c 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -940,4 +940,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
>          env->cpu_watchpoint[i] =3D NULL;
>          timer_del(env->itrigger_timer[i]);
>      }
> +
> +    env->mcontext =3D 0;
>  }
> --
> 2.34.1
>
>

