Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXsn-0006w4-Su
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsZ-0006l0-KK; Wed, 30 Mar 2022 08:56:52 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsX-0004YA-SI; Wed, 30 Mar 2022 08:56:51 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9298621C6C;
 Wed, 30 Mar 2022 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhFYNyYPRCcLBEZVNCD7ZOOJTmG3o6A4RaJXBk+/Kv8=;
 b=O8alWpXzpOtujLY+gf/pdmUH9vF0nohuGWIGH4rkN73/DhaPiJcgsFfExnJIeShmz6XsSW
 SZaRBtErNBiDPrBTGffAH/rHIycScRe6X0ApX0pZceLfUmK03IKIBEsovfhN+LDQtiRzBn
 +dKG4JiBNJgH8j/I2gR9n1NwpEnymCs=
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
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH 01/18] define MAX_CLUSTERS in cpu.h instead of cluster.h
Date: Wed, 30 Mar 2022 14:56:22 +0200
Message-Id: <20220330125639.201937-2-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:56:53 -0000

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/core/cpu.h    | 6 ++++++
 include/hw/cpu/cluster.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 136973655c..38c72cbda1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1054,5 +1054,11 @@ extern const VMStateDescription vmstate_cpu_common;
 
 #define UNASSIGNED_CPU_INDEX -1
 #define UNASSIGNED_CLUSTER_INDEX -1
+/*
+ * This limit is imposed by TCG, which puts the cluster ID into an
+ * 8 bit field. Default being all-1s, custom index cannot be set to
+ * more than 254.
+ */
+#define MAX_CLUSTERS 255
 
 #endif
diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
index 53fbf36af5..09a2b86832 100644
--- a/include/hw/cpu/cluster.h
+++ b/include/hw/cpu/cluster.h
@@ -57,12 +57,6 @@
 #define TYPE_CPU_CLUSTER "cpu-cluster"
 OBJECT_DECLARE_SIMPLE_TYPE(CPUClusterState, CPU_CLUSTER)
 
-/*
- * This limit is imposed by TCG, which puts the cluster ID into an
- * 8 bit field (and uses all-1s for the default "not in any cluster").
- */
-#define MAX_CLUSTERS 255
-
 /**
  * CPUClusterState:
  * @cluster_id: The cluster ID. This value is for internal use only and should
-- 
2.35.1


