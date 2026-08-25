Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8A1C61DBD
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 21:25:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyydD-0003rX-HR; Tue, 25 Aug 2026 17:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyydC-0003qd-5l
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyydA-0002N9-DJ
 for qemu-riscv@nongnu.org; Tue, 25 Aug 2026 17:24:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67PL9Y1p3675665
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wnP82xrulJP
 H4SceLT/7zH5771Vh+GqItvqzst16sMY=; b=mLhbNWe0iaycBC/T81KbYxudJ8m
 yijxpR3m9SIjmk8qoCCxJdDzd27Kbq8Z5UZhOh8gr7UpXCs69Hz61jpWZwVpVOld
 WYYYAyToxcUcln9jIaXDb1gSiZOcMQjcruH8fcS4Pc3NH6BsmGCsNgat1j6KV0XM
 RCBfpPSzbkwfaDsPxVBunK9yNA9XqaYPe75OWfIaSps8YMzOY93awGIMQZn/c8FR
 rmy35ywatuOSsbLcen6asJOcmXizl1NAYJi33tPQdlHky6xplTDJRcj07785TPXl
 ksTe1SNUGbwCa7Hu/mv1FOWhrnpvyVYY4+qmdjl4gG0r9rmbn7g2LTPbUhQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxgtkf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 21:24:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-904c1d588bbso3530766d6.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Aug 2026 14:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787693056; x=1788297856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wnP82xrulJPH4SceLT/7zH5771Vh+GqItvqzst16sMY=;
 b=QPwh5tjN7eja7LYF73wdt4od27dXMQYtZtQZP+00FxtGUYevWLtmt1xYMGCIwgauGp
 8hPmF7X69Gu2kwnnPTLAu4HYVg0kYDzqJ0/Zmv5MakOOh0mTHUazHXhUzRrzrdh03YGF
 aaWyzCBV7X3ZQsxoE4nbuJ8yuqrHuDGmrhoHendDSKRpj9nAWviDuEr7C3Lpj4+T5Ffu
 z8qurn6fL+8Sgob6jEuf2/kuk+fgSil+zCqG82n8xFD3LE0ej5LomY3StojygYpouiz2
 cijieiep3MLA3rm3CKJbcN30pJCzMVM6pKPQfKfJc/rKrw55k8XzygeA3Yc2M8SOhcHj
 meMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693056; x=1788297856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wnP82xrulJPH4SceLT/7zH5771Vh+GqItvqzst16sMY=;
 b=WKGqrZ76E0yRMU/HzDIOpcWbLRQ/Sl85jEn+fqPo1jTPUa6EW4Zs3Ic294ieMmVZk5
 hkKtnEGE3eZ9FTg2VXrIQsybmpUG+miBjR4Iz5uoVPdoFxFIISihy3zNeSe8VQmt7Eoj
 E1HSgTBPs0mq6BpwdO/gt/98GdJdfC9VtsG5NE01ask7w1qA90BxEGuyUWtyYQiWW5EP
 7LrbpavxsuJn9mtEXDDnd2ZqbbTgGrfcVd1gro1NnitQJswr/kDvoNptGkMlG3vUBtc0
 15fTpGgDfpKxBo2p2FNA27IMRUIg6x0ueHnsl9LDDkCIezwB2dfRuNWi0tK4t5njOpIe
 +Pyg==
X-Gm-Message-State: AFuF++nnI3gcum2lrw0IJ9btQNJvNOp+QwMEE8xdDnhbefejwSLaEGD+
 wDwjtDs1PmOPuWxi7T+JaAhGH/eHnuwGsW0bdZHZq7auUf68AK71sHUHB/Boq7ygdHUkBZj8VsU
 Ak1WfGasdialVl1bMwVGijLRDvZycGvmUNMcmgcOJxICCs4DmjCvYo2EQIQ==
X-Gm-Gg: AR+sD12AJp5aZpeqGnknnYsPXHL/gXG+Y+f30057hwcjuyQStuYGTz00dMoBAQ3Zf/l
 MiOFwLOGYXOA4mQn622Dxyx028SO2cubYoZlUiTrI2TKh38g5K29YUYMoD5Thska8T5cLUU0ZDG
 0/numXuZ+r2Jnnq0u9yIBQyGdRQaFpqVyjHpO70Zl/NAo6QltLdUtIJfmBLBqB+bc99K663ZMbc
 I8xx8UxMidF9cIUv/upbIcNc2XtXDsQ5MXzfu99aYcQ6fniiB/T2jiUPGCoagpmQF7id6x+b3rS
 vhqgdR4qurTKWG+vRrRQ8wh/cHMPtGCUTdwKa1YfEKqeXEoDudBrVZmOhZ/LBaWSmeLvJugMJ9L
 srMkO49dspSbMt8/xkvo2bsEdcpyzZkDUgMpB/Q==
X-Received: by 2002:a05:6214:4890:b0:907:be64:6b76 with SMTP id
 6a1803df08f44-90cc6aafa7cmr27569986d6.12.1787693055852; 
 Tue, 25 Aug 2026 14:24:15 -0700 (PDT)
X-Received: by 2002:a05:6214:4890:b0:907:be64:6b76 with SMTP id
 6a1803df08f44-90cc6aafa7cmr27569406d6.12.1787693055400; 
 Tue, 25 Aug 2026 14:24:15 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cc65299f0sm8646386d6.41.2026.08.25.14.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:24:14 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 13/13] hw/riscv/riscv-iommu-sys.c,
 virt.c: add create_riscv_iommu_sys()
Date: Tue, 25 Aug 2026 18:23:25 -0300
Message-ID: <20260825212326.1907-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e0800 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7ypw5r5HuOgaF4lO-pgA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: h-leSzUHsyNJLTHEomSvch763BUaC5QN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfXy7HSUkkICt9U
 TCWJJX7zvMiB56QygCw7nkOmfqR6Rk88UWRHc9yqwb+LOTDxu4tbhKPqXTxc9guC9AKzJjqeQVS
 6I8xEQp9FI58F+kjg83/tqCho6Te7T5Tc2GNs3iqAmA2eVvb9FpbO/rxkEm5yKYtJFjBatwvbm+
 Y4XAh71BNRQd6/DerMdiDRq735yv1NeDQsUa362CropB6PnEERw7D1RFpHwuhmmMUFLBKNbHAK2
 2RjS9q5IofkWHZ98DDQDid+/ZF8svEQsLPqHaeLfFxQNYeMepvpRSTlaVqnE2BmNDDXLDpwib4z
 lMgsfEubgWb0He9a8pcsWoWEFDjs25zommL2hg3GpH0Pk51XZ67HxZPghPvmy7xQbBtw9MCNEkN
 HIRQIhSu0rlbfWHGaXkvMF/3TrN47pL9y1/cYNt9mLP2ee3r70ZAEWKaBu4QkjmFuAlpJUAfrc5
 OSqhO0LR4Ni7ONWHRaw==
X-Proofpoint-GUID: h-leSzUHsyNJLTHEomSvch763BUaC5QN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4MiBTYWx0ZWRfX2St8F8fYgFJh
 jgX7njqsPiBfWSNtuUNHMG2eWqiKy45y/WHx+0ktMmj5KoProhF9GAjUu59N9YDXyfLqHPlDk43
 kwsZ7ahvx4Dh7KLkono58ivZXVlIrUQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250182
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

Move the creation of riscv-iommu-sys to its own file instead of open
coding it in the 'virt' board.  Other boards in the future might want to
use this device and we want to avoid code duplication.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-sys.c | 25 +++++++++++++++++++++++++
 hw/riscv/riscv-iommu.h     |  3 +++
 hw/riscv/virt.c            | 23 +++--------------------
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
index 3314adeed2..258c171efd 100644
--- a/hw/riscv/riscv-iommu-sys.c
+++ b/hw/riscv/riscv-iommu-sys.c
@@ -217,6 +217,31 @@ static void riscv_iommu_sys_init(Object *obj)
     riscv_iommu_set_cap_igs(iommu, RISCV_IOMMU_CAP_IGS_BOTH);
 }
 
+DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
+                                    hwaddr addr, int base_irq,
+                                    bool is_32_bit)
+{
+    DeviceState *iommu_sys = qdev_new(TYPE_RISCV_IOMMU_SYS);
+
+    object_property_set_uint(OBJECT(iommu_sys), "addr", addr, &error_fatal);
+    object_property_set_uint(OBJECT(iommu_sys), "base-irq",
+                             base_irq, &error_fatal);
+    object_property_set_link(OBJECT(iommu_sys), "irqchip",
+                             OBJECT(mmio_irqchip),
+                             &error_fatal);
+    /*
+     * For riscv64 use a physical address size of 56 bits (44 bit PPN),
+     * and for riscv32 use 34 bits (22 bit PPN).
+     */
+    object_property_set_uint(OBJECT(iommu_sys), "pas-bits",
+                             is_32_bit ? 34 : 56,
+                             &error_fatal);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
+
+    return iommu_sys;
+}
+
 static const Property riscv_iommu_sys_properties[] = {
     DEFINE_PROP_UINT64("addr", RISCVIOMMUStateSys, addr, 0),
     DEFINE_PROP_UINT32("base-irq", RISCVIOMMUStateSys, base_irq, 0),
diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
index da70e8bfa8..7c470ba084 100644
--- a/hw/riscv/riscv-iommu.h
+++ b/hw/riscv/riscv-iommu.h
@@ -104,6 +104,9 @@ void riscv_iommu_set_cap_igs(RISCVIOMMUState *s, riscv_iommu_igs_mode mode);
 void riscv_iommu_reset(RISCVIOMMUState *s);
 void riscv_iommu_notify(RISCVIOMMUState *s, int vec_type);
 void riscv_iommu_fault(RISCVIOMMUState *s, struct riscv_iommu_fq_record *ev);
+DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
+                                    hwaddr addr, int base_irq,
+                                    bool is_32_bit);
 
 typedef struct RISCVIOMMUContext RISCVIOMMUContext;
 /* Device translation context state. */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index af9de36726..9b63e4af60 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -32,6 +32,7 @@
 #include "hw/core/sysbus-fdt.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/iommu.h"
+#include "hw/riscv/riscv-iommu.h"
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -910,26 +911,8 @@ static void virt_machine_init(MachineState *machine)
     }
 
     if (virt_is_iommu_sys_enabled(s)) {
-        DeviceState *iommu_sys = qdev_new(TYPE_RISCV_IOMMU_SYS);
-
-        object_property_set_uint(OBJECT(iommu_sys), "addr",
-                                 s->memmap[VIRT_IOMMU_SYS].base,
-                                 &error_fatal);
-        object_property_set_uint(OBJECT(iommu_sys), "base-irq",
-                                 IOMMU_SYS_IRQ,
-                                 &error_fatal);
-        object_property_set_link(OBJECT(iommu_sys), "irqchip",
-                                 OBJECT(mmio_irqchip),
-                                 &error_fatal);
-        /*
-         * For riscv64 use a physical address size of 56 bits (44 bit PPN),
-         * and for riscv32 use 34 bits (22 bit PPN).
-         */
-        object_property_set_uint(OBJECT(iommu_sys), "pas-bits",
-                                 riscv_is_32bit(&s->soc[0]) ? 34 : 56,
-                                 &error_fatal);
-
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
+        riscv_create_iommu_sys(mmio_irqchip, s->memmap[VIRT_IOMMU_SYS].base,
+                               IOMMU_SYS_IRQ, riscv_is_32bit(&s->soc[0]));
     }
 
     s->machine_done.notify = virt_machine_done;
-- 
2.43.0


