Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOBmP-0000gw-3Q
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 00:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mOBmN-0000fD-9n; Thu, 09 Sep 2021 00:35:15 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mOBmL-0005kR-Ag; Thu, 09 Sep 2021 00:35:14 -0400
Received: by mail-io1-xd2e.google.com with SMTP id a15so685596iot.2;
 Wed, 08 Sep 2021 21:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXKA2IAQb6kFaK9jvJrY6uiPaTE0uI7fDgzSZvKWSc8=;
 b=GpYiNyIp6UEz9ADduUZ2wXPzjA2jsDQRaTY/6PHUGnoHMo31cUVsGg7K6VphOe547p
 bwHZ73qUD4iGtqem9+TJRqJakMh0WO+S5cmY1zz8DxQFzmFNzKY1W6BnPju7xOUS5JYY
 B4vUIS7x6P0e7iLbXhxRy6VvELEBa29SJ2hXEJ1t21sZPtMFz8lpSXM+v5eZUAmnYFyY
 eX4IzMdgyHGvDvtVcPTlFH/OG6naAsdL4PfvEMi3zirvtKTtpOronT8aY0HbmynuEYM+
 SbiSu+87TVAW1Y8Sz94X8vGq9ypemdeeMzkHoMgUAtLkNdpwDmdztIQ8oXeuf7kw/cnb
 tGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXKA2IAQb6kFaK9jvJrY6uiPaTE0uI7fDgzSZvKWSc8=;
 b=ZAM/lwjRnG5F0RRVzrJQeVUghkLEEeVczPo5F6LaQqhOK4A/lvDFxSRHiy0ji+kIEC
 FDsf4x0fhh5EapwDdSCyd3EVVGrl1VaM19YQX6GZqvFUzT1lke65Hj5MKSDLzdjQVkew
 Y+jHZSnRytOmZAKYGgdh3w96g0syYTLqIIwrOBGfaR9pMC13QjEUfVjZ3pZqPMEcnfnz
 +U7PpQDy654/GTvfKPILULYbJeI3SHgJaFMceBf/zWN8YrgtSlAEcaOHgGfGDoA6Ztdx
 OmkUle+pjBJvC5XG+w11J/Pwkne6UfXwAUpEBuReUSHGC1gYzC/0IO2KHSs46ChZ7SxO
 Oo0A==
X-Gm-Message-State: AOAM530jSjPmKVOtw5bVJBLu8dWD65ThRitc0dFTrIUau9nNDPk63hWA
 lnL3s1YcyI128VPRwYKN42KRmxsIDwjE0LKElsc=
X-Google-Smtp-Source: ABdhPJz2/ZhUqmkG87pGpE5D7zKt/JYw2Z1iE2ND0p1Ts5hiLL+FIzUASbgBGqj0n+1kZTOpqrB3Jep/8TSf7TpnrO4=
X-Received: by 2002:a05:6638:e8f:: with SMTP id
 p15mr1094770jas.114.1631162111399; 
 Wed, 08 Sep 2021 21:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210829175120.19413-1-space.monkey.delivers@gmail.com>
 <20210829175120.19413-3-space.monkey.delivers@gmail.com>
In-Reply-To: <20210829175120.19413-3-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Sep 2021 14:34:44 +1000
Message-ID: <CAKmqyKNNdmM3HjxKDW_5zJvtUXKZNpkT4_CphCnB-x92LShnjg@mail.gmail.com>
Subject: Re: [PATCH v10 2/7] [RISCV_PM] Add CSR defines for RISC-V PM extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 09 Sep 2021 04:35:15 -0000

On Mon, Aug 30, 2021 at 3:51 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 96 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7330ff5a19..140178d23c 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -334,6 +334,38 @@
>  #define CSR_MHPMCOUNTER30H  0xb9e
>  #define CSR_MHPMCOUNTER31H  0xb9f
>
> +/*
> + * User PointerMasking registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_UMTE            0x4c0
> +#define CSR_UPMMASK         0x4c1
> +#define CSR_UPMBASE         0x4c2
> +
> +/*
> + * Machine PointerMasking registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_MMTE            0x3c0
> +#define CSR_MPMMASK         0x3c1
> +#define CSR_MPMBASE         0x3c2
> +
> +/*
> + * Supervisor PointerMaster registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_SMTE            0x1c0
> +#define CSR_SPMMASK         0x1c1
> +#define CSR_SPMBASE         0x1c2
> +
> +/*
> + * Hypervisor PointerMaster registers
> + * NB: actual CSR numbers might be changed in future
> + */
> +#define CSR_VSMTE           0x2c0
> +#define CSR_VSPMMASK        0x2c1
> +#define CSR_VSPMBASE        0x2c2
> +
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -531,4 +563,68 @@ typedef enum RISCVException {
>  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
> +
> +/* General PointerMasking CSR bits*/
> +#define PM_ENABLE       0x00000001ULL
> +#define PM_CURRENT      0x00000002ULL
> +#define PM_INSN         0x00000004ULL
> +#define PM_XS_MASK      0x00000003ULL
> +
> +/* PointerMasking XS bits values */
> +#define PM_EXT_DISABLE  0x00000000ULL
> +#define PM_EXT_INITIAL  0x00000001ULL
> +#define PM_EXT_CLEAN    0x00000002ULL
> +#define PM_EXT_DIRTY    0x00000003ULL
> +
> +/* Offsets for every pair of control bits per each priv level */
> +#define XS_OFFSET    0ULL
> +#define U_OFFSET     2ULL
> +#define S_OFFSET     5ULL
> +#define M_OFFSET     8ULL
> +
> +#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
> +#define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
> +#define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
> +#define U_PM_INSN    (PM_INSN    << U_OFFSET)
> +#define S_PM_ENABLE  (PM_ENABLE  << S_OFFSET)
> +#define S_PM_CURRENT (PM_CURRENT << S_OFFSET)
> +#define S_PM_INSN    (PM_INSN    << S_OFFSET)
> +#define M_PM_ENABLE  (PM_ENABLE  << M_OFFSET)
> +#define M_PM_CURRENT (PM_CURRENT << M_OFFSET)
> +#define M_PM_INSN    (PM_INSN    << M_OFFSET)
> +
> +/* mmte CSR bits */
> +#define MMTE_PM_XS_BITS     PM_XS_BITS
> +#define MMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define MMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define MMTE_U_PM_INSN      U_PM_INSN
> +#define MMTE_S_PM_ENABLE    S_PM_ENABLE
> +#define MMTE_S_PM_CURRENT   S_PM_CURRENT
> +#define MMTE_S_PM_INSN      S_PM_INSN
> +#define MMTE_M_PM_ENABLE    M_PM_ENABLE
> +#define MMTE_M_PM_CURRENT   M_PM_CURRENT
> +#define MMTE_M_PM_INSN      M_PM_INSN
> +#define MMTE_MASK    (MMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | MMTE_U_PM_INSN | \
> +                      MMTE_S_PM_ENABLE | MMTE_S_PM_CURRENT | MMTE_S_PM_INSN | \
> +                      MMTE_M_PM_ENABLE | MMTE_M_PM_CURRENT | MMTE_M_PM_INSN | \
> +                      MMTE_PM_XS_BITS)
> +
> +/* (v)smte CSR bits */
> +#define SMTE_PM_XS_BITS     PM_XS_BITS
> +#define SMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define SMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define SMTE_U_PM_INSN      U_PM_INSN
> +#define SMTE_S_PM_ENABLE    S_PM_ENABLE
> +#define SMTE_S_PM_CURRENT   S_PM_CURRENT
> +#define SMTE_S_PM_INSN      S_PM_INSN
> +#define SMTE_MASK    (SMTE_U_PM_ENABLE | SMTE_U_PM_CURRENT | SMTE_U_PM_INSN | \
> +                      SMTE_S_PM_ENABLE | SMTE_S_PM_CURRENT | SMTE_S_PM_INSN | \
> +                      SMTE_PM_XS_BITS)
> +
> +/* umte CSR bits */
> +#define UMTE_U_PM_ENABLE    U_PM_ENABLE
> +#define UMTE_U_PM_CURRENT   U_PM_CURRENT
> +#define UMTE_U_PM_INSN      U_PM_INSN
> +#define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
> +
>  #endif
> --
> 2.20.1
>
>

