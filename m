Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixI3z-0003se-GP
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 17:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <keithp@keithp.com>) id 1ixI3x-0003oG-9m
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 17:13:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <keithp@keithp.com>) id 1ixI3w-00041U-CF
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 17:13:25 -0500
Received: from home.keithp.com ([63.227.221.253]:33170 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <keithp@keithp.com>)
 id 1ixI3t-0003oD-Rw; Thu, 30 Jan 2020 17:13:22 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 93B913F2AA6C;
 Thu, 30 Jan 2020 14:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1580422397; bh=yaVHPGyh874+mQ78S8X2p8uzfvXeaQLIIHBITFxyqsQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pyF0PfWEvm86RmPnDF43aYq9Pto7fpSYebXHHLpe06MaJesgZeqQaZMa5oA4jdQTw
 XpivhHPxyNoku/OBEfR4hoBmVVTVunq5Lu37hWyDbCiES+eU6wIRnPrU/6OPzi8ADg
 QeBmCr6R/XawVm4hCCNvTxV3FdCQ+8DI01x3QxThIH5PdhOtZ2Bhk3k0mj0YvYOzws
 t9I7PNxXPBg/eAuGVzQWuNDmS1JARKpRfywx/lIccwOqcxbyBS92HjxELhVUhk+Bir
 zPcWaO6aJHlG6ytu/+jb3MrChwinRqx7jwAwmMoOh2opOWxNkHaq4Q6Mnbt7CseFpq
 fQ4RLAISO4ztA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id lza7xOK8U_12; Thu, 30 Jan 2020 14:13:17 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 3350F3F2A963;
 Thu, 30 Jan 2020 14:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1580422397; bh=yaVHPGyh874+mQ78S8X2p8uzfvXeaQLIIHBITFxyqsQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pyF0PfWEvm86RmPnDF43aYq9Pto7fpSYebXHHLpe06MaJesgZeqQaZMa5oA4jdQTw
 XpivhHPxyNoku/OBEfR4hoBmVVTVunq5Lu37hWyDbCiES+eU6wIRnPrU/6OPzi8ADg
 QeBmCr6R/XawVm4hCCNvTxV3FdCQ+8DI01x3QxThIH5PdhOtZ2Bhk3k0mj0YvYOzws
 t9I7PNxXPBg/eAuGVzQWuNDmS1JARKpRfywx/lIccwOqcxbyBS92HjxELhVUhk+Bir
 zPcWaO6aJHlG6ytu/+jb3MrChwinRqx7jwAwmMoOh2opOWxNkHaq4Q6Mnbt7CseFpq
 fQ4RLAISO4ztA==
Received: by keithp.com (Postfix, from userid 1000)
 id AAF781582162; Thu, 30 Jan 2020 14:13:16 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH] riscv: Separate FPU register size from core register size
 in gdbstub [v2]
In-Reply-To: <mhng-2ed22ad1-9efc-4ffb-856b-0d63ad8a9173@palmerdabbelt-glaptop1>
References: <20200128233216.515171-1-keithp@keithp.com>
 <mhng-2ed22ad1-9efc-4ffb-856b-0d63ad8a9173@palmerdabbelt-glaptop1>
Date: Thu, 30 Jan 2020 14:13:16 -0800
Message-ID: <87sgjwr3sz.fsf@keithp.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.227.221.253
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
X-List-Received-Date: Thu, 30 Jan 2020 22:13:26 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Palmer Dabbelt <palmerdabbelt@google.com> writes:

> This isn't working for me.  When I apply it on top of my for-master (whic=
h is
> very close to master), I get=20

>     warning: while parsing target description (at line 1): Could not load=
 XML document "riscv-64bit-fpu.xml"

If you're building from an existing directory, I think you'll have to
force re-creation of riscv32-softmmu/gdbstub-xml.c

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl4zVPwACgkQ2yIaaQAA
ABHtExAAh+e3lWokXF31WEoms5bPrxYYzR9r8wyRH2+JPNYfK1uM5aZLuGSkZhrV
y3woNgwg1zv5A+xFIDGc+i6gt+H504rrpC+cx9KOWQr5m4PHxhXGKb9CmVSffIMh
uojLzicVZB1nS308LE+UEub6YoFJjET+qSjUX/C6ehjaEsSuTxRLYdcfzTXSbkRv
wDujGskwx/5z/xpbaeL4aLQNlYNCrLDiqDZeJiav+6sfgwJzEYg3sB55AwD0r1Qo
241vRlTV+12OICluHiy9nx2EvGQTFF3R0Psw5S7b41oZEgpAnVlQwFl9MUg4v0R1
dcsqMEmLVR/orsvlanDzPHaCJNY8ydi7mEsTZHking2npjxLXWovTRDhAA7tLGR6
0QV0iKfKkP2u0Cxsc4LJMoa8/6KXkkzPFTeMr6BXntKaKaGNDB5Bd78VX+32jNkL
Dfue+tNdKgsxR0waSDqDmxuYEI1eUWlucYG3QMNwTPeGRylUPUgxAjJ2Smok1hnZ
Qcrq/A82ucjRNePkP14IkSgh98McGxSNVOEp7JWLS4fx1F+Rjy3ZW/sPC1qOHaEB
PhQPkawwGxH2wJBjD+7ZufYF41JV5Wll5N8upFAOCeCVtOs/8fS/8eMRCufjx1Ii
ohUgh/zo6eF2IkxOIB1AWTFNqaW1qxgRUAuq77dbB9G4QL8nF3c=
=PEBC
-----END PGP SIGNATURE-----
--=-=-=--

