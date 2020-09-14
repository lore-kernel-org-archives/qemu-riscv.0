Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHrGF-0003fx-JN
	for mharc-qemu-riscv@gnu.org; Mon, 14 Sep 2020 12:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1kHrGE-0003cB-36
 for qemu-riscv@nongnu.org; Mon, 14 Sep 2020 12:23:22 -0400
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:46515
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1kHrGC-0005JJ-4T
 for qemu-riscv@nongnu.org; Mon, 14 Sep 2020 12:23:21 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-riscv@nongnu.org
Subject: Fwd: riscv32 wait() problem, qemu or glibc?
Date: Mon, 14 Sep 2020 19:23:10 +0300
Message-ID: <2107152.vFx2qVVIhK@noumea>
Organization: Gentoo Linux
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2504681.lGaqSPkdTl";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 12:23:18
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Sep 2020 16:23:22 -0000

--nextPart2504681.lGaqSPkdTl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

[forwarding this also to qemu-riscv, not sure what's the right list]
An: qemu-devel@nongnu.org, libc-alpha@sourceware.org

Hi,=20

first of all, sorry for crossposting, but I'm dealing with many moving and=
=20
experimental parts here...=20

Situation: riscv32 (ilp32) qemu-user [1] chroot, Linux [2], glibc [3], gcc =
[4]

The following small program outputs "child exited with status 40", which is=
=20
rather unexpected (it should be 42). Any idea what is going on?

(This is a simplified version of code in a configure test. The test has oth=
er=20
potential issues [5], but in any case it cant produce useful results on=20
riscv32 right now.)

TIA,=20
Andreas

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>

main(c, v)
     int c;
     char **v;
{
  pid_t pid, p;
  int s, i, n;

  s =3D 0;
  pid =3D fork();
  if (pid =3D=3D 0)
    exit (42);

  /* wait for the process */
  p =3D wait(&s);
  if (p !=3D pid)
    exit (255);

  if (WIFEXITED(s))
  {
     int r=3DWEXITSTATUS(s);
     printf("child exited with status %i\n",r);
  }
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


[1] qemu built from git master, Sep 12, 2020 16:30:37 EEST
[2] host kernel is 5.8.8
[3] glibc-2.32 with the rv32 patch series backported from master
[4] (Gentoo 10.2.0-r1 p2)
[5] https://lists.gnu.org/archive/html/bug-bash/2020-09/msg00033.html

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)

--nextPart2504681.lGaqSPkdTl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE2dlecvcVU8/ThuQ/jJJgxvbXoxAFAl9fmO4ACgkQjJJgxvbX
oxAS+Q/9HTMxXOl7GOBjHOo+4NUt4jH3kPShv6MWEbf47tho+YzCKtsdkMruJMZt
mgpD9LoXrFdeYEQZPIvun8DUSfjx48+v567mJlVgoYm99kW6Rhbv0Pc7V25iZBG8
j7F5wwfDJj0/1Cv2gsCVw7fmOUKo0k9fkFQ9gd2uUyUjEqNKOQejNT0rOeJ9ICkP
AG4pggyWTKxb1Zv11qNvhzaP2M9tH2fFWw5YOhLFF+FrsKXc1Jyovk5YGbRxuZLG
OdUQjjxK42SgMrKA6kKHKF5dxj5HeTiBFAhjn+1q7W8qsNcRfKCgdbylfminhVmR
r7GTD/00DNNQQfuOZT1WqbHr+lpgrKQ952aSQ39+4qO8BI+gHOCMTapRD+nRAF0G
Ryuu3UX7mbXZcrh6ghJR06+TvRkhNiYPZlCZpkyF1RdjH7prUsKt98YDlBuxKQFa
75SsLfltNASwsYY97HRaLvXkU2wNoh0WGk13eBxG6cUvar4OFMHl1fqn8NRWJnly
RqSKOTUocOAqKJ5U4etlYcTMq5GfN2roz+X29YGlkbaG7srFAo2l7ml9QmEnSGeq
EWlmURU6r/C6sTtTeWC5J8KZts7YHUBxyzUKIteqa+8lo2gryH2BxEcbQK7qYWKd
1chrfIqpYxx+jHx0rADDBV7HQT73syjNmSsS99EFHCCA2zMPUKM=
=Mc4r
-----END PGP SIGNATURE-----

--nextPart2504681.lGaqSPkdTl--




