Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D8EC61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 16:50:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzGoK-0006Wd-Fj; Wed, 26 Aug 2026 12:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGoJ-0006Vy-C6
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:49:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGoG-0000xc-F0
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:49:10 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QDvDdi1138567
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wnP82xrulJP
 H4SceLT/7zH5771Vh+GqItvqzst16sMY=; b=PgSoj1AgKNvSbCArBS/2ufJ8xcH
 JjqTASmEQFJwfVxjaFWXQSGDWEDYFmZUEHmcZbRJHDZfhGyZImO/PQSsUZ+4axdk
 /0ZdUpkMGrkziE7CIIfiGUlmSXGon7to5sPoWDthMVLOB/MGPlvbyW9KfraDe8H1
 5af5jTNU4U7iqYm4eYHVm8oS+tNCqjgdOQTG8xaiQWqZt3hkhCc73Z8Uk4qoxNKm
 dr3vnQrq29Tmd+6+toiUKIO8AR8sp16kQxfW1jl5Cc6omUf2yzwG4XDx3AnTTn8l
 yCcOwmg71nzo9LOr1d4dWJzw/Y7oiHqNHJBIKxlu5Hu11S7SZOIhnWzXVxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga07592p2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52827090cc5so1089701cf.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787762937; x=1788367737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wnP82xrulJPH4SceLT/7zH5771Vh+GqItvqzst16sMY=;
 b=HKvnQ2CzTi9WQVOKVjlQ9Z7OpoWUlPWwC2YBqdEU/Gj+SF9/bNUVqYi37W80Bb3i/T
 mCriI59/+n7viHwD+6rL3Y+Wa2yTcKY6ga5kuihIG2RCvg+NrLm03PEzaZWO56Rj5lTM
 U0NOq7G6x+nglu0UgKc+zLVwV5nhP9XKy3BqjTW3wmoKRv7eV3sVHWEx3Mub8AiJISUl
 S3/hg8Du0QAgea+3MUGW9LvH1Z9LLfQN8dhllfMY9Vn4H4fs6gpW/yL0wn3L2wttTHXe
 swY7iuQnTQ6ymnOxNt5zazU0aEhxkp/isX0Z+/WWCbGbgAewnQ+nTHrRUVKR2z9v7lrn
 FsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787762937; x=1788367737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wnP82xrulJPH4SceLT/7zH5771Vh+GqItvqzst16sMY=;
 b=dYFhWJtLoRuA5405j5VTRC02yOpQBmKL/l/f42AqlFLAtHN0+2s7wLPRkMUFvW4ANB
 WJuOusfwQMMnqHp2MKdOa5yc2nmAppvCvB6fS1Kas2R8jZixXzpAN/N7/HqYO3+BOw3A
 bMk2ZYcqe5dfGY9SQfthT6mAMgv9okLK0G1Kr/r/HIyivD3bstWfVIUVAgOia/5ln0oT
 tsA4ELHfZ3AK3F/yBpRpr6wmXdIgmo9ThJLnQIoiWLpPZmZYt2iOOK3q2FsRRE8xe125
 WPMM01lS52jH9GY85Ldyeh0PuJZKan3IEaffmaygvfXiDuki/YwIVjsenrLdhw0YxGuv
 gFSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpuhTB5ANhg2l0UBWqbC1u906iuYggDVgx+JILrkQicR9rRah85U+IyHy/oGCcuWp4zwmFnuNGuQimJ@nongnu.org
X-Gm-Message-State: AFuF++nAdy6OP68JbTdpNQyIFlIj8HdGOZ6JVjycuB/TJDzlfBz2a1Mj
 NIlxT4xa4CBlAb43TcIZvtgXP4vfd2/QHA93qHfosehwOspfFjLiEv/1MRP8qJ41WXVuvwjqu7b
 gMKNONaEV+aye2Tb6jgD9nha07nKXgvtvdJFlToDlze6bHAtv+tB+4MTHMg==
X-Gm-Gg: AR+sD12uE8EiQky66VnPE3hKkhZiFQahtS3Y2kZXG+zvdo4UctXw5LjWJ/zY9BuyC1Z
 IWvw8s/XsKmrq1EH0TPH2EJOCdvB9n682Khhc07t69cQPlqky5sSULOX/F/lW/GXUq5I09JqQPU
 Id4oYBBk+Pz47iHD1yzJ9+mmkQ2hHQf7zsWq/sVPdxjus4HU9t2JAN0NaagZsYMEnCv9sfbO/tm
 oeAGpsCCAQ4JjO++LpiUriSR1E3Ivu1i1f5kkWEtngbORDLtgK0EsH8zgNpJFG8TmRv6xiaNWtE
 R/TtzJrYwN8eseWycyZ5P/H3JumtzwQJzVv09bU2RcMRclUPw8fcKd9hGJcIv6b2tVWJTajVDWH
 CHJDGZE6RSEWYL1HCx9k6qN4+7ol8SI/VVk+YNQ==
X-Received: by 2002:a05:622a:34b:b0:51c:ca9:7cdf with SMTP id
 d75a77b69052e-52fa1a5c719mr6310161cf.2.1787762936761; 
 Wed, 26 Aug 2026 09:48:56 -0700 (PDT)
X-Received: by 2002:a05:622a:34b:b0:51c:ca9:7cdf with SMTP id
 d75a77b69052e-52fa1a5c719mr6309681cf.2.1787762936184; 
 Wed, 26 Aug 2026 09:48:56 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4275fc3esm20092651cf.25.2026.08.26.09.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 09:48:55 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 13/13] hw/riscv/riscv-iommu-sys.c,
 virt.c: add create_riscv_iommu_sys()
Date: Wed, 26 Aug 2026 13:48:13 -0300
Message-ID: <20260826164814.44335-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m8g79XCL5l7XU20Li-TAdaNUy9XtOhvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfXzOnf3cyA3+sg
 CBGMXOWY6pnSXtf7uYCfU/81wiSuG8g0KR964792La/W6ZFHVQcRAOSgz6W2/A3BGXhThzj1kRf
 2ANx7gHSNPAw1dfVlNBmduHT7imbniMZb1KGh/CRfuBJ3yy/cWnIexuswpAMTn4qbXcfVdW/Iuf
 fmO/Ot1INFaegtdX4oT+9+G1JWN4sQc/JViolXnNU47mydAHP7UpsOT3bGtnj83BTO6FF6ANam4
 LE9K+r+CXhKt/FIIf6W4iwEEOnkIg2rGX5rLXqrs1qRtg3UDsQNiYnyOEYbzskt66PjbacNF/uf
 zc7leKtZG10Pvz/KO81MEsWSMsj4f0uj5L+Tg1bZUfb4Q4dQqJ/ljnPmMF22SKjIURgWgCWuxVF
 IN8gel4IMdXYWWFv6KHQq/37lIK3PE4YR1iyHnytBJPEss6g5higDeOqXm5tYFcO/EcpNKRAP9d
 oixQq9uoxCjd8TXY7Hg==
X-Proofpoint-GUID: m8g79XCL5l7XU20Li-TAdaNUy9XtOhvz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfX+3LGkcONbOkO
 AUKz3WCyi3BuEgSB69OJ+scXaQ2sguGhPYU+Ep9TB9JTXH5NJIX59/WVH3LI9QZiqD+QpMon0lY
 2cSC4+as4FuPc0C+VGzNGt4jr/B6DN8=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f18f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7ypw5r5HuOgaF4lO-pgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260140
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


