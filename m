Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8xGd-0006d0-O8
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 21:22:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8vVI-0007qW-Ix
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 19:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8vVH-00027Z-Bp
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 19:29:12 -0400
Received: from mail-yw1-f43.google.com ([209.85.161.43]:41063)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1h8vQO-0005nO-Iu; Tue, 26 Mar 2019 19:24:08 -0400
Received: by mail-yw1-f43.google.com with SMTP id l15so10721307ywe.8;
	Tue, 26 Mar 2019 16:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9su9XAmO/1gPxcPx7cqMm/rMxZ0reS0jfDWABCEsLlo=;
	b=PJ4R1E9Do3ZMBcSGAtZ7BiPoAjvSkQrfj3Y6YbSHTkR/mpWJgfO5p5BRK8NK26e6MK
	mNf7Hf4hrau+Rtr68J9md8Iwfw2rV6oDvuq1/ZcQFvSzbvpbrQMt4zh62xOg7IsMGpoy
	X6stO942WsnbNAQOJzWYlQ5x8s930nCcVedBfka/C6QScnDBu8vfnngXS4X9dgaK4PwP
	qY41k7rq2JCUm9LQrmEC0oRV0hTBW9pwQUJUmkp86TmAtvLp2Rv4xot4fWw94+SIC+td
	xJo7GG/D7woQb2TPc4SmZgNizM9M2SlIegCcmETPo6d1/2X6hvnKrSJfMJ3kk7ChWRBe
	DuNA==
X-Gm-Message-State: APjAAAVMdJUNUUU8O0Q3HThZQTWuCXilmTi5TbTUJrDt96AwAWhDZgiG
	RndFJPSauSCqa3PcNfignhtjdLSzs6xTL8EPnz4=
X-Google-Smtp-Source: APXvYqy/YaslSAWY/Zmy5Cn3yJhmRMh0q7LIPCZqbtmyEghJlcDvWBZHL2RlDirjgERKlR5Cy4EddtB9pw9H1UrEeIU=
X-Received: by 2002:a81:4f10:: with SMTP id d16mr27677430ywb.184.1553642647992;
	Tue, 26 Mar 2019 16:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553129005.git.alistair.francis@wdc.com>
	<5c92e23e.1c69fb81.aa92f.dd74SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <5c92e23e.1c69fb81.aa92f.dd74SMTPIN_ADDED_BROKEN@mx.google.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 27 Mar 2019 00:23:56 +0100
Message-ID: <CAAdtpL7MKx6qNnKL8v5WCTH_5bQF3js3DRxJceqZQ0gGTRdAAg@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000243e7d0585079e23"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.43
X-Mailman-Approved-At: Tue, 26 Mar 2019 21:22:10 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.0 v1 5/5] riscv: plic:
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
X-List-Received-Date: Tue, 26 Mar 2019 23:29:13 -0000

--000000000000243e7d0585079e23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 21 mars 2019 02:00, Alistair Francis <Alistair.Francis@wdc.com> a
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

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>

--000000000000243e7d0585079e23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le j=
eu. 21 mars 2019 02:00, Alistair Francis &lt;<a href=3D"mailto:Alistair.Fra=
ncis@wdc.com">Alistair.Francis@wdc.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Instead of using error_report() to print gu=
est errors let&#39;s use<br>
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
auto">Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@=
amsat.org">f4bug@amsat.org</a>&gt;<br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000243e7d0585079e23--

