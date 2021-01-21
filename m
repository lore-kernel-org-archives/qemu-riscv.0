Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2bgW-0002KI-Gy
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jan 2021 10:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1l2bgU-0002I0-2r; Thu, 21 Jan 2021 10:15:42 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:47364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1l2bgM-0000zq-0C; Thu, 21 Jan 2021 10:15:40 -0500
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
Date: Thu, 21 Jan 2021 17:15:20 +0200
Message-ID: <2013655.G923GbCHz0@farino>
Organization: Gentoo Linux
In-Reply-To: <24791910.1r3eYUQgxm@farino>
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com>
 <24791910.1r3eYUQgxm@farino>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart268544978.ifERbkFSEj";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=140.211.166.183;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 21 Jan 2021 15:15:42 -0000

--nextPart268544978.ifERbkFSEj
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com, Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
Subject: Re: [PATCH v2 1/1] linux-user/signal: Decode waitid si_code
Date: Thu, 21 Jan 2021 17:15:20 +0200
Message-ID: <2013655.G923GbCHz0@farino>
Organization: Gentoo Linux
In-Reply-To: <24791910.1r3eYUQgxm@farino>
References: <1fb2d56aa23a81f4473e638abe9e2d78c09a3d5b.1611080607.git.alistair.francis@wdc.com> <24791910.1r3eYUQgxm@farino>

Am Mittwoch, 20. Januar 2021, 22:12:30 EET schrieb Andreas K. H=FCttel:
> > This patch just passes the waitid status directly back to the guest.
>=20
> This works at least as well as the previous versions, so ++ from me.
>=20
> Will do more testing over the next days to see if it maybe also improves =
the
> additional oddities I observed.
>=20

So the patch is good since it clearly resolves the linked bug.=20

However, something else is still broken (maybe related; unchanged compared =
to=20
the previous patch version). I keep seeing hanging "qemu-riscv32 /bin/bash=
=20
=2E.." processes using 100% cpu. If I attach strace (on the host arch x86-6=
4) to=20
qemu, I see an infinite loop:

waitid(P_ALL, -1, {}, WNOHANG|WEXITED, NULL) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
waitid(P_ALL, -1, {}, WNOHANG|WEXITED, NULL) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], NULL, 8) =3D 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) =3D 0
=2E..

Unfortunately I do not have a simple reproducer. This is somewhere in the=20
middle of our build system...

Otherwise, I can re-build glibc, gcc, binutils, make  in the qemu chroot=20
without obvious problems, with one striking strange detail - "make" refuses=
 to=20
run more than one concurrent process (even with MAKEOPTS=3D"-j9"). Somethin=
g is=20
off there.

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)
--nextPart268544978.ifERbkFSEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE2dlecvcVU8/ThuQ/jJJgxvbXoxAFAmAJmohfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEQ5
RDk1RTcyRjcxNTUzQ0ZEMzg2RTQzRjhDOTI2MEM2RjZEN0EzMTAACgkQjJJgxvbX
oxCA8A//eIyf9r7Ua2Vd9/m2dBI9wkBLIu5IhCmEYGLCmfJAr88ixv+kom/tREo6
1A5RB54TceTl+TzF5hdWFF0IHr6dABiYzH3+bPCYqPHIpTUQDieZJ9ftpbooZD1O
4Cz85kvdeGK0dQw75XkkG/sZzeEH20IXtETqxUWglAkjHdhA7yaj49Gr5OycMOat
ELX5k59lZj7X6nzzJ0vegxoeV9RxuaT1NUr5tZd63ZSfi44UeOhWMqNYr75h8g+A
Fh374uRClPEDzIF9qQxOysaz3HUsvE1gwbKW3mvMhDC+lG8YdTIEd2yJUjeNJGix
TW2koSs7hNpJ0lkZ7ACClfooS9eAOlcVNXQviClG6GUECcRimVbFsO3/xp0kNKj/
HU6EXWk3yTHjy/ykBhuu2msvx+EpF6suHNNk2kaevrFXIetn/vu/9g2DgDtLMyFo
z6NX/7xOSXU6XhFIr6OHpAmQGvlyQtXK5iRu53hKpKiA2USC1/UMl93wZ3+/zcCx
n/rk4Y9WzCvxLng5FiI0bNn1R8inM22MesfouGsi3gL252zeyYOv7Kl4JKOdX+MW
R5KI28Q/WsxVNwX/MSusTmVkYi8E4tQ5i3Zf44GWQBKWPRTGZ2hbH0WuhEPom9Jl
fC/qndodsmbsoOLBfHto+wiarX4QyhFzcPOwVEkgAnHM4jSZB4Q=
=CJsN
-----END PGP SIGNATURE-----

--nextPart268544978.ifERbkFSEj--




