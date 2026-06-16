Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED25CD98D2
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 00:00:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZdhG-00021M-AQ; Tue, 16 Jun 2026 19:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdhB-00020c-Nc
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:59:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZdhA-00083I-3Q
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 19:59:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GLTg66736993
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wpDFQqe/i30
 A1HqdCZQ6BGqOps2hFYSOdsjhnuUvPq4=; b=gI4fictdbNkXBRMEj3098hToJOa
 arptZY5ww+zTyLc60zY4P5JTKohXa+RNl7bTMJle+TMoib4mFhiGFu1VbzvNXbq+
 O7mNcwC9V2E/0moVpZewMQwmlHL/bLT8fNSblBjQtpBgsYCl1IK7Fvj3imjjTa1J
 mUwshHzuWPDr+eqzTPRYOax0+4S/RDWhUa9lyfR+UNDLJyz9TDhoU4wlLQhiXMTa
 CqJdW3FuBVE+V9cLDI92TYe0FJzuPpQGFqQ3md9d/M3nL6nj98Uhxd9qJ9mj2Pla
 IYYZ+krqJ8qI4UczIxvFiaCGeh6KpzuhYfUEaq0EhD9W9FhT2ayDSB6GX8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesgg72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 23:59:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517c65e497eso102290031cf.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 16:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781654390; x=1782259190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpDFQqe/i30A1HqdCZQ6BGqOps2hFYSOdsjhnuUvPq4=;
 b=IdVFGJVI1S9IpoiihtW/FyVce2HRTGlsVbW9Fv7ODwan4oDURnxIHDjaxqgXnH/lXn
 0NtBTyHRLdLMxT/C5ALzgxd9OWzPOKXTTI/ikiqTHs9VN6mGRme17hailJYSb72gF1HI
 QzdsBrIWD7VJc984cSl0y8Ckv8AxQN2UDGtdORFfKagys13+qiVaxgMp8Pyp7Dpy3Tsm
 Ux1pcmuI70QPy98AgupEKcziGwnrGARKGBzTVrp6UIzi5HwIgbkYiIFXGIoUEB9+KAVG
 sHr68TNyZFVXHxQiSJSxCfw/ivlqznwds8DfGU5fa+2s9OXcLmObrifTIHzI040GenBf
 TKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781654390; x=1782259190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wpDFQqe/i30A1HqdCZQ6BGqOps2hFYSOdsjhnuUvPq4=;
 b=kgyXOS+xqF3wq1G7vaLpLj5NIYp1ExGgcW5XRBSlLmmWJlPPUu1PvtWfCXKr0nv9KM
 6BTGEnDIhQl2e+rOEgeHjUdmlEMD+tQUCyA/jkD9YyaXC96NRysPfreLE7oH9wnEbeOG
 h2U4ONd3ophQAe7OcFYH3ttnMtUL31/ZMZ1mrmHjAksjSGUna6D3vXKaSzLVsXvfrEEt
 LwNv7AytX+X3K2vmp9npdN5IL8bRzHbQDyCXTY0Mv9Y4Cc+qdANhPFvUcocJ4iJp8ae3
 rHV6+A9j5up64b+vgMo7QDKkQCq76jJnio/vi4SroydL7Ai9BzXFcsjety4bRsockG9b
 oGLw==
X-Gm-Message-State: AOJu0YwrLNtLtIC4B1D3F1tqKFWUePyMnIadkxYdZcE0qWA1Oq/mCo2d
 TUa/zw3ldgiUPly0EdCiHM4umR0GdR2Ejx/Uma9zkcP5wM44qb2kmhp9CW61eJr9UfXbF7ody3W
 JkJGYjoNZ/MxelaKitIRl+1SjaG8fuToANgW2Ea3AXAPxjtyyZF8cEdjp8w==
X-Gm-Gg: Acq92OFhJ7oID0vOBO7u6hf5s9lRYdWxit0rtBzaXZzGxGL/Entl4x7J3OlelYXsktB
 7MUhKzftoo+fzX7QAyfkySBpfbN+p1+ZX9ZjbELZ/DDc21CEBeoSgnEbyLW5SC+H3eJtkvaPExw
 tNdSyZOmYc6TLEei1mIR2jGJsqYEj5RyTf++o1AD4+hpQ9tRYh2U0ibfuAw2aVSboBRe+elr0Mq
 t1M+vgCKCHxJ8h2C/VNJFL6IHag87plTHiIX91qEff0NXtgdo1Y9nF87vGObrhsU8ZlI4Etk2CR
 icml1i7zwfg3zC96AiC67LElDRrwzBcNa8/6rVunRnEKspyGj/sErqdbRGDRnvbAZXdKTC6JG9s
 pAUwZqlYYoNcaGH54Zp58uVjEXk2RuLU+xufuKGAaHZkt0Y24QBcmsQE8kt8=
X-Received: by 2002:a05:622a:243:b0:517:8d40:7c7d with SMTP id
 d75a77b69052e-519a8e5ba58mr25966401cf.29.1781654390093; 
 Tue, 16 Jun 2026 16:59:50 -0700 (PDT)
X-Received: by 2002:a05:622a:243:b0:517:8d40:7c7d with SMTP id
 d75a77b69052e-519a8e5ba58mr25966191cf.29.1781654389667; 
 Tue, 16 Jun 2026 16:59:49 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f132178csm50191986d6.7.2026.06.16.16.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 16:59:49 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/5] hw/riscv/sifive_u.c: use intc_phandle in plic creation
Date: Tue, 16 Jun 2026 20:59:36 -0300
Message-ID: <20260616235939.1358663-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX2qJDJfv2WujV
 gfRmFczdM8ml4BwBYKXIc8Iaj1jqxsbD8zzuN/NisdaB0vQh5QklBP3famopZyrc8alMG0cfUoK
 DSnKbKb7dcdSc91qsbZe/mqJqOw+Dwm0xVoDum9FL+F5/S7Nx41CXm6v4hfZ29qST4dtjza3dX4
 3+sf6d49HXh5k7uW+RwCPVMinczBmnmX2HlW3MVrNjZLmTIGflZM64TY9nJqC1mnGh0XnQerplP
 eFc5csnwcQjBoWSbxU/zSElcL/nrG96Id6J2HeJ783kED4yBs3IHij5xSK61+bIpxd22sstOpoc
 uzdNhfy6L9J+qJeokcxv83ZsTIu/muzOi/i8niOG12UhBcsLDDOpL3fUebJCFPxX516bDS9jDFE
 OSglcWsXL7Pgkea5885eZjs9JVKVxlvgqwef9WpgEIFXKxWkktpZivsaQz6amt7y+P/oC0i8Ssi
 IuAHTRcf/o9OVXkwH/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDI0MiBTYWx0ZWRfX8aw7u9is9RJb
 0nTHzq2PqXtAJKUvoZubYynB9gqW5J0oxTbYyBP+V4hwTI2sgl+3c+Zit36/yw+x28EZ0YB3pOD
 ZjVHd40XpdiT2taQXPpQOp7dvsbvnXA=
X-Proofpoint-ORIG-GUID: mtu5KJP-OlF9t2hSkn4iODPK8Swx6fn4
X-Proofpoint-GUID: mtu5KJP-OlF9t2hSkn4iODPK8Swx6fn4
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a31e376 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rRz0n67az6SdDS5ShVgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160242
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

The info about intc_phandles for each CPU is already stored in the
intc_phandles array.  We don't need to fetch them again using
qemu_fdt_get_phandle().

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fda9a09f06..b3468254f5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -199,20 +199,16 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     plic_phandle = phandle++;
     cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
-        nodename =
-            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
-        uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
         /* cpu 0 is the management hart that does not have S-mode */
         if (cpu == 0) {
-            cells[0] = cpu_to_be32(intc_phandle);
+            cells[0] = cpu_to_be32(intc_phandles[cpu]);
             cells[1] = cpu_to_be32(IRQ_M_EXT);
         } else {
-            cells[cpu * 4 - 2] = cpu_to_be32(intc_phandle);
+            cells[cpu * 4 - 2] = cpu_to_be32(intc_phandles[cpu]);
             cells[cpu * 4 - 1] = cpu_to_be32(IRQ_M_EXT);
-            cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
+            cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
             cells[cpu * 4 + 1] = cpu_to_be32(IRQ_S_EXT);
         }
-        g_free(nodename);
     }
     nodename = g_strdup_printf("/soc/interrupt-controller@%lx",
         (long)memmap[SIFIVE_U_DEV_PLIC].base);
-- 
2.43.0


