Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcU9-0005J9-Rl
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:45:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU3-0005Bv-In
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU2-0002dW-4T
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcTv-0002Zm-Vy; Wed, 20 Feb 2019 19:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709936; x=1582245936;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=dE+Cec88GoO5/zv+M7uR6/QvE5ML1q257t2DPzVzr34=;
	b=GJ15b4T+sPJ9dJ+8s5fTxn5RrDf0FeLdLeEhr2eSBcUh/1XZoK05gUYA
	7oDKAkcCM1sA5jIAw3SYnx6vHuzn0E5Vamp86C3tSGE13MO4Tu0fnHOx5
	8+CQUMvh7FNwTpLxS2b7NXP28D1lkpAyvaQ8GrWJEPPMf+UFzCS83M0wC
	AbSAhvsf4egdHPvCd2IQgHePkvVMTF24Q0ZxyXK5UdBas/QDs2YNiwz+J
	+8+iWKIYxJOkr4MwJuR02o734U+8S3QPTATn9TNqd+j16UNk+MKqn6iQS
	Cqwgmb5UUsIPUW4theTV0fP+0cmOeApP48vP4WDaGwMYOW0Ewg54vsGur g==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="200114444"
Received: from mail-by2nam05lp2050.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.50])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:45:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ef+eU7n/zHfPDvSf1+ijxm4TbGPfpKgPEXrqhWFzykA=;
	b=Oyq0Sl2ODn8rG5dmj91gJ+ApX0SLsAs+JlNLEa8G1W4q9L7gEWhzeawkjF7F7ujniifRytHu5xV5h11nGfineXbwYLkQbf08NCuOZXea8EtG1F3bBZJlwX5gZDcojOVRbRtDpusMtPzSOTdBK0M6Ej6abZq2Rq1HB8xyP0S60rw=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:44:28 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:44:28 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 08/11] RISC-V: Add support for vectored interrupts
Thread-Index: AQHUyX6ZDfF/NYvlbkiHU2H4zotujw==
Date: Thu, 21 Feb 2019 00:44:27 +0000
Message-ID: <2507abbe551534e531b3d454de4d4551bddea32c.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR08CA0004.namprd08.prod.outlook.com
	(2603:10b6:a03:100::17) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9ea2f91-7099-44cf-0fec-08d69795bbcf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:GQ9hk7YIM0lLqckAhezgMcN9RbFXDdkQ7h5ALAj?=
	=?iso-8859-1?Q?CMjrTGD1cych6epoCNUpybg+sSaTFs+8lJCMzm0Ut1kw5x2NwSU+R69dZf?=
	=?iso-8859-1?Q?jb2Q6cVPISoxirGS93xhdtOCIV/rP1p+IadJI8aP18mvSdh2VN3AUyMAub?=
	=?iso-8859-1?Q?tFaXIWABgRkWvz04JN98Txa9+q31ijyQ5c+9N5WIGtH4tF5sAqNiDrLaRh?=
	=?iso-8859-1?Q?4nziA6bYZsRwYEC4KjtxSPNu03CSOfdk67z6IfGlFjKP6xGG2BTDDI4/XG?=
	=?iso-8859-1?Q?8U2lwRM0g6/q8mi8RmN4ExYnHsA9PkSb1oFJfLJEZEc1n2PjGQyVEdpjYt?=
	=?iso-8859-1?Q?ArwNApVfhxvtbD1W/0Zmlx0SvyTMMo/cUFv0TZx4I8fmTtsJfnHaVrk81M?=
	=?iso-8859-1?Q?WXq7fKK7Dd+WDEqNU+j6cE2HVSc2ZQVRLux3Nkjcn3GLGT3h5WBJjdQ08N?=
	=?iso-8859-1?Q?uRi+NRBdL5PfasXXOAvL7OmfPo4HkdvZj12Cp0cyjclAjWQew2UbLTXwlO?=
	=?iso-8859-1?Q?8OZdjoJWU9bf6ohZBKN+qvJyMnlEE8FqVSOml1Oh9CgKBvE8Y4AAzUrPz4?=
	=?iso-8859-1?Q?n+FPndBwfeRbcF10o5eA2+/6McwY21vfgpBdlNSCHspnybTC0fB8762mAz?=
	=?iso-8859-1?Q?6qy1To+AQcQKlHkxBKLVuHipRRevlu8NVde/CrtcNMaigO5JgUI3cGhfVp?=
	=?iso-8859-1?Q?TYresY/98AeVyKzSprj9BRmL0l2uCPYNdHODyKaUrhj/mcbW7DPKIgwprZ?=
	=?iso-8859-1?Q?HVqQNqNp5FnzPKTtGtApWm6d55JgCq2tRFMZe9mCur+VwvFftTMijiRkd1?=
	=?iso-8859-1?Q?DJMVqHAqSA3RPO/Da9+vqJoJgDZo7kdDU5J0fY7cJakMZGNB7np4vml034?=
	=?iso-8859-1?Q?ZmrGIiLKmAm3o3eLIlq+CEqrhxWP3GNfY0SekBFFJ1pKkvxhP7MCYbTG3J?=
	=?iso-8859-1?Q?m+ZeBHU2SVY4a2lxtfKX7b2ot4liuZl6dFY/KT2WiF8E/LWecEH6BcHT6Z?=
	=?iso-8859-1?Q?GxBIFtNvqKhcZEHnUiM6b7VJcgU8/A3AV+5Ja+LiwQOIvAWOXXUavnOQFC?=
	=?iso-8859-1?Q?Dj0BCZgaT/Nj0cg1v8xr8tYj9K5kK5BfPpEQKzON6Kh0XpN0+TpdFBBFNd?=
	=?iso-8859-1?Q?mrZ9d/0Oub3mMtM5vqUClB/V/mOnMfk/mi0mIF48nPffQ55JElNydnRWc1?=
	=?iso-8859-1?Q?BFiqAyPHWCuzm6T16b60tT5BdL114zni1ei0PImYCJWMiKLTsWVd2LRYs3?=
	=?iso-8859-1?Q?wdYQg3CqETIEQ64Yjxn89QrFFAsyIxPxZWgnZFvvLBbJCtFqONanf3e8NT?=
	=?iso-8859-1?Q?b3HFVabMMBxihgLV63l59Q8hTqW/3qGlva9x3G1o4nYfA=3D=3D?=
x-microsoft-antispam-prvs: <CY4PR04MB0985D2472FE121710ED73449907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(14444005)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mPo++K0N7NPyq8iPNYcOuVc2c5npaESdljcSHfy5g9/sbt9oKrlBN9tZ4RiC0OGzh5PvzVMEa3OByRlBWQS2viDjLRFwfsGk/3Ui4KfPGDJJncbi1jWvFdrrj+k1cVBACj3Bg3iJ6BaevMBGmoZbqxIFs6OXBa7K/A0xHn9nk6ht+5Cu71wgSLTZ1ODi4WRfELyczxMs9NeRWSzRPqk9fSZhMVD6w3O5vZksBpR8eAxu29HOahsSDfkABDMk1Vwd4e0Qd4Vcn8nPo+kalbbyzp3jukCx4h/qiPP65TXlnNNCRrp9ZpYGqDYxEhCPJAwbc1EW3hoH16X5gS0dBBWNSLGmKP7My4zj5SRIR2UqBRktAUTKqwVMl4KX2hpPyCSRjgSHG+zWyyqUeyCfirMCT8Fa7utbXH467xtUDD8eKCk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ea2f91-7099-44cf-0fec-08d69795bbcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:44:27.4032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v2 08/11] RISC-V: Add support for vectored
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
X-List-Received-Date: Thu, 21 Feb 2019 00:45:05 -0000

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


