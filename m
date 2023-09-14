Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB4EE0212
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:23:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgb4T-0005aT-Ed; Wed, 13 Sep 2023 21:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qgb4R-0005Zf-7J; Wed, 13 Sep 2023 21:23:03 -0400
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qgb4O-0005nq-U6; Wed, 13 Sep 2023 21:23:02 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: LIU Zhiwei <baxiantai@gmail.com>
Subject: Re: qemu-riscv32 usermode still broken?
Date: Thu, 14 Sep 2023 03:22:49 +0200
Message-ID: <4344798.atdPhlSkOF@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
References: <10817413.NyiUUSuA9g@pinacolada>
 <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart48312231.fMDQidcC6G";
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

--nextPart48312231.fMDQidcC6G
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: LIU Zhiwei <baxiantai@gmail.com>
Subject: Re: qemu-riscv32 usermode still broken?
Date: Thu, 14 Sep 2023 03:22:49 +0200
Message-ID: <4344798.atdPhlSkOF@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
MIME-Version: 1.0

> > https://lists.gnu.org/archive/html/bug-bash/2023-09/msg00119.html
> > ^ Here I'm trying to find out more.
> >
> > Bash tests apparently indicate that argv[0] is overwritten, and that
> > reading through a pipe or from /dev/tty fails or loses data.
> >
> > Apart from the bash testsuite failing, symptoms are as follows:
> >
> > * Something seems wrong in the signal handling (?):
>=20
> If it is wrong for signal handling and for 32-bit, I guess it may be=20
> fixed by this patch
>=20
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg981238.html
>=20
> And this patch has been merged into master branch yesterday.
>=20
> May be you can have a try based on the master branch.

I added the patch to 8.0.3 (easier for the moment), and this did
unfortunately *not* lead to any improvements.=20

More debugging coming (weekend hopefully).

However, in the meantime on the GNU Make tracker Alejandro Colomar
pointed me to another detail based on my oddities [1]:

> I think [make] it's failing here:
>=20
> <https://git.savannah.gnu.org/cgit/make.git/tree/src/job.c#n757>
>=20
> But it's failing with ENOENT, which is not one of the documented
> errors for wait(2):

So maybe another point to look at would be the origin of the return
values of wait, and whether that's wired correctly for rv32...

[1] https://savannah.gnu.org/bugs/?64664


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart48312231.fMDQidcC6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmUCYGlfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSqoTxAAuqyx+sWRmn0AqgD7Gn2IwpsszmCWUwvJEetQm9br4NatnVXk6Wn0ipqC
7D8qwCs2xm9KYlVhaJm3cfJ2DCQWEKGNW2egmzFdwtRO8ltG7lRKx4y2FTrZNeuH
onYEksEH91mnuv5EmQ43dn11YSmrtE2k8jHN0sprMZQ+iukuAxdTpCsLgG3Z42Tb
vKwoyYlLuFirHZZeXse7Ir7X2KVqW/IUef8/5PIkmV8jfTDN9FONAEE9rn8MQD+e
VlYbrgs0crRKvgWgxxbdBOP5M64Mp+Z+RWH5cnEMaj4XZ9G6Dd8yZ+c7Gys1pnol
Tjd28EKeC7sAheAspJqEyMPwqxuisGGo/QpWjzq8mRPhgQSzFxYZlsazGWB0L5dx
bWK2VFuaFb7dx6N70cF5GH4iJHNcgkma+BB09W6xJLOP7mCwB/mx6BLzI0sC7m4y
a3lAoELXswt/UvNbJ8OTvDrYdxRohwTcyDjyHCH5kCiKXgQy7oUgjCzVoQGlTiVe
54QKJlApKamNM+nq6rSRi7ucV9TsdWh7Ip3P3XiWpxtV4lHkibNmo4wb5rT31c36
MqPP/Agm9+LMxH4KY2SsxBfCSBib0Y8t8UPzUfz4XAdkAyu1MFRRMAjUzCm0Acz9
fW2djqULqSbdRdhZussK9DNa2EJh3Arrq7X429yGeDSg1C6NelQ=
=GJMM
-----END PGP SIGNATURE-----

--nextPart48312231.fMDQidcC6G--




