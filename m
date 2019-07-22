Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpaZs-0000Vw-Ja
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaTg-0005NB-24
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaTe-0003vT-JV
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:43:51 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:15138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaTZ-0003rl-65; Mon, 22 Jul 2019 11:43:45 -0400
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:43:46 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:43:43 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:43:43 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <david@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <mst@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <claudio.fontana@huawei.com>, <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, 
 <amarkovic@wavecomp.com>, <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v2 05/20] tcg: Move size+sign+endian from
 TCGMemOp to MemOp
Thread-Index: AQHVQKQ9cEFsk0Sv/kSj8smbj0lJlQ==
Date: Mon, 22 Jul 2019 15:43:43 +0000
Message-ID: <1563810222730.76414@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381022273076414btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:50:10 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 05/20] tcg: Move
 size+sign+endian from TCGMemOp to MemOp
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
X-List-Received-Date: Mon, 22 Jul 2019 15:43:53 -0000

--_000_156381022273076414btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for modifying the memory API to take size+sign+endianness
instead of just size.

Accelerator independent MemOp enum is extended by TCGMemOp enum.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 MAINTAINERS          |  1 +
 include/exec/memop.h | 27 +++++++++++++++++++++++++++
 tcg/tcg.h            | 15 +++++----------
 3 files changed, 33 insertions(+), 10 deletions(-)
 create mode 100644 include/exec/memop.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cc9636b..3f148cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1890,6 +1890,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: ioport.c
+F: include/exec/memop.h
 F: include/exec/memory.h
 F: include/exec/ram_addr.h
 F: memory.c
diff --git a/include/exec/memop.h b/include/exec/memop.h
new file mode 100644
index 0000000..43e99d7
--- /dev/null
+++ b/include/exec/memop.h
@@ -0,0 +1,27 @@
+/*
+ * Constants for memory operations
+ *
+ * Authors:
+ *  Richard Henderson <rth@twiddle.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef MEMOP_H
+#define MEMOP_H
+
+typedef enum MemOp {
+    MO_8     =3D 0,
+    MO_16    =3D 1,
+    MO_32    =3D 2,
+    MO_64    =3D 3,
+    MO_SIZE  =3D 3,   /* Mask for the above.  */
+
+    MO_SIGN  =3D 4,   /* Sign-extended, otherwise zero-extended.  */
+
+    MO_BSWAP =3D 8,   /* Host reverse endian.  */
+} MemOp;
+
+#endif
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 63e9897..18b91fe 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -26,6 +26,7 @@
 #define TCG_H

 #include "cpu.h"
+#include "exec/memop.h"
 #include "exec/tb-context.h"
 #include "qemu/bitops.h"
 #include "qemu/queue.h"
@@ -309,17 +310,11 @@ typedef enum TCGType {
 #endif
 } TCGType;

-/* Constants for qemu_ld and qemu_st for the Memory Operation field.  */
+/*
+ * Extend MemOp with constants for qemu_ld and qemu_st for the Memory
+ * Operation field.
+ */
 typedef enum TCGMemOp {
-    MO_8     =3D 0,
-    MO_16    =3D 1,
-    MO_32    =3D 2,
-    MO_64    =3D 3,
-    MO_SIZE  =3D 3,   /* Mask for the above.  */
-
-    MO_SIGN  =3D 4,   /* Sign-extended, otherwise zero-extended.  */
-
-    MO_BSWAP =3D 8,   /* Host reverse endian.  */
 #ifdef HOST_WORDS_BIGENDIAN
     MO_LE    =3D MO_BSWAP,
     MO_BE    =3D 0,
--
1.8.3.1




--_000_156381022273076414btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">Preparation for modifying the memory =
API to take size&#43;sign&#43;endianness</span><br>
</div>
<div>instead of just size.</div>
<div><br>
</div>
<div>Accelerator independent MemOp enum is extended by TCGMemOp enum.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;MAINTAINERS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;1 &#43;</d=
iv>
<div>&nbsp;include/exec/memop.h | 27 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 15 &#43;&#4=
3;&#43;&#43;&#43;----------</div>
<div>&nbsp;3 files changed, 33 insertions(&#43;), 10 deletions(-)</div>
<div>&nbsp;create mode 100644 include/exec/memop.h</div>
<div><br>
</div>
<div>diff --git a/MAINTAINERS b/MAINTAINERS</div>
<div>index cc9636b..3f148cd 100644</div>
<div>--- a/MAINTAINERS</div>
<div>&#43;&#43;&#43; b/MAINTAINERS</div>
<div>@@ -1890,6 &#43;1890,7 @@ M: Paolo Bonzini &lt;pbonzini@redhat.com&gt;=
</div>
<div>&nbsp;S: Supported</div>
<div>&nbsp;F: include/exec/ioport.h</div>
<div>&nbsp;F: ioport.c</div>
<div>&#43;F: include/exec/memop.h</div>
<div>&nbsp;F: include/exec/memory.h</div>
<div>&nbsp;F: include/exec/ram_addr.h</div>
<div>&nbsp;F: memory.c</div>
<div>diff --git a/include/exec/memop.h b/include/exec/memop.h</div>
<div>new file mode 100644</div>
<div>index 0000000..43e99d7</div>
<div>--- /dev/null</div>
<div>&#43;&#43;&#43; b/include/exec/memop.h</div>
<div>@@ -0,0 &#43;1,27 @@</div>
<div>&#43;/*</div>
<div>&#43; * Constants for memory operations</div>
<div>&#43; *</div>
<div>&#43; * Authors:</div>
<div>&#43; * &nbsp;Richard Henderson &lt;rth@twiddle.net&gt;</div>
<div>&#43; *</div>
<div>&#43; * This work is licensed under the terms of the GNU GPL, version =
2 or later.</div>
<div>&#43; * See the COPYING file in the top-level directory.</div>
<div>&#43; *</div>
<div>&#43; */</div>
<div>&#43;</div>
<div>&#43;#ifndef MEMOP_H</div>
<div>&#43;#define MEMOP_H</div>
<div>&#43;</div>
<div>&#43;typedef enum MemOp {</div>
<div>&#43; &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>&#43; &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>&#43; &nbsp; &nbsp;MO_32 &nbsp; &nbsp;=3D 2,</div>
<div>&#43; &nbsp; &nbsp;MO_64 &nbsp; &nbsp;=3D 3,</div>
<div>&#43; &nbsp; &nbsp;MO_SIZE &nbsp;=3D 3, &nbsp; /* Mask for the above. =
&nbsp;*/</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_SIGN &nbsp;=3D 4, &nbsp; /* Sign-extended, other=
wise zero-extended. &nbsp;*/</div>
<div>&#43;</div>
<div>&#43; &nbsp; &nbsp;MO_BSWAP =3D 8, &nbsp; /* Host reverse endian. &nbs=
p;*/</div>
<div>&#43;} MemOp;</div>
<div>&#43;</div>
<div>&#43;#endif</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index 63e9897..18b91fe 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -26,6 &#43;26,7 @@</div>
<div>&nbsp;#define TCG_H</div>
<div>&nbsp;</div>
<div>&nbsp;#include &quot;cpu.h&quot;</div>
<div>&#43;#include &quot;exec/memop.h&quot;</div>
<div>&nbsp;#include &quot;exec/tb-context.h&quot;</div>
<div>&nbsp;#include &quot;qemu/bitops.h&quot;</div>
<div>&nbsp;#include &quot;qemu/queue.h&quot;</div>
<div>@@ -309,17 &#43;310,11 @@ typedef enum TCGType {</div>
<div>&nbsp;#endif</div>
<div>&nbsp;} TCGType;</div>
<div>&nbsp;</div>
<div>-/* Constants for qemu_ld and qemu_st for the Memory Operation field. =
&nbsp;*/</div>
<div>&#43;/*</div>
<div>&#43; * Extend MemOp with constants for qemu_ld and qemu_st for the Me=
mory</div>
<div>&#43; * Operation field.</div>
<div>&#43; */</div>
<div>&nbsp;typedef enum TCGMemOp {</div>
<div>- &nbsp; &nbsp;MO_8 &nbsp; &nbsp; =3D 0,</div>
<div>- &nbsp; &nbsp;MO_16 &nbsp; &nbsp;=3D 1,</div>
<div>- &nbsp; &nbsp;MO_32 &nbsp; &nbsp;=3D 2,</div>
<div>- &nbsp; &nbsp;MO_64 &nbsp; &nbsp;=3D 3,</div>
<div>- &nbsp; &nbsp;MO_SIZE &nbsp;=3D 3, &nbsp; /* Mask for the above. &nbs=
p;*/</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_SIGN &nbsp;=3D 4, &nbsp; /* Sign-extended, otherwise=
 zero-extended. &nbsp;*/</div>
<div>-</div>
<div>- &nbsp; &nbsp;MO_BSWAP =3D 8, &nbsp; /* Host reverse endian. &nbsp;*/=
</div>
<div>&nbsp;#ifdef HOST_WORDS_BIGENDIAN</div>
<div>&nbsp; &nbsp; &nbsp;MO_LE &nbsp; &nbsp;=3D MO_BSWAP,</div>
<div>&nbsp; &nbsp; &nbsp;MO_BE &nbsp; &nbsp;=3D 0,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381022273076414btcom_--

