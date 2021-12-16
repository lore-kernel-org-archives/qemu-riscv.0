Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxinX-0003ZA-5A
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:55:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinV-0003S5-6E
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinS-0003uZ-UL
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630515; x=1671166515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SPZIA74TJTVMJ/EW0ChuA+m3vlMDh9qmBIfXrpPLqp8=;
 b=OcVQOwUq8wPmnHVibi49kmHPB8bHK0qFMy/gocQTACp99xpoPH0OcnbL
 lU75gr4uuewUZ+n0lYgsI2AZKz2fqe8+XO1YNXDgHnjPDBxfeYPvNzzvC
 4KhSS0Pc5w75LWT2UvTiufA5iEocCPxjQsXK28Gni2kXeUpQq1zjk88p9
 hKB1/l8MN/19Lu1bQqo1xmz9d7JhGazmOaq9bF/8hlgaztCLdLUraevBs
 mg3HM9BzjSQs6+3xkzuQVxGVyhEHGKnn/m1mvcSJ0PTd+u5b2Kw75nFua
 uIof3VElltKiylv5BN+8YtU3mMsJt0kUBZWHYEswZQnpiEQOSP6AONSmM w==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="292375156"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:11 +0800
IronPort-SDR: Jzjh5GE0DtOrvH3xD5Nemtyo9CoHJEG+Bj7wVt15XneVHxgRicSOlsZbAMd/FuavZ8Etg15ZU/
 AHBBPj1n4+NXosjXu2vO+HuYORWALVMirtqaAn1A5hzpYoZjmS3p7Rhxh+H289bm7e0wIGLw/r
 M8+TEjRjEBgbAKgZJaTnz8DlfIJAFmRUjUoaqD3Ag42IgciwDH8Fe6QQg/nYU3X0gzgNFYBcGj
 S/OtjuW43/583XV+shBeUaHUA0g5WIj3RnkEugiP6VbX3r1Akgdq+SNxjAuest1p4Y3grRuldg
 ou8yUeEkGZqjjGfQJ+VpxBmN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:28:05 -0800
IronPort-SDR: Mmk0QjgpR2Wu/Gp+M+/3gqfCgFlxpqcVdm4YCAmi45aBtmnunneRQrrLn4nD9Suu2TxaJrchaz
 97XTtZRwDCG2d10Cp4jZ4E7hxgKc1O+Pfk/OAFlUSOCgmAB8C+osamxZA2jpqq8NMw8wbtT4x/
 nEuwDPdKVspnFxmEZI/1YMROoYZa3+vzx/Z7g30YEUnErNrXVTDM8J5Y4kpt9xzXPi0lVlNvL6
 FitsbdxjfNAjvuN1wBYzbzU0y4U1XrpJCZ2a/57Vlbxi5ZPP6USwX0zfSLA6teXKsNLycC9bAD
 mVU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cz11J2z1Rwnx
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:55:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630510; x=1642222511; bh=SPZIA74TJTVMJ/EW0C
 huA+m3vlMDh9qmBIfXrpPLqp8=; b=bmRm9JlPdOT5BoSsP9M15mYKN4MWF+6rg+
 0sHrOxZI7h49AYRBP5Kof+9w/zo+yuAHBP9FnIshetKGFYbYqtc8IYRzTLVKmhFj
 RXEEgrUinJpePGFDxiWUuTt/pPeDs6XssoBwJacsVM1Y7/pz5cY/sZa11FOlbwxH
 0mJxxBocsVo4djjZMM3WLlSbC9uouxKlwonNSqS2pdF6yeYOfan4zCFIlseQym2r
 gIYmWd63eQcAJ4dT8n1zvFJdhBOSw3syqGBA8S2sbNET9oub0STXOsf5jdTPoG5Q
 hvbwnqu12eqvSOZpd0enIcKhE9BktOnsz4cznkj7YAMYB9fV60Rg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IoeJQ86wpyLR for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:55:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cs6XGkz1RtVG;
 Wed, 15 Dec 2021 20:55:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 6/9] target/riscv: Enable the Hypervisor extension by
 default
Date: Thu, 16 Dec 2021 14:54:24 +1000
Message-Id: <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Dec 2021 04:55:17 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Let's enable the Hypervisor extension by default. This doesn't affect
named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
Hypervisor extensions by default for the virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1edb2771b4..013a8760b5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -626,7 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
--=20
2.31.1


