Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C60C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 22:27:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wziZ0-00060k-UH; Thu, 27 Aug 2026 18:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYy-0005tl-Kb
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYx-0001M5-3Q
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:12 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RJLvv6795155
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jn9iXpKYNS1L6RaSzUDnHO6ijMZ0oIaALhAL7v8dv7E=; b=CFM962C9ngXLZcAC
 WskpTBFFoLwQopKDw0++iwcV5RhSTIcwcYZTTRt+zy42pfvYq45cqa5kQwo3t9Md
 LDA0MuC+6xkVt9273lMaS6Akc+apT6dMyS5Er4wFe6OKTzBsaWsCMx7cd+XJODzO
 Aaz17CpCTyUcO9SDSEWUxAN1WxzrG6hH/UWm+WqcWIlvCr71AfBzPawSeREfynYG
 D8ZWxMgJTESBtRC165FO5CeLGfKR0tlj9HpjWPIhimKI17yslUXwFuBHNfCrdRgj
 /RRm9VHxiFCL/ZsWbxRek/zlAlHUJzQnt2IzKsXXmFJBybFLlqVD1MJTxa4mKF1h
 BfpM+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fjp67-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:27:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so45101185a.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787869619; x=1788474419; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Jn9iXpKYNS1L6RaSzUDnHO6ijMZ0oIaALhAL7v8dv7E=;
 b=WkkTkd8XetiWMU6yy6y6dtK2AwzwR8/YJ/aj7U0qeJIfkAb71KvVFedqjXrYzI82be
 mDrKMX9YrQEg++PgLLv4kFe6tTj2Tvh/HWpD9IjfGVlgGC/hHqjZh1ricjZtbjv9qQRs
 zkRfS1n0NnYmuHI4l4RiiYX5GSYHL+EaWhc22UdCNsLGVu5guHHJi93OOUhLtRuDR512
 MUfAD2tzQdhd52JeXaUatLwr9TyZ6RZHVMlpAqRpr1u4eLAdDCajR5ZxcHnc1FvGntWz
 wViISvusXKadW7MFc2VhluA2LRs7ubhd7DBsaAPJmay0o1BHRP7mpy/9LEtS4CZCgWG+
 Usig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787869619; x=1788474419;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Jn9iXpKYNS1L6RaSzUDnHO6ijMZ0oIaALhAL7v8dv7E=;
 b=kJjB1swGVaSjlrfS4CUaFZ3IhyDkESsPMZxvLbOXbC6sGS0Ba/X5BzZTcP2IP7CB9y
 OMtFwOiAsOzk2ZdzlczW0TIGSslEWE21bCGFM6Lkrleg/oo4QOv3rEN3A25PnU1yLFjS
 +QPgqPCjx2diC1+xEKX/Gsa8+6VizyF8Msgf6xBXounmSTaaMGjwMjfTLLiHW22g5qRr
 WBciVd8h+ee00pIYeCC+S2EvmEMsrT+3+y+RyIngqF0DzJwtOfau5m+KxudCrekD96mK
 NCh20zA63xgEIR0rHZ/BRxCQUEA+8WjSC9fI5T7M37U5xPD2NWZ6/OYv7f63kqhMebdW
 TgBA==
X-Gm-Message-State: AFuF++k8O8BK1XK+4Xn43Bgye6E1KTfRDUmPOogQilam4bJ5bo/+CTIW
 CfS8G7W5X/bIx+mCPHLNggSHQ0GSz7v8VjZKM5oG0c9sbNRSIp5soYGen4z7FxPUMHYzNmKunXg
 q+V3pd+DvBU53EmSnYbQ5RxwCzICevb1PRMhQB6dSElnE6XFZBawwKkZNHw==
X-Gm-Gg: AR+sD12lHoAB9r523NCm5WaiilIdwjN1dI4OU0whcjowrZhELO/V8JEgWo7R2u82y6W
 /AclAyuMLF0JrG9GnEE2CKYtIHya/tCj9I1WOoFdPoYeYI+tmWPMBtCWvuVMbs49BSDFb3jMOin
 6ohq/kBYWo7bD0H50uLi+FpjTFqGT6p18L0usebEwaio7VTbRDJvf8dXSHqKgCaE8BwWaxyqyNd
 yFm/4kC2D4+U6gUBJ+0rEPyPftUOTTaJ/kqToLHq/DfCGeWi5j8+WJae21Q5jcNjMRrcgFQRstD
 OXM+94HEstaCXO8i87w+z9RKI3dEZouV/ZP5jr0ngZ8NCXbk4lpeylrCKixwSvbx0Lt9nbLY14D
 boRaAq1PfNeL0VJXedto3/Yz3B1HZq2woxja5TQ==
X-Received: by 2002:a05:620a:26a2:b0:936:a407:98bb with SMTP id
 af79cd13be357-9391379816bmr268337485a.9.1787869619495; 
 Thu, 27 Aug 2026 15:26:59 -0700 (PDT)
X-Received: by 2002:a05:620a:26a2:b0:936:a407:98bb with SMTP id
 af79cd13be357-9391379816bmr268324585a.9.1787869618127; 
 Thu, 27 Aug 2026 15:26:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173a734dsm8924985a.26.2026.08.27.15.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 15:26:57 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 14/14] hw/riscv/riscv-iommu-sys.c,
 virt.c: add riscv_create_iommu_sys()
Date: Thu, 27 Aug 2026 19:26:07 -0300
Message-ID: <20260827222608.329788-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
References: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX/97gyoFZwkgd
 2D9MkRmHOmD248wzLyBaremAxCyCnWUvvQFLnqRhG6bL9K/x57oGO1IBWNoOCkpx9ok6d3m4B9J
 UJphZMuBtSyuqg4fywGSeI3fVNu/wn4=
X-Proofpoint-GUID: DrWl7CXsol0uxiUzKicw-j--CLQrIKQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX8lQiN8oBpfSY
 utow/XR+Wq+pLHe2VIF/vtOkTrD6sHTYKAtWks01EgW2kjo9Wx8Kg687YKqG3fwl+yMiUtWA0RM
 yA0DB1ONUMWtrOCe1UkcEmyUrqSQve4XT8ETt58CJkCKeCd5ylMyKJs/2R+okfMadmLJOflK9kM
 PWvOs0XlSxTMp/ZB+P79pI3O5FFgNDklRSeulPjvj5U5N8FONvDZv00ekX398vhmwtEQkHp1wvM
 UD+hRnozyqJUYlPBnYGaDkyvAlKz6iyPS5dD5wjFGHuB7S3/tR89UgSiYqrI1kfbc8XGwPaHLw/
 8RE/DUCJZGkhyh7e1Zu+OSf5mBhz/u2x5SmsnyT1C/mHMjvp7mOx2HAxG8QkQhSSvBi4QF0Ig+V
 TTD2fBZKv/2pwqbigNePW+UinQ1BXAZ4KP631Vgj0a6dFDlsrWvqsj7ok4egH4mee3XzdzetkJx
 A+11nV8RXNlQEqqdMeA==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a90b9b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sIvX0uTPz6KFyc5RlFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DrWl7CXsol0uxiUzKicw-j--CLQrIKQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270190
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


