Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5684C44515
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:05:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllmA-0002rT-Jx; Mon, 20 Jul 2026 07:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllm7-0002oy-H5
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllm5-0002sm-LR
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:07 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvWQ82542256
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=u2inny1kyHj
 ix+ilOuGF76rFjWqbyjoEgMiN6LdTVuU=; b=h53QDa4cp8Sm3n0l1DO18qeXMsu
 6piejxjXWpRts72ykZ7bwt5euRpVIeQg/Q4ZixkMwOcpHpnrJ8v0490GWNJ3U5kK
 kg0JG+N4RgbUV+TWs2OB4Elv/CtRqS7+3XAx/7FEzDUYh/r5WlVkKlusWbggvOW7
 M4bjYoEDXqS0LT6APGDDoEFOPIpRPJcTInNnsczRDBJqndKwhWiGPWCPB8eR3sLF
 FlEHTFY98pAp2x6YowAZmr8aMv+GJTpqO3zCHS7tUn7xtTCaIe2zd6BfhWVHyT70
 eB8IgG1ENlolgFLEa9bQ9mPeVWBRfuKiCl7banjKrHppBJe1Lcr6fm4R1cA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcgw87-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:03:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cc98d6a88bso33989595ad.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545383; x=1785150183; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u2inny1kyHjix+ilOuGF76rFjWqbyjoEgMiN6LdTVuU=;
 b=iYD2gzFmsVaclEH3wKS57KJK2bAF1kclxzqUeYuHsBNOnnghT8toxswlK7QKyx8xKS
 pl+GOY29ui7d8Z7g7zl2TSlwtGlyOxe62LzZCpfJAurS0W9ZnpbjAAjtSLcGNslQlFEs
 K8oMAXdIAWASI+0p9vMJDq7pWatqwuzHIH1aVoMD83pMTiGjmaLC9/qMqPcCWdPA0k+T
 BQsNVBK3r4NsQwVivifuiGspiDst42TMQAfay4zdCkKI2bGVCdKrad6P1wIGkT8XtV/Y
 /bhC6iUa4hAWs3Z6z8uudfpQcRD1wjINnSRiCIcIovl2z1M9Cg8nz9FSH30D7vkvJAgL
 E2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545383; x=1785150183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=u2inny1kyHjix+ilOuGF76rFjWqbyjoEgMiN6LdTVuU=;
 b=cts+tBI9vvauP/OKlwq/OS1ju5hqgMSlc0qBfsN6elFywmfp7NcgvjHlJVHpCGY7NO
 Nm/mjDe0xuyIzoUSSN99XSZ6ci08FgeR5uZ9lS3tWom/5uC0BLDzz+T1I2fncXrv9G+q
 5H4NPoYcx7Pe/GA+dlGYyiKZxRJbWfvT/DtnZ0IDwy+mNx4s9CaML6GFfmcQIdmzvMU3
 qVQ+o/Kfc/ZB1SjO6taCgeBtHrDWzTDBHDsQmktVLcv0L1crnFyqKMp2j8aEDmIDtKv9
 qWz76sTVMAFoh4fXyBm8luuqPK/tl72T9QdlS2sohnPmRqcv1APbxqLDHCUwSxFIQVK9
 19fw==
X-Gm-Message-State: AOJu0YzPfp+m/6fkXmCNYGgYi3meUY3rg1g4YXp2v3djdsAwjNmQBeJN
 cm8QRPm7G8uT95lsHIgyX9xPW4VYncZGOXAcBHXMx/Quat17WYmBEX7TjU5P9UnLXR9x22OxW8L
 7vkhlSLMxKXH+9638S0XLZgnAwWvjzJFRxbb2xoZHGtSFKJlLjh7cuIw/Jsy5JlXkNQ==
X-Gm-Gg: AR+sD1340L7UWRQudaBh+QstPCdI3KEsOWEZ2u6nKFrPVzvFoGf1v4snEXRMke74oX4
 rrz9vAvXNh2R+ZXByedue/nRBLc1RPEjMwUL01Gc5JilY8/RKC/3g5oe/KMxJth1AG7FR5lQFIr
 hVTLcuJM6topFm5WjWgCJMTUavZDtczfjsmHAcuvvqQO4q6peuXuhsoCI54K4WEtSV6aa4hSBY5
 NCbYbEarE/8N0JoGwpWX1AMaDRft0dYxLNHvpMXV1GGvrVPhxZu6k1CjzA4cX4fXHc12XIlJdqY
 6n6hSLwxgEAoODZXPM2zQyTNgNgt9Yy+DFJALVzGNgTAO3TOK7aJGcx9v9FSJRtx1hGEYvsYFqn
 Fnouli1T7Xy6DnhQfjDfGOskk3SlG/nuhL/wpLCgzmZJZt0VbPIuj3Yb5wI7jJT02oMjEghdcqg
 7SNzP7h8cT/a3JvLzncu9s8v8mBTieLr0=
X-Received: by 2002:a17:903:2d1:b0:2c9:99be:f011 with SMTP id
 d9443c01a7336-2cf34988a8dmr98692745ad.6.1784545383154; 
 Mon, 20 Jul 2026 04:03:03 -0700 (PDT)
X-Received: by 2002:a17:903:2d1:b0:2c9:99be:f011 with SMTP id
 d9443c01a7336-2cf34988a8dmr98692435ad.6.1784545382660; 
 Mon, 20 Jul 2026 04:03:02 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20b1f3sm34698566eec.26.2026.07.20.04.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 04:03:01 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v4 03/10] hw/riscv: add RPMI FDT helpers
Date: Mon, 20 Jul 2026 16:32:26 +0530
Message-ID: <025da435c6b7097161342724a6e1ba7e85b64258.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y1AlyqKNbTpSNBV-cAZ7jFna8aBGU577
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX0+6nc3O0HpX9
 mLkeZ23Q8GH3jV4m/YoRYwh7Y97MQjdxwXFkCvorazueKq7uLAB/ZVgusU12RxkJOHQVYNtRP1T
 /S9sF3zap/qaNoniUF8s8aJPKHhBPCWpdcplgnM+9k4qPOLApNaXumnbAWfHLhFErimCZLE1zbJ
 HMnyyQHL9zSLxk38Ng4igDJIzI4oP5XmEih+iHikUXV29s8+PIo078o3I66zwgKkQqpdg1CPqU/
 Lnjm02+O1J+zZ05iXLts9vnbKn1dWTD6oqPiLcgIz6P2Tq68PF0iCufK6GSVVmbImm23g5E8lkA
 hfZ+hUs6dGzQjzCEKQ0xj9nTiOJ2blHuUZHF5IZkM8YNSnFnVRDGUWU1oHUET4zQWXRlHk5i8yL
 WbEoXgYNw1XaDgE274LZDdU6IsJChRnqnbSIvZl2+gJueYzH3tex1IbLDjubXWyL7RbOa6ELKcJ
 E5v59vhVHUu5q+Zyy2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfX99hy1djdQjHe
 q5XpWT2CGTlo6ikxjgw1bKpsTfoFxEHfMFzGGdnmW8JA/dodT2p0dtVe8XsS/HbTupxA31hpdmz
 KpPXEpzA+tcQc/f+fiXzcO7J3xRoN/w=
X-Proofpoint-GUID: Y1AlyqKNbTpSNBV-cAZ7jFna8aBGU577
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e0068 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jHWy4UxqgUe44QwoGJQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200123
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
 hw/riscv/meson.build        |   1 +
 hw/riscv/rpmi-fdt.c         | 103 ++++++++++++++++++++++++++++++++++++
 include/hw/riscv/rpmi-fdt.h |  30 +++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/riscv/rpmi-fdt.h

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index b70a054579..ae69426eb1 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -3,6 +3,7 @@ riscv_ss.add(files('boot.c'))
 riscv_ss.add(files('fdt-common.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: files('rpmi-fdt.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
 riscv_ss.add(when: 'CONFIG_SHAKTI_C', if_true: files('shakti_c.c'))
diff --git a/hw/riscv/rpmi-fdt.c b/hw/riscv/rpmi-fdt.c
new file mode 100644
index 0000000000..b2b3daea1c
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
index 0000000000..f053ae5d57
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
-- 
2.43.0


