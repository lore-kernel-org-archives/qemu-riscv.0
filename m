Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJjgs-0004kl-0G
	for mharc-qemu-riscv@gnu.org; Sat, 19 Sep 2020 16:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1kJjgp-0004iG-P1
 for qemu-riscv@nongnu.org; Sat, 19 Sep 2020 16:42:35 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:55758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1kJjgn-0006Do-Kz
 for qemu-riscv@nongnu.org; Sat, 19 Sep 2020 16:42:35 -0400
From: Andreas =?ISO-8859-1?Q?K=2E_H=FCttel?= <dilfridge@gentoo.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-riscv@nongnu.org
Subject: Re: Fwd: riscv32 wait() problem, qemu or glibc?
Date: Sat, 19 Sep 2020 23:41:57 +0300
Message-ID: <114347864.ZKypZ73Fx5@farino>
Organization: Gentoo Linux
In-Reply-To: <mhng-a7087781-d72b-4824-b649-2535cf70327e@palmerdabbelt-glaptop1>
References: <mhng-a7087781-d72b-4824-b649-2535cf70327e@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6349276.AMKPKieAE8";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=140.211.166.183;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 16:42:31
X-ACL-Warn: Detected OS   = ???
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
X-List-Received-Date: Sat, 19 Sep 2020 20:42:36 -0000

--nextPart6349276.AMKPKieAE8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Palmer,

> > [1] qemu built from git master, Sep 12, 2020 16:30:37 EEST
> > [2] host kernel is 5.8.8
> > [3] glibc-2.32 with the rv32 patch series backported from master
> > [4] (Gentoo 10.2.0-r1 p2)
> > [5] https://lists.gnu.org/archive/html/bug-bash/2020-09/msg00033.html
>=20
> I don't see any replies to this, but for some reason I remember having se=
en
> some.  Did this get resolved in some other thread?  I'd bet that it's a b=
ug
> in rv32 user-mode emulation, as that's been only lightly used so far.

No resolution yet. The conclusion was also that it's likely a bug in rv32=20
user-mode emulation, and I put this aside for the moment (to later retry in=
=20
softmmu mode).

(the original mail was on qemu-devel and libc-alpha, and there the thread=20
continued a little bit there, see
https://sourceware.org/pipermail/libc-alpha/2020-September/117563.html )

Best,
Andreas

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)
--nextPart6349276.AMKPKieAE8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQKTBAABCgB9FiEE50NBr50KpJKM5MK59n+4O2olsAAFAl9mbRVfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEU3
NDM0MUFGOUQwQUE0OTI4Q0U0QzJCOUY2N0ZCODNCNkEyNUIwMDAACgkQ9n+4O2ol
sADu5A/8DcfrHwrYmKckCPoDBqUob5QYNTIJyqlftxg3wuo8oqKOZsde+hyoseuD
YTisLqU3apmxTwG3K0mtGaceZvs35nPR88IPUJb7gsAnHICFrhDOSCn2IEDmQ6Tk
/hqmt5uqQOWt3lpXLJJ+p/gcQ8nuo+Ee67IdQ6tRzs8hLrxpa+oL1YkLvmbY9FZW
QxKEbbwZoo9W5x4A7Fj3xhPxq4rIEvFk2H3celHdTQTUk2N0yHQlQpq3fe0uYrs2
oQQeI91QNEdDOAsrNS2FJ7jlcOPa12kKNjGLGX6YyD2WOzm6zX9XhHpECp4/JrBH
M7Og+VUIrz2yWp5SExTZtd8DC+a9x4/xbur4B8cbhro+y+blTneT78/OVG51CvA7
8FrE0QH/O2MyfPt3gL9za1LilrvT07GIFpbU6LPZP0HFE2A8nU+i3fz7nYTkw8t/
VPrORS0tdDGo+jimyYg8VrscACRpcBWcE/0i+cy4sJzLASjG5WCyTE3JWRWJEP13
buOx7Nz/jQpJMCsD9BGXkGSqYfSTR8rOGiTb18AyJrrKUJKMnCKIZvlAcYhX30Y/
rR/ssYoBQ0OVsB+8fL5dvxBh28UvmtfL8erwOGzz/5xwL9XDIuPkC0Qi9nzogGV7
JI8eowQT09EpdzkLO9MY66S/YI1nV3uvTj23VNk9UuqU9vG2B3M=
=MehC
-----END PGP SIGNATURE-----

--nextPart6349276.AMKPKieAE8--




