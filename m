Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A23C61DBD
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:41:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03Mw-0007ex-6C; Fri, 28 Aug 2026 16:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mv-0007cy-5k
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mt-0006ZD-12
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:08 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJ7BS93675258
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BLnGzNzLpVRKq6WQRhFt0AFmqc7IFlfRt0zn0ugukbA=; b=VemBTMwNHgcWE6pd
 WmsgORzCHS2yox45HH4k3EgtZpj46qEeN/qw1Mo6KkWcU+Abz936N+q+/7nmI604
 W2ZejQ90EJg4iu8/LskwjJWs3Oa+0eVjaJsSCEt6Io9Gj9d3/yQhB650hzoYs/5y
 Fxus9BC4ZRN4hvXw+eVJh4aOR7l/LgyvwgR4tCtfDh9YPnW76piIOQPOvDtPj9NM
 0Yzu7nLxfus4qYKfUsw9Jqd9ASOztZ5xYdDa75UncFeaem+DTwBH9n1e6nJWxUBc
 dhSktrHhTlnkbduK/yYqdNJ/uwncee1TwTkN2IKqTV7t2udIg2oRSyQtUdrx3nOc
 gA/Ugg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs3jja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e53b8a302so115850685a.1
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949595; x=1788554395; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BLnGzNzLpVRKq6WQRhFt0AFmqc7IFlfRt0zn0ugukbA=;
 b=i1oVKOARswo9uYG9Jk3bupQtlPUq/OrYt18Q7iD0pRDB0hoOuopKsVCbztN1Q2kcpL
 k+rPepMVmKf3Y0dj+rcTijvjWU/KNwYd2Pi5giy6/OqF58+2ibyza9lWiXOEjB0OoAl5
 hbqZYGJNSBhO623Nd7JTovbPO0G+FeA8POpLxcX6jbFvr1USiCDEAi0+ekHgmjOQ+Hwp
 gdmADA45GvtqGFCIRNTvFr/6U2nXHEeHsU1AN+XZEKNkBiz9oshxSzU4rK6EQ+lHoKaC
 Qe/QsqrcRlgPRyezAJRG4JdE0mq8N+5xS9hGEeki+4O0PuTGGb9iLkrWYH9/HUOpjnNd
 ULEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949595; x=1788554395;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BLnGzNzLpVRKq6WQRhFt0AFmqc7IFlfRt0zn0ugukbA=;
 b=YwRm+eoMNCrY3tG7Fy+hGj2Uhli+kGeWjuk/Sx+k+ECbAb/PEcyxluXqHJiSOcROel
 hm87LvZwLeF3n61/aM8EmBwctcIGwtQmZ5fGMEgAkOcaiSdkYKBr5S5JHAmS9/fulfwx
 aBviuD7mak4PkHm7bc1jL+hAg0bPSAPqS3Jz7gUUQ0pmpU9WN9MiE/vomJ2hsjIkPg+m
 asRjXvTlJiI7sfjIyiW3U0Q+Q0Ol5hMIzSpQpmeHZjFhFihPYSu8LHHEenv9rA9C/y0b
 BGYhR7HB3ln8CtsAChYejxUz1psfN40ba8MJeQqR+/zyS2lT6DrN6r/s0UwuxKCOsuIo
 kXyA==
X-Gm-Message-State: AFuF++n6o7wJ8YY7+kBtrJflY62ECe4PBXWw0hatUh6RWtHSZ64+e9Ed
 Uvo6lglzqrtgOkmgIPEReqYtFML8/lWIFkRWrad2Z32RYbv45o8NMkk5PY7/gMwUTV0MGlbNnyf
 nzPwoE5YEs5Yrudle9If9igAOr87xxTEi/gRI6zVikZQNpbQdtGz7xvwRPw==
X-Gm-Gg: AR+sD13FJ/TftFfNhXLxl4TrjnxVpyFZY46ggysrkAa2xPcORpjKylp5ARA4ho/KnrX
 2FNLjdihn/h3297F8k64Cwmz7i7HfcsL5J6yZHnCr398mEBSm4Y0CbyPXSwKtNycLoiJmeTncMe
 Mm/Corfm3x/rAxlHQOHPS709pSpPXsRVnMpIUoqW0yPpnD9iOcnqptofg0qkmwxpXY+DfIet5MV
 n3AxK79mnF9y+SdvH/o3Ei+X7374VJDkxXGNhi+IBq3otCKj0wIlJjjne+ksOgB2KytxJgsLNXq
 lJFyf2FDOkHe9x4QEVRBrgpamMlAK8w0YNeyxyQKQ7M0LVQNcgvWSQITwXs/UfLQzzPmOOfzTBi
 gLoEcnzYtrbLzqnSUlVNECB5z9uL4+H6AfgHnsg==
X-Received: by 2002:a05:620a:4686:b0:939:1864:343e with SMTP id
 af79cd13be357-93918644403mr676541785a.40.1787949595140; 
 Fri, 28 Aug 2026 13:39:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:1864:343e with SMTP id
 af79cd13be357-93918644403mr676511185a.40.1787949591377; 
 Fri, 28 Aug 2026 13:39:51 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:50 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 09/15] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_socket_aclint()
Date: Fri, 28 Aug 2026 17:39:11 -0300
Message-ID: <20260828203918.350131-10-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a91f21b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5MeqwQr2QVKu_SNN6D4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX0u+IRwYTnCW6
 +7lPYZ0e57zMNfSzhhKV8gUw1Q2Mmgxb1wZ1xe0i3vy81U2/4shMHAJFMDKysoVuGVOYaXbGMe0
 JRHm5Nr28rjNrZnaSw1GlwPyuc/6Qxf27khnu/9RFoBg0ZFzlL1R1CDu/pkCpIlxErhKYusD1kX
 BV+HO4zyMNjhLG2Zq6VX9j4OsCyxZlwx+6zEt0+WWEixj2PnGyGate8V9qUAYKiq6gNeeH8XB7M
 6C5TKlQtAqBrF9sm89dUWUy4XgzzUeDqbFrtNNrwgOslP9zE3tT/7tEDvBc4OxMksOdeB3n9dAe
 zfwaViv2Hpe6fNtQmGe4GAqpnOn9QBT0ey9gKgXoapO1pxwU/gmmk9mdOl63nC2iXtBqKrG1EjK
 osMWfqyWHzFix9Af/A1LG+9aGhwV9sNx7S+H2AzchJ2jqYtoXcgplbZNoY4w7Bm34q30OdnZeYV
 1jOMZMCwdjykAnbihxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX4XGJ4bNkVrXC
 6sXhQ9P6QAIS7kyRqNOczRj5/6GTPUvNplU0iHFlmSbhOAx/DDXihssqCP4RS8Ee9fyycFEPRoT
 UCg1zVaNdYJ/rerbcof8AvxL6OqR1nY=
X-Proofpoint-GUID: s4x3z7yLSV03oRIFlWSFdLfjQ37eOjrX
X-Proofpoint-ORIG-GUID: s4x3z7yLSV03oRIFlWSFdLfjQ37eOjrX
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

Yet another FDT that we want to move to a helper to avoid copy/pasting
code to other boards that will use a mtimer.  In particular the future
'riscv-server-ref' board.

No FDT changes made.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         |  97 ++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 102 ++++------------------------------
 include/hw/riscv/fdt-common.h |  11 ++++
 3 files changed, 120 insertions(+), 90 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index d815c5adff..d2ce93ad28 100644
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
@@ -702,3 +703,99 @@ void riscv_create_fdt_socket_aplic(void *fdt, APLICFdtProps *props,
 
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
+    name = g_strdup_printf("/soc/mtimer@%"HWADDR_PRIx,
+                           addr + RISCV_ACLINT_DEFAULT_MTIME);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible",
+                            "riscv,aclint-mtimer");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+        2, addr + RISCV_ACLINT_DEFAULT_MTIME,
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
index 83a4b7710d..717a01da8d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -180,94 +180,6 @@ static void virt_flash_map(RISCVVirtState *s,
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
-    name = g_strdup_printf("/soc/mtimer@%"HWADDR_PRIx,
-                           addr + RISCV_ACLINT_DEFAULT_MTIME);
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
@@ -348,6 +260,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
     bool numa_enabled = riscv_numa_enabled(ms);
     bool is_32_bit = riscv_is_32bit(&s->soc[0]);
     APLICFdtProps aplic_props;
+    ACLINTFdtProps aclint_props;
 
     riscv_fdt_create_cpu_socket_subnode(ms->fdt,
         kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
@@ -355,6 +268,13 @@ static void create_fdt_sockets(RISCVVirtState *s,
 
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
@@ -373,8 +293,10 @@ static void create_fdt_sockets(RISCVVirtState *s,
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


