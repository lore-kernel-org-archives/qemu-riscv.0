Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC7Q-0003at-6F
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7N-0003Ym-58
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:58:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7L-0000Mz-Pv
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:58:09 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59831)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC7I-0000Hi-7i; Mon, 14 Jan 2019 18:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510285; x=1579046285;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=i+lFi+aCAJEl9mmnqQ3ezawmHCqe3yek8lEo71ONyDg=;
	b=nlDyFkKt/cvTbglxaWYw63jhxhmK+7REUqaQQJGqT0Ruzc+K16ErVfWu
	lSqSx2CNnYYFgeHa6F+6fvDIYFFKNO7vd8FNSs8b6SW7z5J9f3nmt/UTB
	riuz13rWVG9fyZKr+rmZoG1AA+2paSknVOw4OJ5tDOCubAbeEScY61DBY
	0vEVwEpbBXRjlx14ZhmXLSrbgHo3LLHBP6kAD28MchfcmKbCcjAbYBSXR
	fefhZAp5BuYozZHa8PMcMtC+yD77tCAc3LIM/acuxT5zEk+501QdwN/kh
	ye2Wfya5cCCYkufJkRzCwy3ohJdA837+iF8g+4xQvL0Z3gbtEqoF4icNT w==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="98765680"
Received: from mail-by2nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.59])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:58:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZhQpmcwdslTXA/zrPWJr/0tcictWCciVueDS5m1iYxE=;
	b=E//DsLfWtHZPKG5zalW1vobVo4sSO3P2u9OD4V5jPCxhKLCMQZVYyhAsz5ChtRBWIFHzMBCJlNd8LAT8Wjk0euOLpnrtvAzRyQZgYmNLcH+6+Uq9tpDXjT3BA5RhUrsQA5ybghmPUK63iq0IekKfpCsp1hR+t+XXQtia8owiHXw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:57:59 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:57:59 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 2/8] RISC-V: Mark mstatus.fs dirty
Thread-Index: AQHUrGT6TH7Q+oyNaU+G4s+WsxRZzQ==
Date: Mon, 14 Jan 2019 23:57:59 +0000
Message-ID: <c0db51a0307fd7e46184b8e01ee60be508ea9da0.1547510220.git.alistair.francis@wdc.com>
References: <cover.1547510220.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR20CA0026.namprd20.prod.outlook.com
	(2603:10b6:300:ed::12) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:vpswrbZqLFhZRu9yVigepWRH/UuA354R41WiutrXxAoop5+jyCRTNTckjlc6LltO5yq7SY8UDcKEKf44EDi2Ah/YsNJ4+ZRyPMS2F9ufZalzjli8t0DkxhyzJCY3RBnk9odomEKjJCOm9MroPH4jkjcTo83XF34wblTf3jRAoEJId2lOVa2lc00w4CVjug4D64AYcK0krsOxfhej45AHc/DVb/2MztRzfmbCnPrbtpQ+C11KwQ0QewJ4wxkQWcqio9CfE4cXV3QQE4EogjsZFrg11WzucDRoXNkVvqRPx0PMuDt02y82Zg6yWnLpDaWfURa2vvKB/hvJtjMjAwQsoinL5Kh/CYvgykcTSG3MQPyIg0r1m5bmx8QUnYzT7eCJYXZ9xUr27gcWgAEp8MosGJQy5xF6wT4LXEi9wxdfhNKzChQ2vUPc0Au11gdjBOe7a4W2jDyZj9gbp2BCBdFJqQ==;
	5:nSMAsRXnrIjtm/H/TrE3EJkAzy9328HeOvAPaLJgVxJvxkoKZOu1GQ4aFL0eBdMwZ3BEG4Qi9MQ3MI27hnT5VcBXPeP5tP5sCWJb5CPpgp+HCjbozvt3xBnfs+HlS27DexiVom3bOGneImrw/Wkhk3E3lDwmHuiS6dzJstJuclDo+qT7GSI6K7WVuVbf0ro4rann7g2VZZmxwHjhO12FqQ==;
	7:ZfKgwEVnlqNmzNM8e3NTWzOIt1Q+TVYkFP0zmMmsOGkz2gLlkAKU++etW9TeVyxgElPKeSw0C4xRrzWXEcIFMEroupeIbDUT5EL3O11O9i4iowudIW/OLjp398YDkx+R4zJH5rA5wYq47ySAbG64+A==
x-ms-office365-filtering-correlation-id: c5519a06-e579-4483-69c6-08d67a7c1c74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0895D07AF3252AA16EF62CC590800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(118296001)(256004)(99286004)(72206003)(14444005)(386003)(6506007)(68736007)(966005)(5660300001)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(76176011)(6486002)(36756003)(478600001)(25786009)(6306002)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(11346002)(26005)(446003)(86362001)(14143004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1XbFwOu43z78wY5wdf6qqmuhgoI5qh7H+QQrILOsz0oOV0eVQiuvIm0XKL09ty+P9JXeKGTjU4OHn7yBh/EI52LhRVMddoJO4UKWojPpKraZze9rDXitnLd7uQ6JN2TlQ0hVEAVZRvN3h5FTiA0a0d5hqX7EFvjzD03oa5+trrl3aq70MM7khwyMaK6C3nhXu8zXE9FGR1huY/L+ThB/8r6rXqkc7h503qpzAImzMO94hcdpRjuT38xlaeiruYsIzzPipXYcj4Tv6WKChXGAI0Co88+AJ0VnHvMUSicU1Lmcr+dc2oFuQxhC3rgj/WVfjCPoRz2YlRtbvWoiW3/+ol8TMGZunFK7BGVnB6t5VV/MNp4p3IinT5QgFBZzy3RNHEh8FWMk9sQYSfN2ge/klkjbztumA2cSP41oULKyuC8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5519a06-e579-4483-69c6-08d67a7c1c74
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:57:58.9917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 2/8] RISC-V: Mark mstatus.fs dirty
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
X-List-Received-Date: Mon, 14 Jan 2019 23:58:10 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Modifed from Richard Henderson's patch [1] to integrate
with the new control and status register implementation.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2018-03/msg07034.html

Note: the f* CSRs already mark mstatus.FS dirty using
env->mstatus |=3D mstatus.FS so the bug in the first
spin of this patch has been fixed in a prior commit.

Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Co-authored-by: Richard Henderson <richard.henderson@linaro.org>
Co-authored-by: Michael Clark <mjc@sifive.com>
---
 target/riscv/csr.c       | 12 ------------
 target/riscv/translate.c | 40 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5e7e7d16b8..5714147689 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -317,18 +317,6 @@ static int write_mstatus(CPURISCVState *env, int csrno=
, target_ulong val)
=20
     mstatus =3D (mstatus & ~mask) | (val & mask);
=20
-    /* Note: this is a workaround for an issue where mstatus.FS
-       does not report dirty after floating point operations
-       that modify floating point state. This workaround is
-       technically compliant with the RISC-V Privileged
-       specification as it is legal to return only off, or dirty.
-       at the expense of extra floating point save/restore. */
-
-    /* FP is always dirty or off */
-    if (mstatus & MSTATUS_FS) {
-        mstatus |=3D MSTATUS_FS;
-    }
-
     int dirty =3D ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS) |
                 ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
     mstatus =3D set_field(mstatus, MSTATUS_SD, dirty);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3d07d651b6..0581b3c1f7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -651,6 +651,31 @@ static void gen_store(DisasContext *ctx, uint32_t opc,=
 int rs1, int rs2,
     tcg_temp_free(dat);
 }
=20
+#ifndef CONFIG_USER_ONLY
+/* The states of mstatus_fs are:
+ * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
+ * We will have already diagnosed disabled state,
+ * and need to turn initial/clean into dirty.
+ */
+static void mark_fs_dirty(DisasContext *ctx)
+{
+    TCGv tmp;
+    if (ctx->mstatus_fs =3D=3D MSTATUS_FS) {
+        return;
+    }
+    /* Remember the state change for the rest of the TB.  */
+    ctx->mstatus_fs =3D MSTATUS_FS;
+
+    tmp =3D tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
+    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    tcg_temp_free(tmp);
+}
+#else
+static inline void mark_fs_dirty(DisasContext *ctx) { }
+#endif
+
 static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
         int rs1, target_long imm)
 {
@@ -679,6 +704,8 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc=
, int rd,
         break;
     }
     tcg_temp_free(t0);
+
+    mark_fs_dirty(ctx);
 }
=20
 static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
@@ -944,6 +971,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t op=
c, int rd,
                          int rs1, int rs2, int rm)
 {
     TCGv t0 =3D NULL;
+    bool fp_output =3D true;
=20
     if (ctx->mstatus_fs =3D=3D 0) {
         goto do_illegal;
@@ -1006,6 +1034,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output =3D false;
         break;
=20
     case OPC_RISC_FCVT_W_S:
@@ -1035,6 +1064,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output =3D false;
         break;
=20
     case OPC_RISC_FCVT_S_W:
@@ -1085,6 +1115,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output =3D false;
         break;
=20
     case OPC_RISC_FMV_S_X:
@@ -1177,6 +1208,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output =3D false;
         break;
=20
     case OPC_RISC_FCVT_W_D:
@@ -1206,6 +1238,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         }
         gen_set_gpr(rd, t0);
         tcg_temp_free(t0);
+        fp_output =3D false;
         break;
=20
     case OPC_RISC_FCVT_D_W:
@@ -1254,6 +1287,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t =
opc, int rd,
         default:
             goto do_illegal;
         }
+        fp_output =3D false;
         break;
=20
 #if defined(TARGET_RISCV64)
@@ -1271,7 +1305,11 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t=
 opc, int rd,
             tcg_temp_free(t0);
         }
         gen_exception_illegal(ctx);
-        break;
+        return;
+    }
+
+    if (fp_output) {
+        mark_fs_dirty(ctx);
     }
 }
=20
--=20
2.19.1


