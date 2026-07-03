Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DBDC43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:09:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiH2-0001Hd-Ma; Fri, 03 Jul 2026 14:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiH0-0001H8-S8
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:05:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiGx-00026c-Q0
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:05:58 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HjBb4546852
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o0QSRSQX8OU+omQDi0SR/hFUIF9oi+TXP31bNkHRkJk=; b=PpRf0bDCO/eZWiBF
 XZrMxzLeXU8VUl1VYWyH2fOnH9KNW6DuPmvQ4kAHsRd5CW1GADLQQTguLz3zDJd2
 BFewSa6zM3PG1EExhOZW9VVZgcP9/y6rc7yws5re1F2gimZoNnRWltjGHkVuTYNk
 eQv/zMBcbkJ3OrVpMxjAmSLtHeNNen5w9XHpjCtUdDexLTpnbCvf5lJ3+LIY9eRm
 vjsapPAC183KYgTtCPKqD6kz8IXx++bMZR//SZThGwon9FrhA91qO297RzWzTdBU
 qzXx89lyjO7CzXCntiRnCPkUlAQXDXoO/aVSxH4wXm8FKYkEP5OVoMH9jukw60+b
 /BUirg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bteb9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:05:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bf321d786so8996931cf.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101953; x=1783706753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0QSRSQX8OU+omQDi0SR/hFUIF9oi+TXP31bNkHRkJk=;
 b=NLV3iWXUO4MxBaglgjiNrdTHkKDyPM6KvCqIPhaNlnF0pFFOwsuvxqghkk75cg+z6y
 7qqW6NmkP3GTwZV69fi8Rkb39/NLO3P+z/DnFa55aYFrWzqCRICcEORIbY9/S0VvsLIY
 QphyhQhAULknr4j6Lw/JzRmRgNdLeXEb3foucCkc2QMRJvSw6Wvbew3xUx358kZqTOLV
 lhfGexCPCUOsADcmriA+nHxEjYYRV0PwkrNhsY/iJHhgSj7PQc3XvxoKQTr77xHjTL2y
 QNAEFCMwleFZ/NSPKiXN7sSw2Wq+JI8LGwfzprF1AyvRJ7EQ8JmIUUrEC5qXS5B9svK9
 FNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101953; x=1783706753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o0QSRSQX8OU+omQDi0SR/hFUIF9oi+TXP31bNkHRkJk=;
 b=AUbaAKrYPUfosN+Pcgtiv/91opzWNrhQwDKUB8pDfz48rsxpKycan2HSyHlCWmrgEZ
 liRgRobn0yofqCBlQTT8lYAVnnEJqiMcmHTwqw3uLBoMFKBa/sefgIma8BE93b/TYNy2
 G1cz0inM5iz/ZHSx/E7hexQB2e8TCD0s1ToGqZjMSn4DnUeCgwOBuWeIoTTDBdOTfDBo
 VEvcfWEanBZcTo++6pGXhcezCgFlMxq1QbcuK6MwDUAblEEhsNSJVZYosW/3IPe3JMRO
 yPwIraey69Q/IvnIFK5fMt0UPLwjJyi00qKF523Vv7x3g8PqCYkS0sHxs5AEpRsaWw5K
 SJkg==
X-Gm-Message-State: AOJu0Yy4L1WJoCdHrbwhdVRtNqWVoxDHkhTsSIJInK6qgwbUlalreULw
 QHsAWmjQVOhr1s1q1Qs9ai/Wkhd9xcZGgPAQBHWQNHHzTMoWB3huAibE6n/MIV2MDxs6JNhz/Ro
 XKe3dnJSlt/+gyV7t8FtpYGw7M2zAErCgE8AVzE1MbvibyIyq9FOIRmNncg==
X-Gm-Gg: AfdE7ckaQJGnp3cjV3ps9ysZc9gAZ6ZOMSKxw/udgwaCItGlci6bURiCQ7lXGUVnK2s
 CooyKPWlqoWxY6kKqbo073PVSpxUJDPknjhyIfv1addFrfLlSQ3tMkrdnPW8EJi+uIylf/lm8My
 n0uNMMD/hLevU1Z/iYDbYPUZKqQ/hUvNP3k0Tc7Qa5hvQWqrTG7ZIQ4vtBFJW/3eWj5PAcqtALT
 82bsJsnId/XhKtex20/4Fqa9lpvB2oXcRoZQtjoPbJY1dX4Nj/jESCxIL8Pn+fdoMVqC7S+/peC
 CfTUYd/lCyEKAIHKxhOGwHoJpHmLyrUCnvClJs+fq42qkk7XhP2QpEk80tqIK8WuO3qBJQJpWoe
 lLTQBuWZw/HFJLlmeL7gneo8lE4VFxprP8V2QZbA6DviPeQ==
X-Received: by 2002:a05:622a:1348:b0:51c:2685:2952 with SMTP id
 d75a77b69052e-51c4c325c4bmr10095781cf.62.1783101952897; 
 Fri, 03 Jul 2026 11:05:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51c:2685:2952 with SMTP id
 d75a77b69052e-51c4c325c4bmr10095281cf.62.1783101952451; 
 Fri, 03 Jul 2026 11:05:52 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:05:51 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH v4 03/24] hw/riscv,
 target/riscv: move pmu fdt function to fdt-common.c
Date: Fri,  3 Jul 2026 15:05:15 -0300
Message-ID: <20260703180538.3346781-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX9agS+JnmkOsq
 OuWHuw4X0tJGASg/ZjBbZFNP+LEMfckJp+eZmJVv+5Ex8Ha2F7wm+HsUz7+cyTohGNspVs6WVuN
 pTB89JzLjUAlY4ur61U04mKirgNey9g4T3duINW0RxWke5rlAXKxk95m+L8jZlIXDwM+AVJ0WAP
 CUsVZ1Dnb9o8Y1v54cb1LiOsqOC+Z3oVxX1G5K8328vxOcnUrgP3lVx4SM3BGC5Z33wARl6aFlk
 WOa0uHHMAWg+IXabTxkMaMz+9bnClzwytCqu8SF/zEC2Xqkw50DJqAzd4WFvjBBMJrrqKjg7TTY
 LcnG1XNNC89rMpGQeqHFKaFwJmUWnWPgQhjY6dEfqFaW8TnAIo0lHm+Pm8hfO9uJG3IqezIxRpU
 ZNkaROi27YI1UvLnniTTAsMMX3UYW5xorILw1AQFAhx+b3Qm4Typx/qdSJQgMvRPtjhMZVUM8xb
 KbjKK204mEc0Un3fVZA==
X-Proofpoint-ORIG-GUID: CLrzAcc7jhOiGLB6VwgS9aEOYdV-69Ca
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47fa02 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=rnC1OXZ3MjwXSMxYyksA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXwBjYmA4TyQID
 UTavkExTETj9q0cwc+DbEvnA0rVmIEa1xCkeWkVi0qp2TfRt2e4CWREPXbbI0u+Hu0bSax7iQrp
 1OWayJ8iG9VrTBQNNWoh34qTGB05xyI=
X-Proofpoint-GUID: CLrzAcc7jhOiGLB6VwgS9aEOYdV-69Ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

riscv_pmu_generate_fdt_node() can be moved to fdt_common.c since it has
no PMU TCG internals.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 52 +++++++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c        |  1 -
 hw/riscv/virt.c               |  1 -
 include/hw/riscv/fdt-common.h |  1 +
 target/riscv/pmu.c            | 52 -----------------------------------
 5 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index e0e31af09b..aa143a618b 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -230,3 +230,55 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
     }
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
 }
+
+/*
+ * To keep it simple, any event can be mapped to any programmable counters in
+ * QEMU. The generic cycle & instruction count events can also be monitored
+ * using programmable counters. In that case, mcycle & minstret must continue
+ * to provide the correct value as well. Heterogeneous PMU per hart is not
+ * supported yet. Thus, number of counters are same across all harts.
+ */
+void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
+{
+    uint32_t fdt_event_ctr_map[15] = {};
+
+   /*
+    * The event encoding is specified in the SBI specification
+    * Event idx is a 20bits wide number encoded as follows:
+    * event_idx[19:16] = type
+    * event_idx[15:0] = code
+    * The code field in cache events are encoded as follows:
+    * event_idx.code[15:3] = cache_id
+    * event_idx.code[2:1] = op_id
+    * event_idx.code[0:0] = result_id
+    */
+
+   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
+   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
+
+   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
+   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
+
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
+
+   /* This a OpenSBI specific DT property documented in OpenSBI docs */
+   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
+                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
+}
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index beaf64e0c1..d808bcc11c 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -17,7 +17,6 @@
 #include "hw/core/sysbus.h"
 
 #include "target/riscv/cpu.h"
-#include "target/riscv/pmu.h"
 
 #include "hw/riscv/boot.h"
 #include "hw/riscv/fdt-common.h"
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b68067cfdd..301f1ea54f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -30,7 +30,6 @@
 #include "hw/char/serial-mm.h"
 #include "target/riscv/cpu.h"
 #include "hw/core/sysbus-fdt.h"
-#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/iommu.h"
 #include "hw/riscv/riscv-iommu-bits.h"
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 017278b611..1729a6abc6 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -35,4 +35,5 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                      uint32_t addr_cells, uint32_t *plic_cells,
                      uint32_t cells_size, uint32_t ndev_sources,
                      bool numa_enabled, int socket);
+void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 #endif
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 3444400bd2..38ad2737e1 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -27,58 +27,6 @@
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
 
-/*
- * To keep it simple, any event can be mapped to any programmable counters in
- * QEMU. The generic cycle & instruction count events can also be monitored
- * using programmable counters. In that case, mcycle & minstret must continue
- * to provide the correct value as well. Heterogeneous PMU per hart is not
- * supported yet. Thus, number of counters are same across all harts.
- */
-void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
-{
-    uint32_t fdt_event_ctr_map[15] = {};
-
-   /*
-    * The event encoding is specified in the SBI specification
-    * Event idx is a 20bits wide number encoded as follows:
-    * event_idx[19:16] = type
-    * event_idx[15:0] = code
-    * The code field in cache events are encoded as follows:
-    * event_idx.code[15:3] = cache_id
-    * event_idx.code[2:1] = op_id
-    * event_idx.code[0:0] = result_id
-    */
-
-   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
-   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
-   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
-   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
-
-   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
-   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
-   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
-   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
-
-   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
-   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
-   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
-   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
-
-   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
-   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
-   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
-   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
-
-   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
-   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
-   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
-   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
-
-   /* This a OpenSBI specific DT property documented in OpenSBI docs */
-   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
-                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
-}
-
 static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
 {
     if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
-- 
2.43.0


