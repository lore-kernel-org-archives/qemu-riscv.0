Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwcU7-0005H1-Pp
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 19:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU5-0005Dq-6m
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU4-0002es-AH
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 19:45:05 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=948ed6046=Alistair.Francis@wdc.com>)
	id 1gwcU0-0002Zm-5o; Wed, 20 Feb 2019 19:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1550709942; x=1582245942;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=OqJSNUbLovD5/OEFY8Jlxgx2laeSTywQRK0A9Bjgzis=;
	b=VRdRc2pztPDDQl9mJ6XoGbTcFGErECyj766xji9e+t/nBUvVSrlNG+k8
	Bt+XPuapQ+062fIskc37he44pwAW8OW76iJjfBZMKRj4Cihkh7bUbQkjN
	nEnAnmnYlK9rue7lpupsXEjqt9kf5iqQTdxgDvdhmqIKD7MUZdpVRHdKU
	3SX2TmvQNo6H/UelGyfNfbU7a0e+YKR32EWfJGyfMjcpcb4+TtUWLiopD
	sznRUfOPZSqFuWLeuHIiHx/dJaE3jVWuGoQd94ultqfluaAEQsO3us6Yt
	nmPn2H0hCpkENAqwRHzvqej2x2ahgndXzRYaeMRXMXMP03/Y40xP0Xleu w==;
X-IronPort-AV: E=Sophos;i="5.58,393,1544457600"; d="scan'208";a="200114446"
Received: from mail-by2nam05lp2050.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.50])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 08:45:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r1KYhbOFIzwO4GbSeJjgPMpjM5e4rX5qeOaTGy9LzWw=;
	b=UdUF+3XzhKGm3IpqHrWU+6fkKde2jlMq9GBY2DnCTMZC/u7CwgGBioaJWwoxjfo1nmrOq84aQm81F6NQmlNEEUZSWp3tPYFnddoQj9LfpZMs+l+QOYLP0Ekr/awViVu/2EeLnk9t1X0jXHXsk5zhoFhiA8Ep9GychKAGi7tJI7E=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0985.namprd04.prod.outlook.com (10.171.246.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.16; Thu, 21 Feb 2019 00:44:37 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%10]) with mapi id 15.20.1643.014;
	Thu, 21 Feb 2019 00:44:37 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v2 09/11] RISC-V: Convert trap debugging to trace events
Thread-Index: AQHUyX6f7GMORncytkeCPdTlDRvGSQ==
Date: Thu, 21 Feb 2019 00:44:37 +0000
Message-ID: <ff6208c5e487ad9f56f2a0d1a862ebc9ebe8fbb3.1550709660.git.alistair.francis@wdc.com>
References: <cover.1550709660.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1550709660.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR07CA0021.namprd07.prod.outlook.com
	(2603:10b6:a02:bc::34) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbf8fd54-10bf-49e9-2a0a-08d69795c178
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0985; 
x-ms-traffictypediagnostic: CY4PR04MB0985:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; CY4PR04MB0985;
	23:WNHo8YS18G5Gc6S2ipzuhClEjnZjBqeoEABjrrz?=
	=?iso-8859-1?Q?cfWtYLwylfRFv3qQrt11bP8UyjyAmOipBTBPExl1z7cV9Xn+WWsUdceS4t?=
	=?iso-8859-1?Q?qqwpl5e7TFn1IkYHlxpNfgqZekZgcVB3/Ii3Hg7e2c7g+nF7Y6B9fDkp0r?=
	=?iso-8859-1?Q?Lohr4lMgHZTNn0lw/BF1DHFtWB4E0KKOwcIeVqURhgGj+Nz9vJKw74T3mV?=
	=?iso-8859-1?Q?RE6gcmkaOW3Ps6o3RsPTPhQBxCiRf9/d5mfypt/w84IxeHNSPqQGtP7Uz4?=
	=?iso-8859-1?Q?JhEdNyRR1zYYB27c7GmA/aMJYlFIShgZFLOHq8xU0dvAH75zAu8WhgoVFT?=
	=?iso-8859-1?Q?uo1yfj3Pmqkdut48aedSAXqOxR7z5LTSEwv8Yo1sZwoicnS3m08Ak1ZLyC?=
	=?iso-8859-1?Q?9y0ljSNNiMfysf0rEAPLg/nTMPM2jUeBhCCk/E8R+IaAkzhNGmypz1kWXQ?=
	=?iso-8859-1?Q?3vMTLP6J33j5ZubxM5uH7e2GrJRWotQSY86S917mp4/7pb8KSVgEO4VW8y?=
	=?iso-8859-1?Q?Rqq4atZnb8+9c4p50EsK4y5YbRFkN2aagO+edgPPemLcwB5yAqfUF2Ap1s?=
	=?iso-8859-1?Q?oAqR/fU1pUUZJ61o6Pp0fGG1wYjvCj3B9iLbsEY9oZ1vTe30CbClBtWll6?=
	=?iso-8859-1?Q?tpNpuqBPAxXkJjHcu5gOPup/rt6EWGHuIeUK4qHDa8Kdqht7AxczIcVJNI?=
	=?iso-8859-1?Q?BoVHL50mC0kgS+l9Z7k6iQMpqMxFGgiZ2sIt+Hiv6Iatlslr6D9OA1WdNB?=
	=?iso-8859-1?Q?yZGGyDn+DaOKkw4iayrKBf2+CIE30MQl03UNoe9Nrf+uyyBmRj0Ct7uRbo?=
	=?iso-8859-1?Q?0A916XHpaIbtMix1+2P4RYRMhuW/UKpsvBSOFRtBiU6kKJsYhNKemxZmiu?=
	=?iso-8859-1?Q?U4t3VQQYTa93WArS4oxNARMKa07Y+KaQCXGxDUFDrU0puXxSB3QIgAtxcq?=
	=?iso-8859-1?Q?mHwV+9VZ1p5DE0Rw4GoiBfkIZN8CvlK/lV/sPqJwvTOJ/+Fo0o6FGPMG+X?=
	=?iso-8859-1?Q?NL7U5HmMUwfYnOQnxomL3WUSI0tbt0STh4kaz3f1g31vyxSW6LgnDTrP6i?=
	=?iso-8859-1?Q?DqnCKpRMLEukW6ajUwswCR8DiVSR9NseFWH9m7YIWgA0pTqYijEdtPHAgh?=
	=?iso-8859-1?Q?nC0+l47WlsGS+HlD8NfLXCwwXuiy4zbuHcNHaLtP0+1/5+4R4SZ8g50uAa?=
	=?iso-8859-1?Q?3VAANIUJkbLRr+b4UEkiJ1O8Wt3ekynk2i29bDM74tKem73+R+ZRwNaYfG?=
	=?iso-8859-1?Q?de6DthhKVzWgz6CsERO7bVDSncjsodQdTbl46bkAgxO029mmgv8y/BJWYq?=
	=?iso-8859-1?Q?bN6nxtGM4qL4FHVgNXD6cki?=
x-microsoft-antispam-prvs: <CY4PR04MB098508F97E1DD5B622EDA8EA907E0@CY4PR04MB0985.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(189003)(199004)(72206003)(2616005)(118296001)(4326008)(25786009)(97736004)(478600001)(110136005)(3846002)(14454004)(6116002)(486006)(86362001)(44832011)(6436002)(316002)(54906003)(71190400001)(71200400001)(7736002)(305945005)(81166006)(81156014)(6486002)(8936002)(50226002)(66066001)(8676002)(2906002)(386003)(256004)(68736007)(476003)(186003)(102836004)(76176011)(106356001)(6506007)(105586002)(2501003)(6512007)(99286004)(11346002)(52116002)(446003)(26005)(53936002)(36756003)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0985;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xPY5Tr/uSld6vafE3xZ15sj7aqJu/q/w6wUB8SdTlIyZV9lY4ZCpUEZb3OK0Se3kiNYG/dt5u3lHEj1yBL7DkLpCWRw2d967bAar4GrGOEzrwBYiLmrXrkiidHQYw6FTZKHugVIMHKcyc7WQ5sJr5UcXUNeCntuDI5Stc3Wqrcc25E0muduLQlBxhjozDO2AEPQJXXNEoZ7wTVwAp3V7YrgDDZrSLyvUqSmP4TcizA1ScE0pFKxdAVhBRNibMPEtdFmQyPE3m+WAF1Xm7zrucGIDSoFOVN1asOtjrnq3kwoIIUzu1S8ywIApDUR0Cdn2uf5u/kfdIfz58Q7se3c6uyLafdiz1FWTHUIhpW9LaYf5su/nZpHfrVEUBMItV2i4NcNbv/fhO3oNRc2bBCFtxSt2sdvvQ3KohLLF/9+CUqw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf8fd54-10bf-49e9-2a0a-08d69795c178
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 00:44:36.8991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0985
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v2 09/11] RISC-V: Convert trap debugging to
 trace events
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
X-List-Received-Date: Thu, 21 Feb 2019 00:45:06 -0000

From: Michael Clark <mjc@sifive.com>

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 Makefile.objs             |  1 +
 target/riscv/cpu_helper.c | 12 +++---------
 target/riscv/trace-events |  2 ++
 3 files changed, 6 insertions(+), 9 deletions(-)
 create mode 100644 target/riscv/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 5fb022d7ad..581bd97042 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -181,6 +181,7 @@ trace-events-subdirs +=3D target/arm
 trace-events-subdirs +=3D target/i386
 trace-events-subdirs +=3D target/mips
 trace-events-subdirs +=3D target/ppc
+trace-events-subdirs +=3D target/riscv
 trace-events-subdirs +=3D target/s390x
 trace-events-subdirs +=3D target/sparc
 trace-events-subdirs +=3D ui
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a02f4dad8c..6d3fbc3401 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,8 +22,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
-
-#define RISCV_DEBUG_INTERRUPT 0
+#include "trace.h"
=20
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -493,13 +492,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
=20
-    if (RISCV_DEBUG_INTERRUPT) {
-        qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": %s %s, "
-            "epc 0x" TARGET_FMT_lx ": tval 0x" TARGET_FMT_lx "\n",
-            env->mhartid, async ? "intr" : "trap",
-            (async ? riscv_intr_names : riscv_excp_names)[cause],
-            env->pc, tval);
-    }
+    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 16=
 ?
+        (async ? riscv_intr_names : riscv_excp_names)[cause] : "(unknown)"=
);
=20
     if (env->priv <=3D PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
new file mode 100644
index 0000000000..48af0373df
--- /dev/null
+++ b/target/riscv/trace-events
@@ -0,0 +1,2 @@
+# target/riscv/cpu_helper.c
+riscv_trap(uint64_t hartid, bool async, uint64_t cause, uint64_t epc, uint=
64_t tval, const char *desc) "hart:%"PRId64", async:%d, cause:%"PRId64", ep=
c:0x%"PRIx64", tval:0x%"PRIx64", desc=3D%s"
--=20
2.20.1


