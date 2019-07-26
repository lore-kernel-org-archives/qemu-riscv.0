Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr4DR-0006ko-6q
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 13:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45165)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hr4DO-0006jL-Pn
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 13:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hr4DN-0008Ih-IX
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 13:41:10 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:34175)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hr4DM-0008ED-P7
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 13:41:09 -0400
Received: by mail-io1-xd44.google.com with SMTP id k8so106502770iot.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 10:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ju/a+1ebffMbw9h6KBThpPtb9pMJ4DA4Jdq1yJbuP4=;
 b=hpP+t8QmysjSYiI9a7e4xKQjOnT6n0ylUA6FJobdF+XWMyaWnOrs0nd5ZvXzrT4Z6H
 BRJEAUGv34Qc278BN/r3aSs2V3LFqGf5TAf6W4y2Al+MKwhHtUdCIVZbC5w6VqXktBew
 uZnF7qq+++fBDyQYbgT4mcMFUNn+egNq7Qp+nm5JnEHMekF5QbzoOusNiEW/NmV5iuPx
 GeOP5097BoeM7HcGidqY12Xo4vqyGY7rtGY4RJYEbLF2+SOrkExAjalp08t4BYZ0Fw0H
 q4iN+0U5WXPX/QGwJ2l76bcQEQZSozUaduSlwFO4G143yDuGm0gS907VXMUjqDXqYWGo
 ulTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ju/a+1ebffMbw9h6KBThpPtb9pMJ4DA4Jdq1yJbuP4=;
 b=TqOQmtdCJtsk5pcj6AnOiV4AA56t1y758a+OyBWvSgFBEZONna3eXJH79VS1nqG+ot
 +sbKjcg5GmO6QJhEdAKViKtFFZC+/T+Yitwe22DNvXUJrwdJO0Cjlo5mDH7M/Nao7imD
 T1781zF+3PXx7nGA9JJY9GNXUX9B0Muzv5ADt07AxN7Fw0UX0O8rYmKOdxcqn+ChJXRY
 JHxDrg0ExfHCywbGUD9f1hPsKYFTCK9uQ+Fj9ObkepHf1bmPJgCKDZU4PjK2qHyNoJo+
 yCS2yWmgTXyB+4R/wSIKCpvCjDpJ/spFuuA4FyRmp6hMrx0LsiYTuOOtw+cy1BcVagB+
 MiWA==
X-Gm-Message-State: APjAAAU7OwA7f8AaMrn97nMo6JwXd3+W8SMqJ/N2UoRRZaVi3XPDqPvd
 0CdAnq6SZcCRf6Ofs+d6VmijM2M0VHBLcPDxaUuVWA==
X-Google-Smtp-Source: APXvYqzkOSDU7gL2bu6uGizTvuxl8UnN2dq20ncNMuoCGmnvDzT8je+rXpUDRs+BJIbjdjqovYOVBtGeR4+2jsTHraA=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr41036969iob.178.1564162867014; 
 Fri, 26 Jul 2019 10:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <10db21dad60854653b7b6272a44a63e2473af2b0.1564080680.git.alistair.francis@wdc.com>
In-Reply-To: <10db21dad60854653b7b6272a44a63e2473af2b0.1564080680.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Sat, 27 Jul 2019 01:40:56 +0800
Message-ID: <CAEiOBXV1CfOfpTFFNas0cALjAkhjgDb78GkLusPO2bzoHROrxA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000000f4435058e990c2f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 5/6] target/riscv:
 Update the Hypervisor CSRs to v0.4
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
X-List-Received-Date: Fri, 26 Jul 2019 17:41:12 -0000

--0000000000000f4435058e990c2f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 26, 2019 at 2:55 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Update the Hypervisor CSR addresses to match the v0.4 spec.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 11f971ad5d..97b96c4e19 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -173,6 +173,24 @@
>  #define CSR_SPTBR           0x180
>  #define CSR_SATP            0x180
>
> +/* Hpervisor CSRs */
> +#define CSR_HSTATUS         0x600
> +#define CSR_HEDELEG         0x602
> +#define CSR_HIDELEG         0x603
> +#define CSR_HCOUNTERNEN     0x606
> +#define CSR_HGATP           0x680
> +
> +#if defined(TARGET_RISCV32)
> +#define HGATP_MODE           SATP32_MODE
> +#define HGATP_ASID           SATP32_ASID
> +#define HGATP_PPN            SATP32_PPN
> +#endif
> +#if defined(TARGET_RISCV64)
> +#define HGATP_MODE           SATP64_MODE
> +#define HGATP_ASID           SATP64_ASID
> +#define HGATP_PPN            SATP64_PPN
> +#endif
> +
>

Basd on spec, is HGATP_VMID  preferable ?

chihmin

>  /* Physical Memory Protection */
>  #define CSR_PMPCFG0         0x3a0
>  #define CSR_PMPCFG1         0x3a1
> @@ -206,23 +224,6 @@
>  #define CSR_DPC             0x7b1
>  #define CSR_DSCRATCH        0x7b2
>
> -/* Hpervisor CSRs */
> -#define CSR_HSTATUS         0xa00
> -#define CSR_HEDELEG         0xa02
> -#define CSR_HIDELEG         0xa03
> -#define CSR_HGATP           0xa80
> -
> -#if defined(TARGET_RISCV32)
> -#define HGATP_MODE           SATP32_MODE
> -#define HGATP_ASID           SATP32_ASID
> -#define HGATP_PPN            SATP32_PPN
> -#endif
> -#if defined(TARGET_RISCV64)
> -#define HGATP_MODE           SATP64_MODE
> -#define HGATP_ASID           SATP64_ASID
> -#define HGATP_PPN            SATP64_PPN
> -#endif
> -
>  /* Performance Counters */
>  #define CSR_MHPMCOUNTER3    0xb03
>  #define CSR_MHPMCOUNTER4    0xb04
> --
> 2.22.0
>
>
>

--0000000000000f4435058e990c2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2019 at 2:55 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Update the Hypervisor CSR addresses to match the v0.4 spec.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h | 35 ++++++++++++++++++-----------------<br>
=C2=A01 file changed, 18 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 11f971ad5d..97b96c4e19 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -173,6 +173,24 @@<br>
=C2=A0#define CSR_SPTBR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x180<br>
=C2=A0#define CSR_SATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x180<br>
<br>
+/* Hpervisor CSRs */<br>
+#define CSR_HSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x600<br>
+#define CSR_HEDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x602<br>
+#define CSR_HIDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x603<br>
+#define CSR_HCOUNTERNEN=C2=A0 =C2=A0 =C2=A00x606<br>
+#define CSR_HGATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x680<br>
+<br>
+#if defined(TARGET_RISCV32)<br>
+#define HGATP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP32_MODE<br>
+#define HGATP_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP32_ASID<br>
+#define HGATP_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SATP32_PPN<br>
+#endif<br>
+#if defined(TARGET_RISCV64)<br>
+#define HGATP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP64_MODE<br>
+#define HGATP_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP64_ASID<br>
+#define HGATP_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SATP64_PPN<br>
+#endif<br>
+<br></blockquote><div><br></div><div>Basd on spec, is HGATP_VMID=C2=A0 pre=
ferable ?<br></div><div><br></div><div>chihmin</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
=C2=A0/* Physical Memory Protection */<br>
=C2=A0#define CSR_PMPCFG0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3a0<br>
=C2=A0#define CSR_PMPCFG1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3a1<br>
@@ -206,23 +224,6 @@<br>
=C2=A0#define CSR_DPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7b1<=
br>
=C2=A0#define CSR_DSCRATCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7b2<br>
<br>
-/* Hpervisor CSRs */<br>
-#define CSR_HSTATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xa00<br>
-#define CSR_HEDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xa02<br>
-#define CSR_HIDELEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xa03<br>
-#define CSR_HGATP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xa80<br>
-<br>
-#if defined(TARGET_RISCV32)<br>
-#define HGATP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP32_MODE<br>
-#define HGATP_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP32_ASID<br>
-#define HGATP_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SATP32_PPN<br>
-#endif<br>
-#if defined(TARGET_RISCV64)<br>
-#define HGATP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP64_MODE<br>
-#define HGATP_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP64_ASID<br>
-#define HGATP_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SATP64_PPN<br>
-#endif<br>
-<br>
=C2=A0/* Performance Counters */<br>
=C2=A0#define CSR_MHPMCOUNTER3=C2=A0 =C2=A0 0xb03<br>
=C2=A0#define CSR_MHPMCOUNTER4=C2=A0 =C2=A0 0xb04<br>
-- <br>
2.22.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000000f4435058e990c2f--

