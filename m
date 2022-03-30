Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXt1-0007XN-CE
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:57:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsf-0006on-Ur; Wed, 30 Mar 2022 08:56:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXsb-0004Zh-TX; Wed, 30 Mar 2022 08:56:55 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id A5D9A20780;
 Wed, 30 Mar 2022 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yAl9UmQScRePk2SVLTDCbmbb8crA3T3m5WK8Zes84L0=;
 b=dfO7Ra3dxjxDgRm4zGt6tgvWY84pbYNMVI+E95RBI/Ir8ziXlohCAafkmv37SizYYv7f4n
 bo8kjQnqwWaMS36AWqckCMc4iqbaw9BkxqV6nDFt4eWmBelMA3HSX/75F8gTUW+VIA1ZeM
 Th2BdEQK2ixSbGnJUbUPaiz7xNxKEQY=
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
Subject: [RFC PATCH 07/18] hw/cpu/cpus: add a common start-powered-off property
Date: Wed, 30 Mar 2022 14:56:28 +0200
Message-Id: <20220330125639.201937-8-damien.hedde@greensocs.com>
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
X-List-Received-Date: Wed, 30 Mar 2022 12:57:01 -0000

Can be used to initialize the same property on all
cpus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/cpu/cpus.h | 3 +++
 hw/cpu/cpus.c         | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
index 295d7537e2..7e89a0d018 100644
--- a/include/hw/cpu/cpus.h
+++ b/include/hw/cpu/cpus.h
@@ -46,6 +46,8 @@ OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
  *      written before realize in order to enable/disable clustering.
  * @cluster_index: The cluster ID. This value is for internal use only and
  *      should not be exposed directly to the user or to the guest.
+ * @start_powered_off: Default start power state of all cpus
+ *     (can be modified on a per-cpu basis after realize).
  */
 struct CpusState {
     /*< private >*/
@@ -59,6 +61,7 @@ struct CpusState {
     struct {
         uint16_t cpus;
     } topology;
+    bool start_powered_off;
     CPUState **cpus;
 };
 
diff --git a/hw/cpu/cpus.c b/hw/cpu/cpus.c
index ed9402c100..d1fe80f0ab 100644
--- a/hw/cpu/cpus.c
+++ b/hw/cpu/cpus.c
@@ -27,6 +27,7 @@ static Property cpus_properties[] = {
      * FIXME: remove this property to keep it internal ?
      */
     DEFINE_PROP_INT32("cluster-id", CpusState, cluster_index, -1),
+    DEFINE_PROP_BOOL("start-powered-off", CpusState, start_powered_off, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -71,6 +72,10 @@ static void cpus_create_cpus(CpusState *s, Error **errp)
             cpu->cluster_index = s->cluster_index;
         }
 
+        /* set power start state */
+        qdev_prop_set_bit(DEVICE(cpu), "start-powered-off",
+                          s->start_powered_off);
+
         /* let subclass configure the cpu */
         if (cgc->configure_cpu) {
             cgc->configure_cpu(s, cpu, i);
-- 
2.35.1


