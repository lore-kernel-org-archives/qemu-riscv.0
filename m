Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEG6h-0004qR-AG
	for mharc-qemu-riscv@gnu.org; Wed, 10 Apr 2019 12:29:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hEG6e-0004oS-K9
	for qemu-riscv@nongnu.org; Wed, 10 Apr 2019 12:29:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fintelia@gmail.com>) id 1hEG6d-0006Rt-Cg
	for qemu-riscv@nongnu.org; Wed, 10 Apr 2019 12:29:48 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:41981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fintelia@gmail.com>)
	id 1hEG6Y-0006Hp-FI; Wed, 10 Apr 2019 12:29:42 -0400
Received: by mail-lj1-x242.google.com with SMTP id k8so2708563lja.8;
	Wed, 10 Apr 2019 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=l8vm+xUorX7C+t0Kbe+tK1Hn6sNLPaRk09jJpVsMse4=;
	b=UTtYiqjPnvsEmeby95wWAcAFG84CxUw0OrpGczpjKKP1/TrPW/Pa5S9EXBVKYRtk10
	ngyoNrA2IFq66uWFMQhdlKWIsMcGXSQuPN/qhHAnsxwiYBhML4EV9kjAGgXxv1V5uN4q
	GEO//IQSfWaqiXjWHyR0c/adJlhRP/ckAGXsl68zpvd+W3e11UDh+nK3zZJUELycuze8
	qDC5lNoNxW16bDNDrHPbUTQJk3SwMwK3NQcoZQMhaD+2qM00XgC+XWSD6mA9blpzeTwh
	rV1va5Q9hrufgZMLPs/j6UO78qVzTYu2I13odfwz3fNA/puO8ahnsvEAfjWjlti28i9o
	eHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=l8vm+xUorX7C+t0Kbe+tK1Hn6sNLPaRk09jJpVsMse4=;
	b=Klv3t7aVPdegGL2eXnR0ixy+NPxcIzY4I2JqTtioNumNgMuvDKmZupAEsLvcI/1gI7
	aGAO9VR6Cui6sVphEBWovwm7W4gh8s0oX891ToVeq7a1YJgnJ4wR4UQyz6Zl8O9Te8si
	bjwGBDingm1aXEJp72izKKb0EuMfKgG+8Q/SDROTyVwcJJ8tpP3vL3zcEb2LpfKakB2a
	2JZcXfBHPsxtpOsVjUsasKJR/mf3aixTh52aWFPkN//+oP0o/iN1QUEMfNfKYdbh4IDS
	KvwtVjyCA4guNjdu/EqSUPNMqePfDAeJqBRGT8Z7ONAta4GZDzVxWQgN3yOOxfusiaTC
	i3jA==
X-Gm-Message-State: APjAAAWzfDucK5FyQ9SMkDAtME0C/BHJvL8mGLfUnQ7LFeng0DeFtyF4
	ZPlAlbenk1xJ5utCnkyJ/+bDdn9qyfpA3zhB+3Cx9EhqiEM=
X-Google-Smtp-Source: APXvYqwXR1pTuBq476qmtTm0pNk7pG83xRayj5xaC6B4O3hnPVZUhNlbh0Ov0vCba4iAMUI5TqzgEwoBJuVNlMZbe4M=
X-Received: by 2002:a2e:9ac3:: with SMTP id p3mr23824919ljj.109.1554913778003; 
	Wed, 10 Apr 2019 09:29:38 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Behrens <fintelia@gmail.com>
Date: Wed, 10 Apr 2019 12:29:11 -0400
Message-ID: <CANnJOVHbCGcgnHT3qVbHGFh_Ba0=FqABSoM2SG9ddf-fawwaYg@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000064f22d05862f93f3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: [Qemu-riscv] [PATCH] target/riscv: Remove unused include of
 riscv_htif.h for virt board
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
X-List-Received-Date: Wed, 10 Apr 2019 16:29:49 -0000

--00000000000064f22d05862f93f3
Content-Type: text/plain; charset="UTF-8"

Unless I'm missing something, the virt board doesn't support HTIF and
should not be including this header.

Jonathan

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

--00000000000064f22d05862f93f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unless I&#39;m missing something, the virt board does=
n&#39;t support HTIF and should not be including this header.</div><div><br=
></div><div>Jonathan<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">S=
igned-off-by: Jonathan Behrens &lt;<a href=3D"mailto:fintelia@gmail.com">fi=
ntelia@gmail.com</a>&gt;<br>---<br>=C2=A0hw/riscv/virt.c | 1 -<br>=C2=A01 f=
ile changed, 1 deletion(-)<br><br>diff --git a/hw/riscv/virt.c b/hw/riscv/v=
irt.c<br>index fc4c6b306e..3526463034 100644<br>--- a/hw/riscv/virt.c<br>++=
+ b/hw/riscv/virt.c<br>@@ -29,7 +29,6 @@<br>=C2=A0#include &quot;hw/sysbus.=
h&quot;<br>=C2=A0#include &quot;hw/char/serial.h&quot;<br>=C2=A0#include &q=
uot;target/riscv/cpu.h&quot;<br>-#include &quot;hw/riscv/riscv_htif.h&quot;=
<br>=C2=A0#include &quot;hw/riscv/riscv_hart.h&quot;<br>=C2=A0#include &quo=
t;hw/riscv/sifive_plic.h&quot;<br>=C2=A0#include &quot;hw/riscv/sifive_clin=
t.h&quot;<br>-- <br>2.20.1<br><br><br></div></div>

--00000000000064f22d05862f93f3--

