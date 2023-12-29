Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4787FC46CD3
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 08:05:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ7rT-0005KS-Pb; Fri, 29 Dec 2023 03:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJ7rR-0005Jx-J3; Fri, 29 Dec 2023 03:04:53 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJ7rO-000588-7I; Fri, 29 Dec 2023 03:04:53 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com F1426C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703837025;
 bh=KrWVf5+lJz4MfIbBmYA1Pz0j724FCRFUK9gDsiM43Bo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=VX7tFOyiN+kakx++amkiMawj8JJNVh5qEUzXv0BPFNiLPp2zBzkBckFxAs3OKVVdc
 BQaxsulyRZRP7it2yoH2DxDaXq1A8FrEjQanoqO+QAs8g3fRjLcsCCDGXHLf4YCgli
 6IzkOzoUbGRsIxq8grjg5ZK7iZ4PAKMEvTbmzJ3LAdk+WCwx5R2syzEUH6f2cXW/s7
 xdPh3v91lxbTWeQ4AGm7ke8S9LUTI2oyR9oT/fLQ33I3q7ouywCprqA94ev9biv35w
 N+MXPK3lMOd2TFNuW9bAYbb2xLq89xvB0ZDu/wNFTubR2BB/59JYGLX7OOkW76RwOd
 /8Omq4QSIXnXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703837025;
 bh=KrWVf5+lJz4MfIbBmYA1Pz0j724FCRFUK9gDsiM43Bo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=txKNX/RPLVATD4ZUSpuvrWDRAnVWtJJvoRMMrF26bJfC0ilv7U3SkLymvXAPguWVK
 b28pXS2FNu4d81dE4U5blWBoc6tNJdU2AFQ06bQn9CavuCHxPB7jQbx5E7fqmwXuLF
 N0a3pkGvYx844Pavs0CgktF29U9Bldx4vUl9GbMpOE8EowCM0fYROJVrowdPuqxb+2
 6IVq27ARsVAMxhhnZ/1If1YOLy+CZl82ton9MHzRy5B0eGBTX6e7Kv8Gb8KUa+mW6s
 ke8wpuzw2WV81y2INsw5IC0A8qtWL/PWjbju8CHstFW6XnlDbEQZtjBMIqD/LSGGd1
 rkSB6Yn2JBW4w==
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
To: <qemu-riscv@nongnu.org>
CC: <qemu-devel@nongnu.org>, <dbarboza@ventanamicro.com>,
 <zhiwei_liu@linux.alibaba.com>, <liwei1518@gmail.com>,
 <bin.meng@windriver.com>, <alistair.francis@wdc.com>, <palmer@dabbelt.com>,
 Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH] target/riscv/tcg: do not set defaults for non-generic
Date: Fri, 29 Dec 2023 11:02:52 +0300
Message-ID: <20231229080302.125418-1-vladimir.isaev@syntacore.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vladimir.isaev@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

riscv_cpu_options[] are exported using qdev and some of them are defined
with default values. This is unfortunate since riscv_cpu_add_user_properties()
is called after CPU instance init and there is no clear way to disable MMU/PMP
for some CPUs.

Can't define them as NODEFAULT since we still need defaults for generic CPU.

Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 target/riscv/tcg/tcg-cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a345d..9ffce1c9f7b0 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -937,6 +937,8 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
  */
 static void riscv_cpu_add_user_properties(Object *obj)
 {
+    bool use_def_vals = riscv_cpu_is_generic(obj);
+
 #ifndef CONFIG_USER_ONLY
     riscv_add_satp_mode_properties(obj);
 #endif
@@ -950,6 +952,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
 
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
+        prop->set_default = prop->set_default && use_def_vals;
+
         qdev_property_add_static(DEVICE(obj), prop);
     }
 }
-- 
2.43.0


