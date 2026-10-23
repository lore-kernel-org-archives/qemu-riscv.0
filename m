Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9B606A31B
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TxzpJRS2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnU9G3Dc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKHq2-0000cO-7B; Fri, 23 Oct 2026 12:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHpm-0000aC-A6
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHpe-0001Tv-Qj
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:29 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NG6S0X2216170
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=W1uOu9Yvs0L
 HCsnnPQSnHDv3YzrhA3fkZ0uCqoasB/0=; b=TxzpJRS2w6CoVK8gD51rZrQauYm
 zywcuCYNedXpg8X8fIRHZIqdthPlrkyNHxe0jdzqVhGcfcuAEzN43BA14/0G9pq7
 5CPuXd8++HrTq6gQqbblwiqWJzg9fAScPmLhYinG835ubtdxPymLYX04B+1aC5bm
 ykGDyGnflBO7bM3H02k/ihxUcwZgIEYgr/pUT8xdN9NpIEcRybAUaHt7YTurnCvM
 osx6jcLQ8HSs/2IjL95+bIhuw0UBRzRjNPDbIid65OuDCLua1upGKLm2/OcMAVt5
 So6RovlU1VnVFvUcthNMiXIlzJ20Ve59cnjevvQOhkKuxR1EIgTlT1+mxvw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc80bu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91256a7b7b3so20077266d6.2
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792771763; x=1793376563; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=W1uOu9Yvs0LHCsnnPQSnHDv3YzrhA3fkZ0uCqoasB/0=;
 b=YnU9G3Dcqu4OhQpjBqY1EHInDWQrKEgeI/QrTx1kic4qg38gt0P2Qe5GXvTnI7Gd0s
 fqnXSbl4xahu2kt2ZX7Q1WRsPGrdObW5eu2bRpVILsDDwf7yr0rnzkABY1jgZjmvc+gj
 nzARN4bCEW6SMcUbnTg5eHeVEAHTTddlDBwZ5hfgn3ObQnLemmb28gn4DjRoC0nBOkZE
 1x9g6bflrReS8YcwBJWRWDmRoKXi1gGjSw4ZWV4w68Uvb9PCr6eGVgtkGgpBaeYfWSSN
 l8MUYZZIMvRBQkC+gVIaLxkPAD9hc+LZC6Ld8DIF3LBO2sAmuQjc7vfMuZMtuPlKEpHc
 uUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792771763; x=1793376563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=W1uOu9Yvs0LHCsnnPQSnHDv3YzrhA3fkZ0uCqoasB/0=;
 b=qRCHxG4HcrXtWqRrdawHXcCvuGDjKemUcpvZ/9U+5iuYVXTSsCwpraFEXJm09Y6fnZ
 0S3I0Q1OUUiu1TUsN9NNjvXDEF2pcge8Jsn2M1/HLy1U2+qRuUEDWfSdj10u4TtMgef7
 b2kI53TPjzykszoL8U4u6pmpOyD0H5yu8mfZiZE+ON296uWoY7+h6TTdM4uo899M3z/H
 HwSbEOtb3VsD3x2OpV4qDo+q8Q+QWmpd2fIiXzwgDvZr02S+2ySKctNOqsxK7d7Kyvkm
 otOdka45O+KZyjJC9e4fOkaNGsHmTfZ/BZPzDuyTL3hN5aXI6V5VvaGdCBi1Y+0ielyH
 Vs9Q==
X-Gm-Message-State: AFq9FYKfzUXGKUc+I2xvD51UL9D6ZbeLkGvzcvalJOaDSz4bcEdmBf0p
 StHdpU//3s7CSTu3n2ZXP4n+0kOiMu35n8jB3pTGnmOzm/YPynM6eOrBArQbTexdIf1RyR/F9hI
 Qn0dWjx2iXACrofwg9aZSfKs1ixMF4xql0wc7wB31udWwOgJbTX9Kx/eg4Q==
X-Gm-Gg: AYBFou2XNp2QuuMhme4LboYkJfTVC2Pk3OYa6/BG9Fx0x7wjPrQ1JfGN4fR0GEMhpom
 UA3KVcZcKYTadMhHnZfm8UojCUFSnfyRnOoWYoJn6ht+VPhkE/JFQLdG+i+PJb0R9kMOxt+YTpj
 9ig4UMDdm20RdXE0GREZc8SmemOVe4rDrLOPCQD9gqHCtFro3xOPk8601Hq7IfH1Za0nwgAGhZY
 dPSg/sy8LwV/TgLZmPwsAeOo8vdJLBzDMI+A0iU8L40+4ZKxqtzVvGpR9Ow+G/1l+4IGS0hwvVo
 SuWGnvZT9kBdqymrWg2qOZ8L09uZLiP80llHX6va2GnpO0uoid5HozyT5JOI3Im83GIb1/i2wVa
 X68UbMQTW+lgakKhgHXTar7e9ZsnjWQ8iszBN+g==
X-Received: by 2002:a05:6214:29e6:b0:917:a615:3741 with SMTP id
 6a1803df08f44-91c3a8a52femr40172946d6.32.1792771762376; 
 Fri, 23 Oct 2026 09:09:22 -0700 (PDT)
X-Received: by 2002:a05:6214:29e6:b0:917:a615:3741 with SMTP id
 6a1803df08f44-91c3a8a52femr40172346d6.32.1792771761915; 
 Fri, 23 Oct 2026 09:09:21 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4524f226sm5063406d6.27.2026.10.23.09.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 09:09:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/6] hw/riscv: do not realize the device in
 riscv_create_iommu_sys()
Date: Fri, 23 Oct 2026 13:09:08 -0300
Message-ID: <20261023160913.24992-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
References: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfXzW+IWvPyXbvW
 fuX/1z6PuFZ5DupBcuRMlDCu2w6SXjfj/oAkF9KvJpRSVa2ogo+i/ee4bIEDevdImkgvgMgJgQF
 dceVghJVxFFok/BU47wOk0YPQ50t0zKSIxqyeBQ5wG2zbXylb9QzMZZd54drmYq9XyE36bL9gDj
 Nv40OWZSuLc2qKY32UCbZ4K/uOEOa8eMo/ZbrVZAdSJofpNUFDSRClLenghFkhooaJDNdTQ7+UL
 3c1CkMSAJzmlCmHbX/Z3hjDkdEwe/W4bBQsSQYeqkAaZW3hp/MMiVQpISUxwrINR81xegzEH6wf
 lSF6qA0sK4YP1tmyzkmZmVL7J2zpolgCE66Jn4fm/BlNPbTUKamM8guXOf7F/evGRoQpOhPqQZk
 CFUw05bvWaKFnjIDhPIG9odkKBcOLqguOj+htJAwowG5QhWq8dQo1hgH3YOzXTilaJoeuWDXR+F
 oxn18phc+nx+3713e7g==
X-Proofpoint-GUID: h33n8BiGkjPTdLzPEBHsdDcNpkr4DfB8
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb86b3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vAOAkzTg_3GT8N5SIgEA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: h33n8BiGkjPTdLzPEBHsdDcNpkr4DfB8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX0uiCTTu8gMVC
 F8C9lRD8tuOnjHwv1eIl7m8Oo7z3HNxtv3NS0xa7QKFf8QEJ3qXfnAie/vRycCQmh98etMXtv97
 xVVunPdZUtzMX+vlasm4UAkmh24nMik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230063
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The riscv-iommu-sys device inherits all properties from its associated
riscv-iommu device via qdev_alias_all_properties() during sys_init().

We're also providing riscv_create_iommu_sys(), a helper to instantiate
the device and avoid duplicating code between boards.  In its current
state the helper is realizing the device before returning it to the
caller, prevents any additional setup of the device (we can't change
device props after realize).

Split the realization code from the helper and make the boards realize
the device manually.  It's a small inconvenience to pay to be able to
config the iommu-sys device.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-sys.c     | 3 +--
 hw/riscv/server_platform_ref.c | 7 +++++--
 hw/riscv/virt.c                | 9 +++++++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
index 258c171efd..190ab0b646 100644
--- a/hw/riscv/riscv-iommu-sys.c
+++ b/hw/riscv/riscv-iommu-sys.c
@@ -217,6 +217,7 @@ static void riscv_iommu_sys_init(Object *obj)
     riscv_iommu_set_cap_igs(iommu, RISCV_IOMMU_CAP_IGS_BOTH);
 }
 
+/* Note: the returned iommu_sys device needs to be realized.  */
 DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
                                     hwaddr addr, int base_irq,
                                     bool is_32_bit)
@@ -237,8 +238,6 @@ DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
                              is_32_bit ? 34 : 56,
                              &error_fatal);
 
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
-
     return iommu_sys;
 }
 
diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index 5f485b1c79..e9536515da 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -481,6 +481,7 @@ static void rvserver_ref_machine_init(MachineState *machine)
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     MemoryRegion *reset_syscon_io = g_new(MemoryRegion, 1);
     DeviceState *mmio_irqchip, *pcie_irqchip;
+    DeviceState *iommu_sys;
     int i, base_hartid, hart_count;
     int socket_count = riscv_socket_count(machine);
     int imsic_bits;
@@ -635,8 +636,10 @@ static void rvserver_ref_machine_init(MachineState *machine)
         create_fdt(s, memmap);
     }
 
-    riscv_create_iommu_sys(mmio_irqchip, s->memmap[RVSERVER_IOMMU_SYS].base,
-                           IOMMU_SYS_IRQ, false);
+    iommu_sys = riscv_create_iommu_sys(mmio_irqchip,
+                                       s->memmap[RVSERVER_IOMMU_SYS].base,
+                                       IOMMU_SYS_IRQ, false);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
 
     s->machine_done.notify = rvserver_ref_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d4b501802f..39381cb21d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -940,8 +940,13 @@ static void virt_machine_init(MachineState *machine)
     }
 
     if (virt_is_iommu_sys_enabled(s)) {
-        riscv_create_iommu_sys(mmio_irqchip, s->memmap[VIRT_IOMMU_SYS].base,
-                               IOMMU_SYS_IRQ, riscv_is_32bit(&s->soc[0]));
+        DeviceState *iommu_sys;
+
+        iommu_sys = riscv_create_iommu_sys(mmio_irqchip,
+                                           s->memmap[VIRT_IOMMU_SYS].base,
+                                           IOMMU_SYS_IRQ,
+                                           riscv_is_32bit(&s->soc[0]));
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal);
     }
 
     s->machine_done.notify = virt_machine_done;
-- 
2.43.0


