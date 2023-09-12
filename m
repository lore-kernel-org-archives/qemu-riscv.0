Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2A9EE3F3F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:31:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgBv9-0000wv-Jf; Tue, 12 Sep 2023 18:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qgBv8-0000wF-9o; Tue, 12 Sep 2023 18:31:46 -0400
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qgBv5-0006Mg-3G; Tue, 12 Sep 2023 18:31:46 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: qemu-riscv32 usermode still broken?
Date: Wed, 13 Sep 2023 00:31:32 +0200
Message-ID: <10817413.NyiUUSuA9g@pinacolada>
Organization: Gentoo Linux
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4469783.usQuhbGJ8B";
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

--nextPart4469783.usQuhbGJ8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: qemu-riscv32 usermode still broken?
Date: Wed, 13 Sep 2023 00:31:32 +0200
Message-ID: <10817413.NyiUUSuA9g@pinacolada>
Organization: Gentoo Linux
MIME-Version: 1.0

Dear all,=20

I've once more tried to build up a riscv32 linux install in a qemu-riscv32
usermode systemd-nspawn, and am running into the same problems as some time
ago...

https://dev.gentoo.org/~dilfridge/riscv32/riscv32.tar.xz   (220M)

The problems manifest themselves mostly in bash; if I replace /bin/bash=20
with a static x86-64 binary (in the tarball as /bin/bash.amd64), bypassing
qemu, I can make the chroot rebuild itself completely.

https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00119.html
^ Here I'm trying to find out more.=20

Bash tests apparently indicate that argv[0] is overwritten, and that
reading through a pipe or from /dev/tty fails or loses data.

Apart from the bash testsuite failing, symptoms are as follows:

* Something seems wrong in the signal handling (?):
=2D-- our package manager (bash/python combo, there bash) hangs reproducibl=
y at=20
one point.
=2D-- when I run a console program and try to background it with ctl-z, it =
hangs
    (only the first time per bash instance, it seems)
    repeated ctl-c gets me back to the shell, then the program is in the=20
background

riscv32 ~ # python
Python 3.11.5 (main, Aug 31 2023, 21:56:30) [GCC 13.2.1 20230826] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>=20
[1]+  Stopped                 python
^C^C^C^C^C^C^C
riscv32 ~ # ^C
riscv32 ~ #=20
riscv32 ~ # jobs
[1]+  Stopped                 python
riscv32 ~ # fg
python


>>>=20

=2D-- make, when building something, seems to always start only one job in=
=20
parallel

Any advice or debugging would be appreciated.=20

If we get this running then I can set up regular riscv32 Gentoo stage builds
within a week. [*]

Thanks in advance,
Andreas

PS.
huettel@pinacolada ~ $ /var/lib/machines/riscv32/usr/bin/qemu-riscv32 -vers=
ion
qemu-riscv32 version 8.1.0
Copyright (c) 2003-2023 Fabrice Bellard and the QEMU Project developers


[*] https://www.gentoo.org/downloads/#riscv

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart4469783.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmUA5sRfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSpcEBAAoe/5kNZ3rZV5+g0u/1NTx1Cu8Q7FOub4hWFRjiUXE9kpykBrfCrCH//m
A9AEO/rhn/QVnDs0N132pOtyIvgujRUeQu5VUc78v7WYcbO7OujmpJC9yCINYt2y
cV9/YGUoqAKS3TASe+KKPtdu8zDvzi45EXXx3odaxhDFSC38KAZXaETRRUrQg7ke
IZMoBxUo5c0fq72zvFSh18EDvcHZiSmwN2mBQ4RtuI0SbsJ+TUj0bvyNEfRGyijM
xjZLANRIZge21t9m3oSzml6kIX0lri0PEVjNgIgdtHAM+jzNBQ50oyOew09HBvqW
lxulu6FrU7xoVr9cKeI1DwZpqu5Bb7XYpXyIZT6r8VQOYlsGd+PGN0D0kupTL/ZU
qKYlrt4avdUNSCb7aHgI+Lb96v0e9STOWYR9Wkhw75AzyVuO6zL9BfMX9PBcOEg+
XBvLPnBb1uFe/fS27zt90Una7KMqQ5eSbJbA+2yV6qniAVWdvqu4pzFii1Su6DEw
zG8N3KGPlXmF6arUkYkaj6NLq0K/ovyBkjUdRlEP4MKBHIHoiRuEFrZlGOhh4dtK
CJUncJS3Oy1ApNBRY6F/Md/KLuJashsBvxqILIuq+2ixx13BJh7qCxcintXlsvJ2
wmpXEBeHBwc4Fv2WJeRd9uBzGVzceRdey44sFGD9nicJORwrwyw=
=JFxa
-----END PGP SIGNATURE-----

--nextPart4469783.usQuhbGJ8B--




