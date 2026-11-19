Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C54606A32F
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EI3/8hZp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWUJXHbT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTxRE-00049w-9P; Thu, 19 Nov 2026 03:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxRA-00047t-Q7
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:08 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxR8-0001Bq-LT
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:08 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJ6v8ai2030776
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3TVHY9ySHYw
 sgNq6P7xkXcHCMyQ08aYCW+Bze0hAuhw=; b=EI3/8hZpBta5AvwHBkBq4gJcNaL
 NpcBZihIgTnpZ6EZc6IjM8WFzJ08FAobAefPcdEBcMSfkysA5UfpQA4yaviUf0Js
 E52OmyZlPywUoAsGqrzNHATpLommzFVHAFLBvJoL5nQGp/JONifZiXMCK9VKLL2w
 8vApnjQs4xCl8yQHTbrmPRH8GHNU8vzsF0oiYCXvysmmkwdRKYFj53zgBYyRjYzR
 yqshY2IRJ5hn8vgZPVXNxDp26W4Y9Ya4UtQNMSvVAaX/wbh7flcc9S2JDfri8zah
 rdRYxkpeMvHcrjqbatZYioG1c6mLfmB6O1xtDArDNxK9O1qg2IoQ23mvkAA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kueh7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-92104826f9bso38159366d6.1
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 00:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795076644; x=1795681444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3TVHY9ySHYwsgNq6P7xkXcHCMyQ08aYCW+Bze0hAuhw=;
 b=BWUJXHbTqhdh0NUGQbR+ZncVq12lBe09Z+VNvkU1b8haotG6mmppRJBmOwKA9ZFVmK
 6tr2/a4pTl+KqobUjrPcpn6jROXoLeGTpPv3ObEdE0rp4lgH//FjK4AWGCZk9riPuZqL
 a+lhChJOrTnNeu5NVMh7xvqq+DQ36biWbbZDItwcdeQUoIsoFRFs18Fgr10WEzr7WCRD
 +u7K34/AXZPE2LggbkVs8IbX05TXUPAmENwMSO0I6XjkOUYA7qQkjaDh28Eoqd8RgjqW
 QkCDvFhY5KzDawPkQs5+6Aj67cqNsY06OxMgYgS8xmMSNSAS8QKNRC0xDiDYdUgCGQIv
 6yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795076644; x=1795681444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3TVHY9ySHYwsgNq6P7xkXcHCMyQ08aYCW+Bze0hAuhw=;
 b=hFfseAX463Q1eMvFUw0Gf/fFSHWO7AbLUEWro5k8qAaKys/CZ6hNxDeYyz9+iFviJ3
 6ZrruqIIR7Y4vmPzzOo48qrnM6Y5rsipIhwIj5qIp3uLAVBgaaWJEFtZtvtBE4ZmgZWk
 qrn/sOoSH6bubtCQ0Wn8mLgyR2CbCqbKi8BUMLSaq5H3cyh/qRwnuuizk6uvGwRbNVxr
 aDHHDx0o1CDZxQIAFXBtTrF8c99+xnZcXcquY9gN6mFG/sDXRZyfRAFhDiDD4UuAWdWm
 tsxVSfR6KkrbbNYwZ/k2fiJgGIiVeb0/fALRx5EPUWud0SzmOn6FS+DT6CYf9rshqcWp
 e4MA==
X-Gm-Message-State: APuU4Z+SqAGnYltuxNqqv68pwtkET1fm5BHYPCvnY6bogrLpFwI0BRZm
 G6wpvYVtdkhc2GoxOR4ybVwTWnZ8CJr0+9byJ8Ewn6oEIsQeha9SpddIGR1gBrad6kWSUgXmrSg
 Gc4kOUtmz9NLjZAdmsT2HQF9W8ox+IIyIZOKGKXuB4TY72xZDjMbiBpmzNA==
X-Gm-Gg: AZFdTZekSV4CJh6VDG07osEYRIDNtsp5F9UUpvqy5LJOp0mYNhwDSb1JznRh8C/jyeu
 /nM+rR+2jynVLS2vgLK8mcLNggnQM2uh+xl0Drx/9qmMaQYpxcD/2aB9yUwzMKg8UigtovjP3VZ
 azZpS4eUfxvEPAbctBZ7160JPEPK1jS4kEGpuvkdWohFCFvxNpbOP5/TJQbcxg1OWUVavfEw3Nz
 dgdG5ZqMtW+ZbF/scoxOi+YgwhK0MNPfBZmEPdGtNHQKi/kFLO7fCdk7/vwqnQTA3ypHM7VTcnI
 o+OXAFAF4omrkgqE+EOEga0+NVIGo7i5eMOMopER+aHu1/uauBgX9YHNY4VJo+a6WUj2NWfRvHz
 gmQLTbNNM/gRCGsJVrq67+1iB+srSv7chBKLB2ToAleeRQqshpWRVQDY6HAK/hu364Nxmx3WOFa
 wMD0uxudOQ
X-Received: by 2002:a05:6214:1d2f:b0:91e:bcf7:82f7 with SMTP id
 6a1803df08f44-92114debcc7mr84340146d6.13.1795076643735; 
 Thu, 19 Nov 2026 00:24:03 -0800 (PST)
X-Received: by 2002:a05:6214:1d2f:b0:91e:bcf7:82f7 with SMTP id
 6a1803df08f44-92114debcc7mr84339746d6.13.1795076643124; 
 Thu, 19 Nov 2026 00:24:03 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([179.193.8.137])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9211a6318aesm34524136d6.39.2026.11.19.00.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 00:24:02 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 1/5] hw/riscv: allow machines to set 'hpm-counters' for
 riscv-iommu-sys
Date: Thu, 19 Nov 2026 05:23:51 -0300
Message-ID: <20261119082356.1264726-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
References: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX0sbu/+RT6LOF
 8yMT6Tdls1mwzP9Ib8UjZ7saxJeO3J+R79E8BVYfyr0wAAXg7URnIUuT0eb8UzSSBoIOO+0e0Ip
 Q/QnK+4ZbUvH8ZZDlXOpVqPgmZv0Rlwpwm/RXLhTfnYGHGgIS93osS31QEftt9hXgwi71lOaq6b
 oc4ZY2lifaxIA+x87IsrqErcnOOOozvuPwW74hmOd2gz0KiDAFFgx0d8BAU+d4fg4dn1E4+et8v
 eJaa0p+sfm3Uy6GMfsFakHartYOWOpEh2/dyKyYcw5iiw74iE76NxcLLwCvIcZ0mUd5nk89iNvk
 y+4TdjpmnRQHxqgB+0NVE5Cb7mP0Do8M/yebXG4Y4bzhkPt+IdXjrLYQqBQl28KLoX56vLNkLcK
 hhcB3DAJ5tNydCIouwdLBWoUFCWHA9qaeHnnOzs11ghQLHJAy5THLvQ9PO76UTOINlDfeKO7x+z
 BwF6hKQFZIZW2pi7zVw==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afeb224 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=a6tGUzlCxnQfwxx7nGpYxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=HwFc7jivAAAA:8
 a=EUspDBNiAAAA:8 a=48PXcFng3gF8bjtwisEA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX6MrGgQbRXMrT
 AZmfxz/vp0ImQhNMb8fqQJjb22EsmAbNkzi+HLJ2KVWe/c0M994OEpVm7+zX+FKIdsy5LEHgBhM
 Dk7swuJpwT/eoGuqLdUZmm9FCRiVDRk=
X-Proofpoint-ORIG-GUID: rl-posQAegBn2oPHfaP2DCuA9C1p1YuZ
X-Proofpoint-GUID: rl-posQAegBn2oPHfaP2DCuA9C1p1YuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The riscv server soc requirements [1] dictates in rule "IOM_200" that
the IOMMU must have at least 4 event counters.  As it stands today we're
creating an iommu-sys device with RISCV_IOMMU_IOCOUNT_NUM (31) counters.

Following the design of setting just the minimal spec requirements, set
hpm-counters to 4.  We're doing that by adding a new argument in
riscv_create_iommu_sys().  In case more IOMMU parameters need to tweaked
in the device we might consider a different approach, but for now this
suffices.

The hpm-counters value used in the 'virt' board is default val from
riscv-iommu, i.e. there's no change in 'virt' board configuration with
this patch.

Note that the 'Fixes' tag points to the riscv-server-ref initial commit
because the IOM_200 rule should have been there from the start.  There's
nothing inherently wrong with the initial commit for
riscv_create_iommu_sys().

[1] https://docs.riscv.org/reference/server-soc/v1.0/server_soc_requirements.html

Fixes: c2fa4320803b ("hw/riscv: server platform reference machine")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-sys.c     | 4 ++++
 hw/riscv/riscv-iommu.h         | 1 +
 hw/riscv/server_platform_ref.c | 2 ++
 hw/riscv/virt.c                | 3 ++-
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
index 258c171efd..3a9e22080a 100644
--- a/hw/riscv/riscv-iommu-sys.c
+++ b/hw/riscv/riscv-iommu-sys.c
@@ -219,6 +219,7 @@ static void riscv_iommu_sys_init(Object *obj)
 
 DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
                                     hwaddr addr, int base_irq,
+                                    int hpm_counters,
                                     bool is_32_bit)
 {
     DeviceState *iommu_sys = qdev_new(TYPE_RISCV_IOMMU_SYS);
@@ -237,6 +238,9 @@ DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
                              is_32_bit ? 34 : 56,
                              &error_fatal);
 
+    object_property_set_int(OBJECT(iommu_sys), "hpm-counters",
+                            hpm_counters, &error_abort);
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
 
     return iommu_sys;
diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
index 403d10b321..0f755b0992 100644
--- a/hw/riscv/riscv-iommu.h
+++ b/hw/riscv/riscv-iommu.h
@@ -107,6 +107,7 @@ void riscv_iommu_notify(RISCVIOMMUState *s, int vec_type);
 void riscv_iommu_fault(RISCVIOMMUState *s, struct riscv_iommu_fq_record *ev);
 DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
                                     hwaddr addr, int base_irq,
+                                    int hpm_counters,
                                     bool is_32_bit);
 
 typedef struct RISCVIOMMUContext RISCVIOMMUContext;
diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index 22b3149ee8..fb770cf6fb 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -67,6 +67,7 @@
 #define SYSCON_POWEROFF                        0x2
 
 #define RVSERVER_PLATFORM_BUS_NUM_IRQS         8
+#define RVSERVER_IOMMU_HPM_COUNTERS            4
 
 #define TYPE_RISCV_SERVER_REF_MACHINE MACHINE_TYPE_NAME("riscv-server-ref")
 OBJECT_DECLARE_SIMPLE_TYPE(RISCVServerRefMachineState, RISCV_SERVER_REF_MACHINE)
@@ -641,6 +642,7 @@ static void rvserver_ref_machine_init(MachineState *machine)
     }
 
     riscv_create_iommu_sys(mmio_irqchip, s->memmap[RVSERVER_IOMMU_SYS].base,
+                           RVSERVER_IOMMU_HPM_COUNTERS,
                            IOMMU_SYS_IRQ, false);
 
     s->machine_done.notify = rvserver_ref_machine_done;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index dceb3ff55e..016003d73d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -962,7 +962,8 @@ static void virt_machine_init(MachineState *machine)
 
     if (virt_is_iommu_sys_enabled(s)) {
         riscv_create_iommu_sys(mmio_irqchip, s->memmap[VIRT_IOMMU_SYS].base,
-                               IOMMU_SYS_IRQ, riscv_is_32bit(&s->soc[0]));
+                               IOMMU_SYS_IRQ, RISCV_IOMMU_IOCOUNT_NUM,
+                               riscv_is_32bit(&s->soc[0]));
     }
 
     s->machine_done.notify = virt_machine_done;
-- 
2.43.0


