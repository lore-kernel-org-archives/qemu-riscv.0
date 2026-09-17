Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC25CC982D1
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 05:24:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x74aw-0007jY-FF; Thu, 17 Sep 2026 01:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74as-0007iA-LZ
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1x74aq-0003zu-O7
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 01:23:34 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GMiipb3597359
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DY5VzhSwEr+
 MxCSUBONUGSoNcNhRVuih2LBa/x5Wtpg=; b=S/PqOhaurRzXiVf16WR9WaVAYy4
 1GQs+qBsx/0jRDGqEX8YjaX1XE4t4CCqUGwF8KIOOWJmrrAQWq2axZwjm2kUUpUI
 De6pnPMYvuAnyrJFnSqcAXhgB4VrqsSGbufy4cG3rq1qyZZPmpEbqvR9G2Ke8bJf
 i1y0OVVrGHnM/97dyGGp7NilVxcdPRr06NJnI89Y2+CP9G1pizJyauoxEhSSwaWF
 J7b8TOWlRrimi/T9GdvDoCm801zfPH3URNYuCNaEIfjSFQO5+vNizi6C36Zuqupi
 on+PpuWB+wS3reMSEXOyjuVS0piWFf3hJnhbX7Tox7Kbuf6Dd+dW+BP0X7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayauef-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 05:23:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-399271df9d8so88113a91.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 22:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789622609; x=1790227409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DY5VzhSwEr+MxCSUBONUGSoNcNhRVuih2LBa/x5Wtpg=;
 b=TUM9fBgbdHh30sZrcvf9pzzhMlruAMoTjZqexxB7wpLaXKmYwWOlD1vpAluxEmix0k
 ij8UsF/nSY1v7JP3TbyHiiMW4bI2XZ2lPOdj2zM2UP5Ry+wTWxoCE5o103vAge5UXkzk
 0Y5ZWF3X0/2j8W3IzRODYFVYto2woBKAK7/Fhbe0cNBKJpKRArmURw6pe5bEeF/v7y9a
 pTe9alryQFniEp5V4GRFCxq4u7Q/wy00SKZiwOBTWGMpH4G9Rd5rjWmEwU3MOuXqPMD1
 UCS4V+5I+bIJatN9aa/Ax9d+4kj01Lfo5bNPnGDEr+438b32kUCH0wS1eC/EnyxnxbXH
 y3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789622609; x=1790227409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DY5VzhSwEr+MxCSUBONUGSoNcNhRVuih2LBa/x5Wtpg=;
 b=mB/AACAv6x4UKZA6pRRFOS8RiVtUgAwC+pcP6I/TKDBsensJ8Lx7Hd7VNALemEk8au
 CE53R5ZlNp41QrOmOeF2/+VTCiD0VXqunjzZcJ5EfOfGMCrJn8croC5xfvJVeqAmlU0k
 ARCzvYlViMd2JPiwPPKW8dnRuDmjfR0mtmP7B3EywLULspupZNLtZ257RAoWjJhAgqTd
 FplYJ7lrMovXT1ccuFfgg5yTAK4Kzd2IrU5v+C3O5g0RntdAbLSuWs0K5ZbgYFMz4lJ6
 jn/DRd3fyqMCVEcYWCfgNSrkHBi/q95nZzMVx3J3QI8S/8RB29aI0YGLMrU5pH8aJN25
 WrCw==
X-Gm-Message-State: AFuF++kJIRGXn2EMHYx1O7oAcktpNbCoM9nHHX63xV+CSGI9074XcKfX
 +4X1cCIktnEH0hjEkaMQCGNgB6OIgI9O2WdBFGUiuL+ZYMjRPUc2ooK77fJ1JgwFFqoSWA3m9GJ
 wBO2/824N+4dUB4IgLBGXatrJYrkLeDca9P3T5jbAk4t3Ac7CtuL1THRFiik3UjZ79g==
X-Gm-Gg: AYBFou1cL0FDNbU7KICf0CP6jh6XznZ2bL6Hjc9g/M2cYeQI3RNcVLPax5d/n2EZDS5
 dXSSzMgvZVQjWxiMXGEqkTq2qhzhgUEigDHZwJKY1VkoTc6XuZL9JWHxZwseW7ZvYHYk+QOzKO0
 he5LLRuuPpTyQoBYqUTxZHpNO+0Akh/pIFq1KTjM8Y/TkRQUWSUmnS9SCELI9O4Qk/UsrkIurgq
 fP7KF53N5CoParypCRVfnYFkt9072k3j4tfgdjhxJwdpSN+KJ5auMYL7oziXVG6yUmaN1iiQHOz
 +NNDE2Fj8dLnCC5eyjH3BJvWT1XuYzntpzynzxFNZcZa9HpP66MKxwgkrNmKsda0vdzUYc+2ojk
 CoYCXLxPt5/yzuedD/QmPUnyN25r3gZe5Ipcu/+3Nnyqi10yM245jt5hgPuQEyuZNR0UkwU+eSM
 TpjVylnWXHDfoZ1J0pLAZPAIygYiLSoOc=
X-Received: by 2002:a17:90b:3b91:b0:39e:b7:cbe9 with SMTP id
 98e67ed59e1d1-39e1e5a206bmr8198945a91.5.1789622609345; 
 Wed, 16 Sep 2026 22:23:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3b91:b0:39e:b7:cbe9 with SMTP id
 98e67ed59e1d1-39e1e5a206bmr8198913a91.5.1789622608875; 
 Wed, 16 Sep 2026 22:23:28 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5af4f0bsm14256187eec.24.2026.09.16.22.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 22:23:28 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v11 03/10] hw/riscv: add RPMI FDT helpers
Date: Thu, 17 Sep 2026 10:52:42 +0530
Message-ID: <20260917052250.1041262-4-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260917052250.1041262-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX/T3MLCYzK46n
 y+dLGRVs13HZMZ9gdWntom5U7k02Zo8umE3++r9LuH81qpx0vbRbVVaXTjexKY7LLbO3AR3bynn
 4ObDe+e09M+7LEfZRjei04nOLQl09/6DPSgwtBus0odTr+ANbDqZl9Kv+79c8gJ66LuXPYrPM/f
 biB0Xf+9nYEiD4JijmS8miOmCPwMMx7zoOHp9kh+a8CF+VmgwkoF/k+pyIUJW/wkxv4QZtdfcst
 Prv91Vdkpim8m//UKHIlI73Jpy8+M0ig4xTiG9+jZvA4TtDN6d0jkXWVVrQnDHIfipdDGRJ9TJx
 m+/hktAOtZVRWEfzG/ObsCUYSGqqzXzH5EhirHrRQCtlvHk4OW84P4OnAS+ESEiVDs2vEY+nGv+
 uxKeW5V608rpAOjzcN2Jm1DBckcGj7CaBjVnVVmPPCfGwKY0uXHhNztD1yrReWej7kTgZMD8KgD
 KavZ7oVEaD8BfzbKXjA==
X-Proofpoint-GUID: KbJ2sTqjJHg21VyalfqvSJDx4OSb9n6s
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab7952 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WNJofZAcfibaGo0vQRIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: KbJ2sTqjJHg21VyalfqvSJDx4OSb9n6s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2OCBTYWx0ZWRfX99mLbmpyWh6G
 4dhZL9So8QeL4X17usjJ2CUlbyBJzlHTQdS9Jm3dMajUhLsg98sGdrYzYbSsE7NOa6/P9qyoa+5
 bovWSGWvskH/B5nut1TARmxXavpluwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Add helper routines for describing RPMI shared-memory mailbox transports
and service child nodes in the RISC-V virt device tree.

The helpers keep RPMI node construction in one place so the virt machine
can add service groups without open-coding compatible strings, channel
IDs, interrupts, and shared-memory references at each call site.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/meson.build        |   3 ++
 hw/riscv/rpmi-fdt-stub.c    |  16 ++++++
 hw/riscv/rpmi-fdt.c         | 103 ++++++++++++++++++++++++++++++++++++
 include/hw/riscv/rpmi-fdt.h |  30 +++++++++++
 4 files changed, 152 insertions(+)
 create mode 100644 hw/riscv/rpmi-fdt-stub.c
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/riscv/rpmi-fdt.h

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 0d82ceacc4..87601f8523 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -4,6 +4,9 @@ riscv_ss.add(files('boot.c'))
 riscv_ss.add(files('fdt-common.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_RPMI',
+             if_true: files('rpmi-fdt.c'),
+             if_false: files('rpmi-fdt-stub.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
 riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
diff --git a/hw/riscv/rpmi-fdt-stub.c b/hw/riscv/rpmi-fdt-stub.c
new file mode 100644
index 0000000000..9866236ab3
--- /dev/null
+++ b/hw/riscv/rpmi-fdt-stub.c
@@ -0,0 +1,16 @@
+/*
+ * RISC-V RPMI device-tree helper stubs.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/riscv/rpmi-fdt.h"
+
+void riscv_rpmi_fdt_add_mbox(void *fdt G_GNUC_UNUSED,
+                             const RiscvRpmiFdtMboxConfig *cfg G_GNUC_UNUSED,
+                             uint32_t *phandle G_GNUC_UNUSED,
+                             uint32_t *mbox_handle G_GNUC_UNUSED)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/riscv/rpmi-fdt.c b/hw/riscv/rpmi-fdt.c
new file mode 100644
index 0000000000..439c91c894
--- /dev/null
+++ b/hw/riscv/rpmi-fdt.c
@@ -0,0 +1,103 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * RISC-V RPMI device-tree helpers
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ * Author:
+ *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bswap.h"
+#include "hw/riscv/rpmi-fdt.h"
+#include "hw/misc/riscv_rpmi.h"
+#include "system/device_tree.h"
+
+void riscv_rpmi_fdt_add_mbox(void *fdt,
+                             const RiscvRpmiFdtMboxConfig *cfg,
+                             uint32_t *phandle,
+                             uint32_t *mbox_handle)
+{
+    g_autofree char *name = NULL;
+    hwaddr a2p_req_base, p2a_ack_base, p2a_req_base, a2p_ack_base;
+    static const char * const regnames_all[RPMI_ALL_NUM_REGS] = {
+        "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell"
+    };
+    static const char * const regnames_a2p[RPMI_A2P_NUM_REGS] = {
+        "a2p-req", "p2a-ack", "a2p-doorbell"
+    };
+
+    a2p_req_base = cfg->shmem_base;
+    p2a_ack_base = a2p_req_base + cfg->a2p_req_size;
+    p2a_req_base = p2a_ack_base + cfg->a2p_req_size;
+    a2p_ack_base = p2a_req_base + cfg->p2a_req_size;
+
+    *mbox_handle = (*phandle)++;
+    name = g_strdup_printf("/soc/mailbox@%" HWADDR_PRIx, cfg->shmem_base);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "riscv,rpmi-shmem-mbox");
+    qemu_fdt_setprop_cell(fdt, name, "riscv,slot-size", RPMI_QUEUE_SLOT_SIZE);
+    qemu_fdt_setprop_cell(fdt, name, "#mbox-cells", 1);
+
+    if (cfg->p2a_req_size) {
+        qemu_fdt_setprop_string_array(fdt, name, "reg-names",
+                                      (char **)&regnames_all,
+                                      ARRAY_SIZE(regnames_all));
+        qemu_fdt_setprop_cells(fdt, name, "reg",
+            (uint32_t)(a2p_req_base >> 32), (uint32_t)a2p_req_base,
+            0x0, cfg->a2p_req_size,
+            (uint32_t)(p2a_ack_base >> 32), (uint32_t)p2a_ack_base,
+            0x0, cfg->a2p_req_size,
+            (uint32_t)(p2a_req_base >> 32), (uint32_t)p2a_req_base,
+            0x0, cfg->p2a_req_size,
+            (uint32_t)(a2p_ack_base >> 32), (uint32_t)a2p_ack_base,
+            0x0, cfg->p2a_req_size,
+            (uint32_t)(cfg->doorbell_base >> 32), (uint32_t)cfg->doorbell_base,
+            0x0, cfg->doorbell_size);
+    } else {
+        qemu_fdt_setprop_string_array(fdt, name, "reg-names",
+                                      (char **)&regnames_a2p,
+                                      ARRAY_SIZE(regnames_a2p));
+        qemu_fdt_setprop_cells(fdt, name, "reg",
+            (uint32_t)(a2p_req_base >> 32), (uint32_t)a2p_req_base,
+            0x0, cfg->a2p_req_size,
+            (uint32_t)(p2a_ack_base >> 32), (uint32_t)p2a_ack_base,
+            0x0, cfg->a2p_req_size,
+            (uint32_t)(cfg->doorbell_base >> 32), (uint32_t)cfg->doorbell_base,
+            0x0, cfg->doorbell_size);
+    }
+
+    qemu_fdt_setprop_cells(fdt, name, "phandle", *mbox_handle);
+}
+
+void riscv_rpmi_fdt_add_service(void *fdt, hwaddr shmem_base,
+                                const char *node_name,
+                                const char *compatible,
+                                uint32_t mbox_handle,
+                                uint32_t service_group,
+                                bool has_mpxy_channel,
+                                uint32_t mpxy_channel)
+{
+    g_autofree char *name = g_strdup_printf("/soc/mailbox@%" HWADDR_PRIx "/%s",
+                                            shmem_base, node_name);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", compatible);
+    qemu_fdt_setprop_cells(fdt, name, "mboxes", mbox_handle, service_group);
+    if (has_mpxy_channel) {
+        qemu_fdt_setprop_cell(fdt, name, "riscv,sbi-mpxy-channel-id",
+                              mpxy_channel);
+    }
+}
+
+void riscv_rpmi_fdt_add_service_node(void *fdt, hwaddr shmem_base,
+                                     const RiscvRpmiServiceConfig *service,
+                                     uint32_t mbox_handle)
+{
+    riscv_rpmi_fdt_add_service(fdt, shmem_base, service->node_name,
+                               service->compatible, mbox_handle,
+                               service->service_group,
+                               service->has_mpxy_channel,
+                               service->mpxy_channel);
+}
diff --git a/include/hw/riscv/rpmi-fdt.h b/include/hw/riscv/rpmi-fdt.h
new file mode 100644
index 0000000000..b157bda1d1
--- /dev/null
+++ b/include/hw/riscv/rpmi-fdt.h
@@ -0,0 +1,30 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * RISC-V RPMI device-tree helpers
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ * Author:
+ *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
+ */
+
+#ifndef HW_RISCV_RPMI_FDT_H
+#define HW_RISCV_RPMI_FDT_H
+
+#include "exec/hwaddr.h"
+#include "hw/misc/riscv_rpmi.h"
+
+typedef struct RiscvRpmiFdtMboxConfig {
+    hwaddr shmem_base;
+    hwaddr doorbell_base;
+    uint32_t a2p_req_size;
+    uint32_t p2a_req_size;
+    uint32_t doorbell_size;
+} RiscvRpmiFdtMboxConfig;
+
+void riscv_rpmi_fdt_add_mbox(void *fdt,
+                             const RiscvRpmiFdtMboxConfig *cfg,
+                             uint32_t *phandle,
+                             uint32_t *mbox_handle);
+
+#endif

