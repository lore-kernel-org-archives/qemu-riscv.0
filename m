Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ECFC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 04:54:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wujvQ-0008QQ-54; Fri, 14 Aug 2026 00:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvP-0008Px-B7
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:53:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvN-0005Kn-Hh
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:53:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4Qb3x509857
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=82l3PjnXb0G
 ZlmKaawQ08Xl5HnrTAdtiJbEN8JRS2d0=; b=V51lIGRMLTeIZZnLCj7vIFE1wy+
 PJiWmhX6o9kHXztyXZDezaFh9uZCAuYIIa/Jh6iQWua6OREindyKmtNajAq5jxbL
 FRAaBflXykU9M0kfGC9lMjBYKBGYoeoUZxE4Bl9GBPRRcJh78mMtYHAeiJ5DBymt
 tqXJ6u9ebXtzZtHNJGn+EJdk1f1Go5P4nZAeuBA7Ubo8JsPhU2IXF2W8s6/7KqVg
 wWUA91G2cK52elVUmGBg9RNXdFl0hDUGPzNAA2B7maNGBUTLNfwGyVp7s47klidR
 52WMtseXWZVjZbx5pQwaNlEZEFzy3v6Al+0vkKemZpFCId+8hk4FQrt2faw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3u6dq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:53:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3811d5ecf66so147047a91.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 21:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786683223; x=1787288023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=82l3PjnXb0GZlmKaawQ08Xl5HnrTAdtiJbEN8JRS2d0=;
 b=QGbv6uOQ5HZ+Qj49C1YFJI+1PDfhCI5xZ5CIgs3gktES631D2iHqNa+oPDztzdr6U9
 wDnZIISSOGig6YnTXu2ac1ZmgxZLkhL0TaV+bmFDVCYTdtEQN+NivhhW2a2g7xnDvuvb
 saV7y26wo7c7NwgIlvSQH5C5P3lwVXbBTZZxYlpGc56TXNKmSq8kTLuApdFO+V6hyMqQ
 4hLXTjXfmqcjXmKjwnePknRYub5ZPUZdIsl7APogClh1Y43ARFK5agZV5TY4oCeSbafl
 dyJx/baYBjeqdfLryCzlcEC2suCOioJMWKMvdLvkh6GbS1J21E7rRDDG2HXadmITGlii
 2D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786683223; x=1787288023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=82l3PjnXb0GZlmKaawQ08Xl5HnrTAdtiJbEN8JRS2d0=;
 b=btozZfChOlHDaj7rK6Iqgc/BkteQrUtRoSWZdlunkkLAez4aAqnWY8syUbUM6ufBWZ
 4APIy4zk2ku4mAl5d8EfxetBtw4Wkl2owJwg6kVeXL9Zt+R0+5EPORI7eUDETKhcVk8o
 eeiQRzHYoBFQRoNuzlQN35q5k64V4sZxsFRTQNAuAIdc1PsMSWZmoRSB8GK9JytivpVy
 lFD8CJXzWQUWeTCOGVxcmh9u9aFUSVb4AEtQ2ZW4KoSO3vgdYGYmPm817ZqdMDO7nNzS
 es2vYmGeTVeaCRGf7khJ8FCdYMVbeRuKDLJZqcXtyEHhhLoSl9WgMtOP6N5DXnpebbOl
 PHmQ==
X-Gm-Message-State: AOJu0YyYbpW0Qtfr2F2XtqrlgYtSbqF4OEFsZvqh2R8eZHw3cvwiIjMU
 cp7OSF4SQ9U9Azi9gqAKs2vo5z0xpXHrCqM/WX2bB6jLRqLIF2eM6p8v7T6HsKE7fD3+D9Rtcub
 x3ZxJvC4wnu6IeO9uesURtc50hjudwDPepMWi86hdx04qJAaWr+FJ3gxeNAIxShLe0g==
X-Gm-Gg: AR+sD11bl/xQ5mKMK/7BoyJvBxbdbGosJHqC/UkMhH7TSIaWhK1tM6acznXigGZxUUA
 qoFUaAQTHBShQQBMGAunF2qICTeytBUfqOvdtx7WdzguLKKUrXNHWd4CRNPjpPy/iI42QSJM1nU
 AuOltVfhuhLkHnnupyxjNmPjYFMi98To7Wzn7WrsDjxqG7YueQXBqGAebbxc9MOUvedJUj7XuXx
 vEOYwyFbB5/ITme8O8yxUwYWkGvCa9ijghH+jNpqYooX/bCT1lhecsbp9dR+Urw6lVs1Rq7cktT
 wRMRP2F2bpKT0eWOwSDbcbJWNVo8tPjVvYi6lVVF/u5OIxyjnsWHdMxUoQCOVV2m4hhon7UJYTi
 mNvw/GdKf0gBcMhh7VSEAxlJuv/daShh7+qoSvs8A4sVYX1CxHXW4ee8p+cwvh2dMCANoYTsrL7
 qFp7kJLmWs2Mco7DaJnU2m5iMBeqFE0m4=
X-Received: by 2002:a17:90b:5444:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-3933b8e2befmr2423115a91.3.1786683222988; 
 Thu, 13 Aug 2026 21:53:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-3933b8e2befmr2423090a91.3.1786683222384; 
 Thu, 13 Aug 2026 21:53:42 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31f15063cd8sm10625665eec.9.2026.08.13.21.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 21:53:42 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v8 03/10] hw/riscv: add RPMI FDT helpers
Date: Fri, 14 Aug 2026 10:23:07 +0530
Message-ID: <20260814045315.3416169-4-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7e9f58 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jHWy4UxqgUe44QwoGJQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX6WdvGK8BMOug
 neYVPPPqygshV99xjq0koovK1dZQ4sE4+KW/0QhOkC2zrVdG5HnfmAmitwhuGnnUGGbOEPOarvU
 G249D0POQTlY/dGgrCFY2rsbvx8lW0OgZTSDG/NyLISKFHca4RvSIexAH/1IFqUMEpGtUSbJ9pm
 KBad9gDgkoc8CEbiar3olLbi1W2hmD6wK6+M7RX3YiNKYy8IlRsgOqXjvJQW1KsYRG+GfJ4br6U
 yRmIvNI3zWF1yCys0jJI3lSlRr8GGXyQRiJOeRgT3Ut3WFBPotIV4eDWGpWfSSHOJ4oWOZBjK4o
 xp3MbhhdC8ryP1vTgxoLy4qQVS68WRbMMoD5liwRABFAcj/bOrLFJ5uHhNSEwOOscmvkQY6Et8U
 2qN68aLVVzQxKTgA/5nY6m+aGZaAij4YBB0rCcjUYU5Rsh5MPIoBEaqMcGLcmfKrWrgmw9zA8/6
 SgqMYseTEwZdvsh8XwA==
X-Proofpoint-ORIG-GUID: AKeW2DkHBv50BqR57p7yPhvxV3wsiQDh
X-Proofpoint-GUID: AKeW2DkHBv50BqR57p7yPhvxV3wsiQDh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX8tX0kdwgvTYL
 kFetaj158B/ZWtaryWUCBFYiUD3I4szEhwMkCDpiYso01wtQstZ8jA7rsUvsPEle4rnbhTfc/ZU
 2TbxeXIR0MdPxougCfCxoX7wBwkWNXQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140036
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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


