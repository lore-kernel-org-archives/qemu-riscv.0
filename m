Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hS7PV-00016p-0d
	for mharc-qemu-riscv@gnu.org; Sat, 18 May 2019 18:02:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49843)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+ddc71d.b78a48-qemu-riscv=nongnu.org@mg.fintelia.io>)
	id 1hS7PR-00016Q-QK
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 18:02:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+ddc71d.b78a48-qemu-riscv=nongnu.org@mg.fintelia.io>)
	id 1hS7PQ-00033A-Nj
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 18:02:29 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:14941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+ddc71d.b78a48-qemu-riscv=nongnu.org@mg.fintelia.io>)
	id 1hS7PQ-000322-DS
	for qemu-riscv@nongnu.org; Sat, 18 May 2019 18:02:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.fintelia.io;
	q=dns/txt; 
	s=mailo; t=1558216948; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=Pp1xobOlKYPYu4GqMuL7HZHsGc+tPWvefC6y7//3JSk=;
	b=oWJbAAVrDvqqo6/bGlpkhLxUroSIO9SDWbLETrrn93sSLB71iMPAgnmpXsQ8BfZz2rQ8z70U
	oNGUm6IrIe7vURoEihBg6+DDi9WBEDERBAFk4ODXKDmkVbiHP9KiPHJr/d5h8qjwSMaQ/9fZ
	RGU1AHq4r8PULoH5cZk1Nfs1/EU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJjMjQ3ZCIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiYjc4YTQ4Il0=
Sender: jonathan=fintelia.io@mg.fintelia.io
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mxa.mailgun.org with ESMTP id 5ce07fc3.7f3cb94d3870-smtp-out-n03;
	Sat, 18 May 2019 21:57:23 -0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id h21so9173172ljk.13;
	Sat, 18 May 2019 14:57:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUb9lJBCRBTdLqL/PkyeF4BX3QnRkN7LLoU0SxxOySh/59Ph0Ej
	1FnfOs1aNKEq9ylR5fjoOTIVTZm11zH+m9tqE20=
X-Google-Smtp-Source: APXvYqyesf0WgP0PT07q34zcA6cl75Sa5n1HpvcHEsjQEgHFwsHcdkSO6gYP0zXIvPv9B72Td0Z51CTei/tUb1tVsMs=
X-Received: by 2002:a2e:2bd7:: with SMTP id r84mr83167ljr.91.1558216641559;
	Sat, 18 May 2019 14:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190517222342.26394-1-jonathan@fintelia.io>
	<20190517222342.26394-3-jonathan@fintelia.io>
	<CAKmqyKMG6ffhQ5VYgLZ3XVfZ2-E_O9BH6UCanmLJ3awDDUfS_w@mail.gmail.com>
In-Reply-To: <CAKmqyKMG6ffhQ5VYgLZ3XVfZ2-E_O9BH6UCanmLJ3awDDUfS_w@mail.gmail.com>
From: Jonathan Behrens <jonathan@fintelia.io>
Date: Sat, 18 May 2019 17:56:55 -0400
X-Gmail-Original-Message-ID: <CANnJOVFE51rFdV0h0T6_dV6r37kBLcBQCo7Csg8NOUoYkOELpQ@mail.gmail.com>
Message-ID: <CANnJOVFE51rFdV0h0T6_dV6r37kBLcBQCo7Csg8NOUoYkOELpQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: multipart/alternative; boundary="00000000000067425d05893095b9"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 2/2] target/riscv: Add
 support for -bios "firmware_filename" flag
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
X-List-Received-Date: Sat, 18 May 2019 22:02:31 -0000

--00000000000067425d05893095b9
Content-Type: text/plain; charset="UTF-8"

> I've never been fully convinced of this, why not just use the generic
loader?

If I understand you are proposing passing bbl (or other firmware) with the
-kernel flag, and then vmlinux (or another kernel) with the -initrd flag?
Wouldn't this result in losing the ability to pass a real init ramdisk to
Linux? It also seems to open the possibility for strange bugs/compatibility
issues later if firmware starts recognizing any "initrd" entries in the
device tree as kernel code to jump into.

I do wonder though how compatible the current design is with providing
default firmware for riscv in the future.

> This should be in a generic boot.c file and support added to all RISC-V
boards.

I can do this for v2.

Jonathan

--00000000000067425d05893095b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; I&#39;ve never been fully convinced of this, why=
 not just use the generic loader?</div><div><br></div><div>If I understand =
you are proposing passing bbl (or other firmware) with the -kernel flag, an=
d then vmlinux (or another kernel) with the -initrd flag? Wouldn&#39;t this=
 result in losing the ability to pass a real init ramdisk to Linux? It also=
 seems to open the possibility for strange bugs/compatibility issues later =
if firmware starts recognizing any &quot;initrd&quot; entries in the device=
 tree as kernel code to jump into.</div><div><br></div><div>I do wonder tho=
ugh how compatible the current design is with providing default firmware fo=
r riscv in the future.<br></div><div><br></div><div>&gt;=20
This should be in a generic boot.c file and support added to all RISC-V boa=
rds.</div><div><br></div><div>I can do this for v2.</div><div><br></div><di=
v>Jonathan<br></div></div>

--00000000000067425d05893095b9--

