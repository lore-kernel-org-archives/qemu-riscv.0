Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkZW-00033w-Cm
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:07:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZU-00032F-LC
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZU-0003dj-0y
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:04 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:54720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZN-0003aW-9E; Tue, 27 Nov 2018 16:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352906; x=1574888906;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=9FjaewiIWv3DlY/L+0Jr3j1n+bRh59qBen4rVUzH5uU=;
	b=fukD0hoC8hrKh6Md2IOYEGITlLmvRGKVCHlW2+whwYXbrvdrMtY+VY9B
	WJ6648AJgiLluhz2Uyj1nf46Jq43vgHp+BBv5e5USWminuZvjJLQ6gfVb
	sFvz+R4KwYRnO6CI3msZ6v6gNk3WAJj12GA7E6htrcwBNJKOclp6PWKkV
	bbhDIDJUs/T9pyA754aRRnUwpJB7nWhVY7IeRf+F1Q/A40RjmOIRKRc56
	Mt7IKOMPxYwTsAvTFYIUs3hdacXQnbkcss93v0+WZsxqEyHw7ZyFEpSSX
	hea6PcR76n9GxkIKggwY9IWLl4nKhKRN7AOioDcQVEj2bj1KqC4pKa5xb Q==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="193052734"
Received: from mail-by2nam05lp0242.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.242])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:08:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9FjaewiIWv3DlY/L+0Jr3j1n+bRh59qBen4rVUzH5uU=;
	b=OhSnm5vOUiMJlgwyAF7wrBxlcllCx/nwMAY1w1nbqYTw4NMF48N95rvJTsDqEMstwuatwR/5lFc+mP3BmyvGVueSODo0GtMcHtbex7KQWdK0HYr8rEc8nQ5CNIhmd6t9gd4mz5TRjNeOxwB5RVNZYj5DsgTkAe8s+DWxDxf83Jc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:06:54 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:06:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 02/24] linux-user: Add host dependency for RISC-V 32-bit
Thread-Index: AQHUhpUfSQy+cgquQU61b2U0puOaXQ==
Date: Tue, 27 Nov 2018 21:06:54 +0000
Message-ID: <d202451a8fb994dd89a87b3b87a986579bbe6979.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0096.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::37) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:SXNGrI8i3JzWwL9UAXYXU4QuuIjzx+DqoZLcFwHlR77T/Q3dCDXaO9BxLx5N6XxDpQcx3NNmoQ23u7QyA7yARA9EUq29XVPajS28lFnAarSFTfpih5/MA01UQaYODuOIHDY1/W6rgbvXxRsHRkcfgieGWB2y9jihta2K1PLkOaUQrBg0namy2KsJw6TCyHoiGhdmIjBItYFWixhU0vKkEd2ql+dm5Zd9YKUBXKrNUvQelaW8KVp0aPRc61iODKRzQoAmchMCeWIas65yojbfbCMRPKwQmUSo629FggsWYnDfjhFz/zwWLpzMRDJHHnf6tYrIc582trd3MpSQdL8C+M6SSEVWTWnhfxb4vRrK5HVtBQF89Aq811WCE7IRydYWkMVLqrjmEbDCRje6ldmd7967VyG3tHZIrzOW0p/wxUGJiiGvjfilNgwSb/+zfcWkE3qdjTkUW9nalWpA9oI4aQ==;
	5:38srLB1VH+4eULIAMwWltzvzIJISU04i7gYAij5ZlkE/uZNJ5+uqCPhoHC9bwM1aIlLDlRMcni3bfhZFFCZqZ2KG0E3qOgsVSqMedwj920D2XsI6mRSTKMwhueS9T6IRNEzepNQ5WoQMumH2Ot6jNZ5tMmMPagh2nomBVB1MH2E=;
	7:PrObd/pWvJ8PR5vlD9ijKc7ql0Jn5YLB1YJevCF5hpqDXYGQXkKA/sStb1N+3Su5q34E6HED4i2cOd+5b9eUyY+jLpURZmHhaOJ306thzS9LEyyGHzx7rq62xd0bxQhHPVMWAcj4CTNl/eA6/4zUug==
x-ms-office365-filtering-correlation-id: 7cfda542-2731-45b9-aeb3-08d654ac4206
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09439E3A1F1FBD2F6F9A813490D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(7736002)(305945005)(118296001)(36756003)(3846002)(86362001)(6116002)(54906003)(11346002)(68736007)(99286004)(76176011)(52116002)(2616005)(446003)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: VsWhOsTxpEmlsrXByqcDEWy9HyEeaZY1sdV66UMWGC6wpy5tYF953+IgOaJm/KkPDgpMtCYHlj5ah5C3rWGp+yYSza8COge3tDgQTUTspTquDn/9nI62YYKxfMdCps/zrBRaYj9NCSDlxbfU+Aof4JnrI/Ed8CNqc4HA48cO2rMufK8V39kqvWo5OxU5EKd7M2RsLxIHtP2ZpcMpr+m5IHF3o8TMjMTVfukZTcoRTeo77HSPEfbZdxo0ND8xe0C+vjQe0OGvyh9we5pRkcYjTUUCtGMI01C8AZZVg94UtOZFZECbw6ouhwW9AeQyGvssvPLSMAkHVdwGzcp+4Nmj8W6OxQFhK4zInD9VKFCMgZc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfda542-2731-45b9-aeb3-08d654ac4206
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:06:54.1627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v2 02/24] linux-user: Add host dependency for
 RISC-V 32-bit
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
X-List-Received-Date: Tue, 27 Nov 2018 21:07:05 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv32/hostdep.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 linux-user/host/riscv32/hostdep.h

diff --git a/linux-user/host/riscv32/hostdep.h b/linux-user/host/riscv32/ho=
stdep.h
new file mode 100644
index 0000000000..adf9edbf2d
--- /dev/null
+++ b/linux-user/host/riscv32/hostdep.h
@@ -0,0 +1,11 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV32_HOSTDEP_H
+#define RISCV32_HOSTDEP_H
+
+#endif
--=20
2.19.1


