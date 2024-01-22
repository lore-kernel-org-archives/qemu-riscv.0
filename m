Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34180C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 04:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmMY-0005U7-BH; Sun, 21 Jan 2024 23:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmMU-0005Qe-Pe; Sun, 21 Jan 2024 23:56:43 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmMT-00035f-6u; Sun, 21 Jan 2024 23:56:42 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4b77c844087so1524800e0c.1; 
 Sun, 21 Jan 2024 20:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705899399; x=1706504199; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXPuyhD+0Y4cZnEOUwfNP68Ju9jH3plh3NEzF232imw=;
 b=SdXlAIHBLgpbvWIDByT51Q+egDkBbaugRKSRo5Klz/xS4/AUVBj0/m0eya7aB1T3gq
 T6aYcLEDnmJa09n9zzm58GOw4CHzigZi6gQXsVnzqSHd0kiu10Fj6FXo72w41b1uLRY2
 UC7+zj2ErT6ZXBPlFd+ZGTExvcyZ6WCQDgUnYXPsBQl1OzHBO3oavAO8EGjywioAzWt/
 I7CKyihQUbGi2uki2DofT5qP6hFEsMLd9bDiVP2DYD2Cs1Eu1ZDIO7U1mMYejV+5/fov
 kYvtiZcqqMYTxA0K+sqqy2xp74rYcvlMu9DwuPnzMHzR4U/zTRpTXoRFuUtq8Yg9Tero
 KpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705899399; x=1706504199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GXPuyhD+0Y4cZnEOUwfNP68Ju9jH3plh3NEzF232imw=;
 b=elCi3ZBlA8U8calVr1T+UrjzHtu6v1QrGRA8iF2FhdnuC7sAD4M/JRT0XozHWQ0nc6
 wwm9GkyyAMavhFFHb3uTF4t+PFAQHU5vNj1u9Ti/0UPe6PQBR+X9Z7bIyMfg/e9nSXTL
 o0zavJEXquBzgsrCt1W+fliD0d5RgvPSWnAo4pgmrKy65mq8iEqsrjGj6WjxVLS8GTRI
 WTN/WMb5lZZXr+Jb0bj/LAOnoN3xguBXh6qKN3uTdpcgkIDufpsPqx0bUs8knEYGwR0z
 b//+ZW5kE6uv2RDEm2RCltdnWx0CkGMjrB1orK1fGEiLn5ZK3cOudZ9CdZ6vf6oFz+7v
 LV/w==
X-Gm-Message-State: AOJu0YyW0Ee7WVvPOMnVOW8LJJFw4yxe+Ht/98CUicP6HSdK7FvUkl5F
 ZXmynodcMQRdjftsNDoBLTWHc2LZ7NIB11Jt8QoVt/2v2JfSCnc5nJ8VyIAxGv5j68qIUqr64EP
 WmMDFYMInqw/AI5NUabykHrsrLQ8=
X-Google-Smtp-Source: AGHT+IExn5IJxpsmVrfxRvfzgaNyONQF0BmyhH6FPUatmiM91OxCZRsihDwu/bquH3H/Kt7l7cReYW59gk4/r3tE2JU=
X-Received: by 2002:ac5:ccae:0:b0:4b9:e8bd:3b2 with SMTP id
 p14-20020ac5ccae000000b004b9e8bd03b2mr1783025vkm.2.1705899399114; Sun, 21 Jan
 2024 20:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20240109002554.646572-1-atishp@rivosinc.com>
 <20240109002554.646572-4-atishp@rivosinc.com>
In-Reply-To: <20240109002554.646572-4-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 14:56:13 +1000
Message-ID: <CAKmqyKM0f8Ti5dL567gvbWm1-eGSjNSAsHWZ3SNQmZcTQLQU9w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] target/riscv: Add cycle & instret privilege mode
 filtering definitions
To: Atish Patra <atishp@rivosinc.com>
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Tue, Jan 9, 2024 at 12:05=E2=80=AFPM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
>
> This adds the definitions for ISA extension smcntrpmf.
>
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h      |  6 ++++++
>  target/riscv/cpu_bits.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361be641..34617c4c4bab 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -319,6 +319,12 @@ struct CPUArchState {
>
>      target_ulong mcountinhibit;
>
> +    /* PMU cycle & instret privilege mode filtering */
> +    target_ulong mcyclecfg;
> +    target_ulong mcyclecfgh;
> +    target_ulong minstretcfg;
> +    target_ulong minstretcfgh;
> +
>      /* PMU counter state */
>      PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ebd7917d490a..0ee91e502e8f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -401,6 +401,10 @@
>  /* Machine counter-inhibit register */
>  #define CSR_MCOUNTINHIBIT   0x320
>
> +/* Machine counter configuration registers */
> +#define CSR_MCYCLECFG       0x321
> +#define CSR_MINSTRETCFG     0x322
> +
>  #define CSR_MHPMEVENT3      0x323
>  #define CSR_MHPMEVENT4      0x324
>  #define CSR_MHPMEVENT5      0x325
> @@ -431,6 +435,9 @@
>  #define CSR_MHPMEVENT30     0x33e
>  #define CSR_MHPMEVENT31     0x33f
>
> +#define CSR_MCYCLECFGH      0x721
> +#define CSR_MINSTRETCFGH    0x722
> +
>  #define CSR_MHPMEVENT3H     0x723
>  #define CSR_MHPMEVENT4H     0x724
>  #define CSR_MHPMEVENT5H     0x725
> @@ -885,6 +892,28 @@ typedef enum RISCVException {
>  /* PMU related bits */
>  #define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
>
> +#define MCYCLECFG_BIT_MINH                 BIT_ULL(62)
> +#define MCYCLECFGH_BIT_MINH                BIT(30)
> +#define MCYCLECFG_BIT_SINH                 BIT_ULL(61)
> +#define MCYCLECFGH_BIT_SINH                BIT(29)
> +#define MCYCLECFG_BIT_UINH                 BIT_ULL(60)
> +#define MCYCLECFGH_BIT_UINH                BIT(28)
> +#define MCYCLECFG_BIT_VSINH                BIT_ULL(59)
> +#define MCYCLECFGH_BIT_VSINH               BIT(27)
> +#define MCYCLECFG_BIT_VUINH                BIT_ULL(58)
> +#define MCYCLECFGH_BIT_VUINH               BIT(26)
> +
> +#define MINSTRETCFG_BIT_MINH               BIT_ULL(62)
> +#define MINSTRETCFGH_BIT_MINH              BIT(30)
> +#define MINSTRETCFG_BIT_SINH               BIT_ULL(61)
> +#define MINSTRETCFGH_BIT_SINH              BIT(29)
> +#define MINSTRETCFG_BIT_UINH               BIT_ULL(60)
> +#define MINSTRETCFGH_BIT_UINH              BIT(28)
> +#define MINSTRETCFG_BIT_VSINH              BIT_ULL(59)
> +#define MINSTRETCFGH_BIT_VSINH             BIT(27)
> +#define MINSTRETCFG_BIT_VUINH              BIT_ULL(58)
> +#define MINSTRETCFGH_BIT_VUINH             BIT(26)
> +
>  #define MHPMEVENT_BIT_OF                   BIT_ULL(63)
>  #define MHPMEVENTH_BIT_OF                  BIT(31)
>  #define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
> --
> 2.34.1
>
>

