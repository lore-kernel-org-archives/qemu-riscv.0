Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghNn7-0006Qg-Nh
	for mharc-qemu-riscv@gnu.org; Wed, 09 Jan 2019 19:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=906996e92=Alistair.Francis@wdc.com>)
	id 1ghNn5-0006Pu-Qj
	for qemu-riscv@nongnu.org; Wed, 09 Jan 2019 19:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=906996e92=Alistair.Francis@wdc.com>)
	id 1ghNn5-0000wZ-5d
	for qemu-riscv@nongnu.org; Wed, 09 Jan 2019 19:01:43 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53371)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=906996e92=Alistair.Francis@wdc.com>)
	id 1ghNn3-0000ql-1L; Wed, 09 Jan 2019 19:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547078501; x=1578614501;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=GuuFotW4xZQr7y2UV/Hvk0heJMDMx7FLRia8Xlyk71Q=;
	b=p8IwPoFujeND/+rUuxVRJhLnmYFMeEg+PoenNjwOfToEzZLVhVx/vl+k
	TXbIIregsQ8V3IJV79GFC8J/xNuyLJRSoUAaREel5S+Ezxb/M4+EDulHl
	LyXqXywhSCO/IVnTwP8G+BP2eWMkgsaI7nvOmlqmqImT1MVz4CKKiG90W
	UWQkFXWiEHIKzOqmy9VuluePFzcGMo9JbyEYImd2k80t+igbR21M4Ruqu
	ygrR5meanSZTfexxeg/qm51V++hVPEjmoyUtyjO9MQRkxuQlQEALJUBaZ
	0rvrXVi0ydgpOiDlhht9ED4+slRnlRrVyfAclvn8MRlrtCd8cYjhxMC8f A==;
X-IronPort-AV: E=Sophos;i="5.56,459,1539619200"; d="scan'208";a="100171206"
Received: from mail-by2nam01lp2057.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.57])
	by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2019 08:01:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GuuFotW4xZQr7y2UV/Hvk0heJMDMx7FLRia8Xlyk71Q=;
	b=ZSHFwzup3Cu7H/LY9JD/e1wRELbIrYRkJBZWpPdo1mEW0oGi0KxyHLGz2VvvqLCRkWC8de7ebknj1apoBwk7OEli3dnY9eSUYrevzfblWsVTlE1tePzlzCPx0IzFbmK710qLZXiihLU1OEqRSPLKJ4mKReQuC3A1oleO9bEK57M=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0369.namprd04.prod.outlook.com (10.173.48.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.6; Thu, 10 Jan 2019 00:01:35 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.010;
	Thu, 10 Jan 2019 00:01:35 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 1/1] default-configs: Enable USB support for RISC-V
	machines
Thread-Index: AQHUqHem4KunkMZyp0G1wRCrn8gEAg==
Date: Thu, 10 Jan 2019 00:01:34 +0000
Message-ID: <c162ffeb1bb1cbcdeb47ea62a829294168a0ebdf.1547078463.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0077.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::18) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0369;
	6:9Oj+djpfXUcmSo1CF6/QiBw1Tp74OBE+SpVw9Qzro+KFeZd8ggfZ5AUM9kBYxr4Ir1szo35V1twojjrmgjaULlfBrT5+DHtUYgTjgU/cKZmR1yCSSOfPJvklf9SAE7T3310okUUFz2R/4N73yOr9dj9j+xYIFYuw1xMnJKqSNHioSthZ55MEBhcVpm+Ys7YmPDK+kV51kKMr3T2stCf/3iFGkd6Zxen0RAc498ejhh67lBit4DL57ivo0wZdUz6IW/WOAfUt3Hd9l5Ewle294TT7e1+3B0mnHKYRzDKd1XMkkbeCHP1h3y3aYl93PuscoVYrTvO4R6X1xbY118dWsEJ8SKnlp3OcOMlqJosGIwQV1B4bpKJUMmCHKiVSadqWzBYkMyYBSB5Q78IUP/dWhDqcGodxi0FftfTV2JFp4zk7ckdugzSJPbyOc+CrBZ6qU2ic34zj7IdnO0lCMXJbAQ==;
	5:IHeA+5wwFVXnsVsoqW1XcDWbhGMk8lqBhRGP5NKzhKOa7mKCtTHa5W0TGEC8gG41IfE3MqMD8WzCTuqzQ8VoZklcx8B80iwMu/84LDrAfQytGPaSGhI377A9zEzKLmVyvOaY8It8k8iOcuDtCJy0lFG3rUTynHo3Gi9lh4hMWFWrfwe9dV1cacIwJhiL+9owBNWlNAxpRGIfhEXBQMKkkQ==;
	7:Cl2ApcHE8M1Aib81PW1Ps+kUG3Z8u462/WGJQfKgixiuAZvkI8DWRSNQ+dW23knFmnXYpLoKSb1vWCflDis8db6GiHDblRBsQ+IPX84y3oyGs0Q21LoH9rN3w845K6iigHT6i+gARCP7I33Y8yERyg==
x-ms-office365-filtering-correlation-id: c74f076b-cba3-43d9-b683-08d6768ec8c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0369; 
x-ms-traffictypediagnostic: MWHPR04MB0369:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0369BB2EB2EE5CA4DE07E89290840@MWHPR04MB0369.namprd04.prod.outlook.com>
x-forefront-prvs: 0913EA1D60
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(486006)(36756003)(5660300001)(72206003)(476003)(186003)(4326008)(66066001)(2616005)(71190400001)(71200400001)(52116002)(68736007)(54906003)(105586002)(39060400002)(106356001)(110136005)(6512007)(2906002)(99286004)(6506007)(316002)(25786009)(386003)(102836004)(26005)(53936002)(256004)(86362001)(2501003)(50226002)(14454004)(6436002)(44832011)(6486002)(7736002)(6116002)(3846002)(8936002)(305945005)(97736004)(118296001)(81156014)(81166006)(478600001)(8676002)(4744005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0369;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MjDhiK4J4ye06pGdPu+62Ga9STLSRVrWhNmeiD7psjLR2DAiwfgSKTftDVse/BJ8ilAFkoRS2qCDRllUX8XKrsyjEubjIo9kxOCQ4Kv9kbRh0Z5XPPani2JOESSofeda0sGC/4KFPAndJblTtpeSpH4zTeZzMppPS5PNR9YbLL1WkZgUxp0jAahDpcdC17J/EV8bFxbeHURWj4ZxACTQChlmjXayMdjYklpXwGi9W63G21k4cLwUzrE82KX4y2ZjyMM8ZCRmmv5YlEUMfm3Ywk5BplT1Jnk2LdktXvkzoeAX91crXTM5msFh16x/1qJc
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74f076b-cba3-43d9-b683-08d6768ec8c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2019 00:01:34.9725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0369
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v1 1/1] default-configs: Enable USB support for
 RISC-V machines
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
X-List-Received-Date: Thu, 10 Jan 2019 00:01:44 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 default-configs/riscv32-softmmu.mak | 1 +
 default-configs/riscv64-softmmu.mak | 1 +
 2 files changed, 2 insertions(+)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-=
softmmu.mak
index dbc9398284..c9c5971409 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -1,6 +1,7 @@
 # Default configuration for riscv-softmmu
=20
 include pci.mak
+include usb.mak
=20
 CONFIG_SERIAL=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-=
softmmu.mak
index dbc9398284..c9c5971409 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -1,6 +1,7 @@
 # Default configuration for riscv-softmmu
=20
 include pci.mak
+include usb.mak
=20
 CONFIG_SERIAL=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
--=20
2.19.1


