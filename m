Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6e-0004L1-EG
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6W-00047y-CJ
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0b-0006IF-QK
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:21:11 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y0Z-0006Dh-NO; Fri, 15 Mar 2019 21:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699268; x=1584235268;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=nbUPHDJk8RpFMRa0NPThvPaRK6PAUOOR9dAveJCYx5Y=;
	b=Xjviz3ddAGT5nI+5reb8n4CA/37jm1RxpihmTQfs+vmjLuHl3a8GIXmZ
	8roSvu/ramtGcb4bzbNmWQdVK23crCd7q/ParQPpIoh95ZWzLVDM4V0xY
	liFokvTKvgcONxyQXOhj8heZjmdBvJs1enSAPndbf2fj6dcD2qiXKterl
	9hcWGeSK8t+uiIDPmdjU+8seipsdjYrQ9TqfPSFAt2aTvxNXKhZHfsejt
	hxLZU2w5Je24vlr85ytzEUfKlA1Gih72FBv3I7orFWzmGxF+13yhs2luo
	dJQaIkkNTHU7AJCULskYRIbaVZPpNZer9TU1C+G4HCtSn1OfLdk0wGhFt A==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="103549488"
Received: from mail-dm3nam05lp2055.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.55])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XKKRuiJtgfIkuiPdNgxISRiHfh202ogQ8Ic56YH569c=;
	b=TZQEE+CCjy3cuwS2sSK/lmFhT0v40XYxpGpNN64MFr/dLwbc53yRBNi9G4eqsETNzem8EeN+jbmzod+VizLnxjKJgf4DiUQdO65LARdpUyslCxRiZ5H+1CuGQTwXhgcwlXPG2IxcL8jvFLBX1xN/xb81Tr9dmmsOCnz3EiX740A=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:21:03 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:21:03 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 08/12] RISC-V: Add support for vectored interrupts
Thread-Index: AQHU25aFnvCRMkHdAkuK/dtF93h7qw==
Date: Sat, 16 Mar 2019 01:21:03 +0000
Message-ID: <648db8b832d23eb815ef0ba4f3e1b0c560e30cac.1552699115.git.alistair.francis@wdc.com>
References: <cover.1552699115.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0079.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::20) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 838bb714-0599-4d74-87e8-08d6a9ada808
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB59896204CE7EBEACEB2B71C390450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(76176011)(6512007)(52116002)(386003)(8936002)(118296001)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(446003)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(11346002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hguGmg6DV6jn8/fKVk3AKRsT2dFoyJgp73gBLCGD7lR26nf1bKtvsLskHSx8jxPBowfi/5nL25Z2/PVE5Pa8WE+8UNQ9mY5lIazv1ZxyNrqmB4pKEakFbSM9cUDdJlKSZd6xW2qlQ37632k0CskSSU1Uy74H+TJaZ9hIXXip0ORZfVGX+p9jBdvLhOthiA7Oi/TJxPl+zNzrRUcYcobAXKLaTP2VkYw1LhIUDrm3EFt7YewBQ5kcrC7thYqTQj6q3x7dzs5LHooNvuv8tjossxc6FNY0i/74/5icugB2J9TWevMv+KFVpp2Iywhl4byXqyaSQvoIFj6EQN8VFRXHxujuJCWaatMvzUzXxmn4YVd6zg8NDPMi0jRoGyWRteELMowzuvw/J81Ma0E8TnzZIYtinuOeRCtc5sFPTzuMh/E=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838bb714-0599-4d74-87e8-08d6a9ada808
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:21:03.5112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 08/12] RISC-V: Add support for vectored
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:17 -0000

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
2.21.0


