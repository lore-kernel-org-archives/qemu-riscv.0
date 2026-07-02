Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3E1C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpq-00021I-0R; Thu, 02 Jul 2026 09:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpl-0001n5-8J
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpi-0007zr-8R
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:03 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0e7M522301
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sbjdXBK8xx0
 7vpSix5ZmnXRTckFrlQPN+PDg8F2TsJE=; b=iOIioGDqC/Gz7yK6PeCQvgrZUWp
 r4AY6yW/dstu6AoxihCgPXKdIfvEaMDLGEIfGPKuAqIerU59dt5Cecbz0/iEN833
 65FW60X+ul+rl4sB01W75Hd/diZO4rWO2NCIGiMurb1Am3ILdaPh20HuyF347O7F
 cW9fRVw4oOw0AdG8kWmh47ksCnrKMfZu8g9/BQKULgAn7xXKk3QdlvYkiPA4KiIF
 xULGywefyNy+9geCWbXLgNlCI8XFaJtMbJXqK3E+CpD1yRrAPThODCnzzO6XRlOg
 fNwp1kl5dDJR61Qz2sOH0/YAkVqfwYcM4BsIJQJDmj9BGgtfFvDlifTpE3w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc1gg8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:51:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-9693b69c4f4so1537647241.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000311; x=1783605111; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbjdXBK8xx07vpSix5ZmnXRTckFrlQPN+PDg8F2TsJE=;
 b=G5agIHPYz7IkIH4P6TBt3x0fCbm8DO4wYR96hjfjJ3Wq49KTQXwDb/BFu7156juhbD
 6e4z+sDx5ybA7krndiWh28SdIuP90t0cMKv/hcZHDQQIujrojh5Kog8JdeuTxWXKOIPW
 mifWpdHVa6zSJpg8jqzZOktCiIpWhIiVXWw8FlFI56BMowwknewLI4Y6tQKX7vDDfgkZ
 s8pr8+BPNXW1jhD46dS9cONXvnokW12GzAawCkDRR6P2zcSCi+Uk6on23RYTna5qmz0T
 J2P0gVN7Qu7GVffQmzsKXKZwjRY5SZB0PHrIdmtjktHt5PfybbCbkilOB/xWspfyAxU5
 kSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000311; x=1783605111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sbjdXBK8xx07vpSix5ZmnXRTckFrlQPN+PDg8F2TsJE=;
 b=liatILGAAelerTUl8cC+jOlq+eJTGuPOWvzGGmdtiHzaRwZI5tB8DYjmeUDHL2vUSb
 7As/PdT0+U7mPt8P6bl4qBVHTEj5g5KMyUuFgPJXYxm4/qXyDlGgGVFqZH9fohV4xqlG
 ocAOy4bNhQkS9xURTm4ghOhEXGU/WwfctwfzAjUy4WiX6ID6xK2bmvHLeDwuj4j3tfGI
 N9D5iJPi5mp6UPUGyhamGX+bM9UQ2ZaO+Ipb3S07WQpTcj8ugso/c3oHYjYAcnX7+C0w
 ayfa0EEMVi+KCDnGcJdEraXAmOU8c2sEQFt7u95OraJoFl+49+WNx8CAX0a73hoYrkxW
 HqHQ==
X-Gm-Message-State: AOJu0YwkCKRziKgOcX84fga9oDGgUMOpYteLXQvSgXepAKVQ+1XUemIN
 kiiTydGL+oowtROKUE7x/7Ubjt4NgBS8HQOamjW3vrwAXlJLF9tAyPHT+/i8ABVCNDQcy9E0MoJ
 OVsyST4IEsIDI09/yCpdebjzPpG47HsEu+2VyAOpRMRsfZGTHdH+m603ptA==
X-Gm-Gg: AfdE7clqeshCDgs+clohGRWvPGmyL9cevsEsUXYn8vOpprFAVZ96d0iRA8PicU81iaQ
 HYi9uNdriaVGWHexLbnymVAcYQkE9lU6NZIu8S6uoq50rvzXRFBrX36n3FuRsKbX46bKsB34n2g
 NMBXNr+T8747wbwDnxqGQCXgvDWjUVsV91GycZ0dQvj4eWf1CWd2iOGT6Bwv33ZVMDCu6A+l8gk
 1OM5V4EQ8/7+mw75SlspJT3XYBkjQOKEd8ZY+3X580FfsF8k08cUz507vVNzavJBrTL3dTXLLHo
 76Je9EsWzYOpmg8HEtvEryfyDEDF9zLgWEtrwHjrlZyUU/VavTm//XaXnz3lOpRIYzGe0A5sSdZ
 L38XuF8FCYuGEV42B0qjt5QNlFW40nwLrFmEDEpywKNy8zA==
X-Received: by 2002:a05:6102:3746:b0:631:2624:e5e7 with SMTP id
 ada2fe7eead31-73da95b0c21mr2608415137.14.1783000310421; 
 Thu, 02 Jul 2026 06:51:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3746:b0:631:2624:e5e7 with SMTP id
 ada2fe7eead31-73da95b0c21mr2608383137.14.1783000309756; 
 Thu, 02 Jul 2026 06:51:49 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:49 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
Subject: [PATCH v3 06/24] target/riscv: move pmu.h to tcg subdir
Date: Thu,  2 Jul 2026 10:51:08 -0300
Message-ID: <20260702135128.1188021-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eUeCsJWJ97Qh5V3gKcXS3S46uwqRxDi4
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a466cf7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=KqZ3gCmnYdtU6Ji4SLwA:9 a=TOPH6uDL9cOC6tEoww4z:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXz7sJ73ZZnJ3h
 OFcEi/jtelpHuoDph5ResEz2sybkgkrGkSHLq1XMysJLtHHg9/piMoZro6lOZ1X/H/JGu7BEXk6
 w1d2eao7KohMEHYruumwclIq0qBJ0P+EEJsCgk05H7KVAdC9YZjLOi7LHMDpAQ4cTmIHbvwkzly
 sNsN5Ujm3DysYu2LhT8ETeAjX35fa/m9XYOlDWlO7hd+7+3N2HhamW0KUUjkw49yFzHfTLDKc/1
 54MeW53FgU9jBnZueRyrJj1NNDIZkYmB3tc72yc735ZoInDqQscs2Em7DjRRDzwe3nA5S8v+KEG
 etpAzihsGIF3LLHeApaY/3yMAUoUQ7zIjzXI0wKWKkV0IQtFZp/NFolPFGS1VVtcHO+KBwr987q
 f27aJU10EN3de7laZgkdxxIx7P9dULzf6mBiJwlLjimfv2x+Jir6L3ZtI/YCQgDL+ZkY+CkjZJd
 umOlZSORIYdqZi5iktw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX584fUrZXC7U7
 3kciKp77wHqSyrxhYOo6SSImP7jZo3tRN8Z3RuCBK5wMC8KePnjm347dgKGefBGtGHWgBQBrs4F
 Q3bmCDb3Fz9R1PKczYahqrfKi7o+P1I=
X-Proofpoint-GUID: eUeCsJWJ97Qh5V3gKcXS3S46uwqRxDi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

With this change we can remove pmu.h from 'virt.c', which is now
becoming a tcg header since we're moving it to the tcg subdir.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/fdt-common.c         | 52 +++++++++++++++++++++++++++++++++++
 hw/riscv/tt_atlantis.c        |  1 -
 hw/riscv/virt.c               |  1 -
 include/hw/riscv/fdt-common.h |  1 +
 target/riscv/tcg/pmu.c        | 52 -----------------------------------
 target/riscv/{ => tcg}/pmu.h  |  1 -
 6 files changed, 53 insertions(+), 55 deletions(-)
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


