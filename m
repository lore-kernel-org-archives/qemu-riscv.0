Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDECC5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:49:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLTD-0003h5-Ik; Wed, 26 Aug 2026 17:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLTB-0003eA-W3
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLTA-0001T5-9S
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:41 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdINB1483380
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 olqHdGaxzXrPitS+3jNFSUVam0sm4yRRKPUQUbIVUzk=; b=eZ8H/CELPWpMG55h
 HqBUjr1AZWbH6dIzJNzB6Im2pNu8LaEtUhCdjmmqBy7Pl7W5tog6a8voUNpRyiY1
 RVs3hyU035YSWO18yIEyEu+Nq45eYVAdToYyT1vDYjsVgOzCwovcxKCVuV2AxxET
 224G3zqD5KSplcHm6U1MVKOHu4R8NFfEFHooe4aDWDBQjlvmtrywtMHOuabV5Qbk
 ewiLR4TzOjRM831S6ActGdn3xIo9zyVeTWiEiQFwGCU1LLHVs+9rD2rR6J3S2TBr
 rMiTnd5JLjZR/cTUcUgMScy649V+ZRiYgM20Z9PtxSNVB8AI01r0uAtHUElHeAr8
 VqLbKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etrcny-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e4f946461so132966185a.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780848; x=1788385648; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=olqHdGaxzXrPitS+3jNFSUVam0sm4yRRKPUQUbIVUzk=;
 b=D/38+j+UFpFl9z4BFveCQinBAcnaDDZzF9o0hhwmfWEunTe4BFYPp4umadw4wSqIkp
 +y7oMBqfAR5ESUkMxXAhKYTUHB2QZxAJ+0BIhhJ1Sga0DF0o9nEhfgGhb+BFghtFVB6w
 kNMlw1tbwF7CZ2Sb1sPZxr8G+vF3jjRYO2Jyd7EVIOOfhbeWPDXKE6toMERMumS5pMdC
 Pa45Ob8Et42GfVoR+DaTpGgT6PZdDmbz5fKKl0a3Ajdw3uS4+axyPiNX7zT+NDcqckiY
 b6MzUenR8Au9jFDClzSQiX9lkN0nHxydkMPdwkq9y0/xp8H6XkjrT4czkHKIpGNQ0mN7
 45nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780848; x=1788385648;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=olqHdGaxzXrPitS+3jNFSUVam0sm4yRRKPUQUbIVUzk=;
 b=MZmb7+00gSPsGPBwwHYZb5Oeh36KXDaJDKMR8/I8ft3nOtyGrHBe1ueV2vPEAzM0GL
 pOMKRKgli9q3ClBio6xN3MJDFkQJQlsJLhUqRAapWZE9uyzlvu+Y6C+g/MFE9AbciPIj
 Ahdg6sPRZikl7q5uvaE4Fqc/rH7YKtq+S2RM19++LEKN14czJn9tX7wETfMe0Yl1fpmw
 iBIl+tOCf56dqcUNvMTOJc2sM5MLaMJ8ZT0mmO15iHt2Kd0Qy8PZgKIU98nAnMgMM/JC
 yd7CFJoaYG0s99MdrRuLmwZTJrcbz18nd5aMGPLVoZ5tlTyX6g5c8hEcXjqafLKqIOWF
 fMHA==
X-Gm-Message-State: AFuF++k6tBin9DqxFQEBaTE31ocbrMLYwH7yzub+fiUif0eDr+dXvuwc
 c+nFNyzhQv9T+2ZBQ+dmuGPmNbAV1ddJq/2KjH5JIBIkylXsVW3uX1SrTUUqEcJa7FMIm4mbrMD
 LgArBNWp+dwQR463pQNP4EZwfv17O8EB3QNuEcLXx8AXemy8aHquKkM4ATg==
X-Gm-Gg: AR+sD10dKTMSfynTOCsu+KCmU/efx2wRTrQLVqmWKo+anKo9gDm4YYs+7BC3rKQ+RFE
 1gOjhSLGIzfcaLUNd/hHXS5QUoVIoX5HPs3j0lGEQf9U1k1Xnz1+iYA4zhWlY1FBZzZGQ8qqEJj
 cbE8oQWYVRH01Hh5O/ADLQIMR/UifYDWvMWocZ/kCOQgJeYOXJiqbV407IjoFK/VMQqS+zZwe05
 jKFTYI2uMcjttIzathJFMLUzEHjNDa6ajM+A89vvXIDo56Bd0yeYusITSojG/0xvMN7c9xfOjiC
 n8s5NX6Sng9161B6hNX+blOCF+eBqxHpRVEDTfuHwAPpCqNemAz2ZOjwJPJOkjOLcysLR2sWHJq
 +6dMSnCjIjgPouzpVifA3PSDFeOFcFJ//qvhy6w==
X-Received: by 2002:a05:620a:a717:b0:930:9585:e08e with SMTP id
 af79cd13be357-937800c854amr982065785a.10.1787780848062; 
 Wed, 26 Aug 2026 14:47:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a717:b0:930:9585:e08e with SMTP id
 af79cd13be357-937800c854amr982059885a.10.1787780847448; 
 Wed, 26 Aug 2026 14:47:27 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:26 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 14/14] hw/riscv/riscv-iommu-sys.c,
 virt.c: add riscv_create_iommu_sys()
Date: Wed, 26 Aug 2026 18:46:42 -0300
Message-ID: <20260826214643.122728-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a8f5ef1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sIvX0uTPz6KFyc5RlFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: x6XDcFvnay0f9b_foNp_-xR8E37eK8uC
X-Proofpoint-GUID: x6XDcFvnay0f9b_foNp_-xR8E37eK8uC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfXzIQsQ9wWAAho
 AtqGTQO4OOeMORQlwfFkkzd6LXZRIi1k+9xIbOAqP0hghChxzOjAAEIVO6VkeWg4biHiYTo38H/
 eGflwmymBZIpjCotKTK19WKBVrFOxW/+eRvQpD/DnVQlNlddiTMCErxwxJq+zomk1di+yatUAE3
 XMz/i1Ht3w0G1ozzup5efPltHD+qQsbFpOe+j7yGPNeZB+BBh+q3wpBRxYjYQz3XODtJtzbgFCW
 cBsqdXnGIQoQ3Ev8AdA+lVj7MuZZ16qirYlD+mdjJM62exlfHP5NtRhqutg7YxBtsYnv5lB9ng6
 dfQjJMUr2HKOB3DymCWkS8nXeCcbFU9mH++r0vv18IUl5ULBVslMYTEfkIvtV0LdQ+xRyvU/qjz
 6Bdz8u33kvh8ZehXT+A5ku6FIZm6B1f4Fef+kFWFMnXR6lYwKFOXLqkrAQ/RXYh2QMGfxNTKwYQ
 sfAVVpzcBQMjKsI6NCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX3pgN+QEZ/pRg
 k6YxZPUcUtKEbpD0Th8fjcvx5ikB0yZPwH5Ef46Kolaf2/mhQKpa77SItjnEdvupL6o/7qsnYOP
 zNO3NPeIOBdwEpLvjCtxBiMf7GVTu5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260183
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
index c1cb98fab0..0da7b8b1d9 100644
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
@@ -917,26 +918,8 @@ static void virt_machine_init(MachineState *machine)
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


