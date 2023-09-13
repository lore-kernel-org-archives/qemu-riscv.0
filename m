Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D0BCA5534
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 10:34:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgNCJ-0000Nb-Ja; Wed, 13 Sep 2023 06:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qgNCF-0000Mm-R3; Wed, 13 Sep 2023 06:34:11 -0400
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1qgNCB-0007BA-56; Wed, 13 Sep 2023 06:34:11 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: LIU Zhiwei <baxiantai@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: qemu-riscv32 usermode still broken?
Date: Wed, 13 Sep 2023 12:33:49 +0200
Message-ID: <5225193.mvXUDI8C0e@kona>
Organization: Gentoo Linux
In-Reply-To: <b065fa54-28fc-d64e-c8dd-16104128326d@tls.msk.ru>
References: <10817413.NyiUUSuA9g@pinacolada>
 <15820654-5d7f-fd66-3d34-da1a55d2a53e@gmail.com>
 <b065fa54-28fc-d64e-c8dd-16104128326d@tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14810793.O9o76ZdvQC";
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

--nextPart14810793.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: qemu-riscv32 usermode still broken?
Date: Wed, 13 Sep 2023 12:33:49 +0200
Message-ID: <5225193.mvXUDI8C0e@kona>
Organization: Gentoo Linux
In-Reply-To: <b065fa54-28fc-d64e-c8dd-16104128326d@tls.msk.ru>
MIME-Version: 1.0

Am Mittwoch, 13. September 2023, 10:06:01 CEST schrieb Michael Tokarev:
> 13.09.2023 04:41, LIU Zhiwei wrote:
> >=20
> > On 2023/9/13 6:31, Andreas K. Huettel wrote:
> ..
> >> * Something seems wrong in the signal handling (?):
> >=20
> > If it is wrong for signal handling and for 32-bit, I guess it may be fi=
xed by this patch
> >=20
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg981238.html
> >=20
> > And this patch has been merged into master branch yesterday.
>=20
> I picked this one up for stable yesterday, scheduled to be released
> on Sep-21.

Oh great, thanks! I'll test this and report back.
=2Da

>=20
> Thanks,
>=20
> /mjt
>=20
>=20
>=20


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart14810793.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmUBkA1fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSqCWg/8CAbGJTmRcNYO4RKEhqyMMP2iHe3qnWCUPp30v/dmrL/fA8MCrNy7gleK
tb0kmqu5dy/V2R7FCrBCV69XnR7OdGDaf32JBUNpmc6/at0KTrFg+f0o8kjPGR/i
dTyyL/bnnzIzC1iiWNLbLGxKKZgBhYCag+Nw3rULpVCo85ilFepjuGeIU9r4xbKy
fzPyHcvOaStW5Z8Inz4MgrfuY9EHR+rEcFYVDj8VUtXDdQLFHj2a9XAVrJsTb+Yy
RncSkmgpY2vxHnd9zB40EORgnmWLjVoML6Mq248sIJKEW6vgUEAyQiHeG6AJga0j
HSyXC6sgfVS8GUVDKkLrIWOSQyilZBnmg0E5/GEFbpCVU1wtwCSMlR/3yUrUDDl0
MWGsE4LJ7W+/a5LQXiMsbVXI0Z367z4r/jx0V2LGEMnS+dMY+VZxXG9YJCu9OtSE
luSJVdGAkUE++fzusYdWzypvq9ANdyBnl4pK9R7Yx8t7X1oR4stTqK3KSHPGBvba
71NhoPJoaLVOBvDC4fwgtBODLylmVq8YQam9H6yLiJta1Fk9wGohEA/9xMu3JN/N
hllJVQtiWGwlEgYGBrkx4gzA4dyarZSekrdGunPCTDMBQGL77vMvXIKuwxAUexjF
2H0E1KrA69TLZ1cOJkl/amUybo60SXgQrIZISCE67zwjFI4zfrk=
=EsgL
-----END PGP SIGNATURE-----

--nextPart14810793.O9o76ZdvQC--




