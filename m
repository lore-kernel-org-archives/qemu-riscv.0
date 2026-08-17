Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B759C5B572
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 10:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvv0f-0003as-Fl; Mon, 17 Aug 2026 06:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wvv0N-0003FQ-KW
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 06:55:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wvv0K-00068H-4w
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 06:55:46 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67H9dd4W1962473
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 10:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=d5xFcJI+/UH
 EitLjRFs9Ilg/TXnyZDJq7fykLRCnwoc=; b=LJricQxtvTru291aosLRao36S9D
 Tf1wTEr2gL/jMFbvd3AyjxvnM37DBXrieOL1hfdGbE9YzAmQJ1YpKR65vyav0bDq
 Pe6VN5Cp/Q7gx+U2+BxJLz847iGNCKIy419os8JE4EYqQCoMa3mcIZtUroDfJJJ/
 Km3VIhvDZOZdlndqxOeqYJ52XlludF4EI7ej31Oz25LbMwOXaqY0ab8hQUYlj9gN
 cu+T57kApMEYbrbJc/ileagTulcwGoE1qgUO+Gipiv5vOAN5xvgbltuQLRAO4Kbc
 nhQD4YtG/ofOCUem+5iho06iadhRELA0dwvL8qdC1EbAr1HM/yY/cXw/b8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wregtuq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 10:55:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2d58262ffbfso3184395ad.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786964142; x=1787568942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d5xFcJI+/UHEitLjRFs9Ilg/TXnyZDJq7fykLRCnwoc=;
 b=OeZAlcG7FaJCr5CRvt1lKHnYeD7Nz1+qFrj+3j3cXH9dwzjzxt9QBaHnf8DIkjQQvi
 s/46Tts/mmOdhhVmjIQ+xRrGtlMBMaat0sd3A62Jo8+APE1j5aYmDLOOq9TpihmtOi4k
 yYquJYH/m4SN/0HsM66i3mHmkepPjtxJArIXucPHXBml8joRPj9UaB6eyuLJld718qiU
 MUs8HoRo9p/2NcT1RhnsV2z7NaQoOxxUHYYDQXlz9fDUlmHAUIHV7tPeyzKjePqXZ/fk
 IEJZYNlc+v+/EjQyhpv8V7hnzWsjsaKNUIj2UqQgMBu4QDV6v/3c7ibUhmjuC7yOP7Vs
 qECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786964142; x=1787568942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=d5xFcJI+/UHEitLjRFs9Ilg/TXnyZDJq7fykLRCnwoc=;
 b=deqdcyd7ye6rrcmrKG2/pQdBpdiLYfD0LWHtAf9lKGwOFya6UDqXuU9JZqL4zeFhuA
 n0gYWRFrmHP8NsJhvg5iKd3JXjHfuWD8Rw2hoYO4KAK5hubEjHVrSGmcDFZFPwOzFtmD
 Pt882hv/DnCXsVVAjLHFcXJ96RwyPl4MFbH8ulBrXxa8+zFL+tdJMsuQW9eT1Aw+TMUH
 8TQ1ax/cVQB2A6nQI0BcbPpAknw9qKCg8Kca4jJi96lPBqGmEVgxemDA7MrZrZvyVoJO
 lK4ip2G+cjVAPbrFzLdpP3HpxGdhU7D30SJBMdkx7fGQGJDzvF/TuRYe6kBbJvuSQse2
 zHUw==
X-Gm-Message-State: AOJu0Yzh0VSEHPOL1gJtXYa2nmxtz6J8OVygzyh6cImjNJjD3XDS8BM1
 NQLEAWU8x19JirG1xZfv/cxOIk1czKLE9JePqDTkx/RA955KmPUoDOQ9Lt+KwF0EMsHz88SbsyD
 ztG5A+LxxNlWTGSRxe7g3GSTQy/kgaolqRz6LI8MewKbUM5XXyYV+nXfnDw==
X-Gm-Gg: AR+sD10b6KgLm3jArIFhhuYb7AbyZ3+F3mqnvvnSpvKXkMkq4cl2mhLM8C/BJSgeEgE
 +RhLXoK6Wa6+TemwiPefUAlhuWimDZeWyLtsgGShBfJbxipOcaSXbPDoLj+6PxTEoNXcHq9z79n
 fGZ+LkQpCCbVWtDnz0S+5ct/BYhWDSpaa1nakO2AZzJCJzLXOFM+eMw+BY10JkWU5i3QSPB4Iof
 dW/qE/3lmaDhED60NBLVIqPvIczjs3WGbdo0/pgZSaRuA9raWpGwuH0vbYaWyHkI+86MtUh7b4G
 1NvA8JPCxdPoY69J296ThaVSbyGIjza0hOyFMAu4uIZWwhQqVLBB7MaHMCgH4EICTW1gtmm34wc
 c9HVjb4RNj84svnxuef9Qn3ST3/cZrXljD+JHb8k0vUVZVjifVEpOuJYmC5FFbkKXT5mLMUJZfb
 J+r8VqWdkYIzF38RIfb3wYg5FDd3ZT8Yo=
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d3b0503575mr173620755ad.0.1786964142248; 
 Mon, 17 Aug 2026 03:55:42 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d3b0503575mr173620395ad.0.1786964141766; 
 Mon, 17 Aug 2026 03:55:41 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3267c389363sm5431136eec.23.2026.08.17.03.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 03:55:41 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v9 03/10] hw/riscv: add RPMI FDT helpers
Date: Mon, 17 Aug 2026 16:24:57 +0530
Message-ID: <20260817105505.2607506-4-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817105505.2607506-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260817105505.2607506-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a82e8af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jHWy4UxqgUe44QwoGJQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 2rHf3eTetVwZ9Woo_ehdXAxhHp0IWtKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4MSBTYWx0ZWRfXzcbd0BDAhqQI
 ruvw6m6o3CYgelBmwqYeui+r/9HXrMOah/2H7JiL5Cxh4ODX0WhWDSP6tNlrZshv8urIlyQCkZh
 rb1HN+bs4gbJaP1Jr/wrqgiUc2sY81/X6J9qbXIwTbd7ELOAj6WmYqJvMfHNbskf9qO9OiUCarl
 G++sgP3ii2snHbkM1Hc0j0lcdNOGAnC3NxNFloGGk9+rqZtHdMa3P6JadJ//DHnIflPxzgSe3tE
 kFtO4RbAYt64N4wke2Aqg6g8YAfga+YSrsYUCoaAV3tkk5B69aMuBVPAFf3F1sQm1qIziwSZcMc
 Gh95aDRGIw+kesn4vtHuZSg6UynXHXqlz94l5PZGYyYyzs8Dxx1cFjJWeESG+06w7e2etzUW0x9
 7UYV0M596GxtIP1VHblIN1RfKQXxZ4Clqu0zERasoms05wg6ovpeNFmW10OWgkCzdx5fuks6Bpc
 VFZb3ig9Y+6zpl9b7dA==
X-Proofpoint-GUID: 2rHf3eTetVwZ9Woo_ehdXAxhHp0IWtKM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4MSBTYWx0ZWRfX5kXwEBhvJPVN
 l6RGHgRT9Dm1+4NfP7tNoZN/JwiJkfSzIvi/SeTfoZhb2Ub5szWIOlojhXdp21QFZNpKa89Vy1A
 TgNt/j52g3+5+4u0MnxdANSpaIr0ypo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170081
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
 hw/riscv/meson.build        |   1 +
 hw/riscv/rpmi-fdt.c         | 103 ++++++++++++++++++++++++++++++++++++
 include/hw/riscv/rpmi-fdt.h |  30 +++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 hw/riscv/rpmi-fdt.c
 create mode 100644 include/hw/riscv/rpmi-fdt.h

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 0d82ceacc4..17e23265f8 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -4,6 +4,7 @@ riscv_ss.add(files('boot.c'))
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


