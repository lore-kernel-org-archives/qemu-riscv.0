Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9Gcx-00068x-8T
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 18:02:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9Gcu-00066z-6C
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 18:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9Gcs-00080I-Uv
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 18:02:28 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:42314)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h9Gcq-0007zE-6o; Wed, 27 Mar 2019 18:02:24 -0400
Received: by mail-yw1-f68.google.com with SMTP id e76so13719705ywa.9;
	Wed, 27 Mar 2019 15:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sv9rulXoAEcWK+XDzSPidHmfkauhULCIiK+FyTFeNZo=;
	b=Y9GcYSiE7WCF4RHLkjXczhadCUG9zRBylTnqSg2gjPFWIFRZqIyOAAnCBzbeqQcoGW
	7wTNqdaobA9vQoSSbwdljM2HVLUiGQSsxEns3/cvCLa0G+XmNF/oRTxmGpiOuIAUg0h6
	wza3MmCK0o8IxPJ9ijSm/CemzNObKaqauEwjnzioGz5vilsC+zun96DG9rFBUaz4kovx
	7wRFnwboERAPtueOJ8cLWa10X3w+Uk3mAQBc5MUEU2PUv4EsVEtsKGmF5UCGI3UTcaIo
	n67MrHGlYrgcWJ1Atjwbli9Hg21wOCHUlby3msXIidWrj1lsX2cL4ccbxQnCLFzz2rDP
	iUkg==
X-Gm-Message-State: APjAAAV50md6/KGtiSbzkCQF19bTQw3U0oNFsqArKQI7p7BiWZOjIiM6
	jqcKHz8wpgxswuyXEw5bKL1KHY0oBGAUwlOJQU0=
X-Google-Smtp-Source: APXvYqwsej6H7z/KOoU1Nu0Crf2L3jFEPT42N56lKWr24TpK4Kon/pRFjEzDLaXu9nQyh7pf4mw6xfV1xlKEFtD4rn0=
X-Received: by 2002:a5b:642:: with SMTP id o2mr31473582ybq.32.1553724143341;
	Wed, 27 Mar 2019 15:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553712571.git.alistair.francis@wdc.com>
	<5c9bc77e.1c69fb81.526f.a250SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <5c9bc77e.1c69fb81.526f.a250SMTPIN_ADDED_BROKEN@mx.google.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 27 Mar 2019 23:02:10 +0100
Message-ID: <CAAdtpL7Rn+P02xhXE4+=k-4091pk0PSdxgBt6gsx0XY0w4vNwA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, "alistair23@gmail.com" <alistair23@gmail.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000a496c505851a9727"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.0 v2 2/2] riscv: plic:
 Log guest errors
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2019 22:02:29 -0000

--000000000000a496c505851a9727
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 27 mars 2019 19:57, Alistair Francis <Alistair.Francis@wdc.com> a
=C3=A9crit :

> Instead of using error_report() to print guest errors let's use
> qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_plic.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 70a85cd075..7f373d6c9d 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -262,7 +262,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr
> addr, unsigned size)
>      }
>
>  err:
> -    error_report("plic: invalid register read: %08x", (uint32_t)addr);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
>      return 0;
>  }
>
> @@ -289,7 +291,9 @@ static void sifive_plic_write(void *opaque, hwaddr
> addr, uint64_t value,
>      } else if (addr >=3D plic->pending_base && /* 1 bit per source */
>                 addr < plic->pending_base + (plic->num_sources >> 3))
>      {
> -        error_report("plic: invalid pending write: %08x", (uint32_t)addr=
);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid pending write: 0x%" HWADDR_PRIx "",
> +                      __func__, addr);
>          return;
>      } else if (addr >=3D plic->enable_base && /* 1 bit per source */
>          addr < plic->enable_base + plic->num_addrs * plic->enable_stride=
)
> @@ -339,7 +343,9 @@ static void sifive_plic_write(void *opaque, hwaddr
> addr, uint64_t value,
>      }
>
>  err:
> -    error_report("plic: invalid register write: %08x", (uint32_t)addr);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
>  }
>
>  static const MemoryRegionOps sifive_plic_ops =3D {
> --
> 2.21.0
>

I'm using the GMail embedded gapp and wonder if the deduplication features
is not sometimes abusive, when the same patch is sent increasing versions,
I reply to the last version I see but my reply looks like I replied to the
first.
I might be also misusing the gapp :)
Anyway:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--000000000000a496c505851a9727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Le mer. 27 mars 2019 19:57, Alistair Francis &lt;<a href=3D"mailto:Alistair=
.Francis@wdc.com">Alistair.Francis@wdc.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Instead of using error_report() to prin=
t guest errors let&#39;s use<br>
qemu_log_mask(LOG_GUEST_ERROR,...) to log the error.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank" rel=3D"noreferrer">alistair.francis@wdc.com</a>&gt;<=
br>
---<br>
=C2=A0hw/riscv/sifive_plic.c | 12 +++++++++---<br>
=C2=A01 file changed, 9 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c<br>
index 70a85cd075..7f373d6c9d 100644<br>
--- a/hw/riscv/sifive_plic.c<br>
+++ b/hw/riscv/sifive_plic.c<br>
@@ -262,7 +262,9 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr a=
ddr, unsigned size)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0err:<br>
-=C2=A0 =C2=A0 error_report(&quot;plic: invalid register read: %08x&quot;, =
(uint32_t)addr);<br>
+=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: I=
nvalid register read 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, a=
ddr);<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
@@ -289,7 +291,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr=
, uint64_t value,<br>
=C2=A0 =C2=A0 =C2=A0} else if (addr &gt;=3D plic-&gt;pending_base &amp;&amp=
; /* 1 bit per source */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr &lt; plic-&gt;=
pending_base + (plic-&gt;num_sources &gt;&gt; 3))<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;plic: invalid pending write=
: %08x&quot;, (uint32_t)addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: invalid pending write: 0x%&quot; HWADDR_PRIx &quot;&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, addr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0} else if (addr &gt;=3D plic-&gt;enable_base &amp;&amp;=
 /* 1 bit per source */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr &lt; plic-&gt;enable_base + plic-&gt=
;num_addrs * plic-&gt;enable_stride)<br>
@@ -339,7 +343,9 @@ static void sifive_plic_write(void *opaque, hwaddr addr=
, uint64_t value,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0err:<br>
-=C2=A0 =C2=A0 error_report(&quot;plic: invalid register write: %08x&quot;,=
 (uint32_t)addr);<br>
+=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: I=
nvalid register write 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, a=
ddr);<br>
=C2=A0}<br>
<br>
=C2=A0static const MemoryRegionOps sifive_plic_ops =3D {<br>
-- <br>
2.21.0<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I&#39;m using the GMail embedded gapp and wonder if the deduplication=
 features is not sometimes abusive, when the same patch is sent increasing =
versions, I reply to the last version I see but my reply looks like I repli=
ed to the first.</div><div dir=3D"auto">I might be also misusing the gapp :=
)</div><div dir=3D"auto">Anyway:</div><div dir=3D"auto">Reviewed-by: Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt;<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a496c505851a9727--

