Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwrkh-0002R8-TA
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jan 2020 13:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fintelia@gmail.com>) id 1iwrkf-0002Nj-2X
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 13:07:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1iwrkd-0002le-Uv
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 13:07:44 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:38242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1iwrkb-0002h2-B1; Wed, 29 Jan 2020 13:07:41 -0500
Received: by mail-lj1-x243.google.com with SMTP id w1so355928ljh.5;
 Wed, 29 Jan 2020 10:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46JFxFrxdqcmsGAe6aUXjC3g01hxO0+G9hBRQ5spp+g=;
 b=Q8epl+3dXxlSnro/s0h9/jB32S7xjCi9VNrYLBthrLXZyVoQ9akKTWuxtKUYF58PQI
 LctVbAvnyc62V0ZiM4dHaK0uldzf2l++m67+z087lphLiLvS05gVOORd0iSf1KEw+nnd
 h1C8LBcGAM/1KuC0pvyCYTuCJe0b48HkKLynicmFYMFyAylgsJPjKb69/nNOWQ8DavYQ
 v3dOTOkTFMHqatsKFH0H1/T7sVnqHl5kvueZ/0PNimJVqasiy5EHqniNdERFMC6dDHVY
 wUAZs/0OmD2CXikyweFPpTxN+JyInfLfVgxA3oVHuV65gVvNtXuKGl87pTypQlvK9uTl
 jswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46JFxFrxdqcmsGAe6aUXjC3g01hxO0+G9hBRQ5spp+g=;
 b=VkJukF7qti818YOnTyZH/Oxlp9Qs3t9Ladl2NXqi8Jiq1KadTnYuLDdDMh0bilKoR9
 J1CXgwGjxe/k8Nxryba1AWMqnX01rXhvA1g4zTJoVinjdyNpn/wWeU1z09y3G7BH6H1y
 DMqcE2ctjfxz5HPtfNiCBuT6UqWn9LJP2w0J2ytNig/4DxgLRy55KuivoFGGd/kJfR/V
 JnSPgLxqUc/QmRodmVEaUg7PXDn0yBI/Sx+95uZv9pd0aeLh9u9Ij26UfqfYKv2sXpHN
 ++G2LzizhmRHqqYeoZfqL7ATrz4Hb0kUML+Lrd+Po+pZvv9283eDv+4luefuMDRCWF3H
 yA+w==
X-Gm-Message-State: APjAAAVLMIs4HL3dq/WGJq9glgEtLp6Nt5hiPQS2nhRdlLtG69K54gBS
 umeSWwKwng/DScvkRJp9dXhrnv8zeoBKiXrN29g=
X-Google-Smtp-Source: APXvYqzNeIiLWwLNSAYsZOxzav1SbFf8BoK5IgIkGnhak4kmilG+s/vCzf1FOokberBsucJGc+J5sgOVUGkbAOnPZow=
X-Received: by 2002:a2e:7009:: with SMTP id l9mr239244ljc.96.1580321259499;
 Wed, 29 Jan 2020 10:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20200128233224.515233-1-keithp@keithp.com>
 <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
 <877e1arz2w.fsf@keithp.org>
In-Reply-To: <877e1arz2w.fsf@keithp.org>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Wed, 29 Jan 2020 13:06:11 -0500
Message-ID: <CANnJOVHkNN2+dnd6UJF3MpU1uLTEoCk2tnJrNzowh3UX4u3mfw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add semihosting support [v4]
To: Keith Packard <keithp@keithp.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004db680059d4b3770"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Wed, 29 Jan 2020 18:07:46 -0000

--0000000000004db680059d4b3770
Content-Type: text/plain; charset="UTF-8"

The text you are referencing (the couple italic paragraphs below section
2.8 in the unprivileged ISA) is non-normative and "can be skipped if the
reader is only interested in the specification itself". This convention of
making indented italic text non-normative is described at the bottom of
page 1 of the linked document.

Jonathan

On Wed, Jan 29, 2020 at 11:45 AM Keith Packard via <qemu-riscv@nongnu.org>
wrote:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > True but irrelevant. You need to refer to a proper
> > risc-v specification for your semihosting.
>
> The RISC-V Foundation defined semihosting as relative to the existing
> ARM specification, so using a link to that is appropriate here.
>
> Here's the current specification of the unprivileged ISA, which includes
> the definition of semihosting
>
>         https://riscv.org/specifications/
>
> While it may be nice in some abstract sense to create a "better"
> semihosting spec, that's not what the RISC-V foundation has decided to
> do.
>
> --
> -keith
>

--0000000000004db680059d4b3770
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The text you are referencing (the couple italic parag=
raphs below section 2.8 in the unprivileged ISA) is non-normative and &quot=
;can be skipped if the reader is only interested in the specification itsel=
f&quot;. This convention of making indented italic text non-normative is de=
scribed at the bottom of page 1 of the linked document.<br></div><div><br><=
/div><div>Jonathan<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jan 29, 2020 at 11:45 AM Keith Packar=
d via &lt;<a href=3D"mailto:qemu-riscv@nongnu.org">qemu-riscv@nongnu.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank=
">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; True but irrelevant. You need to refer to a proper<br>
&gt; risc-v specification for your semihosting.<br>
<br>
The RISC-V Foundation defined semihosting as relative to the existing<br>
ARM specification, so using a link to that is appropriate here.<br>
<br>
Here&#39;s the current specification of the unprivileged ISA, which include=
s<br>
the definition of semihosting<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://riscv.org/specifications/" r=
el=3D"noreferrer" target=3D"_blank">https://riscv.org/specifications/</a><b=
r>
<br>
While it may be nice in some abstract sense to create a &quot;better&quot;<=
br>
semihosting spec, that&#39;s not what the RISC-V foundation has decided to<=
br>
do.<br>
<br>
-- <br>
-keith<br>
</blockquote></div>

--0000000000004db680059d4b3770--

