Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA6C2BA1B
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 22:38:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qhdvA-0008Id-2o; Sat, 16 Sep 2023 18:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qhdv8-0008HR-08; Sat, 16 Sep 2023 18:37:46 -0400
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qhdv5-0002Zm-Df; Sat, 16 Sep 2023 18:37:45 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: LIU Zhiwei <baxiantai@gmail.com>,
 "Andreas K. Huettel" <dilfridge@gentoo.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: qemu-riscv32 usermode still broken?
Date: Sun, 17 Sep 2023 00:37:32 +0200
Message-ID: <6353228.kQq0lBPeGt@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <4344798.atdPhlSkOF@pinacolada>
References: <10817413.NyiUUSuA9g@pinacolada>
 <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
 <4344798.atdPhlSkOF@pinacolada>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6111525.iIbC2pHGDl";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--nextPart6111525.iIbC2pHGDl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: qemu-riscv32 usermode still broken?
Date: Sun, 17 Sep 2023 00:37:32 +0200
Message-ID: <6353228.kQq0lBPeGt@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <4344798.atdPhlSkOF@pinacolada>
MIME-Version: 1.0

Am Donnerstag, 14. September 2023, 03:22:49 CEST schrieb Andreas K. Huettel:
> > > https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00119.html
> > > ^ Here I'm trying to find out more.
> > >
> > > Bash tests apparently indicate that argv[0] is overwritten, and that
> > > reading through a pipe or from /dev/tty fails or loses data.
> > >
> > > Apart from the bash testsuite failing, symptoms are as follows:
> > >
> > > * Something seems wrong in the signal handling (?):
> >=20
> > If it is wrong for signal handling and for 32-bit, I guess it may be=20
> > fixed by this patch
> >=20
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg981238.html
> >=20
> > And this patch has been merged into master branch yesterday.
> >=20
> > May be you can have a try based on the master branch.
>=20
> I added the patch to 8.0.3 (easier for the moment), and this did
> unfortunately *not* lead to any improvements.=20

Also with the patch on top of 8.1.0 no improvement or change.

> However, in the meantime on the GNU Make tracker Alejandro Colomar
> pointed me to another detail based on my oddities [1]:
>=20
> > I think [make] it's failing here:
> >=20
> > <https://git.savannah.gnu.org/cgit/make.git/tree/src/job.c#n757>
> >=20
> > But it's failing with ENOENT, which is not one of the documented
> > errors for wait(2):
>=20
> So maybe another point to look at would be the origin of the return
> values of wait, and whether that's wired correctly for rv32...
>=20
> [1] https://savannah.gnu.org/bugs/?64664

In the meantime I tried to nail down a reproducible hang in bash on this=20
frankensystem with qemu's gdb interface. This also pointed towards
child handling and wait [2].

[2] https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00128.html

Some time ago we already debugged that corner, and Alistair Francis
came up with a fix that improved the riscv32 situation back then [3].=20
Maybe that fix was somehow incomplete? Just speculating...

[3] https://bugs.launchpad.net/qemu/+bug/1906193


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart6111525.iIbC2pHGDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmUGLixfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSobDhAAq4zOXif0uxHFHv0BmJlzeQM2xxpsAtKmXaiQEymrUIv7Ioa9xVKSUUTp
F18gmRxRefvbouJ+YQCHg2Pfs6QuI5IMvkKUCKvSfG9PnbROocXT2GiyEigHejGq
38ZelAosJOEMG3gnuEqGm48NJAA8HhAONQt66SANEzb0g55B1YucWaoyZDhXKeA4
vn1UT/tB/5DJjiXB53CE4aI9R9hEHNyCoJhtcCJTgZt/vhkPWuK2MDuOKkUA7G0Y
tX1Sp1tR5Gqh0IqKnehJ+TYiQ/PwPSleGc9uHG9lKXGPJjL+UKzSM5x4gR/CwkYv
b1dP6OTbOfXc2XRx+P255gWImi12V0JWQ2UStdWVC3/yhBu230Z/RXEehImJ8ez5
2HM5htfodCw27FADvRw500NAH0fa1yEQPdrkYKTrYfHdyK5bdg60NyJTWthpbgZB
NXZiHbxXuEtc5mrK1E/Mty3fVVLaTuiRP1JFZDjiUkK78aG3Bkm351tKVfNE5w/T
tIU8QOqJBbYj+eIwBGOiIwGDStHyS5ibMemKWuUPQg5S1m18iq4bIfeIbPdcNJLi
2emeqCTzQhLFOuKon9nhBf0Qpk6H1sF3o8lvhRMv3WDvBQyFsI7vniePPmMVcNs4
ZKLgKpbFbEgIgCwydHIhu/0TW3z7eEHrNPpgGGgLb1kGpFRvu2A=
=jS5C
-----END PGP SIGNATURE-----

--nextPart6111525.iIbC2pHGDl--




