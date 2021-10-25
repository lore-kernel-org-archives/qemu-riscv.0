Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65D-0002fz-Fo
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65C-0002a3-6h; Mon, 25 Oct 2021 15:56:34 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65A-0005S8-28; Mon, 25 Oct 2021 15:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191791; x=1666727791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1wnU3i015LEcGifHvdvLyfAf3cHkdggweJcARNPBXw=;
 b=rp/ouy9XmJStPLjcsbUG2qHi+itJPajsu2NrjF75k7fk/b96S/JsALgb
 8NJ/Bl7scXm1B00uXlVayIPeLkbmfnhkv808HaQL7SYGMYDOohM2Zb0+A
 8ka0ZmsbrjKPb+Yid+Zg6nmxFzrYWgUGia1sGIV1XPLwp9/oRu7Y93P5a
 PKFQ6cUFFVitQ/V6574FhpCW0xtAbe+IsGyV90hlJEUDXAt+dpYCYZRY7
 yyRi2kWzw0BxsaW4M/w/xtv10SO8jb9bKYTCZO+bVqr6xI1ILqGCe3iQE
 D+FPaNVLfHTMa3g28KB9V/qLvyCmW6Ezkp362HN6fCl0aZoTYMsgjPZdg A==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683002"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:24 +0800
IronPort-SDR: V1T2QKbZ9QR+Dcg74haQu4HAjFATlD9TlFkWEHM0AIQHpHSD+A5O7xL36byRHRB7qnfSoVuFjp
 u7RTx38U/WFSx6rt3lTCphHyJgU0vF2JmW79ulHgwwrtJkfT+7rL77tnXDOSjebqGShWTBklL6
 1dmR5S0iT2MACQtoN/6upR+Ub0wo6gdtnnzrulZBPV5B9+3iTxaQoYG12ynKO/nKeIpq7l8uDf
 n4BH0PSz7ofwMcmEZaOdOwSGCVYL11xqVdy7+koLWR6PJoA7cDVDwaG+HUamm7r+MN1van3/HC
 WjhQQz94QZrMYu/j5UCMsl1K
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:55 -0700
IronPort-SDR: zjUFrZUHdteqhh+xFaFBomuLILWsQ/pQxMJMZ5ksARXIOt9S6pzC504J0ftMauL/A5YNjSXOa4
 gx2Nu4DXoi94skraAK9WoJkXu9MwSewQVrrDrkn5Frh6PVwJqcQqXpGOBw01zE0xrMSvZEEK7L
 CaQoRUL32bGpw0Tn7RLjxmZtBysgqItBNiAwzP/Au1R1c7Lt+YQwBMjVaq04mhLX/GpwmIVHqU
 XZgHx9RWJDg7ITfySDgAWLDVgfK5O99UHj6i48Dq6BlDEIt2wznLaBF9CcqoBvr9vhPd4hUoT0
 zM8=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 03/10] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Mon, 25 Oct 2021 12:55:54 -0700
Message-Id: <20211025195601.245631-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195601.245631-1-atish.patra@wdc.com>
References: <20211025195601.245631-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Oct 2021 19:56:34 -0000

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e63..3b55f5ed0036 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -598,7 +598,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b170..ebc1a8754032 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -294,7 +294,7 @@ struct RISCVCPU {
         bool ext_zbb;
         bool ext_zbc;
         bool ext_zbs;
-        bool ext_counters;
+        bool ext_pmu;
         bool ext_ifencei;
         bool ext_icsr;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index de484c74d3b4..c486eeaffeb8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -64,7 +64,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
+    if (!cpu->cfg.ext_pmu) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.31.1


