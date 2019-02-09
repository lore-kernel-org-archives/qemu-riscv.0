Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsH0w-00063D-Nm
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 20:01:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0u-00060B-0O
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0r-0007pw-UE
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 20:00:59 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsH0m-0007dw-Ss; Fri, 08 Feb 2019 20:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549674052; x=1581210052;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=dE+Cec88GoO5/zv+M7uR6/QvE5ML1q257t2DPzVzr34=;
	b=gZDJdQlLPi7RiX61w3WRl7axj97tLI9FisAa6fEigPbDd4NNfNW6IpXs
	f6jLu+i+XcwhJoMp9ylhKo01tYCWlMarwEzUoJJxFjGXK8i1zEY/FdMon
	+hEAt0dPMhcafdWNvh5TtgUP+TtKMx7WHBI0F1O1K+YDibMu7R7XHVzWE
	nr2q6mn2mzhsUBDy4XGqDGhl4Y4qfbEP1UMxjV7yasm5ljXx08LmAPAZ6
	LDdYgmCLVfw6XEj024P95toESVo3Deb8jjMCns2rUYI9S6emtxEeaI6lL
	kHy+TLuxfozwCMgPg+pm8BtsU+sH5iZTg1aFxKT+aT9w+cwNOPUBGmaUJ A==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="205937729"
Received: from mail-by2nam03lp2051.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.51])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 09:00:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ef+eU7n/zHfPDvSf1+ijxm4TbGPfpKgPEXrqhWFzykA=;
	b=KgfRGZh9RAUmde+QxEzbqhxgi49dKlUGHv2akO258X9DwVfDtCDtV3J+8lb1Ng161mx/5gOZW/fbXq+n8RMoHQLgbu6vXWt1rB+TbeRx2LcT2L8bTq3qkO4TG8SW/znh+qrBQ6zYDzecxifgRTGrCFlyC5gahQngLqMcNbyiU8I=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 01:00:42 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 01:00:42 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 09/11] RISC-V: Add support for vectored interrupts
Thread-Index: AQHUwBLhk+Z9Cpxy/0uUQzBwY0O5Ig==
Date: Sat, 9 Feb 2019 01:00:42 +0000
Message-ID: <06a867e9a21d725d0974d66e213a8eb58b0914f4.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR02CA0058.namprd02.prod.outlook.com
	(2603:10b6:a03:54::35) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:pP87ROTjmGLDMxlY2K8auw1m5N6G2hKwX1s5KWyEySqDrzTJQ/JG5IXM7cOSNBG5OUH0E2k26n9RBD6uKkKdevz7KmfULGyWv063oF01EZc79yjKsSYwhbRMOU9CsOKbzWkdwWEMlggczRpHHRUppQlFE0VLdzWnSTzDhU9liRH8L634RCluPkgJXZRQ+5prEz3YlfdSfAd0T5kyZlE7+SYFol4F2eBmi3iimKB677HVsGK/yvCdYIVcgue4V1dqyJJ4bUWaWxU6n/1rXv47U1GCBiEvGBg7l3X5lMcVzO8VIjDVlSwer4U+m9qEH0bLAjPR0v+DQY3vyaT4myhCyu3IklKibpHoc1aB9DsWfKBZ9ayTW3tToUekBvBsECN7Airlc8sZrreU5OvAQgkqJmGamhMf9d9psXnIkhlDZqu9tYVZBvFxsc8lu7/DeinZkKHOzesDxetKlMvzZw07AA==;
	5:83KwjD22TYiF8r+xX2/kPlrkWCSwFxbRo7M5MKLHiIO6sDSAtGMTLODYpsOOQYbKUpx5xzAu0p/yniOS924N42sPjQNVV1MZcSYotnX+XGeEk8Cu9HB/0ild4c9QYltaDawhTkI70MjNNCu3PODSx/+0Q2U1ByIpQYaeE2yOwVVxzlSQZ/tWaryCVRuqBXmmn23Q9Q0T2nhnLtMWZwjb2Q==;
	7:r+IyC6odkas6cyvhww2kR5y9xeSRG0/ip8zD3hjA25AKzddhPMJ8OJvIBttCdweODgyQtqJkd4TDYQeneuJeacNcgG7blua9+klH1H4fTKMDsNmaic7EvescKHPckXeA7uQOeWHfvtT4acwqhsvCOg==
x-ms-office365-filtering-correlation-id: 03bb074f-6511-476e-7878-08d68e2a03b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409CD4B23622E416D246623906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Um9C3ZzTKrq03VZy0YES1fQ7km9k0yaGp5qND/PktRCxs9UE8b/eGQE1kpoqllpKz4YLUrjowZ/twNK/lY/mqhDItXA/RQbrK3csbu3UC+044n4F1/TdMaQX0COhBhdczkbtF6iBaFWiHKpz+6/kyT695jtg5OLmuIPEqZR/EeozpEO9RHe7Ngo7oYvvO4YHo9xdbk+tn76eECqsTLDCW1vOHmBfsrP/1fvZhCSh+4RhHbALhcS8ReZ8gTIY3JnKed/oEN8DHYL8DVZbxZL/RaOj6xZVrbKjCY7zhuoLKUkd0xabYK+F7zIJ4LvWmyUXwpGWsbnmvXS8FwGk7golDJzN3YIZtQSzsx0CucVpy79qUAf3Wf8VPWICIMWTudSkTnUkruzYbvVh51OBpK4PlgkPFZqy3cEVKkm1tcsb+nw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bb074f-6511-476e-7878-08d68e2a03b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 01:00:41.9406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v1 09/11] RISC-V: Add support for vectored
 interrupts
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
X-List-Received-Date: Sat, 09 Feb 2019 01:01:01 -0000

From: Michael Clark <mjc@sifive.com>

If vectored interrupts are enabled (bits[1:0]
of mtvec/stvec =3D=3D 1) then use the following
logic for trap entry address calculation:

 pc =3D mtvec + cause * 4

In addition to adding support for vectored interrupts
this patch simplifies the interrupt delivery logic
by making sync/async cause decoding and encoding
steps distinct.

The cause code and the sign bit indicating sync/async
is split at the beginning of the function and fixed
cause is renamed to cause. The MSB setting for async
traps is delayed until setting mcause/scause to allow
redundant variables to be eliminated. Some variables
are renamed for conciseness and moved so that decls
are at the start of the block.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 145 ++++++++++++++------------------------
 target/riscv/csr.c        |  12 ++--
 2 files changed, 60 insertions(+), 97 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 073bdcfe74..a02f4dad8c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -454,118 +454,81 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
=20
-    if (RISCV_DEBUG_INTERRUPT) {
-        int log_cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
-        if (cs->exception_index & RISCV_EXCP_INT_FLAG) {
-            qemu_log_mask(LOG_TRACE, "core "
-                TARGET_FMT_ld ": trap %s, epc 0x" TARGET_FMT_lx "\n",
-                env->mhartid, riscv_intr_names[log_cause], env->pc);
-        } else {
-            qemu_log_mask(LOG_TRACE, "core "
-                TARGET_FMT_ld ": intr %s, epc 0x" TARGET_FMT_lx "\n",
-                env->mhartid, riscv_excp_names[log_cause], env->pc);
+    /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
+     * so we mask off the MSB and separate into trap type and cause.
+     */
+    bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
+    target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
+    target_ulong deleg =3D async ? env->mideleg : env->medeleg;
+    target_ulong tval =3D 0;
+
+    static const int ecall_cause_map[] =3D {
+        [PRV_U] =3D RISCV_EXCP_U_ECALL,
+        [PRV_S] =3D RISCV_EXCP_S_ECALL,
+        [PRV_H] =3D RISCV_EXCP_H_ECALL,
+        [PRV_M] =3D RISCV_EXCP_M_ECALL
+    };
+
+    if (!async) {
+        /* set tval to badaddr for traps with address information */
+        switch (cause) {
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_INST_ACCESS_FAULT:
+        case RISCV_EXCP_LOAD_ADDR_MIS:
+        case RISCV_EXCP_STORE_AMO_ADDR_MIS:
+        case RISCV_EXCP_LOAD_ACCESS_FAULT:
+        case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
+        case RISCV_EXCP_INST_PAGE_FAULT:
+        case RISCV_EXCP_LOAD_PAGE_FAULT:
+        case RISCV_EXCP_STORE_PAGE_FAULT:
+            tval =3D env->badaddr;
+            break;
+        default:
+            break;
         }
-    }
-
-    target_ulong fixed_cause =3D 0;
-    if (cs->exception_index & (RISCV_EXCP_INT_FLAG)) {
-        /* hacky for now. the MSB (bit 63) indicates interrupt but cs->exc=
eption
-           index is only 32 bits wide */
-        fixed_cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
-        fixed_cause |=3D ((target_ulong)1) << (TARGET_LONG_BITS - 1);
-    } else {
-        /* fixup User ECALL -> correct priv ECALL */
-        if (cs->exception_index =3D=3D RISCV_EXCP_U_ECALL) {
-            switch (env->priv) {
-            case PRV_U:
-                fixed_cause =3D RISCV_EXCP_U_ECALL;
-                break;
-            case PRV_S:
-                fixed_cause =3D RISCV_EXCP_S_ECALL;
-                break;
-            case PRV_H:
-                fixed_cause =3D RISCV_EXCP_H_ECALL;
-                break;
-            case PRV_M:
-                fixed_cause =3D RISCV_EXCP_M_ECALL;
-                break;
-            }
-        } else {
-            fixed_cause =3D cs->exception_index;
+        /* ecall is dispatched as one cause so translate based on mode */
+        if (cause =3D=3D RISCV_EXCP_U_ECALL) {
+            assert(env->priv <=3D 3);
+            cause =3D ecall_cause_map[env->priv];
         }
     }
=20
-    target_ulong backup_epc =3D env->pc;
-
-    target_ulong bit =3D fixed_cause;
-    target_ulong deleg =3D env->medeleg;
-
-    int hasbadaddr =3D
-        (fixed_cause =3D=3D RISCV_EXCP_INST_ADDR_MIS) ||
-        (fixed_cause =3D=3D RISCV_EXCP_INST_ACCESS_FAULT) ||
-        (fixed_cause =3D=3D RISCV_EXCP_LOAD_ADDR_MIS) ||
-        (fixed_cause =3D=3D RISCV_EXCP_STORE_AMO_ADDR_MIS) ||
-        (fixed_cause =3D=3D RISCV_EXCP_LOAD_ACCESS_FAULT) ||
-        (fixed_cause =3D=3D RISCV_EXCP_STORE_AMO_ACCESS_FAULT) ||
-        (fixed_cause =3D=3D RISCV_EXCP_INST_PAGE_FAULT) ||
-        (fixed_cause =3D=3D RISCV_EXCP_LOAD_PAGE_FAULT) ||
-        (fixed_cause =3D=3D RISCV_EXCP_STORE_PAGE_FAULT);
-
-    if (bit & ((target_ulong)1 << (TARGET_LONG_BITS - 1))) {
-        deleg =3D env->mideleg;
-        bit &=3D ~((target_ulong)1 << (TARGET_LONG_BITS - 1));
+    if (RISCV_DEBUG_INTERRUPT) {
+        qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": %s %s, "
+            "epc 0x" TARGET_FMT_lx ": tval 0x" TARGET_FMT_lx "\n",
+            env->mhartid, async ? "intr" : "trap",
+            (async ? riscv_intr_names : riscv_excp_names)[cause],
+            env->pc, tval);
     }
=20
-    if (env->priv <=3D PRV_S && bit < 64 && ((deleg >> bit) & 1)) {
+    if (env->priv <=3D PRV_S &&
+            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
-        /* No need to check STVEC for misaligned - lower 2 bits cannot be =
set */
-        env->pc =3D env->stvec;
-        env->scause =3D fixed_cause;
-        env->sepc =3D backup_epc;
-
-        if (hasbadaddr) {
-            if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr =
0x"
-                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
-            }
-            env->sbadaddr =3D env->badaddr;
-        } else {
-            /* otherwise we must clear sbadaddr/stval
-             * todo: support populating stval on illegal instructions */
-            env->sbadaddr =3D 0;
-        }
-
         target_ulong s =3D env->mstatus;
         s =3D set_field(s, MSTATUS_SPIE, env->priv_ver >=3D PRIV_VERSION_1=
_10_0 ?
             get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE << env->p=
riv));
         s =3D set_field(s, MSTATUS_SPP, env->priv);
         s =3D set_field(s, MSTATUS_SIE, 0);
         env->mstatus =3D s;
+        env->scause =3D cause | ~(((target_ulong)-1) >> async);
+        env->sepc =3D env->pc;
+        env->sbadaddr =3D tval;
+        env->pc =3D (env->stvec >> 2 << 2) +
+            ((async && (env->stvec & 3) =3D=3D 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_S);
     } else {
-        /* No need to check MTVEC for misaligned - lower 2 bits cannot be =
set */
-        env->pc =3D env->mtvec;
-        env->mepc =3D backup_epc;
-        env->mcause =3D fixed_cause;
-
-        if (hasbadaddr) {
-            if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr =
0x"
-                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
-            }
-            env->mbadaddr =3D env->badaddr;
-        } else {
-            /* otherwise we must clear mbadaddr/mtval
-             * todo: support populating mtval on illegal instructions */
-            env->mbadaddr =3D 0;
-        }
-
+        /* handle the trap in M-mode */
         target_ulong s =3D env->mstatus;
         s =3D set_field(s, MSTATUS_MPIE, env->priv_ver >=3D PRIV_VERSION_1=
_10_0 ?
             get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE << env->p=
riv));
         s =3D set_field(s, MSTATUS_MPP, env->priv);
         s =3D set_field(s, MSTATUS_MIE, 0);
         env->mstatus =3D s;
+        env->mcause =3D cause | ~(((target_ulong)-1) >> async);
+        env->mepc =3D env->pc;
+        env->mbadaddr =3D tval;
+        env->pc =3D (env->mtvec >> 2 << 2) +
+            ((async && (env->mtvec & 3) =3D=3D 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
     }
     /* TODO yield load reservation  */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 938c10897c..8039eb6e48 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -435,10 +435,10 @@ static int read_mtvec(CPURISCVState *env, int csrno, =
target_ulong *val)
 static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
 {
     /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D reserv=
ed */
-    if ((val & 3) =3D=3D 0) {
-        env->mtvec =3D val >> 2 << 2;
+    if ((val & 3) < 2) {
+        env->mtvec =3D val;
     } else {
-        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: vectored traps not supported"=
);
+        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n=
");
     }
     return 0;
 }
@@ -607,10 +607,10 @@ static int read_stvec(CPURISCVState *env, int csrno, =
target_ulong *val)
 static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
 {
     /* bits [1:0] encode mode; 0 =3D direct, 1 =3D vectored, 2 >=3D reserv=
ed */
-    if ((val & 3) =3D=3D 0) {
-        env->stvec =3D val >> 2 << 2;
+    if ((val & 3) < 2) {
+        env->stvec =3D val;
     } else {
-        qemu_log_mask(LOG_UNIMP, "CSR_STVEC: vectored traps not supported"=
);
+        qemu_log_mask(LOG_UNIMP, "CSR_STVEC: reserved mode not supported\n=
");
     }
     return 0;
 }
--=20
2.20.1


