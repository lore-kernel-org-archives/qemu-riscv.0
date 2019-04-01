Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hB2MO-0003cw-1B
	for mharc-qemu-riscv@gnu.org; Mon, 01 Apr 2019 15:12:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hB2MM-0003bz-M4
	for qemu-riscv@nongnu.org; Mon, 01 Apr 2019 15:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hB2MK-0003b5-R4
	for qemu-riscv@nongnu.org; Mon, 01 Apr 2019 15:12:42 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39208)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hB2MI-0003Ux-DK; Mon, 01 Apr 2019 15:12:38 -0400
Received: by mail-lj1-x243.google.com with SMTP id l7so9244875ljg.6;
	Mon, 01 Apr 2019 12:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=CYyoKxP2tVMzsXeTaLE3iilx/FfVPxgXR34Y/usgyyY=;
	b=ZVlnEXq8X+x7VozNTRR1rYcaqE4OZLVqYd4vMwgUjdXrztY4yvPoZrCYxBW/Ck3Q2+
	i29LuYRSUjjfuD2S/pbLPPDf0uKPWmz7qGrBAKEVSE55q0CqonGScHlzxLA+dwuNPP1q
	J4QH+vnxhyJfT4r17FxO0SYTD2spaXxz0MIAFVn3Pfpj34gB45965O8wDF5HRPEb0aqh
	6aTii0kKU6+6Nt9cbgkKEorV4XTisvdj0kySrWLSHi3oeL+sDBmc+8s9EJ+DEz6RO4Eo
	zRhKyNh4RVjdJ33nj8C03Nl1fUOHJ/P06Yqwh9aYnMn/lu4RdUAr705xOkYNjlb9pdYU
	KhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=CYyoKxP2tVMzsXeTaLE3iilx/FfVPxgXR34Y/usgyyY=;
	b=ao9apI0gUOeziRP6db3IkI8HJh6X/Mc1ImeYD7xqHAcYv/1yqb+TtS60OpaMOjyYmT
	R5TjJT6zAncw1uL8eI8hQcXzOMj23avCxTkAV/6IkH9+f2tPbhlPcghtqLpDK7g1mwie
	Xiss9J9cEukdAboKZ7obvdKKPsVBUM11NP4XekhqMM2Nu/1uDKh8Oux5ov6NjvmXTW+K
	ApxlnPX31cN/vTDQUamq+dTFNRJ64pmseCjIGGRsC83tPJAIooWWYh8E49m1jT82zyS9
	s16nHBX1fhZyYkqyEAbtRlcAUn9FvU0+cpVn+xzbz2cQ/lgQofUVYEXDj63KfAipd9+z
	i7gQ==
X-Gm-Message-State: APjAAAXRe0KQfaQTGjifgvWXncCCBGgkVq6HPliCbqfhnTd5rI1MW3yz
	N2a4B0+vzDOF9pY7o71B1PoZJIXVI0BBX7SZu8ffGurA
X-Google-Smtp-Source: APXvYqyHTp+nZ+HPgu1UjzVXAIPKpRz19oAdJ7DoBX9IuKUpzj3PpvE8JuVDqv8DaZ8WRA5noI6JuMlWT9EcS/4Y+Rk=
X-Received: by 2002:a2e:8693:: with SMTP id l19mr24634312lji.47.1554145953751; 
	Mon, 01 Apr 2019 12:12:33 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Behrens <fintelia@gmail.com>
Date: Mon, 1 Apr 2019 15:12:07 -0400
Message-ID: <CANnJOVHadZt5Vho5sy6FGVgUW_yvYZg7BGDiGJFtRBCquyOXZA@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000080a87705857ccdd7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-riscv] [PATCH] target/riscv: Do not allow sfence.vma from
 user mode
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
X-List-Received-Date: Mon, 01 Apr 2019 19:12:43 -0000

--00000000000080a87705857ccdd7
Content-Type: text/plain; charset="UTF-8"

The 'sfence.vma' instruction is privileged, and should only ever be allowed
when executing in supervisor mode or higher.

Jonathan

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
---
 target/riscv/op_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index b7dc18a41e..644d0fb35f 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -145,9 +145,10 @@ void helper_tlb_flush(CPURISCVState *env)
 {
     RISCVCPU *cpu = riscv_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
-    if (env->priv == PRV_S &&
-        env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TVM)) {
+    if (!(env->priv >= PRV_S) ||
+        (env->priv == PRV_S &&
+         env->priv_ver >= PRIV_VERSION_1_10_0 &&
+         get_field(env->mstatus, MSTATUS_TVM))) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         tlb_flush(cs);
-- 
2.20.1

--00000000000080a87705857ccdd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>The &#39;sfence.vma&#39; instruction=
 is privileged, and should only ever be allowed when executing in superviso=
r mode or higher.<br></div><div><br></div><div>Jonathan</div><div><br></div=
><div dir=3D"ltr">Signed-off-by: Jonathan Behrens &lt;<a href=3D"mailto:fin=
telia@gmail.com">fintelia@gmail.com</a>&gt;<br>---<br>=C2=A0target/riscv/op=
_helper.c | 7 ++++---<br>=C2=A01 file changed, 4 insertions(+), 3 deletions=
(-)<br><br>diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c=
<br>index b7dc18a41e..644d0fb35f 100644<br>--- a/target/riscv/op_helper.c<b=
r>+++ b/target/riscv/op_helper.c<br>@@ -145,9 +145,10 @@ void helper_tlb_fl=
ush(CPURISCVState *env)<br>=C2=A0{<br>=C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *cp=
u =3D riscv_env_get_cpu(env);<br>=C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cs =3D =
CPU(cpu);<br>-=C2=A0=C2=A0=C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&amp;<b=
r>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env-&gt;priv_ver &gt;=3D PRIV=
_VERSION_1_10_0 &amp;&amp;<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g=
et_field(env-&gt;mstatus, MSTATUS_TVM)) {<br>+=C2=A0=C2=A0=C2=A0 if (!(env-=
&gt;priv &gt;=3D PRV_S) ||<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_10_0 &amp;&amp;<br>=
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_field(env-&gt;mstatus=
, MSTATUS_TVM))) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 risc=
v_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 } else {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
lb_flush(cs);<br>-- <br>2.20.1<br><br><br></div></div></div>

--00000000000080a87705857ccdd7--

