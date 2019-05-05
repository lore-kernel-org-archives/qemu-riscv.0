Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNOiU-0000dE-8H
	for mharc-qemu-riscv@gnu.org; Sun, 05 May 2019 17:30:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <merker@debian.org>) id 1hNOIg-0003JK-8v
	for qemu-riscv@nongnu.org; Sun, 05 May 2019 17:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <merker@debian.org>) id 1hNOIf-0005Dy-BV
	for qemu-riscv@nongnu.org; Sun, 05 May 2019 17:03:58 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36613)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <merker@debian.org>) id 1hNOIf-00052E-1A
	for qemu-riscv@nongnu.org; Sun, 05 May 2019 17:03:57 -0400
Received: from excalibur.cnev.de ([213.196.205.91]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MsZeX-1gTcsq09Zj-00tymC; Sun, 05 May 2019 23:03:47 +0200
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
	(envelope-from <merker@debian.org>)
	id 1hNOIS-0005gU-2U; Sun, 05 May 2019 23:03:44 +0200
Date: Sun, 5 May 2019 23:03:43 +0200
From: Karsten Merker <merker@debian.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org, Karsten Merker <merker@debian.org>,
	Vagrant Cascadian <vagrant@debian.org>
Message-ID: <20190505210343.edgohqdc5vxvjepo@excalibur.cnev.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:r1kv4TM8WshbheAP13CYRwAsnC0IY9Dmr/k/UZpLU2ZHRiRh8Td
	2M0XQNP8EP8/Louxg4a5T3cNbgg3Wv1pf5FqXLLHfT9Re6wOpqRiNkURJ4NwqS44wFU8xy7
	JxYVGP/wbwYTWgKu1ohepUgGzoetvcSdO4E2MNybEzEQtoVqO72Coy1qxg3urDObzE16Lar
	bjPyCQpn7ovEWaYqcExyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6X0qLbcJcCo=:/kRbiM9QtTF7Mb8uUZFRjS
	nT12Qs8uTvqi0jYzH2i/bzT6sDvkjS4wn16aK7XVPlwsIohR4q722TPvxGwM6qflAd/bktfL8
	Wxxz4fSRgaRLOgCCdkSQoinH777r6apv4WQzn7xSbyOE7g3hW/IG8AebIzYG46rnuEGCmRW/2
	7izs2W2CwI7QzmK8r0pOYCWzElNpqqamJR9TB36GctdLJvFm/GKAVS2DVqJU/SbFq8ThJy6b+
	XsvIHER9zww6Oli6F04/OcHQzIHpZKcfhfYl4O3CxnbJ3Bday/fC0oQR0kcVLKhhHdue4wd6D
	cIf3eoEwsRb6gHq9jW6vbek1rI1AtiA8Qndkl2PEgY1nZ7PHWXlH4XBkhLPytusTRTiRAZAVk
	JArkLeONnJAQJcqvExbODu542n8XSnzSmAytQOjVSYG65+3EXxiZ3iCitJgCp1oPZiZnsrtoq
	NrOobUxDcnpNXAq7Yquq0TcRJ0e6wsP1YNRdT4iYTBIWhxcj0zmWb+6NA5loIwyCPJgIOQjf5
	i1G8ZSrvx2/WyF3GxFh+9843W2/U771Ij4VXYQMFQFAfBMaK2CjsGKcQsZJoh+8MaAL4lrwjE
	joOeczAja0wnzM8RtAwWch+hByyALJnNdnzvpuJDeTfKPwgN6Rm7q4E1o3X7iPF/O9OCvDPAe
	3BBZS9n39Ta548/mro5O4AXe8OTuFud9JEfc1q++kGPHRUIBG4xWyqo05QXyFCiR8BNcd432Y
	A8jGcvemWFcDrQDaeu0bCi2IeAS4GkcspJ/aqg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
X-Mailman-Approved-At: Sun, 05 May 2019 17:30:37 -0400
Subject: [Qemu-riscv] RISC-V: qemu should provide different "model" strings
 in DT for RV64 and RV32
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
X-List-Received-Date: Sun, 05 May 2019 21:03:59 -0000

Hello,

while working on RISC-V support for the Debian flash-kernel package
I have stumbled over a potential problem with the "model" string
that qemu sets in the DT that it generates for the "virt" machine,
namely "riscv-virtio,qemu".

Some tools, among them flash-kernel, use the "model" string to
determine on which specific type of hardware they are running and
perform corresponding hardware-specific actions.  It looks like
qemu uses the same model string for both RV64 and RV32, which
makes it impossible to differentiate between the two. I would
therefore like to propose to make the model-string
XLEN-dependent, i.e. "riscv64-virtio,qemu" respectively
"riscv32-virtio,qemu".

Regards,
Karsten
-- 
Ich widerspreche hiermit ausdrücklich der Nutzung sowie der
Weitergabe meiner personenbezogenen Daten für Zwecke der Werbung
sowie der Markt- oder Meinungsforschung.

