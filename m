Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRN7i-0002G1-TC
	for mharc-qemu-riscv@gnu.org; Thu, 16 May 2019 16:37:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marco@peereboom.us>) id 1hRM6n-0005AC-VV
	for qemu-riscv@nongnu.org; Thu, 16 May 2019 15:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marco@peereboom.us>) id 1hRM6j-0000lZ-C8
	for qemu-riscv@nongnu.org; Thu, 16 May 2019 15:32:04 -0400
Received: from 96-92-233-220-static.hfc.comcastbusiness.net
	([96.92.233.220]:60695 helo=dcr0.decred.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marco@peereboom.us>) id 1hRM6f-0000hc-KI
	for qemu-riscv@nongnu.org; Thu, 16 May 2019 15:31:59 -0400
Received: from mail.peereboom.us
	(104-0-143-237.lightspeed.austtx.sbcglobal.net [104.0.143.237])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by dcr0.decred.org (Postfix) with ESMTPS id 191A318B4072;
	Thu, 16 May 2019 19:31:53 +0000 (UTC)
Received: from [172.16.0.153] (cpe-70-114-171-172.austin.res.rr.com
	[70.114.171.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.peereboom.us (Postfix) with ESMTPSA id 6147F7232B;
	Thu, 16 May 2019 14:31:51 -0500 (CDT)
From: Marco Peereboom <marco@peereboom.us>
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E206B6D1-759D-4DD8-A566-F3D2194E193F";
	protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Thu, 16 May 2019 14:31:48 -0500
Message-Id: <95054557-05B0-4AAE-BA8B-55E088806F2C@peereboom.us>
To: qemu-riscv@nongnu.org
X-Mailer: Apple Mail (2.3445.104.8)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.92.233.220
X-Mailman-Approved-At: Thu, 16 May 2019 16:37:05 -0400
Subject: [Qemu-riscv] Atomic issues on riscv64
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2019 19:32:07 -0000


--Apple-Mail=_E206B6D1-759D-4DD8-A566-F3D2194E193F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

While porting Go (https://golang.org/) to riscv64 we ran into a couple =
of atomic issues.

At first we thought that they were go issues but we have narrowed at it =
down enough
for it to be QEMU related. Basically atomics periodically fail and =
because it is
infrequent enough we wrote some test programs to bring them out quicker.

Either one of these test programs will bring out the failure:
* http://pastebitch.com/WaSP
* http://pastebitch.com/

You may have to run the programs more than once or play with TCOUNT and =
NCOUNT
for the issue to manifest itself. The programs will complain when the =
expected value
does not match the real value.

Success: ok 40000000 40000000
Failure: womp womp 39800640 40000000

These failures do *NOT* occur on `qemu-risc64` or on hardware (sifive =
unleashed boards).
They do occur in `qemu-system-riscv64` running Linux.

This was tested on `QEMU emulator version 3.1.94 (v4.0.0-rc4)`

Kernel:
Linux version 5.1.0-rc3-dirty (marco@void) (gcc version 8.3.0 (GCC)) #1 =
SMP Thu Apr 11 15:18:36 CDT 2019

gcc inside qemu:
Using built-in specs.
COLLECT_GCC=3Dgcc
COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc/riscv64-redhat-linux/7/lto-wrapper
Target: riscv64-redhat-linux
Configured with: ../configure --enable-bootstrap =
--enable-languages=3Dc,c++,objc,obj-c++,fortran,lto --prefix=3D/usr =
--mandir=3D/usr/share/man --infodir=3D/usr/share/info =
--with-bugurl=3Dhttp://bugzilla.redhat.com/bugzilla --enable-shared =
--enable-threads=3Dposix --enable-checking=3Drelease --enable-multilib =
--with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions =
--enable-gnu-unique-object --enable-linker-build-id =
--with-gcc-major-version-only --with-linker-hash-style=3Dgnu =
--enable-plugin --enable-initfini-array --with-isl --disable-libmpx =
--build=3Driscv64-redhat-linux
Thread model: posix
gcc version 7.3.1 20180303 (Red Hat 7.3.1-5) (GCC)

We did try gcc 8.3.0 as well but this one is the one I use more =
frequently.

Let me know if you need more data and any help figuring this out would =
be appreciated.

--Apple-Mail=_E206B6D1-759D-4DD8-A566-F3D2194E193F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8htVBWYODFIPzwuljM0W459K7ykFAlzduqQACgkQjM0W459K
7yntDQ/+O9FtPFFldZbv+ACP0rnT6yYdEdM5+54aJ2/Q6Z9niX/w/FvjbvJcGOzk
6OGy3wCIIbzpLSxYoI0/hkbjxw/72m9La9dL50HdCh4N7ghIQQ+kCcZUcJikCNGi
19iFLua2XA5bIemUVzDsgXZSwMyt2mR/FiMQFl4LyKaUFYAXuhtJiSYA/3XaqTcC
L0Jwjz14ZupNjIpuO9YZQKOdPzaS+wuXdtfDKxlM/edGDewCCykuSIfsouKEuXQA
BjKiE4i1KKQbgsQserRr9d/SuhEZlq37/i1QuFgCTZNAc/TrWx3Z04a7XdH2ja3C
2pP4IadSQeq4bUPk4/BGEp61h4EDEr81B/8FPwxxiNkA4cAjz8igSET7WlF591f8
mrZJC7QWOLrcjhLoC6N+KXmVbh9YOWYJscrwJJ8edmul9/l4x85AAvAC0KoWQdET
WSWNmcpbJC4cdK43thJC43bikdjY2HnzofQNKwpZRiy/TJ4OFLcNOJLpHtjo3dLU
e2F4o5N/4UJUS0cePOPgVE7ONQ+5/FQuzs40+oDL9W8Wwk05him2h1+fDKksN2q7
RrKVMjeG5drnw4I7OYFBodCgkU6H+fBXAcPtTjczCGn6wwa3G9zJs/IJkuYoGX33
Q+rIKGL8VxyWS35i8MhxjcQWHaOsHMqvgCPPHv5wpvQkSNP2Rj0=
=o9mW
-----END PGP SIGNATURE-----

--Apple-Mail=_E206B6D1-759D-4DD8-A566-F3D2194E193F--

