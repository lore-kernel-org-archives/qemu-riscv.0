Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hS7EO-0007MZ-Lr
	for mharc-qemu-riscv@gnu.org; Sat, 18 May 2019 17:51:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hS7EL-0007M2-OV
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 17:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hS7EK-0008Dv-E6
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 17:51:01 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hS7EK-0008Bp-3L; Sat, 18 May 2019 17:51:00 -0400
Received: by mail-lf1-x144.google.com with SMTP id y19so7686159lfy.5;
	Sat, 18 May 2019 14:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TGYcq3uL2t5IesqkvoIlD28a6haYO9HahMhUN4ZmhBA=;
	b=CMujSkON83qVIW5+8i/88Q7kwknN2U80FAVIGoqEINYwQXLo9g76yv5EIdipr5e1HK
	nsYTpe5eBqtR9fRhEcr5rAb8Mv9A8pQ6Fg/U3OkpGe1bW6xUYhDhpQCoG8Hn0xT3Ha1L
	z2SJxwGnzl4VvKv/jEG7ubfcLlzLdsf01Q9OrStNcWStSjo8cXXWVhr/EiAyun1aKBh3
	fUgFuYG/9L2mzXCxY4O+GYgoIMWk1rrou+I4Y4L0HalaIcLhYfWKBh74PqM/xRLy4qws
	j7PGx3rSqLgL4ffMGmfWodnYHAA1Sn1Ohti9Yf9OeaqsYpXbra5l8jt0+BB0JYXtcEgZ
	uw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TGYcq3uL2t5IesqkvoIlD28a6haYO9HahMhUN4ZmhBA=;
	b=EZM1CsHWB8R6vO6xqpQGUmmtqvPILJnBridmxW2VTiAuB7jzc+OjqIImef+TmaolkJ
	YbfXPfTL0/K6TCy3lJN2z0hJ8bSPTLrom7RuOVqAlEtFY8u4nficltBDfax3WCoz8W34
	LbTO3eWFSWAcZ4jsd1+mcdmW9m2tLOBV65+ENXCBkRmQxF2A51752AlIYaQIHtNW319R
	/WYddHRI0tb92655jtzojbNcSnWwHlHcT7rlXUCRiXkQdUCeK2fsyvxGWCV3J3Kasbyf
	dH58vMyL2V0ymrkmZPxoU4azXRTQD5EZMeUSR2r3wciokowHQ8azTRspLcA/I1XmwCT1
	iyvA==
X-Gm-Message-State: APjAAAUWW+47eZmUYT2mifZ17akJiXmIpLQLWL24nTFX8Hb+jWp/DFlm
	NSvTkVjqwuK6tD7ATUPmaJCWlJaTzqouNyapU0I=
X-Google-Smtp-Source: APXvYqwGyPG+j1NA7+y8PGXBReZStyTMYwKbrA9UMP748w3qUuZX8txoPyOjRNFSm+mNfNdyTna8MHoXz3Qfa89jzGE=
X-Received: by 2002:ac2:528f:: with SMTP id q15mr13859490lfm.37.1558216257484; 
	Sat, 18 May 2019 14:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190518191323.4907-1-Hesham.Almatary@cl.cam.ac.uk>
In-Reply-To: <20190518191323.4907-1-Hesham.Almatary@cl.cam.ac.uk>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Sat, 18 May 2019 17:50:31 -0400
Message-ID: <CANnJOVHoc3fAx=_iuOxaKjtWoUg2_npXu+CzQ+CcppevBmddtA@mail.gmail.com>
To: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000082bd710589307e15"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [PATCH 1/2] RISC-V: Raise access fault exceptions
 on PMP violations
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
X-List-Received-Date: Sat, 18 May 2019 21:51:03 -0000

--00000000000082bd710589307e15
Content-Type: text/plain; charset="UTF-8"

This patch assumes that translation failure should always raise a paging
fault, but it should be possible for it to raise an access fault as well
(since according to the spec "PMP  checks  are  also  applied  to
page-table  accesses  for  virtual-address translation, for which the
effective privilege mode is S."). I think the code to actually do the PMP
checking during page table walks is currently unimplemented though...

Jonathan

On Sat, May 18, 2019 at 3:14 PM Hesham Almatary <
Hesham.Almatary@cl.cam.ac.uk> wrote:

> Section 3.6 in RISC-V v1.10 privilege specification states that PMP
> violations
> report "access exceptions." The current PMP implementation has
> a bug which wrongly reports "page exceptions" on PMP violations.
>
> This patch fixes this bug by reporting the correct PMP access exceptions
> trap values.
>
> Signed-off-by: Hesham Almatary <hesham.almatary@cl.cam.ac.uk>
> ---
>  target/riscv/cpu_helper.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 41d6db41c3..b48de36114 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -318,12 +318,13 @@ restart:
>  }
>
>  static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
> -                                MMUAccessType access_type)
> +                                MMUAccessType access_type, bool
> pmp_violation)
>  {
>      CPUState *cs = CPU(riscv_env_get_cpu(env));
>      int page_fault_exceptions =
>          (env->priv_ver >= PRIV_VERSION_1_10_0) &&
> -        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE;
> +        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
> +        !pmp_violation;
>      switch (access_type) {
>      case MMU_INST_FETCH:
>          cs->exception_index = page_fault_exceptions ?
> @@ -389,6 +390,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>      CPURISCVState *env = &cpu->env;
>      hwaddr pa = 0;
>      int prot;
> +    bool pmp_violation = false;
>      int ret = TRANSLATE_FAIL;
>
>      qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
> @@ -402,6 +404,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>
>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>          !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type))
> {
> +        pmp_violation = true;
>          ret = TRANSLATE_FAIL;
>      }
>      if (ret == TRANSLATE_SUCCESS) {
> @@ -411,7 +414,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>      } else if (probe) {
>          return false;
>      } else {
> -        raise_mmu_exception(env, address, access_type);
> +        raise_mmu_exception(env, address, access_type, pmp_violation);
>          riscv_raise_exception(env, cs->exception_index, retaddr);
>      }
>  #else
> --
> 2.17.1
>
>
>

--00000000000082bd710589307e15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>This patch assumes that translation =
failure should always raise a paging fault, but it should be possible for i=
t to raise an access fault as well (since according to the spec &quot;PMP=
=C2=A0 checks=C2=A0 are=C2=A0 also=C2=A0 applied=C2=A0 to=C2=A0 page-table=
=C2=A0 accesses=C2=A0 for=C2=A0 virtual-address translation, for which the =
effective privilege mode is S.&quot;). I think the code to actually do the =
PMP checking during page table walks is currently unimplemented though...<b=
r></div><div><br></div><div>Jonathan<br></div></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 18, 2019 at=
 3:14 PM Hesham Almatary &lt;<a href=3D"mailto:Hesham.Almatary@cl.cam.ac.uk=
" target=3D"_blank">Hesham.Almatary@cl.cam.ac.uk</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Section 3.6 in RISC-V v1.10=
 privilege specification states that PMP violations<br>
report &quot;access exceptions.&quot; The current PMP implementation has<br=
>
a bug which wrongly reports &quot;page exceptions&quot; on PMP violations.<=
br>
<br>
This patch fixes this bug by reporting the correct PMP access exceptions<br=
>
trap values.<br>
<br>
Signed-off-by: Hesham Almatary &lt;<a href=3D"mailto:hesham.almatary@cl.cam=
.ac.uk" target=3D"_blank">hesham.almatary@cl.cam.ac.uk</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_helper.c | 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 41d6db41c3..b48de36114 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -318,12 +318,13 @@ restart:<br>
=C2=A0}<br>
<br>
=C2=A0static void raise_mmu_exception(CPURISCVState *env, target_ulong addr=
ess,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, bool pmp_=
violation)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(riscv_env_get_cpu(env));<br>
=C2=A0 =C2=A0 =C2=A0int page_fault_exceptions =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_=
10_0) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;satp, SATP_MODE) !=3D VM_1_1=
0_MBARE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;satp, SATP_MODE) !=3D VM_1_1=
0_MBARE &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_violation;<br>
=C2=A0 =C2=A0 =C2=A0switch (access_type) {<br>
=C2=A0 =C2=A0 =C2=A0case MMU_INST_FETCH:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D page_fault_exc=
eptions ?<br>
@@ -389,6 +390,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0hwaddr pa =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int prot;<br>
+=C2=A0 =C2=A0 bool pmp_violation =3D false;<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D TRANSLATE_FAIL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_log_mask(CPU_LOG_MMU, &quot;%s ad %&quot; VADDR_PR=
Ix &quot; rw %d mmu_idx %d\n&quot;,<br>
@@ -402,6 +404,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_feature(env, RISCV_FEATURE_PMP) &amp;&amp;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!pmp_hart_has_privs(env, pa, TARGET_PAGE_=
SIZE, 1 &lt;&lt; access_type)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmp_violation =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D TRANSLATE_FAIL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D TRANSLATE_SUCCESS) {<br>
@@ -411,7 +414,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,<br>
=C2=A0 =C2=A0 =C2=A0} else if (probe) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise_mmu_exception(env, address, access_type)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise_mmu_exception(env, address, access_type,=
 pmp_violation);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_raise_exception(env, cs-&gt;excepti=
on_index, retaddr);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#else<br>
--<br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000082bd710589307e15--

