Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAQ1-0000Xk-KB
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:43:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPw-0000Uk-50
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPv-0001c1-Do
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:36 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPq-0001XS-BO; Wed, 12 Dec 2018 14:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643810; x=1576179810;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=2S7rrauxjQHW78NG9LVvSqZTCkNXnKASIbbFBeT4g4o=;
	b=VDg5Gkn/Ru2Bml3A2yensm6j8vWwYVP41+Sh0Y+JFBl1KGEddYQ1DFk6
	GdIetlYx2HVvSwTRUhOqWOFI2LHszzlt2+IMc7fe002shDGduIMTnYLgr
	uroWO/zKsR8hMKBThtkSJs8L2wBvWkw12yPmUGY8OW6e4snKTu+vTyRkH
	lFCcDVeXE6gFivbBT+GelfgwXQ6H0HoFfz24qDTsQtxUwBH5e9MfTqiNE
	qj2OAP/gaIdaIOUVSPyv51ygIHQmcojwW5fe2ZFQbYwJUtuSkfB+Btr2f
	PKZfIPlSRF8hE83KbizUYg7aTlU9HK07/uANB7x5U2wEU2p5ov537ZJLt w==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="96440816"
Received: from mail-by2nam05lp2052.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.52])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:43:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2S7rrauxjQHW78NG9LVvSqZTCkNXnKASIbbFBeT4g4o=;
	b=mIJhPIkQYqzQc4325Cgka6KVWUmzH696PHyBPM6M6n2RNMPy5hZIZ4a0npQgkGryha5+YjTwYCUTs9kLV2SOVcMqIx4vncMQWMBDAxdzNKpar3bIdbSYXQq+mTmtVphN56/CAqdwCESdG3BvPq2/inA1Dti8o8eeIRlLQkAJIrk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0784.namprd04.prod.outlook.com (10.172.168.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 12 Dec 2018 19:43:27 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:43:27 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 04/23] exec: Add RISC-V GCC poison macro
Thread-Index: AQHUklLznaOqGmaqT0+Hist8Bpz9Bw==
Date: Wed, 12 Dec 2018 19:43:27 +0000
Message-ID: <35decc9202e72f185897252900341f0b2807ba88.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0007.namprd04.prod.outlook.com
	(2603:10b6:a03:40::20) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0784;
	6:jlwxQQyrrFENcwyQ7GgVxPxYgGQKBpRvXkuhRst0BilNlSmtrxRYVUQ34z/VwiMvQXvryuBkE/yhp5pZinBCZT334wautGUIETGHYcQ4p8CkDw+A/W9+JVY6eeWoY/TiER0j5yksq8OvqyHGFFz9uavUD5/JbASHiSKH1ormSX3/WIA6QFTq77u2By6KegcXNxbuxgCJRV0A9OV8tVUZQcxyo7DnwbzG4IYkLbP1Plr9MMQ4AJW+ytYqcqX0Bc5yJQPf2HIsaAGqWhJwi7nkWJ6a4yxGXnx2gSYXo3i2F5+0T2I07LqA309KFdaC6jxPbeM9Ramt7UPLoLhkGlREwUM3gKPMiJoRCB0CzHBiFWQV0ybJZUxZ5A9HC1kpdPpcYDYqt/wsiMomh1oFR2yuIvytizKKW/Vt56bY0nbAuS/SOuCMX11gmmXp178gRZj7v334BYtnHE6uPHWaOfGNqw==;
	5:3yxEvaCvxf7aVh1hSt5ZYouGSDKu2rXns1P/Rwd17HGddpDPfdidZn5gooGTRhoBt5mkbBKXAuWnlcFU9yZ9fO0EvLOR5OtVQAXrOX6OLB5U7onB8E77v0mAmxCP5bYrvHwcFjlt4zDBHWNplq8SyOnOJDf4JUXUsDoEsqaB1kc=;
	7:GnRbElzwfC7W24GMuypi+30Q+wWL7tJbqb7HJj4BmOSrZLzzfYCDJ/ZvEvCBWf0fcQUnpHQ0RRthOdTMsjXv/NvzKx3AwgT2bPgOAgOZNYE5ILFfhfvrxu8Wqo7fRqNhquqTce6z4zMFGkRSd3cc2A==
x-ms-office365-filtering-correlation-id: f11b86e1-e91f-4509-4c2a-08d6606a1623
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0784; 
x-ms-traffictypediagnostic: MWHPR04MB0784:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0784DC9A47C6A8098AC9116E90A70@MWHPR04MB0784.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0784; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0784; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(7736002)(2906002)(36756003)(5660300001)(81156014)(8676002)(81166006)(106356001)(8936002)(99286004)(305945005)(256004)(71190400001)(68736007)(105586002)(97736004)(71200400001)(86362001)(50226002)(118296001)(2501003)(6486002)(52116002)(44832011)(25786009)(6436002)(53936002)(486006)(386003)(4326008)(6506007)(6116002)(476003)(54906003)(76176011)(39060400002)(11346002)(3846002)(102836004)(2616005)(110136005)(26005)(478600001)(14454004)(446003)(6512007)(66066001)(316002)(186003)(72206003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0784;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: u8HT9pqzzuaDLxk0YqnsNXFvQid9XNvAGHWXhgWKTHa2iG7ghgBSY6Gn8dS842OS2r/Etx/H0Tc8nbpTPM1qVU8a0L2xcIpKnb2tMEVee0m9uIsEg/Z9rPbAkTYhFHNSjvI0L0GZZ5SkPzdJ63As6P9Ab8M1R9/YXWjI2rzY7UnwD4R0BGLij9owvyiaegOn5A7gpvLSb8zN1M074HBaRl2glO9uBbmxCjmbqkkzmDfskXZrssxszikDSO8MAp7UwlRjfQnUGDZ2Inesdqzf6Ox7kiKRP6T7paAyg25Ermg/clS1dLvMQewXVBgaLczj
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11b86e1-e91f-4509-4c2a-08d6606a1623
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:43:27.7153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0784
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 04/23] exec: Add RISC-V GCC poison macro
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
X-List-Received-Date: Wed, 12 Dec 2018 19:43:40 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/poison.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 32d53789f8..ecdc83c147 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -79,6 +79,7 @@
 #pragma GCC poison CONFIG_MOXIE_DIS
 #pragma GCC poison CONFIG_NIOS2_DIS
 #pragma GCC poison CONFIG_PPC_DIS
+#pragma GCC poison CONFIG_RISCV_DIS
 #pragma GCC poison CONFIG_S390_DIS
 #pragma GCC poison CONFIG_SH4_DIS
 #pragma GCC poison CONFIG_SPARC_DIS
--=20
2.19.1


