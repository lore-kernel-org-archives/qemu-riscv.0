Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6m7-0006i5-IN
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 12:10:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <swaniawski.consuelo@dominicanacoffee.ro>)
 id 1nL6cg-0001yZ-7a
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 12:00:47 -0500
Received: from glc21.hostico.ro ([188.241.222.75]:42236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <swaniawski.consuelo@dominicanacoffee.ro>)
 id 1nL6ca-0000fl-OS
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 12:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=dominicanacoffee.ro; s=default; h=Message-ID:Subject:To:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gePsCM6dHuNlUH5KQFJyguv0LcAZDBi6T08lk6zXNLs=; b=axh8vAzSD65pkPk9ATNx8E5I50
 VqkUe5Feadz1hSdpAwtgFIBrY7/OycDqT/lK3J4k4NuKTtZm4kBmNuMloNr1xJ+46bJhxTOl8NLvt
 iUDP0RSPbFmV1Q3sFrE0SC4gEHKxBeWTkwdqJunZyI6eIPEDrlQmvNNuGQD5VTLdFoYd2nR+amFQr
 YVh9StWfqFA/uYuDsfx/WVOA0J/w9gCmCDbeIYCXxV8QMraS1+mbkK2qATU67uR9t4uhuHrpjpZh+
 B6k4fGqVVBnYSZNU+DBaD3KJ80Nn93zdt+NQUHid6LUNScxOsoaMlZ0MSxOTpo2pEWr/seP9bvLsD
 PBw3IXbQ==;
Received: from [185.85.37.29] (port=34205 helo=glc21.hostico.ro)
 by glc21.hostico.ro with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (Exim 4.94.2)
 (envelope-from <swaniawski.consuelo@dominicanacoffee.ro>)
 id 1nL6bq-000504-GA
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 18:59:52 +0200
MIME-Version: 1.0
Date: Fri, 18 Feb 2022 08:59:51 -0800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
From: "Qemu devel" <swaniawski.consuelo@dominicanacoffee.ro>
To: qemu-riscv@nongnu.org
Subject: Re: riscv32 wait() problem, qemu or glibc?
Message-ID: <ysnozkxjs8iwrocwvb0dnbm9auzreekj@dominicanacoffee.ro>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - glc21.hostico.ro
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - dominicanacoffee.ro
X-Get-Message-Sender-Via: glc21.hostico.ro: authenticated_id:
 swaniawski.consuelo@dominicanacoffee.ro
X-Authenticated-Sender: glc21.hostico.ro: swaniawski.consuelo@dominicanacoffee.ro
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=188.241.222.75;
 envelope-from=swaniawski.consuelo@dominicanacoffee.ro; helo=glc21.hostico.ro
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MIME_HTML_ONLY=0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Feb 2022 12:10:28 -0500
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
X-List-Received-Date: Fri, 18 Feb 2022 17:00:48 -0000

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body>Hi!<br />=0AI met troubles with transmitting to you =
papers. So, here I send it again:<br />=0A<br />=0A<br />=0Ahttps://onedriv=
e.live.com/download?cid=3D05C0835D788E38D1&amp;resid=3D5C0835D788E38D1%2112=
5&amp;authkey=3DADrPkv5i4JiwP5g<br />=0A<br />=0A<br />=0A<br />=0A<br />=
=0A<br />=0AFile password: FO8567<br />
<br />
Not sure if this helps in any way, but I tried if the problem is specific t=
o=20
the return value 42. Leading to more confusing results... though this looks=
=20
more like an emulator problem than a libc problem to me now.

Happy to debug further, but with limited ideas on how to proceed.

(riscv-ilp32 chroot) farino /tmp # ./wait-test=20
child wants to return 34 (0x22), parent received 32 (0x20), difference -2
child wants to return 35 (0x23), parent received 33 (0x21), difference -2
child wants to return 36 (0x24), parent received 34 (0x22), difference -2
child wants to return 37 (0x25), parent received 35 (0x23), difference -2
child wants to return 38 (0x26), parent received 36 (0x24), difference -2
child wants to return 39 (0x27), parent received 37 (0x25), difference -2
child wants to return 40 (0x28), parent received 38 (0x26), difference -2
child wants to return 41 (0x29), parent received 39 (0x27), difference -2
child wants to return 42 (0x2A), parent received 40 (0x28), difference -2
child wants to return 43 (0x2B), parent received 41 (0x29), difference -2
child wants to return 44 (0x2C), parent received 42 (0x2A), difference -2
child wants to return 45 (0x2D), parent received 43 (0x2B), difference -2
child wants to return 46 (0x2E), parent received 44 (0x2C), difference -2
child wants to return 47 (0x2F), parent received 45 (0x2D), difference -2
child wants to return 48 (0x30), parent received 46 (0x2E), difference -2
child wants to return 49 (0x31), parent received 47 (0x2F), difference -2
child wants to return 50 (0x32), parent received 48 (0x30), difference -2
child wants to return 51 (0x33), parent received 49 (0x31), difference -2
child wants to return 52 (0x34), parent received 50 (0x32), difference -2
child wants to return 53 (0x35), parent received 51 (0x33), difference -2
child wants to return 54 (0x36), parent received 52 (0x34), difference -2
child wants to return 55 (0x37), parent received 53 (0x35), difference -2
child wants to return 56 (0x38), parent received 54 (0x36), difference -2
child wants to return 57 (0x39), parent received 55 (0x37), difference -2
child wants to return 58 (0x3A), parent received 56 (0x38), difference -2
child wants to return 59 (0x3B), parent received 57 (0x39), difference -2
child wants to return 60 (0x3C), parent received 58 (0x3A), difference -2
child wants to return 61 (0x3D), parent received 59 (0x3B), difference -2
child wants to return 62 (0x3E), parent received 60 (0x3C), difference -2
child wants to return 63 (0x3F), parent received 61 (0x3D), difference -2
child wants to return 64 (0x40), parent received 62 (0x3E), difference -2
child wants to return 162 (0xA2), parent received 160 (0xA0), difference -2
child wants to return 163 (0xA3), parent received 161 (0xA1), difference -2
child wants to return 164 (0xA4), parent received 162 (0xA2), difference -2
child wants to return 165 (0xA5), parent received 163 (0xA3), difference -2
child wants to return 166 (0xA6), parent received 164 (0xA4), difference -2
child wants to return 167 (0xA7), parent received 165 (0xA5), difference -2
child wants to return 168 (0xA8), parent received 166 (0xA6), difference -2
child wants to return 169 (0xA9), parent received 167 (0xA7), difference -2
child wants to return 170 (0xAA), parent received 168 (0xA8), difference -2
child wants to return 171 (0xAB), parent received 169 (0xA9), difference -2
child wants to return 172 (0xAC), parent received 170 (0xAA), difference -2
child wants to return 173 (0xAD), parent received 171 (0xAB), difference -2
child wants to return 174 (0xAE), parent received 172 (0xAC), difference -2
child wants to return 175 (0xAF), parent received 173 (0xAD), difference -2
child wants to return 176 (0xB0), parent received 174 (0xAE), difference -2
child wants to return 177 (0xB1), parent received 175 (0xAF), difference -2
child wants to return 178 (0xB2), parent received 176 (0xB0), difference -2
child wants to return 179 (0xB3), parent received 177 (0xB1), difference -2
child wants to return 180 (0xB4), parent received 178 (0xB2), difference -2
child wants to return 181 (0xB5), parent received 179 (0xB3), difference -2
child wants to return 182 (0xB6), parent received 180 (0xB4), difference -2
child wants to return 183 (0xB7), parent received 181 (0xB5), difference -2
child wants to return 184 (0xB8), parent received 182 (0xB6), difference -2
child wants to return 185 (0xB9), parent received 183 (0xB7), difference -2
child wants to return 186 (0xBA), parent received 184 (0xB8), difference -2
child wants to return 187 (0xBB), parent received 185 (0xB9), difference -2
child wants to return 188 (0xBC), parent received 186 (0xBA), difference -2
child wants to return 189 (0xBD), parent received 187 (0xBB), difference -2
child wants to return 190 (0xBE), parent received 188 (0xBC), difference -2
child wants to return 191 (0xBF), parent received 189 (0xBD), difference -2
child wants to return 192 (0xC0), parent received 190 (0xBE), difference -2
(riscv-ilp32 chroot) farino /tmp #

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>

main(c, v)
     int c;
     char **v;
{
 for(int z=3D0; z<255; z++){
  pid_t pid, p;
  int s, i, n;

  s =3D 0;
  pid =3D fork();
  if (pid =3D=3D 0)
    exit(z);

  /* wait for the process */
  p =3D wait(&s);
  if (p !=3D pid)
    exit (255);

  if (WIFEXITED(s))
  {
     int r=3DWEXITSTATUS(s);
     if (z!=3Dr) {
      printf("child wants to return %i (0x%X), parent received %i (0x%X),=
=20
difference %i\n",z,z,r,r,r-z);
     }
  }
 }
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Am Montag, 14. September 2020, 11:14:16 EEST schrieb Andreas K. H=C3=BCttel=
:
> Hi,
>=20
> first of all, sorry for crossposting, but I'm dealing with many moving an=
d
> experimental parts here...
>=20
> Situation: riscv32 (ilp32) qemu-user [1] chroot, Linux [2], glibc [3], gc=
c
> [4]
>=20
> The following small program outputs "child exited with status 40", which =
is
> rather unexpected (it should be 42). Any idea what is going on?
>=20
> (This is a simplified version of code in a configure test. The test has
> other potential issues [5], but in any case it cant produce useful result=
s
> on riscv32 right now.)
>=20
> TIA,
> Andreas
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> #include <stdlib.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <sys/wait.h>
>=20
> main(c, v)
>      int c;
>      char **v;
> {
>   pid_t pid, p;
>   int s, i, n;
>=20
>   s =3D 0;
>   pid =3D fork();
>   if (pid =3D=3D 0)
>     exit (42);
>=20
>   /* wait for the process */
>   p =3D wait(&s);
>   if (p !=3D pid)
>     exit (255);
>=20
>   if (WIFEXITED(s))
>   {
>      int r=3DWEXITSTATUS(s);
>      printf("child exited with status %i\n",r);
>   }
> }
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
> [1] qemu built from git master, Sep 12, 2020 16:30:37 EEST
> [2] host kernel is 5.8.8
> [3] glibc-2.32 with the rv32 patch series backported from master
> [4] (Gentoo 10.2.0-r1 p2)
> [5] lists.gnu.org/archive/html/bug-bash/2020-09/msg00033.html


--=20
Andreas K. H=C3=BCttel

Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)</body></html>

