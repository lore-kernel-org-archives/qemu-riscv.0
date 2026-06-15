Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD4CD98E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:43:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE4V-0002wY-Ix; Mon, 15 Jun 2026 16:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4U-0002vS-Ec
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4S-0002Eb-QG
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:14 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FJ12QM1453984
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ga8OQGNFMkS
 /l/cgG0yBv7NXDhBd/6OoyfA2/6gi4Fc=; b=OQhuaKKjti+vSZYR+Lp8iJO9JA3
 48Y05XvLQHqDYyhNgs+Phxwvc+PzF7NeD9HJMY+6lu0sl19BMD9mGqrL8NDKz4rC
 2j25kT4UEqgRFkZ8nwdmrlHbMhvUz2WXAncnUfOmqXhYEqLlr+HP2B8DTCyBVCOm
 29ZrJpB4rV1Br+nWgpyDG16gKw8UDBQ3hCAYjwQNQg4iblEh6Ufd8z/j+2U7Ey+1
 kjAnf6D0jZwatpNyEUhQcDR08JG+CkVCn0l9XJjbLB8O8THt+R9bOAXGfVskYB2H
 evswYPPWn3XQJDQudUWEiqTXEcv6zqAr+xfqLXoNY4mlzi8FdCzg81xHl6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2cbdqw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5175a1e32e3so100051151cf.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555891; x=1782160691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ga8OQGNFMkS/l/cgG0yBv7NXDhBd/6OoyfA2/6gi4Fc=;
 b=eFYfmtPe1hmutVP31lMnOJYglZJFLekrD7Zidgc8ef1zUVsqxNhUEICq9DpfkIMRzk
 G/s4ohdzMJcUixFSAzX0reLik/klMnvFHXS1e5WFSlEVmAlQQgc9QuCx1NkuY7+7QXnt
 katxyDQpWQcOoIEivHyyPY1nIXd9lJ7nSoPcgNA2wJ7lXBlslkGS17Xml+EzYybijEaV
 I3uFodWRX/uVlGQh9Pb+PRGF3PVlloUf4v8DKAtXvvC1tSY37qdBHKWYvOCvpECHS6Ib
 SH9dR0xBjYaqaBD8WGwExFb9lWpo4rLucxXAEQe9IcxW29bNZOfyhnQ1NpX1f9WOSJA+
 bU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555891; x=1782160691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ga8OQGNFMkS/l/cgG0yBv7NXDhBd/6OoyfA2/6gi4Fc=;
 b=Zxc1zM+R50Nm9+ExQ/87zfSBAUQSG81v3w8LNWSseb5egolIjjP43TN1TkeAkBAf+a
 iC2ZBLT/d6AG/UPLXeQ0Ob98YufyxYn8oALX4Pb2/FLUa36Gk5WCjVSLabH+DFBO7XZV
 O3pFBy0iOhhykCVHVSJA9r55J20JVc8C2bKE80wc92jW/9tfla2Rz8A2fYoRnMjhY3EX
 iE5eSYrJO8ycPzAh7FzaXIZqeyoqD52ISCEQ49LO7Xm0BXwtmIVSQCBd8G+TKhp9QO6h
 Y3bgpZuTA1EAvsBijd4CJRGS9mYrlYgwPWdhdAQU9pIeqzsiWYtH++1ua7rNVIIROGAr
 9/0w==
X-Gm-Message-State: AOJu0Yy76T/SAIsSC2poeHkJC+hmriDI76ml47pbchAlfjc5EP3+DxoK
 0575+ah6kPs3/TGuZiNpoWEP8aS2EbW6Dv00Fh9gqnjlb2Okb8gUNYPhSzR7cKIpKlS7hfSRNO9
 yJhUnxz60oSBG5Z3Pddl+CUsqTMddOHDtS4yw8ilZicfBaP3atCaYerH1AFM8bf8u9g==
X-Gm-Gg: Acq92OED2hB+3KvZfoS4l+LmQCPf65TjQEW052W8viN6MKfn748IB2RP+s7gRnHDKZc
 FRZr6hWQuw7N9+XMCnrn4L1mo+3+5a4lST13adIElkdoBjlwBuFU72o6XW6ncjQtvcK3L4/EENx
 1vHSFPesZmbQ+bs8inuhmnWo/XRvIrv4x3OF4ylehpP/554PtWNGiallv8T5pWI187O+ZJfj0eX
 ur2jJub5XVMa9OXEVM4PaDNgpiUWPXymcWC79nlZTfIuP2C1eDpMfOtLDiQ0bc5PuU6o9QnfIl0
 bXWAQ9iOdOY436OJTYuzX7N5Uzivup9hw5B9/i4KzmLv05U74U/q9Qmc9eh+c6ka2BiSFyHwvIW
 WbiTRMnRsbdABIihVjgNm8Fb9y/FglbXeNwXfDWmm46kT9Br4X4rBOx404xg=
X-Received: by 2002:a05:622a:1814:b0:517:9095:c31b with SMTP id
 d75a77b69052e-5195354cab2mr187343621cf.42.1781555891132; 
 Mon, 15 Jun 2026 13:38:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1814:b0:517:9095:c31b with SMTP id
 d75a77b69052e-5195354cab2mr187343291cf.42.1781555890635; 
 Mon, 15 Jun 2026 13:38:10 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:38:10 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 13/13] hw/riscv: add create_fdt_socket_cpu_sifive()
Date: Mon, 15 Jun 2026 17:37:33 -0300
Message-ID: <20260615203734.954428-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfX/yT8bxclB9fS
 CuNt+h3BjEbo9dZjdflq8TZVUrBDwWRnLWRCPmmubnVeU+HsMxx9zqmiKF0v3aAuo/Sdu2iqLFH
 6XZnm3QPjgztLG3K/1/GNIz4sxv334LtdFqApRl4pD/7nTYhb0GxOR9LQs4ezTe5wqBu3gPekyV
 3nxOhN4fFEBPFc2E/IXhsjnPoFHxSGiknm/uy4QX4hetsm/MW2vXJWS65BQI8bx/2/HO7ZJS7fH
 uQ9J+orGxB0Ej3LdjVIZXViSemvIz+X/WF1QGTUyfR8rqn9LSVXTZdO4WKX/adudF2lCsCkt6+J
 y0/9knVQtSXR9fEaa6JHjw5CoIOAtJuuVZy+YFe9KUejfLXhM6i7siqFTAmjqPVAsT1twn+ueVq
 Ls3TibQ0FsfkQF/GFIrvUOo6TIMCG8fj0n6cskIzuxDWXJAEJeUirxORXNecNoJ7sEtc7pmfmCn
 xwMLuRmc11PoBXgb3vg==
X-Proofpoint-ORIG-GUID: WdsB-qHSBbebYXEfKr5YtbhB0pSkjQ35
X-Proofpoint-GUID: WdsB-qHSBbebYXEfKr5YtbhB0pSkjQ35
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOSBTYWx0ZWRfX2+gO+na7xYGA
 6xXx9P9+JsukgACPP8UTDaJpI8orGdEG3O+fxCO0LEQHdehNp+y6sEeNxp2q3YszgNCizw6/gHE
 LQSrWBkklxXeZoT4xyCaANSqv+Dia2E=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a3062b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PC6YXwtoWIEWxpKgCUMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150219
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This sifive_u only helper shares DT code with other boards.  The idea is
to reduce code repetition while keeping sifive_u characteristics in
place.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/fdt-common.c         | 11 +++++++++++
 hw/riscv/sifive_u.c           | 24 +++---------------------
 include/hw/riscv/fdt-common.h |  4 ++++
 3 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 70168ad657..b27ff13bca 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -189,3 +189,14 @@ void create_fdt_socket_cpus(void *fdt, RISCVCPU *socket_harts,
                                        is_32_bit);
     }
 }
+
+void
+create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
+                             int cpu_id, int socket_id,
+                             int socket_hartid_base, uint32_t *phandle,
+                             uint32_t *intc_phandles)
+{
+    create_fdt_socket_cpu_internal(fdt, clust_name, NULL, cpu_id,
+                                   socket_id, socket_hartid_base,
+                                   phandle, intc_phandles, false, false);
+}
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 27c1a74d99..0c6e4204cb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -145,12 +145,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_add_subnode(fdt, clust_name);
 
     for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
-        int cpu_phandle = phandle++;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
-        char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        g_autofree char *core_name = NULL;
-
         qemu_fdt_add_subnode(fdt, nodename);
+
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
             if (is_32_bit) {
@@ -162,25 +159,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         } else {
             riscv_isa_write_fdt(&s->soc.e_cpus.harts[0], fdt, nodename);
         }
-        qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
-        qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
-        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
-        qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
-        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
-
-        intc_phandles[cpu] = phandle++;
-
-        qemu_fdt_add_subnode(fdt, intc);
-        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandles[cpu]);
-        qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
-        qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
 
-        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
-        qemu_fdt_add_subnode(fdt, core_name);
-        qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
+        create_fdt_socket_cpu_sifive(fdt, clust_name, cpu, 0, 0,
+                                     &phandle, intc_phandles);
 
-        g_free(intc);
         g_free(nodename);
     }
 
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 3af9d5c3fd..2d6b9a5d03 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -26,4 +26,8 @@ void create_fdt_socket_cpus(void *fdt, RISCVCPU *socket_harts,
                             int socket_hartid_base, uint32_t *phandle,
                             uint32_t *intc_phandles, bool numa_enabled,
                             bool is_32_bit);
+void create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
+                                  int cpu_id, int socket_id,
+                                  int socket_hartid_base, uint32_t *phandle,
+                                  uint32_t *intc_phandles);
 #endif
-- 
2.43.0


