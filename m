Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEbKb-0000H5-TO
	for mharc-qemu-riscv@gnu.org; Thu, 11 Apr 2019 11:09:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hEbKZ-0000Fi-Gf
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 11:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hEbKY-0003ib-3p
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 11:09:35 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:42459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hEbKQ-0003b4-J0; Thu, 11 Apr 2019 11:09:28 -0400
Received: by mail-lj1-x235.google.com with SMTP id v22so5854185lje.9;
	Thu, 11 Apr 2019 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=GhmylOpb5Yv5dSJKFVWQF6g1fmd6lBnSdN6XJjjnrXM=;
	b=JKcSMSjH1gQoC7eSmzl0iq1rAUuY/3ThbEWoq14DClfPySb42ynCyP3p1Wzx1ncCaN
	IFTrT5avkGkH9v7tAO/la9tQgypBtMlbTsdguWyalad/mCsP4iGRiK6jIB/Nyt2mJyOx
	3FdnBN7HDVhGkNiAh7DNSgbCEWm9EbDfqZCGELBvDMEzld4+t3SLlFF1yFbk3xqK7Hy3
	RcExy3jyi8Qb+smNtTdRjqUe557uuqo9FYcSgzN1KN7vEyN9Zh1msgFq/UgPJwOqVZhn
	/wwCglpK5jJruc5wxY6st1xqbndk/pleNOBJWNtIy9n/exh4MWJ01D3RFF7zujFNPUZv
	bo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=GhmylOpb5Yv5dSJKFVWQF6g1fmd6lBnSdN6XJjjnrXM=;
	b=KlbyhZ1jsLAsaB7Kr1010IVaN+IHEbjFEqygcNhJJn3MrljN1I2buIDLBuDVzeND98
	n4VbNCpx3lFGEal98hxUJcAjlKmi205Hj7ylWqS+mrP2CBaoMFaDtyCH0Avlrkjy6TUS
	XF4Ox06wiw73HvIl05e9H6M7OFZNJQdG/gpgSyxip2SkiSvnzt2BdmFiW0nOmPswlPkZ
	purS6wIJJ2Z0VpQ0uKQwFqkrRHOBOZiHu8ZTZtnk9g4a48eutTu/BCj8221LkwNgQP+Q
	vxgbEaFvWI9Smydkzegm2GHPxV56TXtfKDHXMYxt9YsF896t3WW3GN3ro8iVdJnJ8e6N
	+zzg==
X-Gm-Message-State: APjAAAVVqAtoEsdK1Z35+uV0eYNYM3gDy8Nbi6yM7936gje62g48oWmj
	1YauWc9IrVmfOrOwGtTc0yc7Qdjj+9j9xFL7RZrMs4lvGSU=
X-Google-Smtp-Source: APXvYqxJgtSyxPInmxlpp7Mc6eimiiqvep4fOqZFpOhpB9+563HtulAG4Fbcc7/MVXMjOKVg6lLcpRnO6RhjChY328E=
X-Received: by 2002:a2e:9812:: with SMTP id a18mr23881501ljj.146.1554995364357;
	Thu, 11 Apr 2019 08:09:24 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Behrens <fintelia@gmail.com>
Date: Thu, 11 Apr 2019 11:08:57 -0400
Message-ID: <CANnJOVF2gE3b-C5zSb85SGoP+9cD9xOQQ5Z4tmsGouagR3xo0Q@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000052084a05864292aa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::235
Subject: [Qemu-riscv] [PATCH v2] target/riscv: Remove unused include of
 riscv_htif.h for virt board riscv
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
X-List-Received-Date: Thu, 11 Apr 2019 15:09:36 -0000

--00000000000052084a05864292aa
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
---
 hw/riscv/virt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fc4c6b306e..3526463034 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -29,7 +29,6 @@
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
-#include "hw/riscv/riscv_htif.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/sifive_plic.h"
 #include "hw/riscv/sifive_clint.h"
-- 
2.20.1

--00000000000052084a05864292aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Signed-off-by: Jonathan Behrens &lt;<a hr=
ef=3D"mailto:fintelia@gmail.com">fintelia@gmail.com</a>&gt;<br>---<br>=C2=
=A0hw/riscv/virt.c | 1 -<br>=C2=A01 file changed, 1 deletion(-)<br><br>diff=
 --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>index fc4c6b306e..3526463034 =
100644<br>--- a/hw/riscv/virt.c<br>+++ b/hw/riscv/virt.c<br>@@ -29,7 +29,6 =
@@<br>=C2=A0#include &quot;hw/sysbus.h&quot;<br>=C2=A0#include &quot;hw/cha=
r/serial.h&quot;<br>=C2=A0#include &quot;target/riscv/cpu.h&quot;<br>-#incl=
ude &quot;hw/riscv/riscv_htif.h&quot;<br>=C2=A0#include &quot;hw/riscv/risc=
v_hart.h&quot;<br>=C2=A0#include &quot;hw/riscv/sifive_plic.h&quot;<br>=C2=
=A0#include &quot;hw/riscv/sifive_clint.h&quot;<br>-- <br>2.20.1<br></div><=
/div>

--00000000000052084a05864292aa--

