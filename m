Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6lyT-0000yB-8y
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 20:54:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lyQ-0000d0-OC
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqq-0004sN-GE
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 20:46:33 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:27998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97641c120=Alistair.Francis@wdc.com>)
	id 1h6lqo-0004di-V1; Wed, 20 Mar 2019 20:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553129191; x=1584665191;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=DBQAgadpbnj7BnVWfsQO+BQ1ypLp8McTCWspi4g7wjc=;
	b=Nzxnpi+2z9CujKKA/Ger3TneohiFJaApQpNt2CB4BjKFQv4xZruMSU4O
	huiduFPn/jBbi1dChVZuxcEPdAxhPQHST20UvoU4AQaE+uCY2Nrnf4/jL
	HkPp5haueTE/t/5VdzfraUBnICsTekgFuQ45hzzLaXsgny6TKHDnGizHT
	2qsjN9gix0cUG22/bcqH9QuW1d5rVkT3u0OBrjmVu/AD3W1P42s6DEi4l
	Q5CD2EACgVk+v2sAHY5NY5rYgz4je0+e1yBe92VA/QqNhjxabd+13U3Hx
	zEcq4A6eBjGfs55XUUpIvjJsoNYAaBXmKS3y4KgaZvJvqya7QC+tt5QeX w==;
X-IronPort-AV: E=Sophos;i="5.60,250,1549900800"; d="scan'208";a="103877761"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
	by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 08:46:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DBQAgadpbnj7BnVWfsQO+BQ1ypLp8McTCWspi4g7wjc=;
	b=AawaJpmKvLeZbDyPhL+EZoC6MXaw/qt1ynv9T1hjuVPDpl4F33z4ed8Xf6ZOqrF68E+PQ+a8Ao7VNlqrwgy/TfV2ZS43yZ6i0Zst3zU68oR8lAQwRJy98PLuWzQ67nUFyFhqZKeMq2YD8Wi3UJlZ9Nr5EtubGZ4xN4LxDBxWpoE=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4741.namprd04.prod.outlook.com (52.135.240.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.16; Thu, 21 Mar 2019 00:46:27 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1730.013;
	Thu, 21 Mar 2019 00:46:27 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.0 v1 3/5] riscv: sifive_e: Fix PLIC priority base
	offset
Thread-Index: AQHU33+EVWX+bZ3NU02KaOug8iu8nQ==
Date: Thu, 21 Mar 2019 00:46:27 +0000
Message-ID: <dfb27380e9c06f6e0ac59197934232993d7590d0.1553129005.git.alistair.francis@wdc.com>
References: <cover.1553129005.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1553129005.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0058.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::35) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d050f1b1-3420-4503-4a12-08d6ad96a655
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4741; 
x-ms-traffictypediagnostic: BYAPR04MB4741:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB47419BF597C900FDBE5E750390420@BYAPR04MB4741.namprd04.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(71190400001)(8676002)(446003)(102836004)(97736004)(186003)(52116002)(118296001)(81166006)(6436002)(3846002)(86362001)(2616005)(81156014)(478600001)(6512007)(68736007)(476003)(11346002)(2906002)(66066001)(4326008)(6116002)(99286004)(14444005)(106356001)(26005)(50226002)(110136005)(53936002)(71200400001)(7736002)(44832011)(6506007)(54906003)(4744005)(72206003)(105586002)(76176011)(2501003)(386003)(14454004)(8936002)(25786009)(5660300002)(305945005)(36756003)(6486002)(486006)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4741;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gsq1e3EVF6WLtj9V08WMNWQpTmX3TwC73Vi69jM8duXZdhzPDotg6Y4+5qf2rjHR2emRV3HZ4jQ05NOHny7pBGvUQeKI/C+SHdHRDYzFup4nRxGbDpW40Gr+2SL1VOV18P0Yney+DIpWBZNn7zu35uWZVzAIJ1qs4XzkRK/8q6E77lzJO4it7k0j8WCsZX8G0KVr3Qg5tz6bWXQ8OqERlXfiPMjquQ1IbmpovntKMT1N1uYx1VqYdKEzNop0PgQRYe0IlFfYDP3MxqALM5QIX/L1bwOszsDdkmu2ZfHrQSRe2Rsu6xoqVNhgvXBFCBjxfSACGUsNvpARWOQs8p2u5nCSBL5nwsOYg2VKRI2Eq0ZtKv7JWNx3o+DEfcimAgYEBlCaCGKKGIGYyT+VTvXgLRRKGPixE2PXQSlzNOQPMX4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d050f1b1-3420-4503-4a12-08d6ad96a655
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 00:46:27.0293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4741
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH for 4.0 v1 3/5] riscv: sifive_e: Fix PLIC
 priority base offset
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
X-List-Received-Date: Thu, 21 Mar 2019 00:54:23 -0000

According to the FE31 manual the PLIC source priority address starts at
an offset of 0x04 and not 0x00.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_e.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 7b6d8aed96..f715f8606f 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -70,7 +70,7 @@ enum {
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
 #define SIFIVE_E_PLIC_NUM_SOURCES 127
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_E_PLIC_PRIORITY_BASE 0x0
+#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
--=20
2.21.0


