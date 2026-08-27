Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D15C61DCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 22:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wziYo-0005dQ-Si; Thu, 27 Aug 2026 18:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYn-0005cb-Ek
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wziYl-0001Hv-A9
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 18:27:01 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RJLoIX218264
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nLyjqO2yjNlh10KCYPm3ksDiwJqfCnNwZ2rfvB092wA=; b=PCuJ8pkkZeHXHzrn
 1VrIQ5Ge63l+GbXTVaZquzcv3tw1ycKXDYeU/jycX3Jyn4lmHaxlfzzBwWvdVL26
 OtP3eTiVnEtXbk9UPWryQhw5PuPqZnCX0kYJksNoCrCTPtYAML8Fa1KsIfw4jZCG
 7frog4RyisecujrgCtHg0MqDy2rGHRlOc+qSC9hng3Xvnvq82/sBBTYdzAAdxo11
 R633revaG7XON8tbJEDgfPm7PbhGHy/JNFdntbxDmyLWKs4d3Gyq5NuISC2d6sDK
 p3J3J3Tl0JpwBe/c7clKsPx23E4vz4aUfjNHYENj3jQqygDokQH/2qgRbuilaZa+
 oKpZmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw23b9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 22:26:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936aa34873bso38417885a.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 15:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787869608; x=1788474408; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nLyjqO2yjNlh10KCYPm3ksDiwJqfCnNwZ2rfvB092wA=;
 b=LtPDEdKo5zr2HgdvbNzHt9xUlb8PtosKVm839H2zkRuCgwKcQdny5lA59oZ/B5Oufe
 z0Qwx1c0XGE2TM0gEYiFChj5oHTmi1IOxLmw4Nv8nadmWZE5ech+kdLynpRXQfy0WwdC
 VqDoWgSH/a/neoaOuvJfsw1VrXmoaomS003kNkMJpZ4ndWj2oNJ+jzMsSblc4d0QJ9zM
 +9uVjl0NQ+2lV4hG2GxW17JWSAJ4T8vvoD/LhslMYjvIJP1S7NPKK+TGPxAl94Wz7dat
 m+TVLEh0sAvtY8oVEiL5koi5P4/S/NQLUBp4CqIQ/utCiS2WrcW6LC/fKT5T6zobCzhF
 mXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787869608; x=1788474408;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nLyjqO2yjNlh10KCYPm3ksDiwJqfCnNwZ2rfvB092wA=;
 b=CPHUrVWn8WP31WCcK0dJhLVe+IiJxHlEDdPZ+2xZZu1EaEeiLMz2Z4KdfyOJSnUp78
 vwgMqsOF0zQLk1FmMajqe3hy4CvXvFUJsebHd8iKGUJjsJMnXQYhNLwoUesMOhZvIq5d
 YGd3+fAy0wFzpyTjkri41xOhb+cU6GHK1cBsMhSdMgMuPv2XXdB4oi9NemnmAKv2KWL8
 jNC8/WzcHkWF6EoolR7XQyvmfeQYbMxzRykYguFx+4v8+hVU2u5SXakxbXlwv0PlpOzz
 w0XhZby/qHzUxG95secNIYUrfDhPexRm1OmiW6AwC8kmPJDoM1KRiRSk/OP4uJ+qjncO
 XqYQ==
X-Gm-Message-State: AFuF++l3Xi125aJRwerfJKStYuje70eDHSiywCYf24oVnHkfaNcigPJT
 c5sN3DzvYHUDFYBC8MF1v9aiqostOfGaUzpmXxzd9LytqZD+mE+mfZGrSxKR4UeRr3Y3eyEDapf
 D1JDKlpfGRsXckTkiN2dDl+cfX1ap9cSayxOVLX+fbrmUXxbIqBmtAcVskA==
X-Gm-Gg: AR+sD13yZRBoOUp829Ypa3ATzm92v0kiEXWSPB12mbn3QJ92YeElgGVQlewPuK1OCYu
 ndKBYLQ/u4dXtFIiOO25FueO+LO1Cp7WqjlFK7YhqgxKnpSrRVRmAHvcr02E9f9QNDQgV98cooN
 W6fJVYtTlxOxLQNGcgRDh7zQHMaSn+th+M8L9r8lwfTqBD0Ka8fmDxFwk9Y9zNxnUey5UKMYwES
 cWnj6KncjxFzZ3oTVoaV6G02YZkcgup/VbeZYj3OI+y9KWQF591dpXpQFQH2r0qPfIKeQ4RVQqL
 cPf2tecB06PFykaDVaTCD2aEAMqwIw30efYgbkJCKB/riuoDOh3x0Evkw+SrIfhkH9mUTjfJzyN
 9uibyTm9zibAyfjNkjnH518YN+Q32m/tlVKbtDw==
X-Received: by 2002:a05:620a:a717:b0:92e:5b45:b572 with SMTP id
 af79cd13be357-939137b8a4bmr249855985a.1.1787869602685; 
 Thu, 27 Aug 2026 15:26:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a717:b0:92e:5b45:b572 with SMTP id
 af79cd13be357-939137b8a4bmr249852985a.1.1787869602242; 
 Thu, 27 Aug 2026 15:26:42 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173a734dsm8924985a.26.2026.08.27.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 15:26:41 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 08/14] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_socket_aclint()
Date: Thu, 27 Aug 2026 19:26:01 -0300
Message-ID: <20260827222608.329788-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
References: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5cHyqOcAb1XKytHgkMcIa0JDQXIFCA3b
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfX5CQji6pRnnev
 6qc3dK7U4gyBxXBwv6loaMk3H/rn4K9SpXKoDJLYRgFWIC/DEoFrmi/vc+Rv9GSbqM0nx6haoEO
 EE4Znnqbhfy9Ou9Uib4sIZqI4CGDb3A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5MCBTYWx0ZWRfXwIChTD4yojzc
 5F5PALEzoaEE/p7cCCcb7SHzTmgXoYis6NZ4fwzJxA/0tfWzGkoR8Nj2qZOWpOJsukUe+hvO+oO
 LEGeRaX0TaOsAb9N3bI1/n95SEsxlgQtOiqgqBCFnsR2ZIvHtlyvyR4Nc1Hw9tVJ3kWoeXyNcht
 oPwS0ZqU5JwuQPm3c/hP51X1ZJLHmHfD0B3qahr/PEWVuaG+IJUEPpo1tis+lkAemisiEKltHXI
 jmVbY2zeWRJDXdiqsXsyw/59QTmu+TyVN8eZKSJc3XaJ6jMiGKReE+bafQh20sh7zRp6iM8Jl9i
 0/8HUnZXhc8TKP+PlmjUySC85DQKvX4+5tNRP6eIs952xNCftn72fhVaZVkJP2nIoeU68dPmuut
 zgBCUQGyc8CfYmDlDHWKfeFNkND+o8ByOBABKx+m36TsADi1v9hG6ID6TP+654S0ONAfRXEqaH6
 AHGrZAPklR4a/SJkbsg==
X-Proofpoint-ORIG-GUID: 5cHyqOcAb1XKytHgkMcIa0JDQXIFCA3b
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90b9a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5MeqwQr2QVKu_SNN6D4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
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

Yet another FDT that we want to move to a helper to avoid copy/pasting
code to other boards that will use a mtimer.  In particular the future
'riscv-server-ref' board.

No FDT changes made.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         |  96 ++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 101 ++++------------------------------
 include/hw/riscv/fdt-common.h |  11 ++++
 3 files changed, 119 insertions(+), 89 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index d815c5adff..76a783709d 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -16,6 +16,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/iommu.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_imsic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
@@ -702,3 +703,98 @@ void riscv_create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
 
     aplic_phandles[props->socket] = aplic_s_phandle;
 }
+
+void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
+                                    uint32_t *intc_phandles)
+{
+    uint32_t aclint_cells_size = props->num_harts * sizeof(uint32_t) * 2;
+    g_autofree uint32_t *aclint_mswi_cells = NULL;
+    g_autofree uint32_t *aclint_sswi_cells = NULL;
+    g_autofree uint32_t *aclint_mtimer_cells = NULL;
+    hwaddr addr, size;
+    char *name;
+    int cpu;
+
+    aclint_mswi_cells = g_new0(uint32_t, props->num_harts * 2);
+    aclint_mtimer_cells = g_new0(uint32_t, props->num_harts * 2);
+    aclint_sswi_cells = g_new0(uint32_t, props->num_harts * 2);
+
+    for (cpu = 0; cpu < props->num_harts; cpu++) {
+        aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
+        aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
+        aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
+    }
+
+    if (props->aia_type != AIA_TYPE_APLIC_IMSIC) {
+        addr = props->clint->base + (props->clint->size * props->socket);
+        name = g_strdup_printf("/soc/mswi@%"HWADDR_PRIx, addr);
+
+        qemu_fdt_add_subnode(fdt, name);
+        qemu_fdt_setprop_string(fdt, name, "compatible", "riscv,aclint-mswi");
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, addr, 2, RISCV_ACLINT_SWI_SIZE);
+        qemu_fdt_setprop(fdt, name, "interrupts-extended",
+                         aclint_mswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", 0);
+
+        if (props->numa_enabled) {
+            qemu_fdt_setprop_cell(fdt, name, "numa-node-id", props->socket);
+        }
+
+        g_free(name);
+    }
+
+    if (props->aia_type == AIA_TYPE_APLIC_IMSIC) {
+        addr = props->clint->base +
+               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * props->socket);
+        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
+    } else {
+        addr = props->clint->base + RISCV_ACLINT_SWI_SIZE +
+               (props->clint->size * props->socket);
+        size = props->clint->size - RISCV_ACLINT_SWI_SIZE;
+    }
+
+    name = g_strdup_printf("/soc/mtimer@%"HWADDR_PRIx, addr);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible",
+                            "riscv,aclint-mtimer");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+        2, addr,
+        2, size - RISCV_ACLINT_DEFAULT_MTIME,
+        2, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
+        2, RISCV_ACLINT_DEFAULT_MTIME);
+    qemu_fdt_setprop(fdt, name, "interrupts-extended",
+                     aclint_mtimer_cells, aclint_cells_size);
+
+    if (props->numa_enabled) {
+        qemu_fdt_setprop_cell(fdt, name, "numa-node-id", props->socket);
+    }
+
+    g_free(name);
+
+    if (props->aia_type != AIA_TYPE_APLIC_IMSIC) {
+        addr = props->aclint_sswi->base
+               + (props->aclint_sswi->size * props->socket);
+
+        name = g_strdup_printf("/soc/sswi@%"HWADDR_PRIx, addr);
+        qemu_fdt_add_subnode(fdt, name);
+        qemu_fdt_setprop_string(fdt, name, "compatible",
+            "riscv,aclint-sswi");
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, addr, 2, props->aclint_sswi->size);
+        qemu_fdt_setprop(fdt, name, "interrupts-extended",
+                         aclint_sswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", 0);
+
+        if (props->numa_enabled) {
+            qemu_fdt_setprop_cell(fdt, name, "numa-node-id", props->socket);
+        }
+
+        g_free(name);
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a6ec9def16..717a01da8d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -180,93 +180,6 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
 
-static void create_fdt_socket_aclint(RISCVVirtState *s,
-                                     int socket,
-                                     uint32_t *intc_phandles)
-{
-    int cpu;
-    char *name;
-    unsigned long addr, size;
-    uint32_t aclint_cells_size;
-    g_autofree uint32_t *aclint_mswi_cells = NULL;
-    g_autofree uint32_t *aclint_sswi_cells = NULL;
-    g_autofree uint32_t *aclint_mtimer_cells = NULL;
-    MachineState *ms = MACHINE(s);
-
-    aclint_mswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-    aclint_mtimer_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-    aclint_sswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
-
-    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
-        aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
-        aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
-        aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
-    }
-    aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
-
-    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = s->memmap[VIRT_CLINT].base +
-               (s->memmap[VIRT_CLINT].size * socket);
-        name = g_strdup_printf("/soc/mswi@%lx", addr);
-
-        qemu_fdt_add_subnode(ms->fdt, name);
-        qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-            "riscv,aclint-mswi");
-        qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-            2, addr, 2, RISCV_ACLINT_SWI_SIZE);
-        qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
-            aclint_mswi_cells, aclint_cells_size);
-        qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(ms, name, socket);
-        g_free(name);
-    }
-
-    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = s->memmap[VIRT_CLINT].base +
-               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
-        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
-    } else {
-        addr = s->memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-               (s->memmap[VIRT_CLINT].size * socket);
-        size = s->memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
-    }
-    name = g_strdup_printf("/soc/mtimer@%lx", addr);
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-        "riscv,aclint-mtimer");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-        2, addr + RISCV_ACLINT_DEFAULT_MTIME,
-        2, size - RISCV_ACLINT_DEFAULT_MTIME,
-        2, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
-        2, RISCV_ACLINT_DEFAULT_MTIME);
-    qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
-        aclint_mtimer_cells, aclint_cells_size);
-    riscv_socket_fdt_write_id(ms, name, socket);
-    g_free(name);
-
-    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
-        addr = s->memmap[VIRT_ACLINT_SSWI].base +
-               (s->memmap[VIRT_ACLINT_SSWI].size * socket);
-
-        name = g_strdup_printf("/soc/sswi@%lx", addr);
-        qemu_fdt_add_subnode(ms->fdt, name);
-        qemu_fdt_setprop_string(ms->fdt, name, "compatible",
-            "riscv,aclint-sswi");
-        qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-            2, addr, 2, s->memmap[VIRT_ACLINT_SSWI].size);
-        qemu_fdt_setprop(ms->fdt, name, "interrupts-extended",
-            aclint_sswi_cells, aclint_cells_size);
-        qemu_fdt_setprop(ms->fdt, name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(ms->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(ms, name, socket);
-        g_free(name);
-    }
-}
-
 static void create_fdt_socket_plic(RISCVVirtState *s,
                                    int socket,
                                    uint32_t *phandle, uint32_t *intc_phandles,
@@ -347,6 +260,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
     bool numa_enabled = riscv_numa_enabled(ms);
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
     APLICFdtProps aplic_props;
+    ACLINTFdtProps aclint_props;
 
     riscv_fdt_create_cpu_socket_subnode(ms->fdt,
         kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
@@ -354,6 +268,13 @@ static void create_fdt_sockets(RISCVVirtState *s,
 
     intc_phandles = g_new0(uint32_t, ms->smp.cpus);
 
+    if (virt_aclint_allowed() && s->have_aclint) {
+        aclint_props.clint = &s->memmap[VIRT_CLINT];
+        aclint_props.aclint_sswi = &s->memmap[VIRT_ACLINT_SSWI];
+        aclint_props.aia_type = s->aia_type;
+        aclint_props.numa_enabled = numa_enabled;
+    }
+
     phandle_pos = ms->smp.cpus;
     for (socket = (socket_count - 1); socket >= 0; socket--) {
         hwaddr memaddr = s->memmap[VIRT_DRAM].base +
@@ -372,8 +293,10 @@ static void create_fdt_sockets(RISCVVirtState *s,
                                        socket, riscv_numa_enabled(ms));
 
         if (virt_aclint_allowed() && s->have_aclint) {
-            create_fdt_socket_aclint(s, socket,
-                                     &intc_phandles[phandle_pos]);
+            aclint_props.socket = socket;
+            aclint_props.num_harts = s->soc[socket].num_harts;
+            riscv_create_fdt_socket_aclint(ms->fdt, &aclint_props,
+                                           &intc_phandles[phandle_pos]);
         } else if (tcg_enabled()) {
             hwaddr clintaddr = s->memmap[VIRT_CLINT].base +
                                s->memmap[VIRT_CLINT].size * socket;
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 8207cfee7b..a45b063f66 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -63,6 +63,15 @@ typedef struct APLICFdtProps {
     int aia_type;
 } APLICFdtProps;
 
+typedef struct ACLINTFdtProps {
+    const MemMapEntry *clint;
+    const MemMapEntry *aclint_sswi;
+    int socket;
+    int num_harts;
+    int aia_type;
+    bool numa_enabled;
+} ACLINTFdtProps;
+
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size);
 void riscv_create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
@@ -117,4 +126,6 @@ void riscv_create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
                                    uint32_t *next_phandle,
                                    uint32_t *intc_phandles,
                                    uint32_t *aplic_phandles);
+void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
+                                    uint32_t *intc_phandles);
 #endif
-- 
2.43.0


