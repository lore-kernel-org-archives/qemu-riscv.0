Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ENC-0001XN-4P
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:03:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EN7-0001Ul-C8
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:03:05 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EN4-0004wo-Kl
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420182; x=1672956182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGx1B3MgM+U6Kfsl3iEYfy3ZvGCUTB6i+cs1K5eEnAk=;
 b=g/j4PwrhNJmGnYTPCOtrtgNdoM3o/P/cz3lG5/6w3S/wUz2hMerMtDRm
 xgWq9cJyoPYWajwO981X9nPvA16vCRIpm3vdrMn6rNeUj5x629H3e//5I
 u0TmjnNODrj3B4Su1I9+gzTS/gedKVY0qMXu25+4fmkbn3VTWgoyKlPv3
 flfcaEYE0YucbkQ8uZmtqfBkHX51O321c1gwVTKnSi3W/rJTwnMBonTO4
 FT04AGfDbr2mc96gvJJtjCPPks0S343up9a6eu7klU74DmH9kAHEEJDLV
 hObkBFQap8e6OiM4px3TSuHbVs8VWroDS7V9S9VU8NUPEad1jXHMGMpDA A==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="293830348"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:19 +0800
IronPort-SDR: AP1EEKfbuIHqeMwOYehPk8ONUtwd22kkPKFl8GpAKiEZoSvoB07Ls44nT1CcOkX9UnJvhoxWA1
 u5H8hk4RYw/mRsac8h19bDkh42tVTpD9A/tkbpcX8UoqM4FhZU8gcNezs6SmQjN6tXXNuTivKj
 c/3E9/xB9X6Gqoc7KjRQ2ZuD2JySbkODEqfQNBw0YtPN85NiJz8EnfydUQb8gzVUmJWOxQb8JO
 0YhK6c92kNmx+KOFRqIATmXRqLlNL3Q4y6BdliBVe1PVNd7mwvvBN1Lz44Cj44LCseXvyYH+pY
 VLqlHk9SGlhyQdw5z6P24NHl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:14:11 -0800
IronPort-SDR: 8+vTujYICao8bcTTg/8HMBC3NS+dWXwi6Ovnf+ewcNHpqvXKcVo9pSOVoLqNEgy7Qe/cfQVMM/
 CVlE3nlRxFkguBYN8PukcmwT6ZRBsJ1Lorbz5Dk6yDggDZ7TEDo8qkV208VZ4soTTk6zSHh92B
 lrfCqooNLOArqTWkoUHaoq52/LXbyHYfy6fPhbLLm93sy5Vxywcsl1BBdx4D0L9vE46FchdBls
 eiI3r4dEhx6TGs8IDWoJjD6fJX1oRqsuzpjfwAi/J0SPwByk0t4C7r2s3w3PLb8sfttYBclZqE
 Btc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZW25Cfz1VSkd
 for <qemu-riscv@nongnu.org>; Wed,  5 Jan 2022 13:40:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641418818; x=1644010819; bh=ZGx1B3MgM+U6Kfsl3i
 EYfy3ZvGCUTB6i+cs1K5eEnAk=; b=HwTyC69yi/HyiZeCZdY6VHp/HP6oFlWV6a
 aaIHLUb9xQn3uMtbMwBI6crIA29NjdRu1W6zNUHUgY1WHcqvONoQgVrVU2dfX9hr
 38zXA87Hvep0QiWg5Pg1xQddHPe1wUL1YL/CwIgwfRV51HJSTaOI+MU0KXppjiMP
 cfWLnE/AH6kPuGUBc7JkXAWS0bSIlQVxWvQXs1rnmjgbUXueENCWmLEVb9Iz+h1G
 ZYmvY/uQ99LnJ45EHADOrzFDfDUk9x0qUvylvJaaQfKDryW62Flk/MRqnBoP6ET9
 JD2Se8VaNRiEzYxq+dcKFVOjrXZR3X9XypH5SQwqnFr0T/LNoMSQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yosnBtysSeBO for <qemu-riscv@nongnu.org>;
 Wed,  5 Jan 2022 13:40:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZP01mwz1VSkV;
 Wed,  5 Jan 2022 13:40:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 5/8] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Thu,  6 Jan 2022 07:39:34 +1000
Message-Id: <20220105213937.1113508-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 22:03:05 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The Hypervisor spec is now frozen, so remove the experimental tag.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..9ea67bedd3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,6 +627,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -645,7 +646,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
--=20
2.31.1


