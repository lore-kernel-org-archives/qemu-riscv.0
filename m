Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhLF-0000yO-Es
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:17:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLA-0000vU-58
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhL5-0008G6-2w
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:08 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKx-0008D6-8v; Wed, 19 Dec 2018 14:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247015; x=1576783015;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=2S7rrauxjQHW78NG9LVvSqZTCkNXnKASIbbFBeT4g4o=;
	b=NFK9m+GJHMiTKVx1VsiFSlEl/ymCKE4Q20oPyq0JXgfmsWUwGCpPhTdj
	dvDqaQy4iyZyWgLTJahMC/S4pH44+Maewlifhcal14jWe2Z+sG+jjMZXF
	2q5LA/eoUX25iOf7SsXfC3Th9jx8B7LrN466mWTaCXZhc2bbyQsImQM1K
	Nt6YoSqIdxz+JgHX+KRBZGKlVx6VPyMwq3pea8PI6nP5osUxTd0+AxhQ0
	yLe9DM9fNIBisOx9CbLBlz8I8Kwk+OWBmZQPyY/gxHEiFFDao5WMxucMK
	SRXPGy1K/QwQfSKoUsxbnOE/r999xzQCFfxflDWRAjU9oS57azuymSwak g==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="98234158"
Received: from mail-dm3nam03lp2056.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.56])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:16:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2S7rrauxjQHW78NG9LVvSqZTCkNXnKASIbbFBeT4g4o=;
	b=C6wR0TUu31ztscmU8SgOdePXwlX7XtJagfx8kOzlC0FY5OH58BZG3avjlX7unW+tKQrpVfDXDg+Thb5iTbZLyg+CtTHgwDmonteaX4m9cpGwYobEulbzn63+peRVzegU5/uC7ySPsGXc95QdVq68Gy59nQseSRJYWh+9IlFw/NM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0271.namprd04.prod.outlook.com (10.169.202.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 19 Dec 2018 19:16:52 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:16:52 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 04/23] exec: Add RISC-V GCC poison macro
Thread-Index: AQHUl89li/gdJnBMB0WW8FL0tNYH1A==
Date: Wed, 19 Dec 2018 19:16:52 +0000
Message-ID: <00d02e34f10b87fd61f8dc69ac93d1eb63df949c.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0036.namprd04.prod.outlook.com
	(2603:10b6:a03:40::49) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0271;
	6:y28uSlunvA8IqZuKsELLD83gntRq1UkFhTiapu+Kf03iNoz9DmmzAzoSyepC00yAvqKAuIiW7pwULZiNgqk8yFUg1YrvaTt+IwhcE+Gm+J/DLeqbrCFIOLuMDNaBpJKL4yVIjngl1rjbRaGtPyaqkm9FUfxV5ECMoTor6khW/a6nBsY35gJhH38aygDs7aJRJywRlSY/9d23Wnvgbp7VA2PoOdetRzALFdbNohl8eY+eDuYITYA8P9aDapta/U/3b3Q4w5mcZZT5UGr285M52CWncFG2zHNx5vPZG0e5bvuvxNR1UJEjlxXFpcw5u9ka53ARtpbVcL9f6+D1xj/02mNH6X7ctFEWVy2Rr9XfsPD2fRUqPS0n5B8uvsQt49RD4suARAngG/P8n6Z6SJbXuSPnJDVJ93cPr65Ryn+dalvNh9FpETVn5togetT5yDJaF78B51c9/dzi1zIr+rHveQ==;
	5:2wpDBlFMbW4dcNKM1aBU3IivnPI3sTQ5K9x3Sc5oKzJTttJiVhHvt9Nb4ZMD9uxsKbqrMEYUz29DdF2tBXjDuexYFwv6QCR3eKWECbXN55DK+gvFEAYtEtBL6Av03GNAKMDaluy15bjJSODUW3U19xhLButhD6BbLsvvgnTjPUw=;
	7:9SKVKOBC1egPPrT25rASxN3fO4+uFsra/MS/04neRszxkGetFnBqW7BPSHlv6uYqVaywL0GFJiqHTaVc4GhH1NqsFIrff74kxPKHt4EPRAGCmSAF3exV60QxejMd0m55bYujvyheDabNZOPqkSQkxQ==
x-ms-office365-filtering-correlation-id: a166fc7a-1ee3-42bc-b005-08d665e687fa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0271; 
x-ms-traffictypediagnostic: MWHPR04MB0271:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0271862DAAF17E8EBDCA117F90BE0@MWHPR04MB0271.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0271; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0271; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(186003)(36756003)(54906003)(3846002)(99286004)(110136005)(25786009)(6116002)(14454004)(97736004)(102836004)(256004)(71190400001)(7736002)(71200400001)(5660300001)(305945005)(6506007)(386003)(86362001)(105586002)(478600001)(52116002)(316002)(6512007)(8676002)(81166006)(81156014)(118296001)(66066001)(50226002)(53936002)(486006)(44832011)(39060400002)(2616005)(76176011)(446003)(72206003)(106356001)(8936002)(476003)(11346002)(6486002)(68736007)(2501003)(6436002)(4326008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0271;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: ysmKhX7gP8A90MAqrR2Hh1AkviUIRtRO7T+WHrerX0fht4WIAhnSVbAwaaXoYGEyDk9B1vCjOiFmBTSxQC4N9olVxSaQEOb9WzjqwzfWTPsXLWBjCL0ya0I8qbNE5H1fMnga6a8P0vXuTQ6oiHDRM+s3TCf0ZIxGThRVQGvy3hcj743d79uxJmlpPCQ7LiT+cfgCdyTWm3mu+W8skgIuBbuvGLqrhZP89lbyJI5FodgdjDzpdqFjR3ORYpVNpKQoMZ7Yp5wKtAPclByP0O5wANixKwplcgfsjxqB/K613BILgLZsfpAyC3wgtiqkDido
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a166fc7a-1ee3-42bc-b005-08d665e687fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:16:52.1043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0271
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v2 04/23] exec: Add RISC-V GCC poison macro
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
X-List-Received-Date: Wed, 19 Dec 2018 19:17:12 -0000

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


