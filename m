Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D80CD98E2
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:42:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE4Y-0002zY-4Y; Mon, 15 Jun 2026 16:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4W-0002wy-6w
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4U-0002CA-Hg
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:15 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FIxDsv844400
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=H+CiaQydSRg
 YrdmSW4px1udYdyGA/nnrNi526JmSKpI=; b=ByeQaCD4X0GO+31HOG1wKnaI61D
 kdBs5VSKusp0nZQ6Xt7Rmi9k8t8cGdzlDR8fIjCuMAznvwDWwFsSbuGygiSEhXap
 IXx1gLBodhW2kXUMHNVjhM7Pl/OUgiVwTqQtRa1xFGVyUB73jVmbvJqBco/eV66t
 +MRZh1bH6VhwuMKJaYlLQniUjUy+Oj3J3MLRBhFCZPMrci/1BI1HFAQI/uPWN3yr
 eRVO2Q5Rj8+NkCFNORoLT0863MTVNkN72OuGiHw77hPHBH5C3D36orGdTJPbGzrC
 K2V9B0HX3Mu6KJ5VXqrvQ4UOKIriF1HyQTLEah7+VpO/hB1mrNFX7+Jh3fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter02v9h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915f6ff639aso1066609085a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555881; x=1782160681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H+CiaQydSRgYrdmSW4px1udYdyGA/nnrNi526JmSKpI=;
 b=fpX++H3a7bDnTjTtwhdxuZpVBxJJx6ytr4N7MBASsS31d1jmhm7f3UoRtWUY8bQglD
 SzwJEpRjF4yQ2DwGUC+daZ4harVabkKq0nmmXaaahFY1/4fbPkWw7pnt5sJ9OgkNnLrs
 Mkz2xjOEz//Q5a4oxqFlPoGcQ0Xz/Kpdp9j85RmcnIN7MrzagNpjGrPoop9JgA5ED+Ot
 mF1hL1CBqk+XbejrZ5I9JNwqFAQ+OzT2P8Kghpe7enilv0EOqgpSdPKYejx+KaxZeNLC
 LK6DF5zXycFTN3RwUNBzZlfM00N7eHESIupHaJ3x0G6+FC/+r9alUuL+RDhQ8M5Z5r/U
 vFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555881; x=1782160681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H+CiaQydSRgYrdmSW4px1udYdyGA/nnrNi526JmSKpI=;
 b=gbFkBtRLpiVlvkXLhf639Ss4tg8D2trFVqOCTExPgtRgWV/btMZptP1k5h5tPbke+W
 GVIJcRKDpr5Rkh9gMmyTPumwC8RzAgp1xb4+pXDvXH0S1fCwWkMUYke3r44f1ZN7oiCX
 ESm3xz9weh4yY/pkBTDiVUNQU2KMqy5EH45E/BfSYaYkHsZwsaMhl7S3ud8IK3fXC04N
 qNSZ5oQ6ORWrVY/Y1YgYppMfLqTSdF4awcZdATaYFHRA8BcxPNkRdqmewj/P+MN+1r9E
 A8Kn7Chx7c50WaqwIPz6nGbg3hNk5AqFLCDCprSoDXtO5wgf7Y8uKXeHmn6V+lduTW7c
 s/CQ==
X-Gm-Message-State: AOJu0YzRLCTmn2IxMAtOPxiOuEkvo7mUcWTdgIuTcfpzJHGU+jjflAVj
 rsg0cK4DqobxRb4hNahP6uVyGOA7saJ02BpcQmcqf4/Pe8nse5xUA83nfBF/awZeCjO51YVCSbr
 gSq5/pmbb9nl1cztSaArKiNpzAYOZnE8U0D0XMesrzIdN63TwWaxaD0S7QRVXo7dIFQ==
X-Gm-Gg: Acq92OF1eMMCLbWQT1CYYF31MzdOlV3W15wSvp6j7/c76L1haQUdrKTGias543gLmvo
 UOlUhSciQDQzQXH/NNuRf543KWhisTZWNwo2SOVTNjsR7977Gpqeep10YRUYBUB7FsU7FOAYN7g
 hwdWo6uaf9/CxYmdeZUAEaoexITePDVwsWnIjGr5SRpScKD8vZLh2zbjPrFn3l/dfahbi3nLyy4
 MDY+ZdWy0wn8x5bwvv+VG05K5aJBG6O/rt5ycF8NElcEEYhQe3wQ4Tu4fUb5EIguUARm+gU7QGk
 QSguL2l05hXU/mIpwahu2DI+lBhxVuhVci4ziEoN0X5lKCQGJrUN8MKcXkRySLY+XHcwTIBdNoE
 pUZPzV/1J9J7lOCIMjRacDSHH8VAn5U+cKEWZeMhZiuf3chIHsAHxitHPJkA=
X-Received: by 2002:a05:620a:29c4:b0:915:c271:f91c with SMTP id
 af79cd13be357-917eefc24b9mr1924134185a.5.1781555881179; 
 Mon, 15 Jun 2026 13:38:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29c4:b0:915:c271:f91c with SMTP id
 af79cd13be357-917eefc24b9mr1924131185a.5.1781555880756; 
 Mon, 15 Jun 2026 13:38:00 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:38:00 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 09/13] hw/riscv: add fdt_create_cpu_socket_subnode() helper
Date: Mon, 15 Jun 2026 17:37:29 -0300
Message-ID: <20260615203734.954428-10-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cnTIyLs3PM9CRJbAjnlIjLLpUktf6xMj
X-Proofpoint-GUID: cnTIyLs3PM9CRJbAjnlIjLLpUktf6xMj
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a3062aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZUnHjbZhF9rK9nf7AcoA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfX2ns30z7t3cyO
 TcXD61C/mSPEcO1LVt/TQ2Qm6Nei2Q0RGhp9oNWrBR9CIv+HIxx6wgbJZUlatJXoRYyvRQdyVSZ
 wIumgMs6CGVD1KqAeUU1W7Y6c2V7uO5W6IA4RKbcIMyR+fNIc7kIfst97Ryg8FzGzJYeFgdDrGB
 pVdZCQ+UeVQQ7H43r6YBVA+3L7kq+kHsBAjTivK6VqT+EKBh2DpilEi9ot6YA6R4bnx1K4BU0CZ
 jITnJB65QbZi8bck24sjhpNU1SFH9EbaXFnf8khWRv8Zl9qxdnEE8FuQcwgaACs7urUrj27NjYg
 mHbFXJx/MlxkXfC89YYxRwy92wpGnUd5psqIbQ2/8U7X697LDcqGDaJM6fjLLw9LIW9HTC0G3BE
 zuzBAb4JJgpbIjIlWvSlw26ajecho2djRpnqPAo+ZWKx/ElfCUQSaOxdlq+b9PmEYZ4N0cJLjUt
 /NqDB5pnJhsAaemb0GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfX4Lb5yiYL1cOa
 PRBihNTsmfKq6tYkkRSh9JbicrpRmQTnd6pbErHjois/NOCsBKA2Ijwunuch96jgh3ONMS4nxm5
 4sdgsGFu06pdfHYSXHV2pcEWS8P556s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150219
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

Consolidate the '/cpus' FDT root node creation into a single place.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 10 ++++++++++
 hw/riscv/sifive_u.c           |  7 +------
 hw/riscv/spike.c              |  7 +------
 hw/riscv/virt.c               | 11 +++--------
 include/hw/riscv/fdt-common.h |  1 +
 5 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index d2661ec389..02ac9ddcd8 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -83,3 +83,13 @@ void create_fdt_socket_clint(void *fdt, hwaddr addr, uint64_t size,
         qemu_fdt_setprop_cell(fdt, clint_name, "numa-node-id", socket_id);
     }
 }
+
+void fdt_create_cpu_socket_subnode(void *fdt, uint64_t timebase_frequency)
+{
+    qemu_fdt_add_subnode(fdt, "/cpus");
+    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
+                          timebase_frequency);
+    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+}
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a4265fed0f..27c1a74d99 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -139,12 +139,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     create_fdt_socket_memory(fdt, memmap[SIFIVE_U_DEV_DRAM].base,
                              ms->ram_size, 0, false);
 
-    qemu_fdt_add_subnode(fdt, "/cpus");
-    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        CLINT_TIMEBASE_FREQ);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
-    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+    fdt_create_cpu_socket_subnode(fdt, CLINT_TIMEBASE_FREQ);
 
     clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", 0);
     qemu_fdt_add_subnode(fdt, clust_name);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index b15188fb07..ee8232f734 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -73,12 +73,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
     }
 
-    qemu_fdt_add_subnode(fdt, "/cpus");
-    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
-    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+    fdt_create_cpu_socket_subnode(fdt, RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
 
     for (socket = (riscv_socket_count(ms) - 1); socket >= 0; socket--) {
         g_autofree uint32_t *intc_phandles = g_new0(uint32_t,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b134f11266..6641b60131 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -694,14 +694,9 @@ static void create_fdt_sockets(RISCVVirtState *s,
     int socket_count = riscv_socket_count(ms);
     bool numa_enabled = riscv_numa_enabled(ms);
 
-    qemu_fdt_add_subnode(ms->fdt, "/cpus");
-    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "timebase-frequency",
-                          kvm_enabled() ?
-                          kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
-                          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
-    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
-    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
-    qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
+    fdt_create_cpu_socket_subnode(ms->fdt,
+        kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
+                        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
 
     intc_phandles = g_new0(uint32_t, ms->smp.cpus);
 
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 6e81d6cd6c..27020e69c6 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -18,4 +18,5 @@ void create_fdt_clint(void *fdt, hwaddr addr, uint64_t size,
 void create_fdt_socket_clint(void *fdt, hwaddr addr, uint64_t size,
                              int socket_id, uint32_t *intc_phandles,
                              int num_harts, bool numa_enabled);
+void fdt_create_cpu_socket_subnode(void *fdt, uint64_t timebase_frequency);
 #endif
-- 
2.43.0


