Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6JNv-00005m-I2
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 14:22:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNr-0008UF-IK
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNl-00017p-9u
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:22:43 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47895)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JNY-0008FT-5u; Tue, 19 Mar 2019 14:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553019744; x=1584555744;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=bXxxbDsH0aVj2idXiWu57viIIEYx489VzznurZVnEG4=;
	b=LX7jYiUPnui+W9NqtGfB71vJGgEk+hRtNiEl8irgMh9HhatDaLvMJHnw
	v2+PqxlsNkouEME9x9NSKZJ89O11A3D+0D3ZemzLtfFbaz0rNX+K3DmKK
	5NIj98k+KJrGL6bKiecWuxnZk0fJ9GHUFSRj64o534CafxWzmrfhdkpSF
	dOT4aytDCyuVinNWxw/MtmLmoQV/5be8V9X7pbN3JtYmRwVbfCS9R7fob
	DuC0MXEsbjdXedO/YgbLrC45DAfOWjTjJhCVmwE6YD7flJXpbhnO1i8UX
	OmnfS0PO5oMGvRnWmFSmHKc7DcrOlVOmtB7uVARUXo3H6yz5a1IIG9eNB A==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209307028"
Received: from mail-by2nam05lp2058.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.58])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 02:21:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e+PcgH83l8nVsFDXSW7WAmaBlMHXUIrdZ5fR8Zs7OWI=;
	b=Y7KF5t3XizBdSQuQZknJM97gM/06yPQQWTQ7YkciRPcy68uovc6AU4XlbK89MG43lOZLuVpFFNBNVWMTPfN15u1XzlaU5zQT1aZEP8zdPAOl7/19ZtB+E8tigTFSoehDMWg7f1wq2tAGiVjZxZumNyzpvbLmCD3AxgcWod4fCLQ=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4326.namprd04.prod.outlook.com (20.176.251.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 18:21:24 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 18:21:24 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v1 4/6] target/riscvL Remove the unused any CPU
Thread-Index: AQHU3oCPPLbP72ihGUemb+ZAF/j0yg==
Date: Tue, 19 Mar 2019 18:21:23 +0000
Message-ID: <073a79909f5ec317747ff8330744e6d7dabec717.1553019560.git.alistair.francis@wdc.com>
References: <cover.1553019560.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553019560.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0052.namprd05.prod.outlook.com
	(2603:10b6:a03:74::29) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8d079a0-6ee3-4e45-c0d2-08d6ac97b151
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4326; 
x-ms-traffictypediagnostic: BYAPR04MB4326:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4326052F12E6553A85D0D02A90400@BYAPR04MB4326.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(71200400001)(316002)(6506007)(44832011)(4326008)(2616005)(11346002)(486006)(71190400001)(105586002)(446003)(476003)(6436002)(102836004)(99286004)(52116002)(5660300002)(53936002)(118296001)(386003)(26005)(25786009)(186003)(110136005)(6512007)(6486002)(76176011)(72206003)(54906003)(256004)(68736007)(66066001)(106356001)(8936002)(14454004)(478600001)(2906002)(7736002)(97736004)(3846002)(86362001)(81156014)(36756003)(2501003)(6116002)(305945005)(8676002)(81166006)(50226002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4326;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iI5TZYichY541+wMm3zlFHmatkuYhhueakqNk2KonuFKgf4umRbOXnJMC0qsAJhl6ZaJ17dGOCYYBsVdnGqaSMF5E+0QHuX7KvY24vl3LeNXpIyQVoQHQAawMkcTbIWhkQ+1IHSW4jx+4yh+GPBFL3aWHwIVENVC5RekfwgbIJvGqjGewHbUa+fcHcoqx1WvMHH86Fe5UK21jxowiKa3ycECtBf5JJrw6vkRTYpq6kAC47a6TTw71Tu8jlLJX9JKqnrcAej/Jb8ehld1vqcUo/Wl7mG+gbLHwNHnjsboTSsd7bieaLRuqw1lzLGeFsy8I18lM7u3MfTM2OsMKDE+s3a+NGclHnz0eD4pOhGfqocDx7g3IcDJeWLPBOlXaXPzOLSkR+zKh7Tg6hJtlNsiu2e1eNrhQyPvTc9lmP5Ntj4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d079a0-6ee3-4e45-c0d2-08d6ac97b151
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 18:21:23.8620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4326
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for 4.1 v1 4/6] target/riscvL Remove the unused
 any CPU
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
X-List-Received-Date: Tue, 19 Mar 2019 18:22:45 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 ----------
 target/riscv/cpu.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b6408e0a83..298413f6f6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -188,15 +188,6 @@ static void riscv_generate_cpu_init(Object *obj)
     set_misa(env, rvxlen | target_misa);
 }
=20
-
-static void riscv_any_cpu_init(Object *obj)
-{
-    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
-    set_versions(env, USER_VERSION_2_02_0, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
-}
-
 #if defined(TARGET_RISCV32)
=20
 static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
@@ -575,7 +566,6 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
         .class_size =3D sizeof(RISCVCPUClass),
         .class_init =3D riscv_cpu_class_init,
     },
-    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_GEN,              riscv_generate_cpu_init),
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_RV32GCSU_V1_09_1, rv32gcsu_priv1_09_1_cpu_in=
it),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bc877d8107..7d7caa294e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -47,7 +47,6 @@
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
=20
-#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_GEN              RISCV_CPU_TYPE_NAME("rv*")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_09_1 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.9=
.1")
 #define TYPE_RISCV_CPU_RV32GCSU_V1_10_0 RISCV_CPU_TYPE_NAME("rv32gcsu-v1.1=
0.0")
--=20
2.21.0


