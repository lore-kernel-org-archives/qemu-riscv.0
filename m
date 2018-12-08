Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQlr-0008AB-Ir
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:47:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQln-00086B-1b
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQll-0000UF-QV
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:46:58 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:52330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQlf-0000SA-Un; Fri, 07 Dec 2018 19:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230042; x=1575766042;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=1RjzxF97cDsEp37fTbbwJp9udj5jY4kU2rhMjmwVitE=;
	b=Y3fCoTkKCB3w0S+nHulWuga9wrkjc4aEwNtRXESlYV/Ia9Q+o0xPr6f5
	g+kg6wDEYPSiZhV7qRRIqe0o1t3Hy0qbjbU9nsRs9KQ9Q7qlW3HAT1qSD
	1bhkxJRkgrr0tlBAQtfxEyandDcZWQejI7KM05AZN9GRbU++CW6AJLg3k
	tnjlaIejI7fijx3i1oSE9QHpmZ+0FWlZa7tGuXFuc7AzGvNoSqB94Uy+O
	FscqtZ2Yo/wOc6RtSa+aTko1AgEdUTOwkdGJnifhO9pN5iKb2uagF2lK9
	8bC1EElaRUS8vyuUyyxsEdKy61+jpIxaaaxhZRie6wKcAOrFFFWxox0hi A==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="194003372"
Received: from mail-sn1nam04lp2058.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.58])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:47:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=U/Ndbc10nesm/978dwPlqLYKfhJt4oYeYpZyLnLhQFg=;
	b=WWPj2YLr7PskaV+2kfvMiB0IAp4LLwCPh/zPswY57qHZjpc66nz4yZDd/5yJbzMsBpzttLvfY2vNxINepJkJ1zJICUd/+4aU3rMwdHnEsCAD7cOpsyUIWiJQBqGcXmIY59MkGhslAibj7ztIR/EFg9f5smZcb71CXoqYHLwHWb8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3725.namprd04.prod.outlook.com (10.172.169.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Sat, 8 Dec 2018 00:46:48 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:46:48 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 04/24] linux-user: riscv: Fix compile failure on riscv32
	hosts
Thread-Index: AQHUjo+A80rYmJ7j9UGr21E19fkF0Q==
Date: Sat, 8 Dec 2018 00:46:48 +0000
Message-ID: <d6c491ecb5c0224c113ddfb2c06552ec89b68227.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0034.namprd04.prod.outlook.com
	(2603:10b6:a03:40::47) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3725;
	6:gVWeedgCW8xVM9s2wsgk1RIpklD3h5L8G1XrDYS7NZawUDEyrhhUemaGNPF5dJQqLeRNWDEk9Dm2FjfN1K3i9dXEz7VvLAZ5YdXVK38WD+LIS/Tnb+POXXfJzoGDrOVo1fUUu+SKay54EVyVTU+PWYB0zmBmJX/DTaoSaGttxTbXXk2NAb7iVUtVyqkXk3UkRVph1FF3q0br8GCzWyIDsRhV1GagSn0AcqgNkHLiEU00MwsIzPeiC0x3ymGZOmceV4in6BQkFD6RICXylwOvQA0XpILyl6wiw7yJ+ocB+epFPIqDTsN8U9MJ6LyAlIYld24N/ln0NP9OyF8+Bxx6duXDre9dBBvakLxgmCz7d3lJMxKuAYBcihoSPMN/8AvP0/LV5LDzuPIGIL6inOc2EN93lIA7G4jcjVBKnwduz95dE21XUNxF5Jcl+uF3IIMjinGZ46B+dKj4jodrAVS1FQ==;
	5:JXlEHcH9APgtOwWZA/FBzKmoVvkLcsWrvTnXTUfn6AUHjoSQTv1YKqWC91fiitFH8GVR63zYCPezDjDoqQtTwsZr3FANVe5kZjU/YaaG4THfyDRsuMqF8FQngTPlUCVU7k6FxOPqejNNlSPKI+V+E3FdnRsvwkcSTrOSO+4RQU8=;
	7:WPfs9eCSWFg2x95so+rwI6YEINnoOeruTRUxVcfs7smUHGmQ1tLwiQz+uXQEdOux/5zOFRI4CSmm6wlY1d5xyFbGUrum6IEglJQlvMarL8/ZsyVgroMfphMkhU+KtXZrg8MCg2sy6iRHfrai/QxE9Q==
x-ms-office365-filtering-correlation-id: 999ed22f-4b5a-4b40-a31c-08d65ca6a2c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3725; 
x-ms-traffictypediagnostic: MWHPR04MB3725:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB37259D004516E9C86016A92490AB0@MWHPR04MB3725.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3725; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3725; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(476003)(53936002)(71200400001)(8676002)(71190400001)(11346002)(44832011)(446003)(2616005)(106356001)(486006)(4326008)(66066001)(6512007)(39060400002)(5660300001)(86362001)(81156014)(118296001)(81166006)(386003)(2906002)(8936002)(6506007)(14454004)(99286004)(3846002)(52116002)(478600001)(6116002)(25786009)(72206003)(305945005)(97736004)(6436002)(6486002)(76176011)(26005)(7736002)(186003)(36756003)(110136005)(105586002)(2501003)(50226002)(102836004)(54906003)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3725;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 3Tiq/AbrUoLQDgthSd9UVXyggpy2xNPif6BDvJH0negaDeZRWSAu3w4BRmG+iej0kfNX+8scNOtEkrWa8D2H3VU6IelwhAZzRv4hCv3nHnY/31d0CjtJ2eeQ9G7jth0Zco11GNn5UXG0s+lIOP4sOeycM1kht6FJDY/ApRJJXNnOAiAhyjCaTgyx/BxR7xcbVxuO8Pf3nYBE0XT51A8TeGcCOs/MB3EN1rxGwKFUiJWOS7g4nZrNj0LJQ1txgLOJyc33VlS31nJleONLlSsyDWOQpaMzjClgaeA5577rUf9WFwZIvrrcXm4W9kDrjWZ2mdfhvUmRQeLlrhh0y42T5HsKkjussITy42OSg1EGdNQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999ed22f-4b5a-4b40-a31c-08d65ca6a2c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:46:48.6781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3725
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v3 04/24] linux-user: riscv: Fix compile failure
 on riscv32 hosts
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
X-List-Received-Date: Sat, 08 Dec 2018 00:47:03 -0000

When cross compilling for riscv32 hosts using GCC 8.2 this error is seen:
    error: '__NR__llseek' undeclared (first use in this function); did you =
mean '_llseek'?

To avoid the error let's ensure that __NR__llseek is defined.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/target_syscall.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_sy=
scall.h
index ee81d8bc88..af73f71839 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -47,6 +47,11 @@ struct target_pt_regs {
 #endif
 #define UNAME_MINIMUM_RELEASE "4.15.0"
=20
+/* This is sometimes needed to compile riscv32 Linux user mode */
+#if !defined(__NR__llseek) && !defined(__NR_lseek)
+#define __NR__llseek __NR3264_lseek
+#endif
+
 #define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MLOCKALL_MCL_CURRENT 1
 #define TARGET_MLOCKALL_MCL_FUTURE  2
--=20
2.19.1


