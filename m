Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2C606A327
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 04:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=DCpMwzwN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMdsI-0002Ev-5s; Fri, 30 Oct 2026 00:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xMdsF-0002E3-Ie
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 00:05:51 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xMdsD-0004pE-RA
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 00:05:51 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-369fc2e984fso36643eec.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 21:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793333148; x=1793937948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YsC+XEruGndG58YY8kt8ZdOFOFq6dz4LLUY7PRPLZtc=;
 b=DCpMwzwNm4F1zFLHwP8rxI1IKT+9aRZvr6JBFloEGPa93N2owvu2NAX8VzaM3xH5mV
 Ne2Y4lChB1bU04SFbDXKL/UYEMqVClFkZ1NnHI1A8uK1PQYIMiMCf29su6E3aZjdk5/k
 joVBwC9At3tdAtfThJHsJWfd17bQJnmiCNJmiiisplB4Q4Z0kpOojLlZhiv+LrQdR6AL
 dfbdZS65SJaP2szzsWeu03HfaKx5MQkLKgGcr3dF290U3wAfGsHOR45nVeR8WUrH6J7Z
 CsNHFoowPo5JoMjTj4ynj79J1sWwQMlJhwJUmLNJEAXtCsz1pWC5GYxPz2sNNrxBWlqP
 yHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793333148; x=1793937948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YsC+XEruGndG58YY8kt8ZdOFOFq6dz4LLUY7PRPLZtc=;
 b=lDaHczJf567IqSC7K7nfon377AzhSRdrUISXjgnSwCmRH/g52e6Mya9uT7DxKk3XAv
 VPCGidiLPNxnD2y5nsB6Fprb482fS10X/Yh7JjSDU6F6zx8JzJUhuKlF9ps+9zV7BZtJ
 yyTUslgRRLdn6N/bakidRJ0vvlpDRFZkAHP5QlkwhYeevIHDzRTE4SjSlA3S/PZIZDkm
 z5w10HYtEQHsvZNbzJZIdo3LIaXPi2of3U7QUX3a9wPZhGTh+A1PbjRHKB19pIGnTo9A
 YxEa33U3hIY1TdybcLStSCO+jRjJFAVKxM3PxjfclTF2a7ucq+G0mB+nzcIYQXlT1zPF
 yguA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxr+ddcaT0oda+Vz1JiaBow+iVgbo7hq901da4gk+rCdwpyj2mMLk2h5VnEtjs1nQ3bzwv025OFRBb/@nongnu.org
X-Gm-Message-State: AFq9FYL8DiURIMDto/S5un1qG9b1X2LMgs9J8L8s0tSiikTbh5mZzWzH
 jpQMdwThrPd/ctTCDvbst3ErBSIhRf9r3B8V6hM6ekq5lraeVD+AeQ5/itj2mS2FB7k=
X-Gm-Gg: AYBFou3XWx7qv6X9ywUuxEHnqxuX3Ax0ojPCUW0Dael91MvRy/fYvDrrl0KEzmU6+Zm
 enVZt/AlE6PPnUVq1l5OzmxqxRDagBAa2lxUM6jOX5t1yOAjk+XuTkfuXuuzR4ExVagM6WMmcMp
 4S4N59t75BqWBq+ZJtVn17Jq5OJLBkUy5yePbFimRiaVSeVYk9/gTxUp6f8/T2Ddr+OrDGbRMrv
 NTjcw0BeHaP7EH68R9RqEvxILJfP1bwsXP0yzm+ZjCpr+KK5jYbcx5MudNU72uJRBfdJJM65n7I
 EFe1r9LcdrVY2HR1V965U2bpxoLUYZHJmn3FJs7WGS3rvA0mv6TY2AaJJl2t0aSSpaf+zYwEjdT
 Ar8eL/kWaODLaRpe7T+AKdxZvGI1mJ9NQRfCJKl5wSfYfbmoTfaKVnvhEvRhVGz6gfq9j77d+AL
 wESZ+yV8MlsK5ehIkgyOdPyOX+f3ycKUHDvvYYcXvIxbG2gpgdILQT2vPzAVYkDYxaklR7VX4t3
 9mXJXAZqobQ85QXOEJudjnAIndRSg6B4rQFkknL2oo0w7Cf6fhDx6t1FMiK7L0Sa12e5eb21JNx
 DVOc50xD5P5mgpMWSiS4sbm7gXf7jh6lIoY8wjHbXPR0ThlOu1X1Em+8cTxH1ZfpeIf2tcAhjEF
 s7Q==
X-Received: by 2002:a05:693c:6304:b0:369:289a:d31a with SMTP id
 5a478bee46e88-36a42059799mr2940270eec.0.1793333148209; 
 Thu, 29 Oct 2026 21:05:48 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428af1easm2957687eec.5.2026.10.29.21.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 21:05:47 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Michael Ellerman <mpe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 4/9] hw/riscv/atlantis: Create CPU cluster for Atlantis cpus
Date: Fri, 30 Oct 2026 14:05:10 +1000
Message-ID: <20261030040516.853444-5-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030040516.853444-1-portias@oss.tenstorrent.com>
References: <20261030040516.853444-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=portias@tenstorrent.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation for adding the RCPU, put the Ascalon harts in a
CPUCluster. This will allow gdb to properly handle CPUs of different
types.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig               |  1 +
 hw/riscv/tt_atlantis.c         | 13 ++++++++++++-
 include/hw/riscv/tt_atlantis.h |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d89fdfcc86..4eccfa443e 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -149,6 +149,7 @@ config TENSTORRENT
     select DESIGNWARE_I2C
     select DS1338
     select TMP105
+    select CPU_CLUSTER
 
 config XIANGSHAN_KUNMINGHU
     bool
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index b514aaaa68..076f2321e0 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -50,6 +50,8 @@ QEMU_BUILD_BUG_ON(TT_IMSIC_STRIDE != (0x1000 << TT_IMSIC_GUEST_BITS));
 #define TT_ACLINT_MTIMECMP      0x8000
 #define TT_ACLINT_TIMEBASE_FREQ 1000000000
 
+#define ASCALON_CLUSTER_ID     0
+
 static const MemMapEntry tt_atlantis_memmap[] = {
     /* Keep sorted with :'<,'>!sort -g -k 4 */
     [TT_ATL_DDR_LO] =           { 0x00000000,    0x80000000 },
@@ -551,7 +553,10 @@ static void tt_ascalon_cluster_init(Object *obj)
 {
     TTAscalonClusterState *ac = TT_ASCALON_CLUSTER(obj);
 
-    object_initialize_child(obj, "cpus", &ac->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "tt-ascalon.cluster", &ac->cluster,
+                            TYPE_CPU_CLUSTER);
+    object_initialize_child(OBJECT(&ac->cluster), "cpus", &ac->cpus,
+                            TYPE_RISCV_HART_ARRAY);
 }
 
 static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
@@ -589,6 +594,12 @@ static void tt_ascalon_cluster_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&ac->cpus), errp)) {
         return;
     }
+
+    qdev_prop_set_uint32(DEVICE(&ac->cluster), "cluster-id", ASCALON_CLUSTER_ID);
+    /* cluster must be realized after the hart array */
+    if (!qdev_realize(DEVICE(&ac->cluster), NULL, errp)) {
+        return;
+    }
 }
 
 static const Property tt_ascalon_cluster_props[] = {
diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 52b44504ae..e5fce1f675 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -15,6 +15,7 @@
 #include "hw/intc/riscv_imsic.h"
 #include "hw/misc/tt_atlantis_prcm.h"
 #include "hw/char/dw8250.h"
+#include "hw/cpu/cluster.h"
 #include "hw/riscv/riscv_hart.h"
 
 #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
@@ -40,6 +41,7 @@ struct TTAscalonClusterState {
     MemoryRegion memory;
 
     RISCVHartArrayState cpus;
+    CPUClusterState cluster;
     MemoryRegion bootrom;
 
     uint32_t num_harts;
-- 
2.43.0


