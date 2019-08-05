Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1huWLH-0001Ak-13
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 02:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58032)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1huWLD-00019A-QP
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1huWLC-0007DB-I1
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:19:31 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37015)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1huWLC-0007Cm-Du
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:19:30 -0400
Received: by mail-io1-xd2e.google.com with SMTP id q22so45128026iog.4
 for <qemu-riscv@nongnu.org>; Sun, 04 Aug 2019 23:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1DuDiNQtglBjRp20PSFaAsKw2FXyDFQdSpQgrUHAhrQ=;
 b=Unr+lODJwsfeBZ4k2YWDLoIjYAPk2uEP/U7hIe1Ps1FWyPgeWe+iYHHv178qw6dqWf
 FgLVVz++4geNrupnH8CV2qW3ZU0IZpOzB0W6L8o+Kq8vWoQ8eeSEcxxcsO3OTiDc9iSl
 /P3QoHV5hz12nj8nh9kYlK63jh8lQj0aed54Usm4+dHf8KgQu9iV4rOUlAqwhYCjbuq4
 Q7PERTpzDAqqXZ2RAV22QG5vXPPWy8GKmILcho1EAC0yqFRLF1EtTBTk56+CrlnKtFCg
 WcOjtHDtD/8slw9MnDfMfqwS/bMwZR0vivcsRmcsncJV6hylIfiBC26si2NyKWm+xaqL
 IUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DuDiNQtglBjRp20PSFaAsKw2FXyDFQdSpQgrUHAhrQ=;
 b=GUtD5PKc5I24A4funWUmTwfxBqhOGgcndlXEwBl752XWsNiagn5pd6+3hy0GCIjbGK
 KBE7N0+mo+6HjYyNMH8AREWCXZqbeF2aY+ecOOZrZJ/kwYS6BlzEVsy4Fx1k9t7gY8hi
 ssuNMRZdISZ2W9G12I+hwXwZAKe1tWuCcxs7CcYJ1jhqjWyaGLXOe6DH17NLZlgBfcDR
 SldaluXr63YtzkfQ+H0THykrip2XVCI75jgu7wL7adD+KQp7t++lcCHGkA30KcwkrGu0
 VihlqKnfMtwlNOb9WIU8BkS+R90y6T33N5VbBhlnM9cznBhB5cqOEVGh50NUmu2a8pRf
 lmGA==
X-Gm-Message-State: APjAAAUsE7FFlbvUXF9Hj3P4fYL/q2JtWmEUjoB4w1rsxD8zU1JZ4m9O
 /8ffH9rVBcoXoyFfwk3CLDaUPY32+DOwBlcK6/zXKQ==
X-Google-Smtp-Source: APXvYqxqn2qEJJSnuvLXt71c50oqODpWb07xyU0/rlt1d+LlV7YtHOU2bycs7IOYdsu9VUad1MpNztX6W7l61iGnwWQ=
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr38682669jao.58.1564985969333; 
 Sun, 04 Aug 2019 23:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564529681.git.alistair.francis@wdc.com>
 <dc666f1d37590b76d66415941bc24fe5a7cb46b4.1564529681.git.alistair.francis@wdc.com>
In-Reply-To: <dc666f1d37590b76d66415941bc24fe5a7cb46b4.1564529681.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Mon, 5 Aug 2019 14:19:16 +0800
Message-ID: <CAEiOBXVxn+AXX0M4U_mYzfHVjTECoCUxmPLpUZBFDXCB4i-gXQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000c7f676058f58b014"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d2e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v2 4/5] target/riscv:
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
X-List-Received-Date: Mon, 05 Aug 2019 06:19:33 -0000

--000000000000c7f676058f58b014
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 31, 2019 at 7:40 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Update the Hypervisor CSR addresses to match the v0.4 spec.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 11f971ad5d..e99834856c 100644
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
> +#define HGATP_VMID           SATP32_ASID
> +#define HGATP_PPN            SATP32_PPN
> +#endif
> +#if defined(TARGET_RISCV64)
> +#define HGATP_MODE           SATP64_MODE
> +#define HGATP_VMID           SATP64_ASID
> +#define HGATP_PPN            SATP64_PPN
> +#endif
> +
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
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--000000000000c7f676058f58b014
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 31, 2019 at 7:40 AM Alist=
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
index 11f971ad5d..e99834856c 100644<br>
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
+#define HGATP_VMID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP32_ASID<br>
+#define HGATP_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SATP32_PPN<br>
+#endif<br>
+#if defined(TARGET_RISCV64)<br>
+#define HGATP_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP64_MODE<br>
+#define HGATP_VMID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SATP64_ASID<br>
+#define HGATP_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SATP64_PPN<br>
+#endif<br>
+<br>
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
2.22.0<br><br></blockquote><div>Reviewed-by: Chih-Min Chao &lt;<a href=3D"m=
ailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a=
>&gt;=C2=A0=C2=A0</div></div></div>

--000000000000c7f676058f58b014--

