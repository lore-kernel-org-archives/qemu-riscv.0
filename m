Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A285EC61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:40:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03N7-0007nC-J3; Fri, 28 Aug 2026 16:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03N6-0007mr-2x
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03N4-0006pE-K5
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:19 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJ7BSH3675258
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jn9iXpKYNS1L6RaSzUDnHO6ijMZ0oIaALhAL7v8dv7E=; b=KM/wX79uvSmfIywl
 PhyCNFGyszYGioKO5jN56hZnvMo2OAkPVNMjv1Ef37yUt0aH5+jlC7MCaOv131LK
 FThvKvaiE9w+qt001J/UpdP6drqHMSQSzuhADxde015sTI9QKpKpQGofcTmglxY0
 +enoVDCnJxKCWZihigHb0806z4usaDoJVQFb0hOVpNUZtTTq3TuAwdRHX5sTuLBS
 /Av7hX071AO7lv1BbZ9PGjjZ9If6iR7XI3sWreTxwgf4OiFjAHIh+C2MtpiOZOlV
 qzDh3/33mJGg3yvIhEgN34im01sExYh4xx4kobUqef+X2Pn7/W223o4XUNN/0JOy
 0cUTvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs3jk1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:40:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-933023a5980so250296185a.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949607; x=1788554407; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Jn9iXpKYNS1L6RaSzUDnHO6ijMZ0oIaALhAL7v8dv7E=;
 b=MhWtxo01i4dsUzS8WztMUfdRvduv1qgBlqVD6vOirHLmCS8sS1UMa4V7KygN/Jv5Bq
 mtVBGx76sU08GlRKlzW94VRQRXOHLT/9BsjXe7c8PxZ2NbqcwA8bXka9cgwg23jXPOGn
 rpE4ke+Dgm+xmyeNXDNSxPaYoJl3drJPIrzZDXREg9qsN3rCWBN79oK2fJM4G892MJyz
 W6P2gMArHvBDcU10b/+HWU9uG1NFMWPTUZ+8dci+fz7nT9vauz3JdvxQ3b4UB/5NQZ/9
 uhRMkNxX+UnO5KVE8a4cJVYX6tHxEtFVCTjm6f6mK3bpoacj4LOMHgVZ7gyBKZ8fiRcV
 JaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949607; x=1788554407;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Jn9iXpKYNS1L6RaSzUDnHO6ijMZ0oIaALhAL7v8dv7E=;
 b=AysCLnqUdwKhnJdbw5z5vUloj2y8DaDZDpF2IopBUNnwNY/4ejS2JDjpFr44Uy63dC
 5Un7jJ42z+PGK41sKmdXqPW5Mz6PWJyqjGpSsuyrN8i7oiLT62kb2rq3io4YvseUjuMg
 IoQ8xbPx29V8Vp399BWEeViS5YXiyYfJHh7zLvWcbafQwLQ5NYMcinGR43jap/a8Us+Y
 ZJ3yKxC4qKV2Vo4N5O8eq/lRFPM8Mly72VjKQEuis+atDXvG/FR+Uq6W7vS/AAPn8b31
 5Gzdqf+KLrrfR07zzQr95Wsd8qFOga1JRliM1MUrhN0oxAhOHgjx5Px7AVAGORh8yCL5
 cJ+g==
X-Gm-Message-State: AFuF++llvwN1MoaWchXZlWkI+5HHreZmRJekqhV0jflqQAfFFqT7hsCI
 ZI4ju5Jl8PPqEICg7qsVlzfyb7N3uCeI9XQhkqXp9q6kzS0EFG5GcCfxWJigTCVvnEeTSantLrv
 hcuytVx6zLAHxm2/XTxLgbPFMu5MwLbkSPWq76X2aXYci8WX85YzLPHUblQ==
X-Gm-Gg: AR+sD10GzAb5zzWSbbTl0/HFj4WUm1N/OCksE1Qt54KJbiNA9wRlZiLXvrly2po/Fb0
 NuI4tlESJAYfu7Zjp/C0TznVRx469rCFRqOgoOjwMqsyyLq18AAYu7xrEfbNCIQ9UPTKNCT6k0r
 npMDWbZVdA3cU8SuPJQnORXhoof6WT/dujOfvRiz6DS9y/iSvYrIuYp0G3WxmiZP068arpEhf3v
 1h8WpaNcELQGDwOcYtQNp+tkLLMwDVx8oIXwTxfvr3I3O7zslU4fEwVQHC2DsqNMRpxD4gQE2x/
 9eQ9tjyO9uWXPy6ol+1mL/gBVoO6GEwzsmLpC7+qtC4rv1snkjdg2iGKUhare1iTEnSYwh1VHf9
 +ZqOUyTAl+tmITVfMnkY8JTdwT2kG20h7ixLZJg==
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id
 af79cd13be357-939137d2438mr942872885a.15.1787949607045; 
 Fri, 28 Aug 2026 13:40:07 -0700 (PDT)
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id
 af79cd13be357-939137d2438mr942868185a.15.1787949606531; 
 Fri, 28 Aug 2026 13:40:06 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:40:05 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 15/15] hw/riscv/riscv-iommu-sys.c,
 virt.c: add riscv_create_iommu_sys()
Date: Fri, 28 Aug 2026 17:39:17 -0300
Message-ID: <20260828203918.350131-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a91f227 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sIvX0uTPz6KFyc5RlFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfXwonEhAoeIdWm
 1Z1z4MMtJDTN35CVEVrpn1yvVLnUWM9bOERWllB+8vDLpM9ArzCTynUZ+kmybhzQA9bFhwKbDOk
 zMFvVR/DlBF9BhV4qN760v1RKQVTxyKqg+TwnO5jHdFAmds63EDb+Jk9buLbhv/COtxBzAurkl0
 GxwVyErbcL78eoDQR01Li/bQecTtPiJofdM2tF9FscjXkZk4rRRYK+CJHi0BClcQ1cotcV5m3Qg
 mdDvDASsZGKYPeOQ/l1uRctNCRcGwlP1ExXM+Zr3pd1Tl7CFAblD/LM6eYVzTExRnkr2mHkpMyF
 kNdcQcJfx7tl+bOeNlhI90Gg0fPYAZuRPVmNj0VfLpX+yL/uT3JjbMrL+vTwFvjIUrZP7OtFeGw
 HPCJjxBT06wAgTJWhrSPqzfUjVboYxGSE429wlcaCIYT43dRFTe2WSCVHaooABt+QGs1UVcI4b3
 qrFpeeSm6NoFaH5PtGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX45TUrvgI+oLv
 TFzkDzhKHDfxdT3hzci4mCbFZJTgPTUq7TTEKSnbzcDm01gFiKLJ0mQ2mcKsKBbv/YY4VsQmqng
 slgyjBpLtiBKNatWfA7KmcHWlCIt/RE=
X-Proofpoint-GUID: IainxqXJKc7zpBGx8YmK6N2rfsn1USi_
X-Proofpoint-ORIG-GUID: IainxqXJKc7zpBGx8YmK6N2rfsn1USi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280179
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

Move the creation of riscv-iommu-sys to its own file instead of open
coding it in the 'virt' board.  Other boards in the future might want to
use this device and we want to avoid code duplication.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
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
index d75dec2dd2..de7b99c6a5 100644
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
@@ -933,26 +934,8 @@ static void virt_machine_init(MachineState *machine)
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


