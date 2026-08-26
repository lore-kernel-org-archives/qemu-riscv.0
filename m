Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC20C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLSk-0003Ky-Af; Wed, 26 Aug 2026 17:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSi-0003KN-EH
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzLSg-0001Mv-9T
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:47:12 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QKdRCK899825
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oeAeqqeBK6wakIcsbhuK26bvlA6DkBClt/xUhhGHrAE=; b=jW7lbAWMX9FI4i7L
 VhB68AaqV0SlpXZB+v+0JqU8mL3CZnGV0UajBlfwJEb3Uen+UbM5otgsETtqUnSS
 tkq7nZ8Wdk0fDrmLGXRlbZNGbzceFb9oFLIE2TJhdYBbFhaLRT9WDUuPTZNyZfhv
 jj4Si/zV/RQG0+xOxyu+DooVUxkZVoOL/kE/UqItm5nddyAGA/el/ATvV50y+Cx4
 P3Mclz3wdA11GArvPXgCTzzFj7f6PaC2SsYBWt3RL7O0w2h+mEXADugo3rEuspS5
 CnrN9ELE0i/BjubAPioVGl7VjTDNjWA3xeY3/XJEWevI5ojUPHRpz0B9GR4yG0RK
 onmNbw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqtrcr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 21:47:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-904ee4473a8so10843086d6.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787780828; x=1788385628; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oeAeqqeBK6wakIcsbhuK26bvlA6DkBClt/xUhhGHrAE=;
 b=KRq3mEZ1C5b8GY/QjdNEfiiHRnROFHLDZU25OC5DLkco/d4gkVkvC2/KKYuBYz+Sh9
 5XaTkQ5+yES9sAm1jUe1N5e5MUxKSZ3ouRgo/z9l47Fd09KrcbFzRxR+AmPnyK3yV5Hx
 HIGh1WcYkGSqXHRTuxuZyiFSLQchL0RgVMuemdCViMjtolukIHe67MOoy3cIeZ5CZwPj
 R/BDO2NKHfbpK+/c4CtHXb3pFtdTP5NOqocieyQoOlycTUlHV7DJhxkNFWYtiam4SMic
 Obw1+HfLECU8TEXxXG21HKzlL56CLEO09OpilW10Gm6ND9F/hvSb9KdChgonsS/vEQnL
 qB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787780828; x=1788385628;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oeAeqqeBK6wakIcsbhuK26bvlA6DkBClt/xUhhGHrAE=;
 b=LXIGX0Nf4p8GYljAdtdHQ/uO1DXxDLyjGCYmxnJNFW5mtHwHvSqow9Fr1ZeaAccesz
 W9uBydGiab9a3ojqrKElK24/3EedTFQs2huh98GfPregsDbgQiCVbZktaD90N3YqN3AL
 doRbkVmHrUAIJ4StP/XnO7g+uO9DeOI4WSUUtYOkcmf9emUZJoBdoad5WD8JFwIVwyhE
 5XILomULqfVdsokEf5oZLcnfrT9bIize+q6U0ruXpZKZUcu4KydJGY7nbctEx/TILM5w
 puPdYzhjQWq55ApuvfAYdIZuo/+8me2L+9hgZHCvVWuVXxgI1lgX4CzR9yr1/rLBqS4S
 nLLQ==
X-Gm-Message-State: AFuF++mAlLBEZzrrycIiJJkP9rbgl/4+Yyd19/R+Q9/pxIc3Dtmzbqn5
 4lRDpKDbXWBfhRu9y/8iJr3O14JIgY7hP1QyZipv0kG0igPa4NocduJ7M0Z6CDyrycUMQhVZCc9
 rYNODuIC3IzmvBqRQgs8nrROAdtoqlXFe15qi9AXSwVz1Ni8MnDQ+qg0mIA==
X-Gm-Gg: AR+sD12KYf8Rnp4kuEO2D9Wa9hlwnKNIXGAE9RoQaRX4KkrUyPmsZPulPwmd0bAk3A+
 1s8OGUUwZgkDiNzFMGCVJJhs20KfhNcz9J3cbKeU+69fCcoKYLBjYsfRibmW2eQ5s/kLR/OvP5E
 81eO9fVFcavuLevBimiuwISEfacmkj99l6Xih7I6ajCqcttHsGa35toTgFgL3M56X/7hyIfv0eZ
 15u4GVRjiC35oYdt/bLUd5sL6aWcus8d1OzolKRchh0mKNE8d2uANCMGcg6Hwo04B+VlOqT7Uic
 8zTqjrF5a1LYeYikdztQmy/dBxrJSsjspvUrs0RpE/nEZ8IYQEvvZJkp66yUypOAu6dPLw13rB+
 KVE/0zEYe/CvvEuH3HJeFUbyqxc+cLiTGLCZxaw==
X-Received: by 2002:a05:6214:5bc1:b0:90c:bf49:cada with SMTP id
 6a1803df08f44-90cc78df457mr124006826d6.10.1787780827637; 
 Wed, 26 Aug 2026 14:47:07 -0700 (PDT)
X-Received: by 2002:a05:6214:5bc1:b0:90c:bf49:cada with SMTP id
 6a1803df08f44-90cc78df457mr124006226d6.10.1787780827059; 
 Wed, 26 Aug 2026 14:47:07 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd73e4117sm490916d6.24.2026.08.26.14.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 14:47:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 06/14] hw/riscv/fdt_common,
 virt.c: add riscv_create_fdt_imsic()
Date: Wed, 26 Aug 2026 18:46:34 -0300
Message-ID: <20260826214643.122728-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX1yEaXdR4m/oO
 ZI0Udeby3Fw1E2uQeK+HCa54w9uqMcu3AKF0fX2oMc+0XF6jKiq4AoXmP8mJCk03IE8zO+V7PZF
 9YTFQRUxhFDoCSkLDzTGjYbYx4WH2RM=
X-Proofpoint-ORIG-GUID: trLWWPCKxJAI4t7sWxiC1AhD0JOwi8iA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MyBTYWx0ZWRfX/HsdSkdhnmfW
 QeXABnEXg0HAEXMQaiSS8LR1hWfHTMtfTyLBgVQPkDygJLtuyU3AXzY9v3wBWR9CslUKC415bJ7
 axkvYkc7vcWGLpOK4sqLQ6ZnZEo8f7KTz+3W8uuLK5TdBKQGrJhiIIvOca9myk/xKBdGgwxNYYN
 M+Xljb2wZxtB0YAPwdheI0nHDf1CbYjR5/Jw7FFlYPljzrRkvW6PmbirkzMRnB1h3s6BYSvPY/X
 mX9dgfowC9rrhAWLP6bA2RRKyvhfUMvVCnSspC/6Ml+HhTj7iaAtBuBIlMzl903TeIaV2Nq+Svf
 4eqk0SVGXlYdPl+yF6rkF2jRhFr7tePj1gOnCp1CqIq8VpBHYEPDLFM3vVcyVSxQoXVF0fGDFxh
 /gA39Z2DAg+WAdbRzaJLI3jpmmDlOBvmdnHMA5ZwElQS5yZnD9tlqp6xwm8zQ+af8GzAf+uOMiC
 PoIsmRlRmFJbd36CSPA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8f5edc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BMLNMfnq-h6aLQoT45oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: trLWWPCKxJAI4t7sWxiC1AhD0JOwi8iA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260183
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

The FDT related to interrupt controllers should definitely be put into
helpers, even if only 'virt' benefits from it, due to the amount of code
that is relieved from the board alone.  We'll start with 'imsic'.

For this endeavor we're going to use a helper struct that will carry all
the extra FDT arguments in a human format.  The alternative would be to
add 8 more function arguments, on top of 4 phandle arguments that we're
passing around in all these controllers, and that's not only a poor
reading experience but it's quite error prone too.

We do not want to crowd the fdt-helper with non-FDT logic, hence we're
handling the !kvm_enabled() cond in virt.c using the imsic_m_base
argument.  This is a pattern that we'll fall back on in the next
patches too.

No FDT changes made.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         |  94 +++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 107 +++++-----------------------------
 include/hw/riscv/fdt-common.h |  21 +++++++
 3 files changed, 129 insertions(+), 93 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 54604d3158..62243434d8 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -15,8 +15,10 @@
 #include "target/riscv/cpu_bits.h"
 #include "hw/riscv/riscv-iommu-bits.h"
 #include "hw/riscv/iommu.h"
+#include "hw/intc/riscv_imsic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/riscv/aia.h"
 
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size)
@@ -499,3 +501,95 @@ void riscv_create_fdt_pcie(void *fdt, int aia_type, bool has_iommu_sys,
 
     create_pcie_irq_map(fdt, name, irq_pcie_phandle, aia_type, pcie_irq);
 }
+
+static void create_fdt_one_imsic(void *fdt, IMSICFdtProps *props,
+                                 hwaddr base_addr,
+                                 uint32_t *intc_phandles, uint32_t msi_phandle,
+                                 bool m_mode, uint32_t imsic_guest_bits)
+{
+    RISCVHartArrayState *soc = (RISCVHartArrayState *)props->soc;
+    g_autofree char *imsic_name = NULL;
+    uint32_t imsic_max_hart_per_socket, imsic_addr, imsic_size;
+    g_autofree uint32_t *imsic_cells = NULL;
+    g_autofree uint32_t *imsic_regs = NULL;
+    static const char * const imsic_compat[2] = {
+        "qemu,imsics", "riscv,imsics"
+    };
+    int cpu, socket;
+
+    imsic_cells = g_new0(uint32_t, props->smp_cpus * 2);
+    imsic_regs = g_new0(uint32_t, props->socket_count * 4);
+
+    for (cpu = 0; cpu < props->smp_cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(m_mode ? IRQ_M_EXT : IRQ_S_EXT);
+    }
+
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < props->socket_count; socket++) {
+        imsic_addr = base_addr + socket * props->imsic_group_max_size;
+        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
+                     soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < soc[socket].num_harts) {
+            imsic_max_hart_per_socket = soc[socket].num_harts;
+        }
+    }
+
+    imsic_name = g_strdup_printf("/soc/interrupt-controller@%"HWADDR_PRIx,
+                                 base_addr);
+    qemu_fdt_add_subnode(fdt, imsic_name);
+
+    qemu_fdt_setprop_string_array(fdt, imsic_name, "compatible",
+                                  (char **)&imsic_compat,
+                                  ARRAY_SIZE(imsic_compat));
+
+    qemu_fdt_setprop_cell(fdt, imsic_name, "#interrupt-cells",
+                          FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(fdt, imsic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(fdt, imsic_name, "msi-controller", NULL, 0);
+    qemu_fdt_setprop(fdt, imsic_name, "interrupts-extended",
+                     imsic_cells, props->smp_cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(fdt, imsic_name, "reg", imsic_regs,
+                     props->socket_count * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(fdt, imsic_name, "riscv,num-ids",
+                          props->irqchip_num_msis);
+
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(fdt, imsic_name, "riscv,guest-index-bits",
+                              imsic_guest_bits);
+    }
+
+    if (props->socket_count > 1) {
+        qemu_fdt_setprop_cell(fdt, imsic_name, "riscv,hart-index-bits",
+                              imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(fdt, imsic_name, "riscv,group-index-bits",
+                              imsic_num_bits(props->socket_count));
+        qemu_fdt_setprop_cell(fdt, imsic_name, "riscv,group-index-shift",
+                              IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(fdt, imsic_name, "phandle", msi_phandle);
+}
+
+void riscv_create_fdt_imsic(void *fdt, IMSICFdtProps *props,
+                            uint32_t *phandle, uint32_t *intc_phandles,
+                            uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+{
+    *msi_m_phandle = (*phandle)++;
+    *msi_s_phandle = (*phandle)++;
+
+    if (props->imsic_m_base) {
+        /* M-level IMSIC node */
+        create_fdt_one_imsic(fdt, props, props->imsic_m_base,
+                             intc_phandles, *msi_m_phandle, true, 0);
+    }
+
+    /* S-level IMSIC node */
+    create_fdt_one_imsic(fdt, props, props->imsic_s_base,
+                         intc_phandles, *msi_s_phandle, false,
+                         imsic_num_bits(props->aia_guests + 1));
+
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 32d66a278c..1a461b7eeb 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -320,97 +320,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     }
 }
 
-static void create_fdt_one_imsic(RISCVVirtState *s, hwaddr base_addr,
-                                 uint32_t *intc_phandles, uint32_t msi_phandle,
-                                 bool m_mode, uint32_t imsic_guest_bits)
-{
-    int cpu, socket;
-    g_autofree char *imsic_name = NULL;
-    MachineState *ms = MACHINE(s);
-    int socket_count = riscv_socket_count(ms);
-    uint32_t imsic_max_hart_per_socket, imsic_addr, imsic_size;
-    g_autofree uint32_t *imsic_cells = NULL;
-    g_autofree uint32_t *imsic_regs = NULL;
-    static const char * const imsic_compat[2] = {
-        "qemu,imsics", "riscv,imsics"
-    };
-
-    imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
-    imsic_regs = g_new0(uint32_t, socket_count * 4);
-
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
-        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
-        imsic_cells[cpu * 2 + 1] = cpu_to_be32(m_mode ? IRQ_M_EXT : IRQ_S_EXT);
-    }
-
-    imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < socket_count; socket++) {
-        imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
-        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
-                     s->soc[socket].num_harts;
-        imsic_regs[socket * 4 + 0] = 0;
-        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
-        imsic_regs[socket * 4 + 2] = 0;
-        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
-        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
-            imsic_max_hart_per_socket = s->soc[socket].num_harts;
-        }
-    }
-
-    imsic_name = g_strdup_printf("/soc/interrupt-controller@%lx",
-                                 (unsigned long)base_addr);
-    qemu_fdt_add_subnode(ms->fdt, imsic_name);
-    qemu_fdt_setprop_string_array(ms->fdt, imsic_name, "compatible",
-                                  (char **)&imsic_compat,
-                                  ARRAY_SIZE(imsic_compat));
-
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
-                          FDT_IMSIC_INT_CELLS);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller", NULL, 0);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
-                     imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
-    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
-                     socket_count * sizeof(uint32_t) * 4);
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
-                     VIRT_IRQCHIP_NUM_MSIS);
-
-    if (imsic_guest_bits) {
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,guest-index-bits",
-                              imsic_guest_bits);
-    }
-
-    if (socket_count > 1) {
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-bits",
-                              imsic_num_bits(imsic_max_hart_per_socket));
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-bits",
-                              imsic_num_bits(socket_count));
-        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-shift",
-                              IMSIC_MMIO_GROUP_MIN_SHIFT);
-    }
-    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", msi_phandle);
-}
-
-static void create_fdt_imsic(RISCVVirtState *s,
-                             uint32_t *phandle, uint32_t *intc_phandles,
-                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
-{
-    *msi_m_phandle = (*phandle)++;
-    *msi_s_phandle = (*phandle)++;
-
-    if (!kvm_enabled()) {
-        /* M-level IMSIC node */
-        create_fdt_one_imsic(s, s->memmap[VIRT_IMSIC_M].base, intc_phandles,
-                             *msi_m_phandle, true, 0);
-    }
-
-    /* S-level IMSIC node */
-    create_fdt_one_imsic(s, s->memmap[VIRT_IMSIC_S].base, intc_phandles,
-                         *msi_s_phandle, false,
-                         imsic_num_bits(s->aia_guests + 1));
-
-}
-
 /* Caller must free string after use */
 static char *fdt_get_aplic_nodename(unsigned long aplic_addr)
 {
@@ -584,8 +493,20 @@ static void create_fdt_sockets(RISCVVirtState *s,
     }
 
     if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
-        create_fdt_imsic(s, phandle, intc_phandles,
-                         &msi_m_phandle, &msi_s_phandle);
+        IMSICFdtProps props = {
+            .soc = &s->soc,
+            .socket_count = riscv_socket_count(ms),
+            .smp_cpus = ms->smp.cpus,
+            .imsic_m_base = !kvm_enabled() ? s->memmap[VIRT_IMSIC_M].base : 0,
+            .imsic_s_base = s->memmap[VIRT_IMSIC_S].base,
+            .imsic_group_max_size = VIRT_IMSIC_GROUP_MAX_SIZE,
+            .irqchip_num_msis = VIRT_IRQCHIP_NUM_MSIS,
+            .aia_guests = s->aia_guests
+        };
+
+        riscv_create_fdt_imsic(ms->fdt, &props, phandle, intc_phandles,
+                               &msi_m_phandle, &msi_s_phandle);
+
         *msi_pcie_phandle = msi_s_phandle;
     }
 
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 7517316a56..f0d24c26f5 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -10,6 +10,8 @@
 #define RISCV_VIRT_FDT_H
 
 #include "target/riscv/cpu.h"
+#include "hw/core/boards.h"
+#include "hw/riscv/riscv_hart.h"
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
@@ -32,6 +34,22 @@ typedef enum RISCVAIAType {
     AIA_TYPE_APLIC_IMSIC,
 } RISCVAIAType;
 
+typedef struct IMSICFdtProps {
+    /*
+     * Machines will statically allocate RISCVHartArrayState[] pointer,
+     * e.g. "RISCVHartArrayState soc[VIRT_SOCKETS_MAX]".  We'll have
+     * to use a void* pointer to handle a soc with variable sizes.
+     */
+    void *soc;
+    hwaddr imsic_m_base;
+    hwaddr imsic_s_base;
+    int socket_count;
+    int smp_cpus;
+    int imsic_group_max_size;
+    int irqchip_num_msis;
+    int aia_guests;
+} IMSICFdtProps;
+
 void *riscv_create_board_device_tree(const char *model, const char *compatible,
                                      int *fdt_size);
 void riscv_create_fdt_socket_memory(void *fdt, hwaddr addr, uint64_t size,
@@ -77,4 +95,7 @@ void riscv_create_fdt_pcie(void *fdt, int aia_type, bool has_iommu_sys,
                            uint32_t irq_pcie_phandle,
                            uint32_t msi_pcie_phandle,
                            uint32_t iommu_sys_phandle, uint32_t pcie_irq);
+void riscv_create_fdt_imsic(void *fdt, IMSICFdtProps *fdt_props,
+                            uint32_t *phandle, uint32_t *intc_phandles,
+                            uint32_t *msi_m_phandle, uint32_t *msi_s_phandle);
 #endif
-- 
2.43.0


