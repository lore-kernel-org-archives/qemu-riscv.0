Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxinN-00030t-Ul
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:55:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinN-0002xu-4Q
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:09 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinL-0003ts-4d
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630507; x=1671166507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayBTYXwSr3LpHDfXsatQL6OmSGThM5dBa3wy7BLUtaE=;
 b=baPKBcfSarcCmtUKJkXnMG7dZJC+ktfP6QNrvWtyFI23DesaQI1m1hjy
 W4g92+FnKb462OwIEA207DdVZCGWk9qZYhLEYF5tuggOI1kGMj/+G7FrA
 BBMNxciEmGQwvFBpFqJXq9fYQdsO4rL3FkgSbzawVXANcnKL3bh0d5ZeG
 L/lyphTv4uFHoFywV2PzrNP9KIp6ENnLaOc/NU/gEiEKQ9icfnMHOKuB7
 nXAI7ZeOT7sc6GQYf1C1gQ6MXdCBpGYi5LH7ZCq7MfuDX1ZNMzw6O+Jxo
 4neFfBG+tIF2YsWf0wUXhlQwxiqwB/i+DaU2hOz0LU6cNbnQ7ExHH13s7 A==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354577"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:06 +0800
IronPort-SDR: LYduyMdycbfRBCEzF85S7OS3p1x564lu1YKTEga3N/ARanPdx6K3s0vvLeJ7mjmWNOyvOnKpgw
 2gjOnY+00S1byP/MWIMxu3EhqVj2hE36yu63Id1LLJbnGMlWmJa1VlOrU2ugNMdeO9RE9eDVP8
 e6lHNGVwa8sC/qDWswb4OONev3qq0pIU3jtB3ZP42YOyPkakv03LJuWQsUXkTAYvlcBNEjiygP
 OLX1+uWARpmxPWXC9qlfwaMWcwBueNY+fdhLTwAlKo1LpjYsFA4qlkeWdDiX+4BulBlUghkQIG
 pCxsBopv5nh4zKqDUiw3BgGr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:28:00 -0800
IronPort-SDR: EUaJSguIdYQBGjBdHgtS4vVvOb5YZoKS63ha5DdxJWdFlMz/Jl+Up7NitrB/LYo8mnu9kWgN25
 cUPdv7NEQ8hNvahok2XbpYj/nNm/p3Z3wA111RrOEb/GTYqA4QBzoYREph5YTcZG1ctsjHd7Mx
 lo3OWAQOc0Bfq7pKRE545P5mju52bhbgsYbxHgP9KLph9HjKMW4Z77fTTEVNKXKe0d22S93Nkv
 tnuYeVMLJ3uZlVv227it1Laik9nARrRA1Vbkj63V7AS2kIuLf+1BBB1GbZbvkQMN0bVDr4wdtK
 yAc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cs3pXhz1Rwnv
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:55:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630505; x=1642222506; bh=ayBTYXwSr3LpHDfXsa
 tQL6OmSGThM5dBa3wy7BLUtaE=; b=i6Oxe4x0hZqPYWqMoKJnO6vc6wcPapDJfV
 7dK+iK2Q1q6xlmhfZV5pIfvNL8G3tLskNM6o6tW6cvCmVPR6MbGlvdspx01b8IGo
 YU3VybzAS573Ox6BbXTLNoTPJjc5Gp7UOtBJPweJOB2oXifZODhQgKdwBJ65qfDr
 ziunGRppeeu/EO8i2hiz5bRmtyeW24h++xZMqQ+Mic3UeadIqQjdjlvb9xPGfH6O
 Fxc01AnXaibRgmYWBVlJrSKmpypJRMGAHgmoBBabc3fulXU0rAl1O+sotivUgZFb
 osNSswvWQyEN09/WDGshpYT9qDyLrnlCyDht9AvUhovv4otHC88Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gl2lfpi7mm_Z for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:55:05 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cm4Hrdz1RtVG;
 Wed, 15 Dec 2021 20:55:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 5/9] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Thu, 16 Dec 2021 14:54:23 +1000
Message-Id: <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Thu, 16 Dec 2021 04:55:09 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The Hypervisor spec is now frozen, so remove the experimental tag.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..1edb2771b4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -639,7 +640,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.31.1


