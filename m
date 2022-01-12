Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7dC0-0002eu-Fj
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 07:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dBv-0002bS-FD
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:57:27 -0500
Received: from [2607:f8b0:4864:20::1029] (port=36513
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dBt-0000OS-5i
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 07:57:26 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so11907748pja.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 04:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWZdkZYH6i+HGyHOum/EGEFp5D09bgHjNtHh8VM0imY=;
 b=Ynsa2CTxtZCvUOTMhqh4q0Xk9b3P4oE+vRMBRkqTPqI8p/JuV0zk/Lp6RLCI2O+NuO
 vCz5alqv9lKzJ4fOWU5h/bCLsHGX31ucrQ6YbwuJICKk0kWfnbfc1LFLwyOCqLn2MoAg
 fwcW7W9UxaS0rVa4vacnGp8gJ8cOaqHOzk+BoGUHQ0dKwEganH865VRXFzhBvF9g4Y9x
 0h9CaZCnRvYo57hcwowP8huRBk5rxkfjO7xVyHlzDlWofVeQTwyddRGcykLA88jxZO0p
 FAJbG/Fr3j7CX/Nde9L+XRWz6XXwd2SoyfKD21uC/xJaqZF7iKbs5yrjx2zkaakpZSB9
 EazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWZdkZYH6i+HGyHOum/EGEFp5D09bgHjNtHh8VM0imY=;
 b=lUiycOA0F6j/4vfruX9NLo3yDk4EM9ULluT7da67zB+IweFv1Dc+CqIODm3nfWYPKy
 pqaws2iFX7WN30oYLYueI5mJ/Sr0Ocw0lt4v7eDV5N7vy1RniS8bqHs4btC28eV/RA6b
 BhjjKwYg0KGAq7JCFmFXH5thCl0boyk0csQzqYETajwC1X/SZoSvYPFsS/HZOtyGH6c2
 oDg1rP7ut7x1W0YbdfCSxrwV1Huktx6rA/6Bvg56KLItgVGqqceamlPwbm0LxZYj7qJC
 OiFNoHmbT5TksTSyXQBoCVZpYNSIjT8iZ+6m8JHRdMIkJYJDqL2gydsKb+WB8hMGaS7E
 53jQ==
X-Gm-Message-State: AOAM533ymO6vUIpt+Zsx1Gr+NApyj0M0GCKbGd0QXkPZO55oYwJQJem9
 Mz+o6QwykPzWd/2ATp+hNUF49AHt6iveAlDd
X-Google-Smtp-Source: ABdhPJwf8RyQHtFut3jNqxiIWSWmXHg0wl7qM5Eb+V/B9jhNb1iTMyYOoyQEgG3YieogsCPrnhl7Kg==
X-Received: by 2002:a17:90a:656:: with SMTP id
 q22mr8689210pje.74.1641992242876; 
 Wed, 12 Jan 2022 04:57:22 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54])
 by smtp.gmail.com with ESMTPSA id qe14sm6085542pjb.44.2022.01.12.04.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:57:22 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id o3so4682491pjs.1;
 Wed, 12 Jan 2022 04:57:21 -0800 (PST)
X-Received: by 2002:a17:902:ab8e:b0:14a:2fef:2cf3 with SMTP id
 f14-20020a170902ab8e00b0014a2fef2cf3mr9309257plr.52.1641992241383; Wed, 12
 Jan 2022 04:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-8-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-8-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 20:57:10 +0800
X-Gmail-Original-Message-ID: <CANzO1D1Tmf4XX2SXMGAmrJ9q0HOQ_uxLuq7P6FRYB78Kz-fJ+w@mail.gmail.com>
Message-ID: <CANzO1D1Tmf4XX2SXMGAmrJ9q0HOQ_uxLuq7P6FRYB78Kz-fJ+w@mail.gmail.com>
Subject: Re: [PATCH v6 07/23] target/riscv: Add defines for AIA CSRs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000458e6405d5621ca7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Wed, 12 Jan 2022 12:57:28 -0000

--000000000000458e6405d5621ca7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:52=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The RISC-V AIA specification extends RISC-V local interrupts and
> introduces new CSRs. This patch adds defines for the new AIA CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 127 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index f32159a19d..841c289c5d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -168,6 +168,31 @@
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
> @@ -187,6 +212,24 @@
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
> @@ -217,6 +260,35 @@
>  #define CSR_MTINST          0x34a
>  #define CSR_MTVAL2          0x34b
>
> +/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +#define CSR_HVIEN           0x608
> +#define CSR_HVICTL          0x609
> +#define CSR_HVIPRIO1        0x646
> +#define CSR_HVIPRIO2        0x647
> +
> +/* VS-Level Window to Indirectly Accessed Registers (H-extension with
> AIA) */
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
> @@ -629,4 +701,59 @@ typedef enum RISCVException {
>  #define UMTE_U_PM_INSN      U_PM_INSN
>  #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT |
> UMTE_U_PM_INSN)
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
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000458e6405d5621ca7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=3D"_bla=
nk">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:52=E5=AF=AB=E9=81=93=EF=BC=9A<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Anup Patel &=
lt;<a href=3D"mailto:anup.patel@wdc.com" target=3D"_blank">anup.patel@wdc.c=
om</a>&gt;<br>
<br>
The RISC-V AIA specification extends RISC-V local interrupts and<br>
introduces new CSRs. This patch adds defines for the new AIA CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h | 127 +++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 127 insertions(+)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index f32159a19d..841c289c5d 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -168,6 +168,31 @@<br>
=C2=A0#define CSR_MTVAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x343<br>
=C2=A0#define CSR_MIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x344<=
br>
<br>
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */<br>
+#define CSR_MISELECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x350<br>
+#define CSR_MIREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x351<br>
+<br>
+/* Machine-Level Interrupts (AIA) */<br>
+#define CSR_MTOPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xfb0<br>
+<br>
+/* Machine-Level IMSIC Interface (AIA) */<br>
+#define CSR_MSETEIPNUM=C2=A0 =C2=A0 =C2=A0 0x358<br>
+#define CSR_MCLREIPNUM=C2=A0 =C2=A0 =C2=A0 0x359<br>
+#define CSR_MSETEIENUM=C2=A0 =C2=A0 =C2=A0 0x35a<br>
+#define CSR_MCLREIENUM=C2=A0 =C2=A0 =C2=A0 0x35b<br>
+#define CSR_MTOPEI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x35c<br>
+<br>
+/* Virtual Interrupts for Supervisor Level (AIA) */<br>
+#define CSR_MVIEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x308<br>
+#define CSR_MVIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x309<br>
+<br>
+/* Machine-Level High-Half CSRs (AIA) */<br>
+#define CSR_MIDELEGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x313<br>
+#define CSR_MIEH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x314<br>
+#define CSR_MVIENH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x318<br>
+#define CSR_MVIPH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x319<br>
+#define CSR_MIPH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x354<br>
+<br>
=C2=A0/* Supervisor Trap Setup */<br>
=C2=A0#define CSR_SSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x100<br>
=C2=A0#define CSR_SEDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x102<br>
@@ -187,6 +212,24 @@<br>
=C2=A0#define CSR_SPTBR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x180<br>
=C2=A0#define CSR_SATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x180<br>
<br>
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */<br>
+#define CSR_SISELECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x150<br>
+#define CSR_SIREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x151<br>
+<br>
+/* Supervisor-Level Interrupts (AIA) */<br>
+#define CSR_STOPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xdb0<br>
+<br>
+/* Supervisor-Level IMSIC Interface (AIA) */<br>
+#define CSR_SSETEIPNUM=C2=A0 =C2=A0 =C2=A0 0x158<br>
+#define CSR_SCLREIPNUM=C2=A0 =C2=A0 =C2=A0 0x159<br>
+#define CSR_SSETEIENUM=C2=A0 =C2=A0 =C2=A0 0x15a<br>
+#define CSR_SCLREIENUM=C2=A0 =C2=A0 =C2=A0 0x15b<br>
+#define CSR_STOPEI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x15c<br>
+<br>
+/* Supervisor-Level High-Half CSRs (AIA) */<br>
+#define CSR_SIEH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x114<br>
+#define CSR_SIPH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x154<br>
+<br>
=C2=A0/* Hpervisor CSRs */<br>
=C2=A0#define CSR_HSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x600<br>
=C2=A0#define CSR_HEDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x602<br>
@@ -217,6 +260,35 @@<br>
=C2=A0#define CSR_MTINST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34a<br>
=C2=A0#define CSR_MTVAL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x34b<br>
<br>
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */<b=
r>
+#define CSR_HVIEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x608<br>
+#define CSR_HVICTL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x609<br>
+#define CSR_HVIPRIO1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x646<br>
+#define CSR_HVIPRIO2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x647<br>
+<br>
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA)=
 */<br>
+#define CSR_VSISELECT=C2=A0 =C2=A0 =C2=A0 =C2=A00x250<br>
+#define CSR_VSIREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x251<br>
+<br>
+/* VS-Level Interrupts (H-extension with AIA) */<br>
+#define CSR_VSTOPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xeb0<br>
+<br>
+/* VS-Level IMSIC Interface (H-extension with AIA) */<br>
+#define CSR_VSSETEIPNUM=C2=A0 =C2=A0 =C2=A00x258<br>
+#define CSR_VSCLREIPNUM=C2=A0 =C2=A0 =C2=A00x259<br>
+#define CSR_VSSETEIENUM=C2=A0 =C2=A0 =C2=A00x25a<br>
+#define CSR_VSCLREIENUM=C2=A0 =C2=A0 =C2=A00x25b<br>
+#define CSR_VSTOPEI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x25c<br>
+<br>
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */<br>
+#define CSR_HIDELEGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x613<br>
+#define CSR_HVIENH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x618<br>
+#define CSR_HVIPH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x655<br>
+#define CSR_HVIPRIO1H=C2=A0 =C2=A0 =C2=A0 =C2=A00x656<br>
+#define CSR_HVIPRIO2H=C2=A0 =C2=A0 =C2=A0 =C2=A00x657<br>
+#define CSR_VSIEH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x214<br>
+#define CSR_VSIPH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x254<br>
+<br>
=C2=A0/* Enhanced Physical Memory Protection (ePMP) */<br>
=C2=A0#define CSR_MSECCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x747<br>
=C2=A0#define CSR_MSECCFGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x757<br>
@@ -629,4 +701,59 @@ typedef enum RISCVException {<br>
=C2=A0#define UMTE_U_PM_INSN=C2=A0 =C2=A0 =C2=A0 U_PM_INSN<br>
=C2=A0#define UMTE_MASK=C2=A0 =C2=A0 =C2=A0(UMTE_U_PM_ENABLE | MMTE_U_PM_CU=
RRENT | UMTE_U_PM_INSN)<br>
<br>
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */<br>
+#define ISELECT_IPRIO0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x30<br>
+#define ISELECT_IPRIO15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x3f<br>
+#define ISELECT_IMSIC_EIDELIVERY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
x70<br>
+#define ISELECT_IMSIC_EITHRESHOLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x72<b=
r>
+#define ISELECT_IMSIC_EIP0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00x80<br>
+#define ISELECT_IMSIC_EIP63=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0xbf<br>
+#define ISELECT_IMSIC_EIE0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00xc0<br>
+#define ISELECT_IMSIC_EIE63=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0xff<br>
+#define ISELECT_IMSIC_FIRST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ISELECT_IMSIC_EIDELIVERY<br>
+#define ISELECT_IMSIC_LAST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ISELECT_IMSIC_EIE63<br>
+#define ISELECT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1ff<br>
+<br>
+/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */<br>
+#define ISELECT_IMSIC_TOPEI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (ISELECT_MASK + 1)<br>
+<br>
+/* IMSIC bits (AIA) */<br>
+#define IMSIC_TOPEI_IID_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 16<br>
+#define IMSIC_TOPEI_IID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x7ff<br>
+#define IMSIC_TOPEI_IPRIO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x7ff<br>
+#define IMSIC_EIPx_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 32<br>
+#define IMSIC_EIEx_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 32<br>
+<br>
+/* MTOPI and STOPI bits (AIA) */<br>
+#define TOPI_IID_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A016<br>
+#define TOPI_IID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0xfff<br>
+#define TOPI_IPRIO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0xff<br>
+<br>
+/* Interrupt priority bits (AIA) */<br>
+#define IPRIO_IRQ_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define IPRIO_MMAXIPRIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 255<br>
+#define IPRIO_DEFAULT_MMAXIPRIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
5<br>
+#define IPRIO_DEFAULT_VS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(IPRIO_DEFAULT_MMAXIPRIO - 4)<br>
+#define IPRIO_DEFAULT_SGEXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - 5)<br>
+#define IPRIO_DEFAULT_S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - 6)<br>
+#define IPRIO_DEFAULT_M=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - 7)<br>
+#define IPRIO_DEFAULT_U(_i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (((_i) &gt;&gt; 4) &amp; 0x3)<br>
+#define IPRIO_DEFAULT_L(_i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ((_i) &amp; 0xf)<br>
+#define IPRIO_DEFAULT_16_23(_i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) &gt;&gt; 1))=
<br>
+#define IPRIO_DEFAULT_24_31(_i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - (4 + (IPRIO_DEFAULT_L(_i) &gt;&gt=
; 1)))<br>
+#define IPRIO_DEFAULT_32_47(_i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) &gt;&gt; 2))=
<br>
+#define IPRIO_DEFAULT_48_63(_i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 (IPRIO_DEFAULT_MMAXIPRIO - (8 + (IPRIO_DEFAULT_L(_i) &gt;&gt=
; 2)))<br>
+<br>
+/* HVICTL bits (AIA) */<br>
+#define HVICTL_VTI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x40000000<br>
+#define HVICTL_IID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0fff0000<br>
+#define HVICTL_IPRIOM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x00000100<br>
+#define HVICTL_IPRIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000ff<br>
+#define HVICTL_VALID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)<br>
+<br>
=C2=A0#endif<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000458e6405d5621ca7--

