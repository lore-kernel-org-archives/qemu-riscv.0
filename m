Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC465C61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03Mm-0007Mx-Sg; Fri, 28 Aug 2026 16:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Ml-0007MB-1I
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mi-0006X0-TT
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:58 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJ7Wrx3331032
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZT0iUTBK1UrFvANmHeHLvRYs2Xq1Vmxpjn3bhaymUBg=; b=iGLOdbdlourEUDvD
 gxeOa4ZEebmUrG9j18H2vcQesW2vQU8KY0nPGcbbIzQygiYVV0crmqN1TILyJt6J
 QtQsKlJT6lnrKSrIIcqWUGHGTq0B5Is2EoiKMYBsNauVLjwf+Kyu6Cb8lzpnvcd6
 SyH34JpvZKjpzbMx/htM3u72IAmY2ji0P7uqw54/5OKQ2+UJBXNtA28+hPXpP1hi
 RiF046xXm86+WZQjdo/2b3RKoRjZANbqQFCU5+p81UcixtwXYJneStdzHnpYi4hw
 qy1cM3LwyjesjKe/YwiI3qdPNtpbmmHvhY+hrJ5+Vg5KKJzl1pQY+CzUfgioaa8V
 mjziMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42rbeeq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93909014c85so160666785a.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949585; x=1788554385; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZT0iUTBK1UrFvANmHeHLvRYs2Xq1Vmxpjn3bhaymUBg=;
 b=fayXm6mUDc9IhW8ek5JB3OKn5s27CtjOj8K27QnvQPi5fNjjCr2vt53py/0NeTj+kK
 lvWY+Duyf/p0ROicKn8KZ1d/2yx9yJa9C/yEcnOxhnlPNIOCj1kNuCYHtN5awLAMgoS7
 lNYAllL/LCG5yOWc4ZKBLzvXKtUbCh92mWp+YRB9lPtiOc12fRLMZ+zNCWj9YVqIuPg4
 zP/H1FaTxMwZlFLhXBdfCJSkXoTRfHPX8nZA44I37pnWVS9z/TEQUYs0MDMnRcOunyLx
 IoY4DYIeRKZmyP6gvbSRrsCJh8Em8JrkOmPlBcBc3a7DPkXV0xMCcQhK5+175wSmEmJp
 ZrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949585; x=1788554385;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZT0iUTBK1UrFvANmHeHLvRYs2Xq1Vmxpjn3bhaymUBg=;
 b=L4gMyTThJ3ikuIQ4fNMlTAiDksLZ6+blOX3YyQjYiDysK7NGXFWpZw54sRmW5jpsF5
 9JOrVxZvipHyFe0abbARADQAdV4pvNzT6QL4HODk1PHlv8zbQ21Yw2gYfjvznaWBpu/o
 h3cNQZlOVGkB12XM3xo+cAD/xPvQMyhg0qEonOzM2+kPiNPNI/wQN5RBprChZ+nS5Mvq
 AKgeX5DgC6NQhFxmNuLvc0VM1cpU5np1aZvMqjUugOSc0ZuIFnFJHoo61MHv7CHH9mL6
 7TfpojdGMUkHUO20uiaCSCbtY9OWoRI35SkWuJeSpyxwY+HfKkUwAqILzuVrMqAoxANN
 8NFQ==
X-Gm-Message-State: AFuF++khkctBcmgXUfkl7ssWSsW/tGZ4eysoI9L5PWvZ+cxQ87k0DcTa
 Q5fBDbmiGaPCnRE8BQ0DOogP+RNA4eUd5yNB78X/Qr0ajbiAMW9954ry7caLBJVuvIKjFFjecjO
 fElXJMLz95UXRMaJSZjUORDiUCR1RzfpF19OML/giRxfjaA8xcM1s2hKMjw==
X-Gm-Gg: AR+sD13DnWCezppur4tecIKH/XE+VgmF3m7E/eptmgQPCqA99YEKbqDwGWHiso/mXnX
 iMJtuhjvcTpVxT4UA94TkA9v0uVeKgW1vvhnCLKVaGUniZry+ccEyhRj97x9Ru8z3bD3bka9dzE
 maHOyCusz1MubLKE5fWMgdPKYlHVW9mtwmguwfEnna9IBtdCPf7q+te2aLxzPsKolbO/JPxvV/6
 Qp9tbp348VQPIgrGlvc3T0zW05y8jHDuvLjF3NjFVYttP425vkrGzYDfjXIwH+OnVD6oepuc1qW
 SEOxWXVZUoh2yK8IM4KjOwOW381IzWNnZmqtvQ/fKBVOjW7q4APZHtrlDkwmpuPlzJJh7DdkFXt
 e6U2HsDeSNiwyF0wGRwBJntESKvoRLoqGTeSDdg==
X-Received: by 2002:a05:620a:8218:b0:937:3b26:c9e9 with SMTP id
 af79cd13be357-939138d2d33mr1016138485a.25.1787949584262; 
 Fri, 28 Aug 2026 13:39:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8218:b0:937:3b26:c9e9 with SMTP id
 af79cd13be357-939138d2d33mr1016133185a.25.1787949583755; 
 Fri, 28 Aug 2026 13:39:43 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:43 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 06/15] hw/riscv/fdt_common,
 virt.c: add riscv_create_fdt_imsic()
Date: Fri, 28 Aug 2026 17:39:08 -0300
Message-ID: <20260828203918.350131-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nGjN0s_WJ-n3Kot25S4w2J4xZzCUy487
X-Proofpoint-ORIG-GUID: nGjN0s_WJ-n3Kot25S4w2J4xZzCUy487
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX05Pgos5lSSeA
 bYwkRmM+lzC8RfffOerklMYYq5xDE6bexk8YBH6M5nbT2gmfZ+osQ0WzF9sltFuWHVizTEy4/VY
 isz55AG7J+ciDi8hLGLjFS6YNC7ucn4lLuSXQ3cK23Ovvhl7A98G4E9f+cHFt3yqj03ctLs4qXY
 iE+leIuCYQ09fA5QRTAe7Rx8YmQneniESLhv31t1Hm+nsMZj/76vPCjb5MvVDHpIdJdYAMwb8fw
 Ph+fpFhzrMFuSmJ76DXnIreUWjk5zQijrwm3f82B0wp+Iw3ldtJ9EXkhwYm4xekp+fQFdM2NihO
 NXMnKCb9Y5I10u+N78xwfjl0+YdvEjIU7uihg9UkZ34RpujtyrDAXCa4eUxH8z6oenxNT8dXRp+
 xhhe6ho5NazQ6YbKZuYDf7d7QzcW1rUOlVUMQ+pbC2IJVzi2VQAgtAGTSLYjG8ja+jn4TBN7fDO
 96Wij+TMrbsdwN6QC4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX3TwQq0m5A+at
 XPdJTh8cSqDlZVU/jTF7pU1/7/LPGQOhVhSwLBwWHCyHpN47WiwZsX/TPKpQpazjC+5gclGI53w
 MG9+gwr0978XLv0nd0vDtAZxtz2JL9M=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a91f211 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JygOcCPXwz5LZr-bGiwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280179
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
 hw/riscv/fdt-common.c         |  98 ++++++++++++++++++++++++++++++
 hw/riscv/virt.c               | 108 +++++-----------------------------
 include/hw/riscv/fdt-common.h |  21 +++++++
 3 files changed, 133 insertions(+), 94 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 38813b6aa7..ae24ad0011 100644
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
@@ -495,3 +497,99 @@ void riscv_create_fdt_pcie(void *fdt, int aia_type, bool has_iommu_sys,
 
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
+    g_autofree uint32_t *imsic_cells = NULL;
+    g_autofree uint32_t *imsic_regs = NULL;
+    uint32_t imsic_max_hart_per_socket = 0;
+    static const char * const imsic_compat[2] = {
+        "qemu,imsics", "riscv,imsics"
+    };
+
+    imsic_cells = g_new0(uint32_t, props->smp_cpus * 2);
+    imsic_regs = g_new0(uint32_t, props->socket_count * 4);
+
+    for (int cpu = 0; cpu < props->smp_cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(m_mode ? IRQ_M_EXT : IRQ_S_EXT);
+    }
+
+    for (int socket = 0; socket < props->socket_count; socket++) {
+        hwaddr imsic_addr = base_addr + socket * props->imsic_group_max_size;
+        uint32_t imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
+                              soc[socket].num_harts;
+
+        imsic_regs[socket * 4 + 0] = cpu_to_be32(imsic_addr >> 32);
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
+                            uint32_t *next_phandle, uint32_t *intc_phandles,
+                            uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+{
+    if (next_phandle) {
+        *msi_m_phandle = (*next_phandle)++;
+        *msi_s_phandle = (*next_phandle)++;
+    } else {
+        *msi_m_phandle = qemu_fdt_alloc_phandle(fdt);
+        *msi_s_phandle = qemu_fdt_alloc_phandle(fdt);
+    }
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
index a28e6d200a..468ec90696 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -320,98 +320,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
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
-    uint32_t imsic_max_hart_per_socket, imsic_size;
-    hwaddr imsic_addr;
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
-        imsic_regs[socket * 4 + 0] = cpu_to_be32(imsic_addr >> 32);
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
@@ -585,8 +493,20 @@ static void create_fdt_sockets(RISCVVirtState *s,
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
index 3750230865..182c03d8ce 100644
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
+                            uint32_t *next_phandle, uint32_t *intc_phandles,
+                            uint32_t *msi_m_phandle, uint32_t *msi_s_phandle);
 #endif
-- 
2.43.0


