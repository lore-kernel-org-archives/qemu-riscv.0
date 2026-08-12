Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F269C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 10:35:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wu6It-0008Pg-Fu; Wed, 12 Aug 2026 06:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu6In-0008Ot-Po
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 06:35:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wu6Il-0003X7-OV
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 06:35:17 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C9uH8i3168860
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=82l3PjnXb0G
 ZlmKaawQ08Xl5HnrTAdtiJbEN8JRS2d0=; b=P1Y2lR8AMCe7T4y76wGtzEs5qCY
 ECUDpTfD5Ca9AP5aOwY1ZmGHPbxmRZLlpvqvXTcWfr74+c2kG9GjFPPCqS4Ry2EV
 NLHPVO00vVpT/J/S033+A2gThFjH5ReyEJyoU/FKWAqjMsw3rhyeJfxCv6lig22k
 iZHISwpLzcM7RoKulwu01Y1w7N7BvOkl7eAkoJI7wQOZKkDn9jyr2Kz637c5spMT
 uHH5c2bq5WBCF+ueXmZOS4ZUlDwt6W1HeoiJm2sclImc1n+SUK7Gf2hn7hjU8oXa
 3KuuichIhDVyJQhA3gLapPw91Zj8Utd+lATvO0snKXPrRYSWWmYVZPuWLqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyr4s5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 10:35:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ced1ed870fso2014435ad.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786530913; x=1787135713; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=82l3PjnXb0GZlmKaawQ08Xl5HnrTAdtiJbEN8JRS2d0=;
 b=Zp3EZoC4TP/QG//73g+bpLbV0HST88EPyDrYvbBaM8T4RVWvJNwO6TtIJnirggkA7B
 b5N5++j8m5QxxY03jWuqp4i5yFdu6G5d+lZTWXcy0Odw5HT/aL5PG+1LinaKe0lL16G7
 lROY3o7rqYHw7wFjwc4fJcSvdbxxvyP5Ihk0k/oqCNLWeHdWumbu77WQgug/P5y8tohK
 FRfwi0/zlx3J0RnxJGpjl3qKwJt+ilISRVNEAH9XeD39xpTg6u+ZNBIK2KhSt4TjxyDL
 nrtqL3yEvpxhCFRNNk6UWpAZM0uHpw1Hh/jxwVNZXNV5XN3C4jgZuEicUNSMxWR5SxEQ
 RjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786530913; x=1787135713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=82l3PjnXb0GZlmKaawQ08Xl5HnrTAdtiJbEN8JRS2d0=;
 b=hNp4JgEGzN8sOcIJyhAZ+NtYtywjV13EkNoQVjHKQSQL++cm87dQJH7zisBiO8Xy3V
 RRAMWIPuTXnX4kVfm+8Fne+V1A863ye6CuRj+AXoVhlXlQ5yAbaA0w+mU2qNFxaxuWHA
 EXna3jQqj/UUwMRhR9Kw/LyESMP9ooiYWXfYbdfOWiLJw6m0/2D3Tkpry/i/ZpX1zrdz
 QLE3WCpUpht10BbQvMK2wysSrR3Tsp8lvIAR/SvF3XmR1so8BI+5BoVXDxMXl+NK+oZU
 KXqYtF/VOuTCnN50LWAbFCTBAV5H21bTPhhLI463E+er6F7hvwRJIOVmBsH4zaip4c0U
 3XFg==
X-Gm-Message-State: AOJu0YyCcW8TdrdTEZkTPbxOR7+Y4tODBezK61uY/TG6jCXTyPqyOKk+
 9r6ZxDthiu51mKqSEShwi/4gMGkicUcIdLnvzf0ufgYxAubquthOhqIAKoB5uft4FiY2CrTOBV4
 +CI1ZTmAQG9N+WhzaxFUQeCRH4O3iSRxV1Genqkt0lHrA36iag6Qo5K6Es4xolBv5Ew==
X-Gm-Gg: AR+sD10voXzZjCBBQCm6EgLT55B2cMotHUTuzMPVzu9WtnKAdi937gDZAtj7YqTY1C/
 e5wQH03PDy3/D+EbobLQMgzB4uX5Tq93lrBF933JEoEPuRAFw5DBZie2tf2BVJuu1o7qkID6fZm
 sEJU6LS8WMKzzT6ynoCMASZnO+X04BXdw/LzsMMqIGseb23OaZLfwgLHiGZixWw9LkOslQXDade
 vkc3sG5XtR/j2aCr2Wsk6sVNMBB2UFc6eglKh8nk7Fvm9Qmj2YuzD99IOjZkB4Hp/EZ02d+/fUG
 fqYtQlUpVqUC8rLIkiS6iYupNogU0fHXrXfCweVDvLchRLESXMfkT9n6ArPwtbB4obH6C7Dpox3
 NJDHj3E+71vorpDl10UnkAeoP8I/VkbX1jLgGf07BnObXZQrCROQcPvLsCiWPNDha5Yd7sh0E1y
 qkE2by139eJcFRjILJibx9czjC7+1OzNA=
X-Received: by 2002:a17:903:292:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d3456c187amr37311545ad.3.1786530913181; 
 Wed, 12 Aug 2026 03:35:13 -0700 (PDT)
X-Received: by 2002:a17:903:292:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d3456c187amr37311215ad.3.1786530912738; 
 Wed, 12 Aug 2026 03:35:12 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31d6aec3947sm6910326eec.17.2026.08.12.03.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 03:35:12 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v7 03/10] hw/riscv: add RPMI FDT helpers
Date: Wed, 12 Aug 2026 16:04:37 +0530
Message-ID: <20260812103445.3451960-4-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812103445.3451960-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260812103445.3451960-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX+YMBpAyJBJKb
 U9pjXDTur74FF4iPVcenlAJS3yEgqao8/7INNYyIFhCBNZ85Dr/lWSB5c3V+gepZYJUnuj1qNlm
 Q9nyhLHMGusFbBZGChmskxmD8kZzQII=
X-Proofpoint-ORIG-GUID: Od_FO_09IDTT_WYkNP8_IYF79AtSFGJW
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c4c61 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jHWy4UxqgUe44QwoGJQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Od_FO_09IDTT_WYkNP8_IYF79AtSFGJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfXxF+cQW2/ape/
 ZHVPgbvgQYRUicZcPbo2Uk+NXMtZ1DTudeGMTAPFzzbjixIa0el3OYwLc7FR+i1bMfyUQdBmfFm
 frBmjHOIrU0rKeGnPGVtgFdNzfZtn0LaP9jIBNaqoOpu7fObyJxw8YVtewpr+X30NL1sCiAubtQ
 //M/DlzZWmmXsMXqvL9qLyKKBhaZsEGTRobdGI1cRMlLYr7IffsbVaUWGUGhc0iJxymZed10i+D
 2oxUtOMg73AqngdQxO6lusWdTn916ALLYvvJmhSPnSZelWA/Ovia3jgl/wZHjXl4tDau2aVG52K
 7BjfaClgN2S3eGA7HMJHwKb0HVmTJhJec+leTM07V0FcFwaAkDz6h3uWwkP/z2s0waCR1NXuPCR
 1Y/G+zH2R7YI35AN1eV0n1YbdmneWzQ9MCVhQYssRnrHjk5koXQ9OGEaiH/gCpWtGpKO0hvzFty
 m5Qh/Qj7jnNMOhWDqiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120084
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
-- 
2.43.0


