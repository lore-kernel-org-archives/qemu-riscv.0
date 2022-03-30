Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXtF-0008LY-Ll
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtA-00082g-BQ; Wed, 30 Mar 2022 08:57:28 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXt8-0004aL-OA; Wed, 30 Mar 2022 08:57:28 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 7FBAE21EC6;
 Wed, 30 Mar 2022 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OP2KACeS0PxZ1cbQpDRjk56f4TeAFjOJTUpHlmpiXfc=;
 b=OVTr74r2H1SGGg81PNbAotcOyG0vhNKotyLUFtZKSoRNmscrUSzencupPVJvnAMFhaNeju
 2wPb/gokuOGkPlCtv1oqDkEMUDTSGeJ7o9f4GO2yy+aPKfZGK0u85KjH1K1JU6gHtq505n
 JZswpS2ELJUPLRqhSaK9i7Jb2NN+TKQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 10/18] hw/riscv/riscv_hart: prepare transition to cpus
Date: Wed, 30 Mar 2022 14:56:31 +0200
Message-Id: <20220330125639.201937-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:29 -0000

riscv_hart_array does not need to be a sysbus device: it does not
have any mmio or sysbus irq.
We want to make it inherit the new cpus class so we need
a few tweaks:
+ a temporary helper realize so we can switch from sysbus_realize to
  qdev_realize (will be removed afer the transition is done).
+ a helper function to get an hart from the array (the current storage
  array field will be removed).
+ a helper function to get the number of harts in an array (the current
  field will be removed).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/riscv/riscv_hart.h | 19 +++++++++++++++++++
 hw/riscv/riscv_hart.c         |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index bbc21cdc9a..71747bf37c 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -41,4 +41,23 @@ struct RISCVHartArrayState {
     RISCVCPU *harts;
 };
 
+/**
+ * riscv_array_get_hart:
+ */
+static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *harts, int i)
+{
+    return &harts->harts[i];
+}
+
+/**
+ * riscv_array_get_num_harts:
+ */
+static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *harts)
+{
+    return harts->num_harts;
+}
+
+/* Temporary function until we migrated the riscv hart array to simple device */
+void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp);
+
 #endif
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0..780fd3a59a 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,6 +27,11 @@
 #include "hw/qdev-properties.h"
 #include "hw/riscv/riscv_hart.h"
 
+void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp)
+{
+    sysbus_realize(SYS_BUS_DEVICE(state), errp);
+}
+
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
-- 
2.35.1


