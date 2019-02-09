Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsGzp-00055T-5G
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 19:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzn-00053g-Oe
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzm-00068g-Ey
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21429)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzd-0005zU-Oo; Fri, 08 Feb 2019 19:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549673992; x=1581209992;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=AOaFML7kj36rjvBCxvBKU2+Olafu8d1NMlOnDxuHXWA=;
	b=Bq31ubqcMrjm3S8Ha2YmzEn/q/LA1JXwTOD5IfflUI/mbKFj6Wqpl06A
	APRsHpVw83ZacjBPuwNXFyCDkufcgTMpAFviXG7Mqvlx5Z6NlSdN5YIpL
	HUHXRRLPJQ0SYsBwUJ6HC+/9C/CDxYywJQS4kNMiuWbz0thg1HBZ8ue20
	SRjMxiJs5nhWVhA38pa8qiibGjeyyU9teTENp9aBZ+DMVP1D4KBdmjI/W
	SeTm0C680ziLNqHA7QqsmGmadpoRFeNcdqk8VWkTgvoJx0GQSAZZE0VP9
	fOcKnpvUMR+ZwgdaOPH7DA9Q8pcZYeFLGZiizoKN97Hjwxu6vfzLxCeWt g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="198999429"
Received: from mail-cys01nam02lp2050.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.50])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 08:59:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=McK/qEiyWRH1yKxgD4bsiQmUaVqmhQgC6fbggKB8x8Y=;
	b=nZal/Zbi6B4J4Q0Mt5fwcy9TTvhd4SErLTUZdMPy1GrHpij0NgI1SKLzZ14qllhgKLrPCYm8ppiaFQqv5BMn8I2Ns0PkVcDdq1M1Lr6PW1SNorXi90BL920UaTtHEuQ/CgzzOwfoLOQGju+aBqE7Owh/0NfXcupWDRJPowaZWWY=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 00:59:38 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 00:59:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 02/11] riscv: pmp: Log pmp access errors as guest
	errors
Thread-Index: AQHUwBK7jOTr2znGkEqtlS2C/dKHeA==
Date: Sat, 9 Feb 2019 00:59:38 +0000
Message-ID: <c2daf173b9313126c6cb0babc2728ad82053d668.1549673900.git.alistair.francis@wdc.com>
References: <cover.1549673900.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR04CA0031.namprd04.prod.outlook.com
	(2603:10b6:a03:40::44) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:0/RMWdDaxhyCOeUHNujKieLQoNu2Sr8YoTF0vjkv6aaMvFXKItIFUCys9WLfEY+f/NKK2vlyVqOJ3/RTWeJeBuqZkis1JfGX7c0xKU9GxHRpa/i2nAOaiMrrv8BT8P99Za8d5ldyLDwrDxu+sUFquG90JszinexR+kWp9IEW64f6ilOB5CJmcBR7vyRe0P3X+Is4K3kWCVcB3iBGThtjIaPqEpS3fx02hfnJYU1TAjWiLfyaqr7/ppvvF5Ec4/Ssun1Hl85x308uzS/5uEEa5adgVMbEHJWBywtqODpghwreHHP/M80ew9ZP8K97FByvPzkIY2AcYs1QPMj6YH2xO8GO9O2NYYj+mswbeUStCD//dAe/DirFmMsyaD+11uzwj+V2JT5sk562cbCCClpfBYvy4ePIkhN74yj39XZNnSAEcvLM374EQM8JLjgheWaSrk9wf0zPkOvI8aH1Gb47Og==;
	5:X9vICU62vLVuKEdxa+MMuWp3bqR2QbpZ9UXmlkpUW644mRWVDLzhU4k+YpbOI46FWCUaFLySNK4LR19Y3sCXetuHfgYLUMIH1+AoO/UDqhFJg8UIt9iCtUUzya3wRoNVNXR6ADFaYXvT6e9MYcCmrm7+jetEfkhPgMUTJb1yDy6fvotZz6/b35UALTWxGM/qoDYBz/tc6fnpLs4o0+QCCA==;
	7:fSBHgjK7B2DLeJC1OTBIzknNFJMoedmIBfPKTSdf/CzQKmEhYm4NEz9Os30djVJk5jvsV74fqdba+gDq8n+z1VhrCpE21ssG6wSN2CvBicw7BFy0bvxXBFznYXWKUks1FBpD6PCym/PkiYMMRlDo4w==
x-ms-office365-filtering-correlation-id: 0ba7a395-375a-4186-4596-08d68e29dd62
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409BB67A29032D723930BEC906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(118296001)(11346002)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(76176011)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(446003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bD78bJTHV9VM1HtVDRKtZDhCdgpKmld4olHgDWunn5wl8DHxWixTjglNhowSa/C+MiltBiSCh0BtkfFHZ+KQfd76m/Us18BKokAj42uWyIWfiOymolELzKOfCv+BUkf8ZUNVYRq3lvoGD3BDVRMeuhTCsjpQleJbG4sKtCJ0u8k0BJvslWvD1chp3PD8kbR+MBbQetpTAmKQFXMe8bQ0koCrjhnpbS1axGUYNRqhz0AXr5E7f8nq7K2d8Byt0C2axgugaBx8WQBg6YkB/rMFtpmrTVti5IPp2ZFVXYp9VMH8FE9jNoB2xD8WdsDDK6ONnYWZF+gREiB6iLXWK3OgdGam/VpDfSk8zqmZIS9FVxoUgUxyWVgfqCIbYTXe8+t9VWGVpB1L7r3K1BFCIIc5x08bq0Xz0F3X3yHONgG4ifg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba7a395-375a-4186-4596-08d68e29dd62
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 00:59:37.6550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 02/11] riscv: pmp: Log pmp access errors as
 guest errors
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
X-List-Received-Date: Sat, 09 Feb 2019 00:59:52 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 15a5366616..b11c4ae22f 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -113,10 +113,11 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
             env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
             pmp_update_rule(env, pmp_index);
         } else {
-            PMP_DEBUG("ignoring write - locked");
+            qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked=
\n");
         }
     } else {
-        PMP_DEBUG("ignoring write - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpcfg write - out of bounds\n");
     }
 }
=20
@@ -249,7 +250,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulon=
g addr,
=20
         /* partially inside */
         if ((s + e) =3D=3D 1) {
-            PMP_DEBUG("pmp violation - access is partially inside");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "pmp violation - access is partially inside\n");
             ret =3D 0;
             break;
         }
@@ -306,7 +308,8 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_=
index,
         env->mhartid, reg_index, val);
=20
     if ((reg_index & 1) && (sizeof(target_ulong) =3D=3D 8)) {
-        PMP_DEBUG("ignoring write - incorrect address");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpcfg write - incorrect address\n");
         return;
     }
=20
@@ -353,10 +356,12 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t a=
ddr_index,
             env->pmp_state.pmp[addr_index].addr_reg =3D val;
             pmp_update_rule(env, addr_index);
         } else {
-            PMP_DEBUG("ignoring write - locked");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "ignoring pmpaddr write - locked\n");
         }
     } else {
-        PMP_DEBUG("ignoring write - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpaddr write - out of bounds\n");
     }
 }
=20
@@ -372,7 +377,8 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint3=
2_t addr_index)
     if (addr_index < MAX_RISCV_PMPS) {
         return env->pmp_state.pmp[addr_index].addr_reg;
     } else {
-        PMP_DEBUG("ignoring read - out of bounds");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring pmpaddr read - out of bounds\n");
         return 0;
     }
 }
--=20
2.20.1


