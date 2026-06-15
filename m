Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922D1CD98E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE4P-0002sx-Sb; Mon, 15 Jun 2026 16:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4N-0002sR-Cz
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4J-00029p-SA
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:06 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FIx7da861022
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=D882KEthOvY
 2rIi3k7Eye2n7i4NMV5sVrKHmsFH48ww=; b=Wuoh+c1etz9ZoSfgPtDtHSQwtWa
 Aeul7vCSrYDPG5p902wqf8x0XPAPVYvmhb7eGzrcVw26/Eef/rj67OXlwUgZXANn
 t2Ww5N+hIp1SSLGTrtc9F//pVkd6I1BbtiBvNDs1Nm+RvBu709cEJX5rhyDguWd3
 TzIAZRbhtDFmiVshftDr1hhOWrpy6Z4AYWGlvSOuDSzp86vT+PxKcmeqAnPuzeFJ
 iDU3GfiivFwVU4n4wcxVbmqXIqGpCc5HYIlVrnc19D8riawjYGUOLLVO79ePd0eI
 IrD0fK/1vn0ToBSX60wIVLTFHm1ATBPsZkSzKSpJfA3EaRJZylhyTdEdV6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydavjf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915f7c37734so829310185a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555871; x=1782160671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D882KEthOvY2rIi3k7Eye2n7i4NMV5sVrKHmsFH48ww=;
 b=SZtOS950PZ/Z+uSWTSGqeIPgE5c53UDahfTRarmj93AMXSXm1gxyQO2gQonCjo/Dhh
 TJQ/qyQL9+0PXCottg27RQGSQ5TVRBz0lleeYuUwLDv4g0ildzDQKDpXlXBppc7ebEpb
 xz2LJuMR0NFN7ZquYvLOA1ARTDZUmxu0Ih0HwZmq/CnEtL4w1XhnXCikx2qWTNCTsyb1
 nZ9h0aWRDXz6PRkht/TiThmzeU7oXWIZjtwZFn2l8gz4cJ9tpQ7s/IHO+YtB4Z49qNe7
 1m2KLi27tNjbGgSdH81+j7A7X6EWrZg4WS9kWoroNhzT6GjPAAhzYzkLiIZxYPsOuvGG
 i+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555871; x=1782160671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D882KEthOvY2rIi3k7Eye2n7i4NMV5sVrKHmsFH48ww=;
 b=pQ+f2i5URnQ8CPeT2huiP2+HzV7sO8mbh7d5fnDLuqljPfxPGsFS/kdNGeoxXuctNN
 Fcc2Sxr5Vct5H/xL4B6d8j+Z2FP9uWnZ13ESLUg/+PmwXi5AYxKK1BoQz20yaDDbsQJd
 gbNgsxqfpD0yyKsTsubM/gI12tpXSlyGa8G3E5K8jmTq0FdD1Fc2SQz2HmecxPRRa6VT
 A+n1lusJLgJGjJ/OTFHBWPB4svyPXIEiZHzc7eADqgPRLYxVT8Nef4xYIPH4Gp9XCnOw
 VbbKpm9rMlmo0ts6vRFc1aJxnlOYuT4+XtCS1n7FLVo/6MnAxcbm2x1gaUWMU7rf31jL
 TsNQ==
X-Gm-Message-State: AOJu0YzIFaP6HvsBEsvS379ZL4ze4T2bs2Ni9x7QrjZhrk65AtZ52L3w
 e/YAQWDHds6ACT0M8E8d8x3cEFnsMaj12BApGBv5tQYuteDlsYeRXz0vTR9fMN1vIx0VHs4COX9
 +RmZsNvOFgMaj0jBD7ef5HOuoA0NosfcxP2HTA5e73Uwxlfoiax6yvi0QLl6Gn+zaQw==
X-Gm-Gg: Acq92OH08P4z+eCKZTcZaJlmtUUQY9fk54dZDZgIbRiq7Z1XGcE1Pm8f2OtQiPdpaXI
 6dM4XfkNjHE3II2cZTXkI5X44yx2GxOurGP3gczonAr2RoCj2ymfGPxyp77fW4BBkgbWgmsYj+f
 VEw3QfUYtTlDNzkJ+jeM/W7JDHAQ/O4HAB8F4bVQftfZyEkyQUIXhERbbjn8jPB16Gy82ApRuRE
 Zl33fDgxrGzmtmzrPintxyqlPOeR3lVCo4e9QsIbHcJbCGIlk8cswp7nH5EcQ/1aWTBR0dvEAe7
 lqA98+PbeqOiPH3AbEYnnY6w3PMe+UPQIZ7/vQoHqJ/8wljElatOvGqzXEwOR1+mUebBn/GZ1x5
 LJaPsqwB++09iyRCpinSNxpFiKYAAXbZRdSGmZKhIBtApz0/pmR8fL3Cc7Jk=
X-Received: by 2002:a05:620a:1a18:b0:8cf:f1d9:ba20 with SMTP id
 af79cd13be357-91c23c7c7e6mr194568285a.8.1781555871463; 
 Mon, 15 Jun 2026 13:37:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:8cf:f1d9:ba20 with SMTP id
 af79cd13be357-91c23c7c7e6mr194563585a.8.1781555871038; 
 Mon, 15 Jun 2026 13:37:51 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:37:50 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 05/13] hw/riscv/sifive_u.c: add intc_phandles array
Date: Mon, 15 Jun 2026 17:37:25 -0300
Message-ID: <20260615203734.954428-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9jHq9gD1ur3XhbC-HE3HXrXbjlXncS8B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfX22zTVR7iav42
 fXGFgniLDJaJjNunwhwW70KvWAUAdhCttTt+6Uh77Y/zHBM2QBUyFIR5bVCdLEGqwFrW+xnnhuY
 N6hh588X+r7H1pz2T/5JeI0+UWoxzdQ=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3062a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KCrPqT59WbVjnSvmJHsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9jHq9gD1ur3XhbC-HE3HXrXbjlXncS8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfXyGOowIvnFJVb
 WezYxcxujz3maLjHNRbexZiFUJiaXs641quEhU7M3xWOYna1R438cH1Qpf1KHeVx1UM2mJjV0io
 CWG2lo5/R1D2vjb3lNHXADtnuW1iPkxzJHxKVUov5GVnmvuJowI1z1yerrClXIaSeX1Htbf/XTK
 irw58+gJywXjQWkeC85wyGWR2gGs+Z3XqjPL7knyCFo0cA0yDUL2NQh9W37XNOOsr+Ix4EH8rLS
 IQp1KZxhl0sehBODDbAw+INvajVyVSX8fvrkZmRkS2gfVuQ9lTq2isjA6p72IN0KYtM6zlxClXm
 HcR6uuoXR5505apQjDvVsYZsOsvDd+D2iMvbKM1S0sFtrl4IWlWZaF1r3/7g6E9WveD13va7SXr
 BolX+VCVv69XKV1v+i41l2yIoLsyjWyIizlS7zMMtcL4Kq4bmFXRrAnBdmFtQA59+VPzuonLTJJ
 HMi6PkWihCouINDPj4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150218
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

Store the intc phandles in an 'intc_phandles' array, like the 'virt'
board does, instead of re-creating the interrupt-controller FDT string
and using qemu_fdt_get_phandle() to fetch it.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a00cfd08a7..ce86989bc8 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -111,6 +111,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     static const char * const plic_compat[2] = {
         "sifive,plic-1.0.0", "riscv,plic0"
     };
+    g_autofree uint32_t *intc_phandles = g_new0(uint32_t, ms->smp.cpus);
 
     fdt = ms->fdt = create_board_device_tree("SiFive HiFive Unleashed A00",
         "sifive,hifive-unleashed-a00", &s->fdt_size);
@@ -168,8 +169,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
         qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
 
+        intc_phandles[cpu] = phandle++;
+
         qemu_fdt_add_subnode(fdt, intc);
-        qemu_fdt_setprop_cell(fdt, intc, "phandle", phandle++);
+        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandles[cpu]);
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
@@ -179,14 +182,10 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
 
     cells =  g_new0(uint32_t, ms->smp.cpus * 4);
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
-        nodename =
-            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
-        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
+        cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
         cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
-        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
+        cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
         cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
-        g_free(nodename);
     }
     nodename = g_strdup_printf("/soc/clint@%lx",
         (long)memmap[SIFIVE_U_DEV_CLINT].base);
-- 
2.43.0


