Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC499C282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 11:16:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trxaP-000566-Lt; Tue, 11 Mar 2025 07:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1trxaJ-00054G-TU
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 07:15:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1trxaD-0002gS-2O
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 07:15:42 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e6c18e2c7dso4353736a12.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741691730; x=1742296530; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JODqmJpjc0PT5iaWUAWGCAY04ya3pEVBlJWvvnWrQ/8=;
 b=aBzUZWl9F6IeoUjs+8M/2+aBmvxbl0kAipZDHyo0QydBeuyssMMgui9kUHuWsCiUwp
 BsKckjZO68Z5Su+1SmPDWrT9a22zaE9M60J7gldbN90eOz/EJxDcyCz3t3ssQxyVgrHs
 lT8kqerzG2DttqC9IeEQ6j1pPjiaRQ+GeDe9gdh5Yyjb3jxPMP1NifUmIzShY4iGO345
 SdHP3Oc3XE5d1+Rj9jrF/2VAgbC/8+WSkf7bw0UuDJOIfhZWIQ5EifA9a8jYLjmXd0ob
 ytIlt/CnciZPlKDctRzzbZHPhFix5ce8DPleWdaTf2G2aaDTfw33nS3XLTBKEDjCyjKk
 5ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741691730; x=1742296530;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JODqmJpjc0PT5iaWUAWGCAY04ya3pEVBlJWvvnWrQ/8=;
 b=Mrt13u5n0CwMEJ9vKSPId1KFPC3UQ1o2Ic9rzIZMQwTtGonmZUpy46O8GXHak/iqIZ
 GsY9Ym+0bzFFTHsbnDqxPnu5xm5dA0IhnPjkMasXuPhM/g/QGOzvtwtuyLNT5W5X3t2q
 574a7cFCoTxSz2deEVLsWLOFXC5emsuSNerHb9Hu3QjnquhxnT5AU7oilLIJGzTGUQWl
 fphtWdvgi6HeEP1nkOFBvnVWoqI/Cmha71iKq78nOQRXWiwlKmd1EGvsocvxqz6bvgkw
 KIPBb9pdQmj/sxzsXlEFSsmsxzFnmYhsmobpKxDcc945FfEUAioI7LMwBtn6WZ3YcAtD
 FlzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3+SsrJ0V72uQM2srlL8GJlrtSSkrApVIAD8OjgXW9N+CGliae0rCP65LoJBRX8NQREdiSxwryM8UU@nongnu.org
X-Gm-Message-State: AOJu0Yw1IPsKHwMyr3e8AouvfOUcAhL2+pGvyD22FlZOSENXh5uY+iLs
 xPKpjDgZ/2w5jHGpA1/kXXgSL7bmJhQ5U3UimbLOQFhte6ZOhzggYZ96XrYvAOU5M7I1L0QumoT
 jYQkq7rFsiFwE9PR6ybS3jkVtxBxN/5eZtrI7vg==
X-Gm-Gg: ASbGncsrUbmg0Xb1VMTDd2y9nUfwNwSfXa67f0jKxOPYtB+JMuFnhowL7r1it7bPXrK
 hfn0yowrmTY4bAfQYYJAh0QzELRAHWJTUxo6R3E69uyGPcLU7PrtVqSZgrRbqitDFbnVDJnCupX
 NTcFzX0+GL+uoKyAKxn6mWulg=
X-Google-Smtp-Source: AGHT+IFvk7GhulogJYj6Ovi2ALR2HT8lgySbT2VdE4fqFz7aoWIu/BgujxAXvvhS+iOEZ7REIavzPnrG4ymyNc/JQts=
X-Received: by 2002:a05:6402:4020:b0:5e5:ea02:1230 with SMTP id
 4fb4d7f45d1cf-5e5ea021550mr22367111a12.28.1741691730604; Tue, 11 Mar 2025
 04:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250227073049.32655-1-jason.chien@sifive.com>
In-Reply-To: <20250227073049.32655-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Tue, 11 Mar 2025 19:15:19 +0800
X-Gm-Features: AQ5f1JpdPnNBvJhsbvX-AJPPLFWXtswO5zALm80VUhBk6y3bjWDc5onCA9aCAjA
Message-ID: <CADr__8rS-Ociq7dG0Wpk5YB1RvVOMBZ3cEbeChWKVkYO1qX0VQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/edu: Rename macros indicating the direction of
 DMA operations
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Jiri Slaby <jslaby@suse.cz>
Content-Type: multipart/alternative; boundary="000000000000e94d9f06300f344c"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jason.chien@sifive.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000e94d9f06300f344c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

Jason Chien <jason.chien@sifive.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=8827=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:30=E5=AF=AB=E9=81=93=EF=BC=9A

> This commit renames the macros to accurately reflect the direction of
> DMA operations.
>
> EDU_DMA_TO_PCI now represents reading memory content into the EDU buffer,
> while EDU_DMA_FROM_PCI represents writing EDU buffer content to memory.
>
> The previous naming was misleading, as the definitions were reversed.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  hw/misc/edu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> index 504178b4a2..1353c67dc2 100644
> --- a/hw/misc/edu.c
> +++ b/hw/misc/edu.c
> @@ -63,8 +63,8 @@ struct EduState {
>
>  #define EDU_DMA_RUN             0x1
>  #define EDU_DMA_DIR(cmd)        (((cmd) & 0x2) >> 1)
> -# define EDU_DMA_FROM_PCI       0
> -# define EDU_DMA_TO_PCI         1
> +# define EDU_DMA_TO_PCI         0
> +# define EDU_DMA_FROM_PCI       1
>  #define EDU_DMA_IRQ             0x4
>      struct dma_state {
>          dma_addr_t src;
> @@ -146,7 +146,7 @@ static void edu_dma_timer(void *opaque)
>          return;
>      }
>
> -    if (EDU_DMA_DIR(edu->dma.cmd) =3D=3D EDU_DMA_FROM_PCI) {
> +    if (EDU_DMA_DIR(edu->dma.cmd) =3D=3D EDU_DMA_TO_PCI) {
>          uint64_t dst =3D edu->dma.dst;
>          edu_check_range(dst, edu->dma.cnt, DMA_START, DMA_SIZE);
>          dst -=3D DMA_START;
> --
> 2.43.2
>
>

--000000000000e94d9f06300f344c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Jason Chien &lt;<a href=3D"mailt=
o:jason.chien@sifive.com">jason.chien@sifive.com</a>&gt; =E6=96=BC 2025=E5=
=B9=B42=E6=9C=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:30=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This commit renames the macros to accurately reflect the direction of=
<br>
DMA operations.<br>
<br>
EDU_DMA_TO_PCI now represents reading memory content into the EDU buffer,<b=
r>
while EDU_DMA_FROM_PCI represents writing EDU buffer content to memory.<br>
<br>
The previous naming was misleading, as the definitions were reversed.<br>
<br>
Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com" ta=
rget=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/misc/edu.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/misc/edu.c b/hw/misc/edu.c<br>
index 504178b4a2..1353c67dc2 100644<br>
--- a/hw/misc/edu.c<br>
+++ b/hw/misc/edu.c<br>
@@ -63,8 +63,8 @@ struct EduState {<br>
<br>
=C2=A0#define EDU_DMA_RUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
1<br>
=C2=A0#define EDU_DMA_DIR(cmd)=C2=A0 =C2=A0 =C2=A0 =C2=A0 (((cmd) &amp; 0x2=
) &gt;&gt; 1)<br>
-# define EDU_DMA_FROM_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
-# define EDU_DMA_TO_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
+# define EDU_DMA_TO_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+# define EDU_DMA_FROM_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
=C2=A0#define EDU_DMA_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
4<br>
=C2=A0 =C2=A0 =C2=A0struct dma_state {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t src;<br>
@@ -146,7 +146,7 @@ static void edu_dma_timer(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (EDU_DMA_DIR(edu-&gt;dma.cmd) =3D=3D EDU_DMA_FROM_PCI) {<=
br>
+=C2=A0 =C2=A0 if (EDU_DMA_DIR(edu-&gt;dma.cmd) =3D=3D EDU_DMA_TO_PCI) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t dst =3D edu-&gt;dma.dst;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edu_check_range(dst, edu-&gt;dma.cnt, DMA=
_START, DMA_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst -=3D DMA_START;<br>
-- <br>
2.43.2<br>
<br>
</blockquote></div>

--000000000000e94d9f06300f344c--

