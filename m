Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkZf-00039C-7H
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:07:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZd-00037r-Ld
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZd-0003gJ-1K
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:13 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:12604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZY-0003eP-Dh; Tue, 27 Nov 2018 16:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352829; x=1574888829;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=muuHqix0+OSrOzgGMh6gAE6a9JiMOf60o3iU9lL6gks=;
	b=l2bsJ5PpCQgTD/8j8/nIC570gwxb09q9TTycLkkCO6rdRvvBYYnwvDSW
	PMDC07Pn72hpaUvz12rshw8oxDbDf0M90Tab3BK0Jpy67oOA0f5iM/siC
	V3G4/JseqS+l2j2bqiElne07KOOECY88ETSY5MKBBCV//Z9mPmdlX2s3I
	9f8DfWRIKXcdrCvmaTH+KnP65aBrlz2wizxpnPmR0Ci2gxbLsK3pb72JI
	OcEyjpUlxICith8pEr/kTsMziZlERvOKtFMvPP5AMHHCuknwUL4DScgIh
	BvXJdbxCHXtA3AqY85T/qTgwKxxtTsyfPgEwWs0fulGrPMQQZmMqUksnq A==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="95244762"
Received: from mail-by2nam05lp0247.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.247])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:07:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=muuHqix0+OSrOzgGMh6gAE6a9JiMOf60o3iU9lL6gks=;
	b=jY5LYhFMby6ERe0SvpasKoT2KfdCTfi6OYeQOxCjCbRMrRXOswcNNf1MVlQRKr1w0PC9nFdekixPNwqJnsqcBIfM9P1cBMJbGP2dLXNhFbO7N6iJ3u6GDKYQ+GXe3uI+8N/aGiLcUbR9vRJG/f0XyQCbloNOup63pEF4va9f2P8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0993.namprd04.prod.outlook.com (10.174.250.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.14; Tue, 27 Nov 2018 21:07:03 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:07:03 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 03/24] linux-user: Add host dependency for RISC-V 64-bit
Thread-Index: AQHUhpUlDLgbiRBgtkS9xTuANjCimA==
Date: Tue, 27 Nov 2018 21:07:03 +0000
Message-ID: <ee42111e15391fa5d3a9b0893dd3d7a66188500a.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0103.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::44) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0993;
	6:RYLSZ8bz/Kq3EOs3YefCpzTuHvyJW+McTAWykxGS5JnfNhbU9ZVcNfkKHj57C8P2ST5wDtxJoqhmTcORVYYqOtxdZdtDvKPaXlK4nH0TOlJpHqyPZD46rjwzlgVE2yyqsAyEgRYVKbaHz+ZZXGpKzFhOjny4NnxSDvl9Tie5vUGsCEOzf8Z5j5asYEtCKLtSC4S+tFQ7G2w/pwWfuo5oHhZ5pRXdgrrm212/PF6F5hX/u+YquyyWUVNfdKoAVE9V+46mJmjNsHFzjLiYQtkp+79cka5HBRtMK7j+r+2jW7RnYg1Dpg8//ZwYu/7IlT+vmwQL2+dFK/Huxmkyf3iX+A3soaAN5wmwG6rcHBmr+8S/30zV6hjJ99TuvOA5cBly78eVlRUOW7wU/T9QqGVf9GXpF0cE1q3CF24Ey1FQp5aZqkCn5MbD26u6Ci++zJZx06obnQxhImGk518qx8btIg==;
	5:1kjX7OnRntc9USYX/1eE43usNNTy2ARZBDi8/eVLLRwzRFklIkJSFgw8A4o0FnJyMFqm5aaH/rEUybw7Qh2a+8Kyms0dI0vimR/cLEkHS1ujkwtqIxVxuxI0Dy8GAjtRK8T+T6PjNSSiZCuZ/suBQv/a970JMXtBA7Yi9i9NpZE=;
	7:65BuTfD1lbqSoAUgr1AoStzmSnhPZlZCWdD56+u5jYfFWQb4+QzS3WNod0buF6MR6fm7Aw51IZF6Q4mSYiYt7IHbJlBNy9+rKG6qksTBfiFuC5efVoLcDP0xjtyW1VAHnm3FEBtojedU931h9xSgvQ==
x-ms-office365-filtering-correlation-id: 4b4700f9-4b02-4430-0093-08d654ac4764
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0993; 
x-ms-traffictypediagnostic: MWHPR04MB0993:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09931243A6226309AC65AAF490D00@MWHPR04MB0993.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0993; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0993; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(7736002)(97736004)(305945005)(54906003)(316002)(110136005)(8676002)(50226002)(3846002)(6116002)(81166006)(81156014)(8936002)(6512007)(478600001)(39060400002)(6436002)(72206003)(6486002)(53936002)(105586002)(25786009)(118296001)(106356001)(2501003)(5660300001)(66066001)(4326008)(76176011)(68736007)(486006)(6506007)(476003)(99286004)(386003)(44832011)(26005)(11346002)(446003)(2616005)(14454004)(2906002)(86362001)(186003)(256004)(52116002)(71200400001)(36756003)(71190400001)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0993;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: MouL85c/gnCuAV/xXyzaR65UgHaHsJlFwL2WWCG1yh8FdPIxTCYE0QURdDqxJoRT5G7jg40QxeLWbQBN2eekiapLK/zn28gev0kpJBaiF8AyZlklEJMsjkUFxaK06OZyg2VHZA6vWyppH9QMcq3H6aJXf1nkSGsE7/TPMXVoRidv699tBvsFxnee9PTp52FUD9gkNINMybCR5h0DWbpFJ07fBQ1/Fl6U6W3mSsHumr+PmhcQo+jL94R1c7FKrMCWEh41EtSewu6+Gzf0oxHoalwqqTfNdktH7aHG8bTtv5Y5LoS22WyasXWVJjPIeC5FU3tqRLJ9HGmkhiOnxZNjzXfUoNnNQrODDNAIR58qOfk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4700f9-4b02-4430-0093-08d654ac4764
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:07:03.1785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0993
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [RFC v2 03/24] linux-user: Add host dependency for
 RISC-V 64-bit
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
X-List-Received-Date: Tue, 27 Nov 2018 21:07:14 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv64/hostdep.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 linux-user/host/riscv64/hostdep.h

diff --git a/linux-user/host/riscv64/hostdep.h b/linux-user/host/riscv64/ho=
stdep.h
new file mode 100644
index 0000000000..28467ba00b
--- /dev/null
+++ b/linux-user/host/riscv64/hostdep.h
@@ -0,0 +1,11 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV64_HOSTDEP_H
+#define RISCV64_HOSTDEP_H
+
+#endif
--=20
2.19.1


