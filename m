Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my28w-0004Ee-32
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 20:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my28v-0004DJ-3Y; Thu, 16 Dec 2021 20:34:41 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=43705
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my28t-0006sD-D4; Thu, 16 Dec 2021 20:34:40 -0500
Received: by mail-io1-xd2e.google.com with SMTP id z26so883990iod.10;
 Thu, 16 Dec 2021 17:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7khW8yh+zKn4If5uegkS5q0MZseCJdBWQVQtiSv5hc=;
 b=cCWZWW3LdFLY0LYihMalWARg4n4V4vW5CKbnrKgAcXDuZ2pqEizg5dYmx+0DGrDhqR
 QuNdgzX3AXkLKxrqmeTo7LH1cajfMLrglw9WUsOcaX+0ec7Kyf3tcO+XXAgU/Uy2WhlQ
 voJL2l6cFnxSR4aRhNfo2fYOZaJFGpq0k+iCvaJVcJ8nAuB4lAdp1uHBaNW7ktlMyVbf
 LWVnbiMxRcHktB4DciQczItR/FFc+RX+8yGeKla1+4BkZWjL0jfitx6qQmxhSKarXPq/
 6k/3NwKnNGAsXm+3Sz1gAoCN9nfttoyhh5SQu3b2NPzWa/okZ/JlbjoOKLXcCIGgbg00
 /4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7khW8yh+zKn4If5uegkS5q0MZseCJdBWQVQtiSv5hc=;
 b=pZENYsMd8FGN93oTTicfE1xv9ObqM3foMTreHscor7ZQ+aBg8hNcrwFPjBXrFgNjCF
 lhcFsIb9F0UEIi3n4J8Kd89bANM9G5iK7m8UdJ3u9mNq2+NeqPD+owvGC0zcrRT+I0Eg
 RA3Hs+AGWw2i4p/hDuKBkINUtW5xkitjyl3LBFDpoeWiYlJxsycT+5Gi2ok2DkfRYWJj
 CY2vkpnMVTFHkDfnbuO12KxunJKZ3jyP1+zkQklcUS/MPEveTRtQFrUMpJBtjbPPeLj9
 0a/OevHmABj1gA5pUddMJH1/apkfg7k9s2ULXZEn9rKS4gxx4CzwnEhf9ruMeJ7p1fAa
 Xq/Q==
X-Gm-Message-State: AOAM530sY+txn1tEOtKnYp7c21BJ3cTLqkkJZvW+2eL+Mbc1JsJiKuxX
 cP6Q0kmzPm76sCwxK81QW0zCUQNuWmspAKdn4bo=
X-Google-Smtp-Source: ABdhPJwh5IIFDm96YR6C/6FFlbAoAhw+WWKlEFW7bEYGJokoPWmnekRgusGVkfRjGNqfl42/wYZ9wOwpdja1QHG60Lc=
X-Received: by 2002:a05:6638:1395:: with SMTP id
 w21mr423430jad.125.1639704873889; 
 Thu, 16 Dec 2021 17:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-8-anup.patel@wdc.com>
In-Reply-To: <20211211041917.135345-8-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 11:34:07 +1000
Message-ID: <CAKmqyKNWmGz8pVqdoBzpszaQL4xFyE3M_o+d6Z2dnne8fD=d3g@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] target/riscv: Add defines for AIA CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 17 Dec 2021 01:34:41 -0000

On Sat, Dec 11, 2021 at 2:22 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The RISC-V AIA specification extends RISC-V local interrupts and
> introduces new CSRs. This patch adds defines for the new AIA CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 127 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 0c6ef6e51c..5b28e73506 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -160,6 +160,31 @@
>  #define CSR_MTVAL           0x343
>  #define CSR_MIP             0x344
>
> +/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_MISELECT        0x350
> +#define CSR_MIREG           0x351
> +
> +/* Machine-Level Interrupts (AIA) */
> +#define CSR_MTOPI           0xfb0
> +
> +/* Machine-Level IMSIC Interface (AIA) */
> +#define CSR_MSETEIPNUM      0x358
> +#define CSR_MCLREIPNUM      0x359
> +#define CSR_MSETEIENUM      0x35a
> +#define CSR_MCLREIENUM      0x35b
> +#define CSR_MTOPEI          0x35c
> +
> +/* Virtual Interrupts for Supervisor Level (AIA) */
> +#define CSR_MVIEN           0x308
> +#define CSR_MVIP            0x309
> +
> +/* Machine-Level High-Half CSRs (AIA) */
> +#define CSR_MIDELEGH        0x313
> +#define CSR_MIEH            0x314
> +#define CSR_MVIENH          0x318
> +#define CSR_MVIPH           0x319
> +#define CSR_MIPH            0x354
> +
>  /* Supervisor Trap Setup */
>  #define CSR_SSTATUS         0x100
>  #define CSR_SEDELEG         0x102
> @@ -179,6 +204,24 @@
>  #define CSR_SPTBR           0x180
>  #define CSR_SATP            0x180
>
> +/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
> +#define CSR_SISELECT        0x150
> +#define CSR_SIREG           0x151
> +
> +/* Supervisor-Level Interrupts (AIA) */
> +#define CSR_STOPI           0xdb0
> +
> +/* Supervisor-Level IMSIC Interface (AIA) */
> +#define CSR_SSETEIPNUM      0x158
> +#define CSR_SCLREIPNUM      0x159
> +#define CSR_SSETEIENUM      0x15a
> +#define CSR_SCLREIENUM      0x15b
> +#define CSR_STOPEI          0x15c
> +
> +/* Supervisor-Level High-Half CSRs (AIA) */
> +#define CSR_SIEH            0x114
> +#define CSR_SIPH            0x154
> +
>  /* Hpervisor CSRs */
>  #define CSR_HSTATUS         0x600
>  #define CSR_HEDELEG         0x602
> @@ -209,6 +252,35 @@
>  #define CSR_MTINST          0x34a
>  #define CSR_MTVAL2          0x34b
>
> +/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +#define CSR_HVIEN           0x608
> +#define CSR_HVICTL          0x609
> +#define CSR_HVIPRIO1        0x646
> +#define CSR_HVIPRIO2        0x647
> +
> +/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
> +#define CSR_VSISELECT       0x250
> +#define CSR_VSIREG          0x251
> +
> +/* VS-Level Interrupts (H-extension with AIA) */
> +#define CSR_VSTOPI          0xeb0
> +
> +/* VS-Level IMSIC Interface (H-extension with AIA) */
> +#define CSR_VSSETEIPNUM     0x258
> +#define CSR_VSCLREIPNUM     0x259
> +#define CSR_VSSETEIENUM     0x25a
> +#define CSR_VSCLREIENUM     0x25b
> +#define CSR_VSTOPEI         0x25c
> +
> +/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
> +#define CSR_HIDELEGH        0x613
> +#define CSR_HVIENH          0x618
> +#define CSR_HVIPH           0x655
> +#define CSR_HVIPRIO1H       0x656
> +#define CSR_HVIPRIO2H       0x657
> +#define CSR_VSIEH           0x214
> +#define CSR_VSIPH           0x254
> +
>  /* Enhanced Physical Memory Protection (ePMP) */
>  #define CSR_MSECCFG         0x747
>  #define CSR_MSECCFGH        0x757
> @@ -619,4 +691,59 @@ typedef enum RISCVException {
>  #define UMTE_U_PM_INSN      U_PM_INSN
>  #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
>
> +/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
> +#define ISELECT_IPRIO0                     0x30
> +#define ISELECT_IPRIO15                    0x3f
> +#define ISELECT_IMSIC_EIDELIVERY           0x70
> +#define ISELECT_IMSIC_EITHRESHOLD          0x72
> +#define ISELECT_IMSIC_EIP0                 0x80
> +#define ISELECT_IMSIC_EIP63                0xbf
> +#define ISELECT_IMSIC_EIE0                 0xc0
> +#define ISELECT_IMSIC_EIE63                0xff
> +#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
> +#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
> +#define ISELECT_MASK                       0x1ff
> +
> +/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
> +#define ISELECT_IMSIC_TOPEI                (ISELECT_MASK + 1)
> +
> +/* IMSIC bits (AIA) */
> +#define IMSIC_TOPEI_IID_SHIFT              16
> +#define IMSIC_TOPEI_IID_MASK               0x7ff
> +#define IMSIC_TOPEI_IPRIO_MASK             0x7ff
> +#define IMSIC_EIPx_BITS                    32
> +#define IMSIC_EIEx_BITS                    32
> +
> +/* MTOPI and STOPI bits (AIA) */
> +#define TOPI_IID_SHIFT                     16
> +#define TOPI_IID_MASK                      0xfff
> +#define TOPI_IPRIO_MASK                    0xff
> +
> +/* Interrupt priority bits (AIA) */
> +#define IPRIO_IRQ_BITS                     8
> +#define IPRIO_MMAXIPRIO                    255
> +#define IPRIO_DEFAULT_MMAXIPRIO            15
> +#define IPRIO_DEFAULT_VS                   (IPRIO_DEFAULT_MMAXIPRIO - 4)
> +#define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_MMAXIPRIO - 5)
> +#define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_MMAXIPRIO - 6)
> +#define IPRIO_DEFAULT_M                    (IPRIO_DEFAULT_MMAXIPRIO - 7)
> +#define IPRIO_DEFAULT_U(_i)                (((_i) >> 4) & 0x3)
> +#define IPRIO_DEFAULT_L(_i)                ((_i) & 0xf)
> +#define IPRIO_DEFAULT_16_23(_i)            \
> +    (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) >> 1))
> +#define IPRIO_DEFAULT_24_31(_i)            \
> +    (IPRIO_DEFAULT_MMAXIPRIO - (4 + (IPRIO_DEFAULT_L(_i) >> 1)))
> +#define IPRIO_DEFAULT_32_47(_i)            \
> +    (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) >> 2))
> +#define IPRIO_DEFAULT_48_63(_i)            \
> +    (IPRIO_DEFAULT_MMAXIPRIO - (8 + (IPRIO_DEFAULT_L(_i) >> 2)))
> +
> +/* HVICTL bits (AIA) */
> +#define HVICTL_VTI                         0x40000000
> +#define HVICTL_IID                         0x0fff0000
> +#define HVICTL_IPRIOM                      0x00000100
> +#define HVICTL_IPRIO                       0x000000ff
> +#define HVICTL_VALID_MASK                  \
> +    (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
> +
>  #endif
> --
> 2.25.1
>
>

