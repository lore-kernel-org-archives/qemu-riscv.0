Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7de4-0004rq-PZ
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 08:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7dds-0004oT-Qx
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:26:20 -0500
Received: from [2607:f8b0:4864:20::1036] (port=53770
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7ddr-0005F8-53
 for qemu-riscv@nongnu.org; Wed, 12 Jan 2022 08:26:20 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m13so4815750pji.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4nFbChKtI5HFpRaHGd2jNtuyH9zhZGk8AL/mAFl/7o=;
 b=eOG+v487EQQVDwICp3+LbhZZuR4E0+g3iDFgS45kMNIpaM8RowhKWhMZCmpsHPBr+O
 FsLFXMta3VYTAAuRxOQIYwHVWejX+4I/XZP2Gn8R/nPBdjsysnKjimYqbAjZlhLD3e64
 0PNdh6KfFm09HIaTBL2NMDHd7HYcU2kxoR1wL5bTAH4+cpanF2D9i6cYgvgli3WU4OF5
 tpzxD9qO7A3Jo1rksfpCrQiBkmt7jXjziFHr14XgNfljWA7SaieBcQDnwIbzzyIFuK9V
 YZ2JxMus3kb1XgDZojL4J1utnVjXEe2wmMzVU6sVvUafv0sYS6IttNSgzhihPcbQ2SGp
 B9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4nFbChKtI5HFpRaHGd2jNtuyH9zhZGk8AL/mAFl/7o=;
 b=U3iNJD8AfHpUwlf66JodJXpOVZbkTuYRjEBnHappMTHB+E79qnCXbgoFGjL51GyRjt
 km0OCA7dfwQfef/1zslDIPksjM51/Jkjp48tq6seEIfSPCtTMKeVw8H80be6i/bhFZHx
 lX5WQ7iOWwH//i5ZKVm455R/jzhICOfTaOf+OLWNgelc8EN2Eo7noNoUdoeTlQrXN5xR
 SAgYIVvn9MoD0JdMUr3tOabJOk8v6t1FEiJCe787iUje1b5cuXDiiMnBxo6hxCBd8Ynv
 7JahixQqm3xgPMYMfCMm+mDkNB3kP79UoRf0BOHYEyNpk0NPDP/xfxMTluSsaGhDCmmu
 lFQg==
X-Gm-Message-State: AOAM533Rskvs4eZ3HhI0x2oYe1aIOCJuUH1Hp3fe8OSqL2GaayaSpfby
 LnX3hl7Eu4xdEFl/Wnim3QDrmkCnLlaOWqxp
X-Google-Smtp-Source: ABdhPJz+Rql7B/iSen1XSmdwxn8BSxzISl0oJde4bVqh+94ibMoXcYMEYjd6vnZJvK3RvxxZTvyDRQ==
X-Received: by 2002:a63:705c:: with SMTP id a28mr4553662pgn.339.1641993977646; 
 Wed, 12 Jan 2022 05:26:17 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181])
 by smtp.gmail.com with ESMTPSA id h5sm14379291pfi.46.2022.01.12.05.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:26:16 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id h1so4048161pls.11;
 Wed, 12 Jan 2022 05:26:16 -0800 (PST)
X-Received: by 2002:a17:90a:4b0d:: with SMTP id
 g13mr8780276pjh.83.1641993976314; 
 Wed, 12 Jan 2022 05:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-24-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-24-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 21:26:05 +0800
X-Gmail-Original-Message-ID: <CANzO1D0y_-ryTOKt4XDJUzk0tbHF1qsvj5ytU=cTSXrLVZ4gUA@mail.gmail.com>
Message-ID: <CANzO1D0y_-ryTOKt4XDJUzk0tbHF1qsvj5ytU=cTSXrLVZ4gUA@mail.gmail.com>
Subject: Re: [PATCH v6 23/23] hw/riscv: virt: Increase maximum number of
 allowed CPUs
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="000000000000ae7fe305d562836f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Wed, 12 Jan 2022 13:26:22 -0000

--000000000000ae7fe305d562836f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:06=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> To facilitate software development of RISC-V systems with large number
> of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).
>
> We also add a detailed source level comments about limit defines which
> impact the physical address space utilization.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  hw/riscv/virt.c         | 10 ++++++++++
>  include/hw/riscv/virt.h |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 7579f7b41f..86b03736eb 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -44,6 +44,16 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>
> +/*
> + * The virt machine physical address space used by some of the devices
> + * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
> + * number of CPUs, and number of IMSIC guest files.
> + *
> + * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
> + * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
> + * of virt machine physical address space.
> + */
> +
>  #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT=
)
>  #if VIRT_IMSIC_GROUP_MAX_SIZE < \
>      IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e12e8ddcae..62d8e9c6d0 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -24,7 +24,7 @@
>  #include "hw/block/flash.h"
>  #include "qom/object.h"
>
> -#define VIRT_CPUS_MAX_BITS             3
> +#define VIRT_CPUS_MAX_BITS             9
>  #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
>  #define VIRT_SOCKETS_MAX_BITS          2
>  #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--000000000000ae7fe305d562836f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org" target=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2021=
=E5=B9=B412=E6=9C=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:06=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Anup Patel &lt;<a href=3D"mail=
to:anup.patel@wdc.com" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
To facilitate software development of RISC-V systems with large number<br>
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).<br>
<br>
We also add a detailed source level comments about limit defines which<br>
impact the physical address space utilization.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
---<br>
=C2=A0hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
=C2=A0include/hw/riscv/virt.h |=C2=A0 2 +-<br>
=C2=A02 files changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index 7579f7b41f..86b03736eb 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -44,6 +44,16 @@<br>
=C2=A0#include &quot;hw/pci-host/gpex.h&quot;<br>
=C2=A0#include &quot;hw/display/ramfb.h&quot;<br>
<br>
+/*<br>
+ * The virt machine physical address space used by some of the devices<br>
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,<br>
+ * number of CPUs, and number of IMSIC guest files.<br>
+ *<br>
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,<br=
>
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization<br>
+ * of virt machine physical address space.<br>
+ */<br>
+<br>
=C2=A0#define VIRT_IMSIC_GROUP_MAX_SIZE=C2=A0 =C2=A0 =C2=A0 (1U &lt;&lt; IM=
SIC_MMIO_GROUP_MIN_SHIFT)<br>
=C2=A0#if VIRT_IMSIC_GROUP_MAX_SIZE &lt; \<br>
=C2=A0 =C2=A0 =C2=A0IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_G=
UESTS_BITS)<br>
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h<br>
index e12e8ddcae..62d8e9c6d0 100644<br>
--- a/include/hw/riscv/virt.h<br>
+++ b/include/hw/riscv/virt.h<br>
@@ -24,7 +24,7 @@<br>
=C2=A0#include &quot;hw/block/flash.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
<br>
-#define VIRT_CPUS_MAX_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
3<br>
+#define VIRT_CPUS_MAX_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
9<br>
=C2=A0#define VIRT_CPUS_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (1 &lt;&lt; VIRT_CPUS_MAX_BITS)<br>
=C2=A0#define VIRT_SOCKETS_MAX_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
=C2=A0#define VIRT_SOCKETS_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 &lt;&lt; VIRT_SOCKETS_MAX_BITS)<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--000000000000ae7fe305d562836f--

