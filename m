Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrT8y-0002Qy-94
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 18:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrT8w-0002Q1-LP; Thu, 10 Jun 2021 18:27:18 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrT8u-00015c-Om; Thu, 10 Jun 2021 18:27:18 -0400
Received: by mail-il1-x134.google.com with SMTP id x12so664299ill.4;
 Thu, 10 Jun 2021 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J63923FXV6CC7lvW7OI1Ml7viz382Lr53mOpuoVxfr8=;
 b=Dvm+DPRXXLGawguas/frhYhzK4W9XtNBOFaBXP+fJVI5wRJ86jKqfWEMCzZQ5jb3Dt
 L20ENI2sL8OwYb6kL6iGnndMldIKrd8A+CxtWhsUq60tlQAXR2aYAhC6zLf5KTgwyeoP
 TkOhUSDQq/r/QXIr1eEPrf6NQoN8pK2zg7D54RgQmbj5C1jsKDV5VeYmHzVrnBXLojVQ
 uHhZC/If92HmF+PzOY+ki/HhWDf3ftj6R4yA0kHT7xZAwO2Jdj0OAA2QXD4avqHxNPA6
 0oQzTlPDb/wvr8uVf/fLbIbduKIR5dU78fCrsd4/+fPCFR8jEmM6IKB9gxKj0O0STuFI
 vVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J63923FXV6CC7lvW7OI1Ml7viz382Lr53mOpuoVxfr8=;
 b=UygFy0969aVPRd5Mws2d0wXgfA5Pp7g5dXCpQnxYCDTukh2F9nOW8DFRsWnoYoGFRz
 6LqeLUvjj7+VJMoP3mGAbhyJZSzWBDMoJ8EBtzi7P1/QlJ070hO+c9oQmXGiRY2uRBmw
 1KUYoKIZfAZ663scVEMM+bXkVZQN+QhVOBPjQvIgUnxHVMvW8rdpW3vPX7uMKvWeFZaC
 frJ6fDNstHu/qcHgYm1PhTQuJJxt2AezuPeYwSA1JdrNAiYGPd/zpBLpgphI5MxCh4X3
 E7fF/ejui9R8e9BDlF03SRcrBtoAepFtrK2m2bVGTDoBNM4nkzO0jjxmt3KwQGIGYrRE
 gMOA==
X-Gm-Message-State: AOAM530v8Xu9364Zc+KYrFXRQ4EPLV24K7WhUutC2MxspwJ01KBmWqqt
 cse2J2vtue+76LZcINoGVSVgOy8o5Nstzn/9Rlw=
X-Google-Smtp-Source: ABdhPJxsjR//8E1zfGHanmjQl9FL89m407kKVl1DuyqUacAzIUcvFIugqoD8HysbKB/a8nTE2dqr11cPFe5jQTSeNWk=
X-Received: by 2002:a05:6e02:dc7:: with SMTP id l7mr773402ilj.40.1623364034774; 
 Thu, 10 Jun 2021 15:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-2-anup.patel@wdc.com>
In-Reply-To: <20210514143242.377645-2-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 08:26:48 +1000
Message-ID: <CAKmqyKOdyCYvMrqU1H+En6VSkmh8GLdx=P3PMmjCyejn11HWew@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Add defines for AIA local interrupt CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 22:27:18 -0000

On Sat, May 15, 2021 at 12:33 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The RISC-V AIA specification extends RISC-V local interrupts and
> introduces new CSRs. This patch adds defines for the new AIA
> local interrupt CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 128 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..d23242655e 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -169,6 +169,31 @@
>  /* Legacy Machine Trap Handling (priv v1.9.1) */
>  #define CSR_MBADADDR        0x343
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
> +#define CSR_MCLAIMEI        0xfa8
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
> @@ -191,6 +216,24 @@
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
> +#define CSR_SCLAIMEI        0xda8
> +
> +/* Supervisor-Level High-Half CSRs (AIA) */
> +#define CSR_SIEH            0x114
> +#define CSR_SIPH            0x154
> +
>  /* Hpervisor CSRs */
>  #define CSR_HSTATUS         0x600
>  #define CSR_HEDELEG         0x602
> @@ -232,6 +275,34 @@
>  #define CSR_MTINST          0x34a
>  #define CSR_MTVAL2          0x34b
>
> +/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +#define CSR_HVIEN           0x608
> +#define CSR_HVICONTROL      0x609
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
>  /* Physical Memory Protection */
>  #define CSR_PMPCFG0         0x3a0
>  #define CSR_PMPCFG1         0x3a1
> @@ -436,6 +507,7 @@
>  #define HSTATUS_SPVP         0x00000100
>  #define HSTATUS_HU           0x00000200
>  #define HSTATUS_VGEIN        0x0003F000
> +#define HSTATUS_VGEIN_SHIFT  12
>  #define HSTATUS_VTVM         0x00100000
>  #define HSTATUS_VTSR         0x00400000
>  #define HSTATUS_VSXL         0x300000000
> @@ -565,6 +637,7 @@
>  #define IRQ_S_EXT                          9
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
> +#define IRQ_S_GEXT                         12
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> @@ -592,4 +665,59 @@
>  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
> +
> +/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
> +#define ISELECT_IPRIO0                     0x30
> +#define ISELECT_IPRIO15                    0x3f
> +#define ISELECT_IMSIC_EIDELIVERY           0x70
> +#define ISELECT_IMSIC_EITHRESHOLD          0x72
> +#define ISELECT_IMSIC_TOPEI                0x76
> +#define ISELECT_IMSIC_EIP0                 0x80
> +#define ISELECT_IMSIC_EIP63                0xbf
> +#define ISELECT_IMSIC_EIE0                 0xc0
> +#define ISELECT_IMSIC_EIE63                0xff
> +#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
> +#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
> +
> +/* IMSIC bits (AIA) */
> +#define IMSIC_TOPEI_IID_SHIFT              16
> +#define IMSIC_TOPEI_IID_MASK               0x7ff
> +#define IMSIC_TOPEI_IPIRO_MASK             0x7ff
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
> +/* HVICONTROL bits (AIA) */
> +#define HVICONTROL_VTI                     0x40000000
> +#define HVICONTROL_IID_MASK                0xfff
> +#define HVICONTROL_IID_SHIFT               16
> +#define HVICONTROL_IPRIO_MASK              0xff
> +#define HVICONTROL_VALID_MASK              \
> +    (HVICONTROL_VTI | \
> +     (HVICONTROL_IID_MASK << HVICONTROL_IID_SHIFT) | \
> +     HVICONTROL_IPRIO_MASK)
> +
>  #endif
> --
> 2.25.1
>
>

