Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKpaz-0004ld-PJ
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 14:04:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpaw-0004kr-NO
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 14:03:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpas-0002B9-5r
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 14:03:58 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKpar-00027u-M9
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 14:03:54 -0500
Received: by mail-pl1-x642.google.com with SMTP id f12-v6so8782696plo.1
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:date:references:in-reply-to:message-id:subject:from:to
	:cc; bh=4sc3ryc+7yWNWKikvMvofU9HeBlrHTYTfICCNYahMbc=;
	b=jikkccNP8WMtEBryCl+mOR2Df0QYYhGMFVTplSd/hvxL4cHmXfF6yHxfj95waywpyc
	Uen6TswpAYptI3y42cqGCcZQdMsBz9GNdpyNP8UNBNberHx6m2hVefd5opnZVvSbzvR5
	mAlv819MmMKSDA2brPyFiYR9vpL6+bI0WezyemejE3uZvAxpZSBt4wKQ+CvTPJYnvNO+
	T8+TsyS0EtIbJkCNSUr0FTi2So3C9JX4DtVwk344helQWkcwLtQd3ScIYgvjbjbGixWI
	wfWktGcdlfSOi+swLMVCga1AVgdGLD0OrxQpArgI7JIK8Zv3pRN1Kvxdrk0P2n+cNa/a
	xKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:references:in-reply-to
	:message-id:subject:from:to:cc;
	bh=4sc3ryc+7yWNWKikvMvofU9HeBlrHTYTfICCNYahMbc=;
	b=OzZm6EsjcVtaDln0J947HGZldgMdZBCu9IWKEnU1rnXCgnU0pyLHYCHsHv9uLanmpd
	02r6o+wva8HORqtlC+hH50EEzCSO1WJ+6iALeeTDAhl7lGHKIYRLmKrGwbAlWDXSNcYS
	pTkfpZLlDLUwEY2zPRtMBMJvGg6yMbg0s+6t/V+xgppVuFcu0mUcK/B+spXYqil90yv/
	uoXy1c08hKt9L8xuf5oY25Y2JZuIIOxfetVJL3RhWGXwVkB63tT1UBF075rFfeuPC3W0
	ubfwlNFVGDzb4hjt7nGaL/RyPhIdVcHYrqb78Qrh/KaFgDNONuFFeFnNVrO+/uEg+r46
	Rk3w==
X-Gm-Message-State: AGRZ1gI7QrAMBJvdNmlgiZoKVwz3o9dkenqcSXLcZPVbQpyQs+BOI8eO
	7OY3KLvucaFe/luG+z2wxPVdwA==
X-Google-Smtp-Source: AJdET5epYnDLpWvuw+TFiSF9dVCWGlsWV8/apiU7xDJZkBVaFS/xwhvT50XnjNY4rDq/eReiOv5NSg==
X-Received: by 2002:a17:902:8543:: with SMTP id
	d3-v6mr5707593plo.313.1541703832362; 
	Thu, 08 Nov 2018 11:03:52 -0800 (PST)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id l3sm4202879pga.92.2018.11.08.11.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 11:03:51 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 8 Nov 2018 10:58:05 -0800
References: <1793576616012e06e68cd9e0215eb907ff2ef12b.1541627403.git.alistair.francis@wdc.com>
In-Reply-To: <1793576616012e06e68cd9e0215eb907ff2ef12b.1541627403.git.alistair.francis@wdc.com>
Message-ID: <CANs6eMmcgZMoNbv83idynU_qt6GKrGNMu0GkbpxDidw_=QNNOw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Content-Type: multipart/alternative; boundary="000000000000a822dd057a2bd088"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [PATCH for 3.1 v1 1/1] hw/riscv/virt: Free the
 test device tree node name
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
X-List-Received-Date: Thu, 08 Nov 2018 19:03:59 -0000

--000000000000a822dd057a2bd088
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 1:52 PM Alistair Francis <Alistair.Francis@wdc.com> 
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a137a503c..2b38f89070 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const 
> struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[VIRT_TEST].base,
>          0x0, memmap[VIRT_TEST].size);
> +    g_free(nodename);
>
>      nodename = g_strdup_printf("/uart@%lx",
>          (long)memmap[VIRT_UART0].base);
> -- 
> 2.19.1
>

Reviewed-by: Palmer Dabbelt <palmer@sifive.com> 

--000000000000a822dd057a2bd088
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 7,=
 2018 at 1:52 PM Alistair Francis &lt;<a href=3D"mailto:Alistair.Francis@wd=
c.com">Alistair.Francis@wdc.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistai=
r.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/virt.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index 4a137a503c..2b38f89070 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const struct=
 MemmapEntry *memmap,<br>
=C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_cells(fdt, nodename, &quot;reg&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0, memmap[VIRT_TEST].base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0, memmap[VIRT_TEST].size);<br>
+=C2=A0 =C2=A0 g_free(nodename);<br>
<br>
=C2=A0 =C2=A0 =C2=A0nodename =3D g_strdup_printf(&quot;/uart@%lx&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long)memmap[VIRT_UART0].base);<br>
-- <br>
2.19.1<br></blockquote><div><br></div><div>Reviewed-by: Palmer Dabbelt &lt;=
<a href=3D"mailto:palmer@sifive.com">palmer@sifive.com</a>&gt;=C2=A0</div><=
/div></div>

--000000000000a822dd057a2bd088


--000000000000a822dd057a2bd088--
