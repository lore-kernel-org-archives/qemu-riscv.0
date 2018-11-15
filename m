Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQGC-0007mD-W7
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:37:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG8-0007gX-Kc
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG7-00050a-Tv
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:12 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG3-0004yQ-G2; Thu, 15 Nov 2018 17:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321427; x=1573857427;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=VogOQjFrd3wYQKzXil8KkY1CNgS8koY1j2JjE3rmNIM=;
	b=Mpjc74fBR1WEb4Tys51FVvgiuE+oCHG/R8+EuXeCjD1uIW7V4MQYvzBi
	6J5ccOz8pIAag5bQWkp6IPgGqKfT0QoRN/cO51WtpTYA6clCZAIKfoYKn
	3LJWmtBd8I0Mcs6CIzrrv2ai2x8AhXaB6ySioUaK7fU1YfHf7U7gWuHc+
	zgSUXca/VMBKQoxmS5kZajrm9gmwVETNCQiw1AL2ETV/kSZnmnABxREdL
	0BNt8pWFubyufcA1NxpoIHkCKeio8u/EtSk6I1aXnMq0PosaacoSczzGw
	zNBIyF50cWkgTL8VGcIjjaJ1BWuAGRNbf4hUYLtQW1NI8SuuIJtn2PRzf w==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523442"
Received: from mail-bn3nam01lp0176.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([216.32.180.176])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:37:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yzDEfzS32xANlyfIIU2aLVjqpwNmDvX6/L1+J/iOCHc=;
	b=cv9/ZpfgLTxrlzhP/Jqsf9OjnWOcjUVkXc3pHFiEZGOtvuKyIebiOgokq/09R3aLUgbQ5V9mef6SwfGCOk8PxKtOWBTmHp0rz6v4PqdvkdAwbl5nRRcXwHeQW+0VmVozSjOXGjc/j87o3yRBy9Mogx3ws+wV9G/B393653pFSbY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:37:04 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:37:04 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 21/23] tcg: Add RISC-V cpu signal handler
Thread-Index: AQHUfTO7klaE228UjkuSpAey4feriw==
Date: Thu, 15 Nov 2018 22:37:04 +0000
Message-ID: <9e9303670bf6210b643b05f9bddf9c52f684173b.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0078.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::19) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:PYyRMsCRxPI8v0IqZi3I23vteVy4ClWHEiBbsc44aCMiA0t1XvnkFsbkMps2PqKhVLNJs8GYjr220h1OJjtydWqUMVX1J5amsnIsYJsLAEXAH3T3SrU95JDet4/QO8XAXHtS/Puxaq2WSwZ413hmfPg1wFWShdR08swwy1n3VmVvEZnrbjT7tlSbH8Rptu28HbnzCFUcgl5284Dz9cIhLrDFccSkjGN97Z6unQ2N3D9pQSrp13MbJgxzWaG0y3OjQrfwkH+yoIq8SKjyNZ8h1Qi/UgCgStcsf/EDcQJSovTefHYnhDe3O4A/vkcO/8JDcXnopJBBR+0od2OmCnv/lbeWAaBwIR/kzsRMSL6ZBXOwO/ci7kVtT/vXtLD8zQNzEBgVq3ZDnUPBEoMpVBxF8xo5ZBxNkNz4k31Fh1Rvlb8iChaePrkV11rSmxtCzMACJaQRc8Vbk/evX2VYHlDCxw==;
	5:ulPNW0tbDXkunfvOEHsrxohq0uIbMEZja2eooyW+hyg0+BozAWy7tVG3ydCcl8zBREKspSJV2omTzSS6wgAOx/PK2jbmsgQZ9I2Fsgpxb4nywYR76Ppz4c+rDQd/1sr9Uu33pqE+5C5lwVW+yAO6D3QiTUCkMeiYxwNPgsTTBSE=;
	7:YJG2MiKXZheRH6hSExy6YDC2G1D3KqkV8+A6TKHL+6SajE6Hf3CZc3OQIbExcKU6jsz0qqPt1VhHV8ANyewvBxLGW7RcPLgUObEtj8Od8YvND4aafj1XHmTwvUj5YokfMkn1hSghEX0aM05KWCP73g==
x-ms-office365-filtering-correlation-id: 90550e8e-36fb-41b5-19ea-08d64b4addc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08655C8D50F386ECC0469B6290DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0865; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0865; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(81156014)(81166006)(8676002)(118296001)(14444005)(8936002)(256004)(6486002)(25786009)(86362001)(2501003)(72206003)(105586002)(106356001)(2906002)(97736004)(478600001)(66066001)(186003)(99286004)(54906003)(386003)(11346002)(2616005)(446003)(36756003)(2900100001)(486006)(6512007)(476003)(6506007)(26005)(39060400002)(102836004)(5660300001)(305945005)(50226002)(71190400001)(71200400001)(110136005)(6436002)(68736007)(53936002)(3846002)(316002)(4326008)(6116002)(7736002)(14454004)(44832011)(52116002)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0865;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: PW1lXcFGAQnpx6uvZwhoc08kAcsagC+Bcc4wLHAi4ua+L7PHu1Dl/fHPQkV+fBCUq6C9z+Q3Pd9L6NQR1YL8IJOleLgcw//Ljoqo5bW5J2PyrD3DTTVVNET7cebPosELXKnTEf1v/0fvnIf6iNyswtxfqb2uVF5w+KRF/z5qBjTjXc0SzrBY95A2b7DcgNXhqV7WF2+iQLJC9NNOxDuOqS/FWv5TX8xWdc7HQeKSu3rdpWp5MuZd1Ge6Bj+CwEdWhY8iAqy9O3NsJbVQM9zEXPGvfYCGsW/XQrPeVNq0BYcaNalLpWgvE0KmtrszN7YeUC2W1E+NopHLJSYqHwfW/mJw5a9PkfeMWC1uCHhohdo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90550e8e-36fb-41b5-19ea-08d64b4addc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:37:04.4658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 21/23] tcg: Add RISC-V cpu signal handler
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
X-List-Received-Date: Thu, 15 Nov 2018 22:37:13 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 accel/tcg/user-exec.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index cd75829cf2..bb693484ed 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -571,6 +571,54 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
=20
+#elif defined(__riscv)
+
+int cpu_signal_handler(int host_signum, void *pinfo,
+                       void *puc)
+{
+    siginfo_t *info =3D pinfo;
+    ucontext_t *uc =3D puc;
+    greg_t pc =3D uc->uc_mcontext.__gregs[REG_PC];
+
+    /* Detect store by reading the instruction at the program
+       counter. Note: we currently only generate 32-bit
+       instructions so we thus only detect 32-bit stores */
+    uint32_t insn =3D *(uint32_t *)pc;
+    int is_write =3D 0;
+    switch (((insn >> 0) & 0b11)) {
+    case 3:
+        switch (((insn >> 2) & 0b11111)) {
+        case 8:
+            switch (((insn >> 12) & 0b111)) {
+            case 0: /* sb */
+            case 1: /* sh */
+            case 2: /* sw */
+            case 3: /* sd */
+            case 4: /* sq */
+                is_write =3D 1;
+                break;
+            default:
+                break;
+            }
+            break;
+        case 9:
+            switch (((insn >> 12) & 0b111)) {
+            case 2: /* fsw */
+            case 3: /* fsd */
+            case 4: /* fsq */
+                is_write =3D 1;
+                break;
+            default:
+                break;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
+}
+
 #else
=20
 #error host CPU specific signal handler needed
--=20
2.19.1


