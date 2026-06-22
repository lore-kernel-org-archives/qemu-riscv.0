Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F93ACD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNV-0000WF-1m; Mon, 22 Jun 2026 15:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNT-0000V8-Qh
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNR-0001p1-8b
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:15 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVjew3842403
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=C2rMfFWTL/1
 +5pznB7RLcCvBAec1n4x9PcUZHGb/jms=; b=NUZNSLa42gmlZzIirzNf9KkA4ih
 oRn4d+ENuZQlCPBavmvc+jzS0Sib5Mw24ddC+FpFs10lONPIaqCnzz4XxkIX89ck
 cRMvO8CP218wCy5qYtYwR6zJKy1v+8H7ySm8C880o6BEljP9NpTZ512NWaVW85nC
 77VDrUe+1z92MqPYPq47pawhIMkbqXGyv2NKy7ijnSrjkHNf+imS1B5xvHlOF1wU
 V4PI7qDTH83ax65EZaCN1IEjkLVwa7yhit1qqkdkwLqKH9ziR1hgtn7+mfNIFM7j
 dmYHBK/nbaliacns0VqJj7UqACVlD9w8Ylgg+qHJaugqjJqmkoWqQfocytQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yht17m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92229624a71so462923185a.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156731; x=1782761531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2rMfFWTL/1+5pznB7RLcCvBAec1n4x9PcUZHGb/jms=;
 b=KXM/LbfmlJFBOU3r8pFT/jQV+U5FjXiXxyZmCC44VQI8EKWmC6qt5zXrjBYbDv0sqM
 cd70BFikoJLFmEHwjl1rdV1z2SVOJoq0Kg5vAWYcypJsCuGRj2yW/NH4MBddBw94heM1
 usHuBZeHyN6n+R1SYxFMsrz2CSQwWkiptpApqk8Olqj4hi/MOgfPP9WMi02kGXBtheOi
 WEMCivPhKi3CcFZTwhGMVnZT3Ts6CV5Y9eWLEYjKrj6hU6TikM6RBgnO5nhOtIVnPbJ1
 qgho3sy6BoKVLDVIR+QadqfwDy7D3mDW54ynBY1EyV4qzHesKrKzMwfVty6o9QVSfHzv
 QylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156731; x=1782761531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C2rMfFWTL/1+5pznB7RLcCvBAec1n4x9PcUZHGb/jms=;
 b=GAaf4KfVvtp3FuMc/7HRqG1c6AmxUlP5TFMeU9W5x2MNUzfCzN9zH6g7wBFRVV5/Sv
 RN0Gq/Xm0pi/itYriof8/irkNRvn5OTmvIB4TNibLYR4lQqCb2rNoO7xewwqk8z36QWn
 AnaNOOb8n5IkTtM66XR/JS2wzZZMSY79aUJTlBYxEHCIhA0K199z1sai2Q9vrjJSdsEv
 XeEg69F3TgYAqklnZGc0getQj3e4FtHbaYqxmf3lUvywJINFZR+MBzy8klnpyosJCDIP
 LfiYfc7oAzCMZoYdqlY2vuGB41C+sU/EZH3fo6hVuAZFwMDCGXjgck7CgZ+j30uwoP0V
 gEiA==
X-Gm-Message-State: AOJu0YzXVhlAwndyEB2XeR7Azh0Jq0/J+2NKwmSzbEbRFr7w4tfq4VR2
 SV0+BOzh6wutb8UNjiK0Wm8hlNclG+qoB6UrFIhky2UHOtQR988snuUAZQldb0yP1n4DiLcOG6w
 Uj3R2JK7dCLOpF9F+fKhakng5h0DUjoXFb0ZD9aNEnSh0whw/KkfxjMC6dQ==
X-Gm-Gg: AfdE7cnOd91WzLqx6ZktuATzKMA5phEuXCHg31uAw1NKm/6phclETow+7dDegUW82fv
 IWDO31JOLGgI3jyiEXwypIZbUgvpL2Xm5BBSYjWv6vBF/vpoquYLaIvtFEvC9HcTSNAm2meH2XP
 gjXI29Cdg7nlbSvAfWxWtw+qdxfGiD7spjYEdNy7Oh1fj+h1CeldFddNgKdhLvOxTDWhIuSJxvS
 +Tn9C/bbBcmEBW3IMfx7bcQpdu3byo9GoCV9W7o3YZG2uh7WqmpX0iPEhNXTvjSS66dtn0c3vNV
 mKUKHK4U2IEZGg4C0ZV0MGP1UE5jP37OU1eppV3c4OPjzD/tqCcsU2nfpoTb93Ty4xmRP240Bi/
 jjBTHTMQJWgmSQC2t/sf4p5i//GSV8V3whOvqijgumIBr8g==
X-Received: by 2002:a05:620a:2954:b0:915:9984:5781 with SMTP id
 af79cd13be357-92091395713mr2712043585a.51.1782156730507; 
 Mon, 22 Jun 2026 12:32:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:915:9984:5781 with SMTP id
 af79cd13be357-92091395713mr2712036785a.51.1782156729863; 
 Mon, 22 Jun 2026 12:32:09 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:09 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 06/24] target/riscv: move pmu.h to tcg subdir
Date: Mon, 22 Jun 2026 16:31:22 -0300
Message-ID: <20260622193141.1449724-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX8KLOD+Z6Gby4
 rAvZfQmFqeByVjo2v7TCzzQrwWeyalhB44IOCKp40BedusNli8kk3We9q/vC7S5b/6BDHxVy6Bo
 VKmTmhNTJuhqjeE1P3ccF5Ka8JA/n9I=
X-Proofpoint-ORIG-GUID: TBV3oudOUCeFPLCIpBpuGXy60MH1-gzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXxmTQc8aK01UR
 jY8nAKNxrSP1DqVY/B9HCvvNScQ7iUZU4Dkn2knhWrP5/limS2jHz0UkdfLo8eJUNV3CpC1tyvQ
 1CuKmnV4LEhckVBK4ivGxd4Hk+MiV1lYnaJR3HqCLbAvTLXLTi8uuhYNVkv97qA+qJ85HQdpyAN
 Nd0WWVVUz+1AFkxaBepJ2polR0c2ypoRpzxg1IBv4cO1KTKJ7MsjrPcsJvaP+3Thv+t59SavZnL
 9DwwjzUUIGe8mysAAs/Yb+NAsX+4CJTbxfYR/pl9NMgcmtjLqx0MC+XPWAjsIOn5yv+rxU3omtH
 LTGSxS3q40FMa+3J31pMr+VycqnKiUGCFkj+p92wntE66AorJIx+fqdKAn6+VGUe+cxo8qOKZIF
 xoi3XpJCZKxmBa65VIDHq8+bnblSP+pxXTT+RZd2f81HGhHXe4RPb/6wvXyyk5SCrE/CPWYHtC+
 svF/iy9Q0R4PI6c1Y2w==
X-Proofpoint-GUID: TBV3oudOUCeFPLCIpBpuGXy60MH1-gzC
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a398dbb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KqZ3gCmnYdtU6Ji4SLwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220189
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

riscv_pmu_generate_fdt_node() can be moved to fdt_common.c since it has
no PMU TCG internals.

With this change we can remove pmu.h from 'virt.c', which is now
becoming a tcg header since we're moving it to the tcg subdir.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 52 +++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               |  1 -
 include/hw/riscv/fdt-common.h |  1 +
 target/riscv/tcg/pmu.c        | 52 -----------------------------------
 target/riscv/{ => tcg}/pmu.h  |  1 -
 5 files changed, 53 insertions(+), 54 deletions(-)
 rename target/riscv/{ => tcg}/pmu.h (95%)

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
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 92c30a6f4c..a1cf8210be 100644
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
diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
index 3444400bd2..38ad2737e1 100644
--- a/target/riscv/tcg/pmu.c
+++ b/target/riscv/tcg/pmu.c
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
diff --git a/target/riscv/pmu.h b/target/riscv/tcg/pmu.h
similarity index 95%
rename from target/riscv/pmu.h
rename to target/riscv/tcg/pmu.h
index b4f1e469a2..de2fae1fb4 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/tcg/pmu.h
@@ -31,7 +31,6 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
-void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
 void riscv_pmu_update_fixed_ctrs(CPURISCVState *env, privilege_mode_t newpriv,
-- 
2.43.0


