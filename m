Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpadd-0000Vl-6V
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55555)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpada-0000UN-VR
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpadZ-0004Js-2U
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:54:06 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.237]:21209)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpadX-0004IC-6E; Mon, 22 Jul 2019 11:54:04 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A010ED66.bt.com (10.187.98.36) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:53:08 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:54:00 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:54:00 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v2 20/20] target/sparc: sun4u Invert Endian
 TTE bit
Thread-Index: AQHVQKWtc7DbOsb7Y06HeJbM6CaVHA==
Date: Mon, 22 Jul 2019 15:54:00 +0000
Message-ID: <1563810840218.14603@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381084021814603btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.237
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 20/20] target/sparc: sun4u
 Invert Endian TTE bit
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
X-List-Received-Date: Mon, 22 Jul 2019 15:54:08 -0000

--_000_156381084021814603btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This bit configures endianness of PCI MMIO devices. It is used by
Solaris and OpenBSD sunhme drivers.

Tested working on OpenBSD.

Unfortunately Solaris 10 had a unrelated keyboard issue blocking
testing... another inch towards Solaris 10 on SPARC64 =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/sparc/cpu.h        | 2 ++
 target/sparc/mmu_helper.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 8ed2250..77e8e07 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -277,6 +277,7 @@ enum {

 #define TTE_VALID_BIT       (1ULL << 63)
 #define TTE_NFO_BIT         (1ULL << 60)
+#define TTE_IE_BIT          (1ULL << 59)
 #define TTE_USED_BIT        (1ULL << 41)
 #define TTE_LOCKED_BIT      (1ULL <<  6)
 #define TTE_SIDEEFFECT_BIT  (1ULL <<  3)
@@ -293,6 +294,7 @@ enum {

 #define TTE_IS_VALID(tte)   ((tte) & TTE_VALID_BIT)
 #define TTE_IS_NFO(tte)     ((tte) & TTE_NFO_BIT)
+#define TTE_IS_IE(tte)      ((tte) & TTE_IE_BIT)
 #define TTE_IS_USED(tte)    ((tte) & TTE_USED_BIT)
 #define TTE_IS_LOCKED(tte)  ((tte) & TTE_LOCKED_BIT)
 #define TTE_IS_SIDEEFFECT(tte) ((tte) & TTE_SIDEEFFECT_BIT)
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 826e14b..77dc86a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -537,6 +537,10 @@ static int get_physical_address_data(CPUSPARCState *en=
v, hwaddr *physical,
         if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical=
)) {
             int do_fault =3D 0;

+            if (TTE_IS_IE(env->dtlb[i].tte)) {
+                attrs->byte_swap =3D true;
+            }
+
             /* access ok? */
             /* multiple bits in SFSR.FT may be set on TT_DFAULT */
             if (TTE_IS_PRIV(env->dtlb[i].tte) && is_user) {
@@ -792,7 +796,7 @@ void dump_mmu(CPUSPARCState *env)
             }
             if (TTE_IS_VALID(env->dtlb[i].tte)) {
                 qemu_printf("[%02u] VA: %" PRIx64 ", PA: %llx"
-                            ", %s, %s, %s, %s, ctx %" PRId64 " %s\n",
+                            ", %s, %s, %s, %s, ie %s, ctx %" PRId64 " %s\n=
",
                             i,
                             env->dtlb[i].tag & (uint64_t)~0x1fffULL,
                             TTE_PA(env->dtlb[i].tte),
@@ -801,6 +805,8 @@ void dump_mmu(CPUSPARCState *env)
                             TTE_IS_W_OK(env->dtlb[i].tte) ? "RW" : "RO",
                             TTE_IS_LOCKED(env->dtlb[i].tte) ?
                             "locked" : "unlocked",
+                            TTE_IS_IE(env->dtlb[i].tte) ?
+                            "yes" : "no",
                             env->dtlb[i].tag & (uint64_t)0x1fffULL,
                             TTE_IS_GLOBAL(env->dtlb[i].tte) ?
                             "global" : "local");
--
1.8.3.1




--_000_156381084021814603btcom_
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
<div><span style=3D"font-size: 12pt;">This bit configures endianness of PCI=
 MMIO devices. It is used by</span><br>
</div>
<div>Solaris and OpenBSD sunhme drivers.</div>
<div><br>
</div>
<div>Tested working on OpenBSD.</div>
<div><br>
</div>
<div>Unfortunately Solaris 10 had a unrelated keyboard issue blocking</div>
<div>testing... another inch towards Solaris 10 on SPARC64 =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/sparc/cpu.h &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;&#43;</di=
v>
<div>&nbsp;target/sparc/mmu_helper.c | 8 &#43;&#43;&#43;&#43;&#43;&#43;&#43=
;-</div>
<div>&nbsp;2 files changed, 9 insertions(&#43;), 1 deletion(-)</div>
<div><br>
</div>
<div>diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h</div>
<div>index 8ed2250..77e8e07 100644</div>
<div>--- a/target/sparc/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sparc/cpu.h</div>
<div>@@ -277,6 &#43;277,7 @@ enum {</div>
<div>&nbsp;</div>
<div>&nbsp;#define TTE_VALID_BIT &nbsp; &nbsp; &nbsp; (1ULL &lt;&lt; 63)</d=
iv>
<div>&nbsp;#define TTE_NFO_BIT &nbsp; &nbsp; &nbsp; &nbsp; (1ULL &lt;&lt; 6=
0)</div>
<div>&#43;#define TTE_IE_BIT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1ULL &lt;&l=
t; 59)</div>
<div>&nbsp;#define TTE_USED_BIT &nbsp; &nbsp; &nbsp; &nbsp;(1ULL &lt;&lt; 4=
1)</div>
<div>&nbsp;#define TTE_LOCKED_BIT &nbsp; &nbsp; &nbsp;(1ULL &lt;&lt; &nbsp;=
6)</div>
<div>&nbsp;#define TTE_SIDEEFFECT_BIT &nbsp;(1ULL &lt;&lt; &nbsp;3)</div>
<div>@@ -293,6 &#43;294,7 @@ enum {</div>
<div>&nbsp;</div>
<div>&nbsp;#define TTE_IS_VALID(tte) &nbsp; ((tte) &amp; TTE_VALID_BIT)</di=
v>
<div>&nbsp;#define TTE_IS_NFO(tte) &nbsp; &nbsp; ((tte) &amp; TTE_NFO_BIT)<=
/div>
<div>&#43;#define TTE_IS_IE(tte) &nbsp; &nbsp; &nbsp;((tte) &amp; TTE_IE_BI=
T)</div>
<div>&nbsp;#define TTE_IS_USED(tte) &nbsp; &nbsp;((tte) &amp; TTE_USED_BIT)=
</div>
<div>&nbsp;#define TTE_IS_LOCKED(tte) &nbsp;((tte) &amp; TTE_LOCKED_BIT)</d=
iv>
<div>&nbsp;#define TTE_IS_SIDEEFFECT(tte) ((tte) &amp; TTE_SIDEEFFECT_BIT)<=
/div>
<div>diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c</di=
v>
<div>index 826e14b..77dc86a 100644</div>
<div>--- a/target/sparc/mmu_helper.c</div>
<div>&#43;&#43;&#43; b/target/sparc/mmu_helper.c</div>
<div>@@ -537,6 &#43;537,10 @@ static int get_physical_address_data(CPUSPARC=
State *env, hwaddr *physical,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ultrasparc_tag_match(&amp;env-&g=
t;dtlb[i], address, context, physical)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int do_fault =3D 0;</d=
iv>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_IE(env-&gt;d=
tlb[i].tte)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs-&gt=
;byte_swap =3D true;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* access ok? */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* multiple bits in SF=
SR.FT may be set on TT_DFAULT */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_PRIV(env-&g=
t;dtlb[i].tte) &amp;&amp; is_user) {</div>
<div>@@ -792,7 &#43;796,7 @@ void dump_mmu(CPUSPARCState *env)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_VALID(env-&=
gt;dtlb[i].tte)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_pri=
ntf(&quot;[%02u] VA: %&quot; PRIx64 &quot;, PA: %llx&quot;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, %s, %s, %s, %s, ctx %&quot; PRId64 &qu=
ot; %s\n&quot;,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, %s, %s, %s, %s, ie %s, ctx %&quot;=
 PRId64 &quot; %s\n&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;env-&gt;dtlb[i].tag &amp; (uint64_t)~0x1f=
ffULL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_PA(env-&gt;dtlb[i].tte),</div>
<div>@@ -801,6 &#43;805,8 @@ void dump_mmu(CPUSPARCState *env)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_W_OK(env-&gt;dtlb[i].tte) ? &quot;=
RW&quot; : &quot;RO&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_LOCKED(env-&gt;dtlb[i].tte) ?</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;locked&quot; : &quot;unlocked&quot;=
,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_IE(env-&gt;dtlb[i].tte) ?</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;yes&quot; : &quot;no&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;env-&gt;dtlb[i].tag &amp; (uint64_t)0x1ff=
fULL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_GLOBAL(env-&gt;dtlb[i].tte) ?</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;global&quot; : &quot;local&quot;);<=
/div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381084021814603btcom_--

