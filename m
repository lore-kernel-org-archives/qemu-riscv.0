Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iH1xj-0001LC-1Q
	for mharc-qemu-riscv@gnu.org; Sun, 06 Oct 2019 04:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <diodesign@tuta.io>) id 1iH1xg-0001Hy-BJ
 for qemu-riscv@nongnu.org; Sun, 06 Oct 2019 04:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <diodesign@tuta.io>) id 1iH1xf-0003E9-Bz
 for qemu-riscv@nongnu.org; Sun, 06 Oct 2019 04:32:16 -0400
Received: from w4.tutanota.de ([81.3.6.165]:55800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <diodesign@tuta.io>)
 id 1iH1xZ-0003AV-8n; Sun, 06 Oct 2019 04:32:09 -0400
Received: from w2.tutanota.de (unknown [192.168.1.163])
 by w4.tutanota.de (Postfix) with ESMTP id EE49C106019A;
 Sun,  6 Oct 2019 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570350726; 
 s=s1; d=tuta.io;
 h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=mb4XjjOktgcw4VQhqMQojvI2U/4ggDIyEqeWXS6auic=;
 b=Aa6fdY8lNSnhdVcLlcuLwICfnn5MUT1o0TY54Sl2HUzjeadEdA0Ka9X2cUlHvovL
 T/Erz/zsLskcJZeDXxKuRXarozwvTlG3Jo2uIkdf8iKqFj5kjvo+c/pgddV+uQFImHY
 6TL8hyP5knQRWO26Y9DZXXN5/QJm5qy5BHHVhxQ+WsHG4UOc0qWxVUR9hluBUGEichJ
 i3D+dpO8ho6iYP5hVgMdFxj+9PplBpUK6GuSy81cA0VFgWUkI1oPzQ+APnEudvOH4ft
 onH3caCn6wRQAsxVPMebiSxJOhi9g2Gp2bMqhZuBCbmgiaqW1f/AhVgnL2cYArJVPJn
 EFdQnl1uAg==
Date: Sun, 6 Oct 2019 10:32:06 +0200 (CEST)
From: Chris Williams <diodesign@tuta.io>
To: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Qemu Riscv <qemu-riscv@nongnu.org>, Qemu Devel <qemu-devel@nongnu.org>
Message-ID: <LqVBb_I--3-1@tuta.io>
Subject: [PATCH v2 1/1] target/riscv/pmp: Fix bug preventing
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 81.3.6.165
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
X-List-Received-Date: Sun, 06 Oct 2019 08:32:17 -0000

Hello. I hope you don't mind me resubmitting this patch. Please let me know=
 if
I've formatted it incorrectly or if it needs more explanation. My previous
attempt probably wasn't formatted quite right. This is my first time
contributing to Qemu, so I'm keen to get it right - thanks.

This fixes an issue that prevents a RISC-V CPU from executing instructions
immediately from the base address of a PMP TOR region.

When jumping to an instruction in a PMP TOR region, pmp_hart_has_privs() is
called to validate the access. If this instruction is the very first word o=
f a
PMP TOR region, at address 0 relative to the start address of the region, t=
hen
the access will fail. This is because pmp_hart_has_privs() is called with s=
ize
0 to perform this validation, causing this check...

e =3D pmp_is_in_range(env, i, addr + size - 1);

... to fail, as (addr + size - 1) falls below the base address of the PMP
region. Really, the access should succeed. For example, if I have a region
spanning 0x80d96000 to 0x88d95fff and the CPU jumps to 0x80d96000, then:

s =3D 0x80d96000
e =3D 0x80d95fff

And the validation fails. The size check proposed below catches these zero-=
size
instruction fetch access probes. The word alignment in pmpaddr{0-15} and
earlier instruction alignment checks should prevent the execution of
instructions over the upper boundary of the PMP region, though I'm happy to=
 give
this more attention if this is a concern.

Signed-off-by: Chris Williams <diodesign@tuta.io <mailto:diodesign@tuta.io>=
>

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d4f1007109..9308672e20 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -235,8 +235,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulon=
g
addr,
=C2=A0=C2=A0=C2=A0=C2=A0 /* 1.10 draft priv spec states there is an implici=
t order
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from low to high */
=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_RISCV_PMPS; i++) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* catch zero-size instruction =
checks */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s =3D pmp_is_in_range(env,=
 i, addr);
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e =3D pmp_is_in_range(env, i, a=
ddr + size - 1);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e =3D pmp_is_in_range(env, i, (=
size =3D=3D 0) ? addr : addr + size - 1);

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* partially inside */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((s + e) =3D=3D 1) {


