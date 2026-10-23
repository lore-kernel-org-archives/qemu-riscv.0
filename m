Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A568606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZuHWLxAB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdEiDkzR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKHqx-00013M-Vk; Fri, 23 Oct 2026 12:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHq7-0000dq-OH
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKHq3-0001VG-9H
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 12:09:53 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NE660B3018953
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hKngGAPqb7H
 KNATxHsXTSIaJgaUH84fCv+sGCJ8OAw0=; b=ZuHWLxABamoSbuiemRfaOcw+MrC
 8z+ABgT9lEofOOwPNQhyqyJcmDY/vyyNTPlmGKaw+dhXkXdbX1B6NLzRAuhe73jS
 /BNekUH+xbL0OTsyDhn2pUSvPpHk5+m+pMOfd7XjoSGUcAO8oilNG1rXBiph1GOK
 ob2wSXPqAOzacHIETuCiluRsk3xk5JAlz4AqBEZ5Nv7gEAl56dhYfSuBc7+jqa9H
 AzoKlKK46aVwMVhTr84HPouDNP4sLuYTVxxyNpULiDz0mtswEUcgraR4GuypFSVw
 8K+Acpk0GFmnO9ZTDD1/YgBrh66sebaeEA19AR/DbPzp7nRKkwZmbM9jaJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbwfd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 16:09:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91785bd637bso30544816d6.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792771774; x=1793376574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hKngGAPqb7HKNATxHsXTSIaJgaUH84fCv+sGCJ8OAw0=;
 b=kdEiDkzRH/rbZREOaRXWNmhF8IkirjPyx/wECjRrB/UMCn+Q9sqsyRTcLNbj46uPpD
 g5p0QNIxwsxoMQ++XfF9z7QaEHZy2Jemd2+zVj+DFtr+ZKIZdg4sBIw6NBfNyCDh+9OQ
 XLwtmyc504YlhF9lNOAkSM27MSQGibjZ4uwC2KtGXShP5XnwZQYMEV4dsIMOaJTrHSnN
 nLK371Wox+5ka+wAdVFtBt5R0t+f1eFPM0K4wNDKgd8UEuRJjZ/NHNDBsU6XNE4O58Uj
 1ZWWJfaIaCF1sC1jMcjhVrYwkVnj7rJtyfKv9c8ITBYYef0DdkMrNHKkDsfjjEdbbtf9
 mBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792771774; x=1793376574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hKngGAPqb7HKNATxHsXTSIaJgaUH84fCv+sGCJ8OAw0=;
 b=aLVdw1q/I763nxlaE7f719qmhmo1VNdZGQNDIlkIm/edt61H48H4L50vQI6hMTBSOU
 4+oMUgthR+aOd/v9qEOoMIY9fi9dmVtn/afOR9LGt/ocTZPfn6vOU1veaMK95yWEzDts
 xRysGK6YXRdS6mQFAAKI6iPvEGN5gslJeHqa3VlqNjR7vowswmDTWo7kZyAeb1Unxo12
 flLbXTgdahjqLwL/eSQXRF8OZjVgGz0dKOCrkD7TPCJTruoabi8vu/hCfbMnj4HNIXks
 sujrwhTx1GvznmyYmxfb4RC9Hvz4bbpcdkukranMMN64LLSYRpHuUhaSrDbdALdZ5GJ8
 yT9Q==
X-Gm-Message-State: AFq9FYJ6g7zwqeIPO9khvnsWhxQURK2NLrPCRNUybAKUSBin8FRcxC9H
 S2Lj9s0t+p3eNPYvNap2HJJeYoT2UebkZiPYaEu3yYqweRocLYrs+Kw4ERZa6iE1ayfVE9XSXtP
 GFIFhnWob/mpddDIuIrqQ/rDqu/cYHJImf1FUwgC/+8ujQA+ALpWI4On+s/2FmPKt1w==
X-Gm-Gg: AYBFou055QQK+fLqnXUUF3Y+xiB6uHRukKDH7voTTPWHIg9YPXmgmVE9vWgYXAwnefF
 YL5r02/dcuCtTpvkKSTU2yXGEffYkwaVlHafikuH4E9tFIlmbToWkPu/YyuNcdTsRylmazj9ATS
 Wygh45eyRblBVih6m7neAWuiCy3GJQd4r7b8o3D3BsANdYDkKC2oZ7/4MDPwCEatx0o39xJ/355
 16OS5rXim4YSEl9dxfFsXKNz9braU+V7OupQ3ZD/hCqdv1/tDasqTfsgqR1D5KR9kQE7ezCQl3U
 QFcPBYPg+b0WEzPy/HPdL+4lyF+FKdsEm1EY2nv9aUB9u9O4b+WF266S3p8nu6d305tbN7LvdLl
 cR0AXdQYmDzrFzBKyjvdnamroKEXt5AYei9Zd7A==
X-Received: by 2002:a05:6214:3c8e:b0:91b:9061:b808 with SMTP id
 6a1803df08f44-91c3a8bc7aamr38651106d6.21.1792771774506; 
 Fri, 23 Oct 2026 09:09:34 -0700 (PDT)
X-Received: by 2002:a05:6214:3c8e:b0:91b:9061:b808 with SMTP id
 6a1803df08f44-91c3a8bc7aamr38650606d6.21.1792771774042; 
 Fri, 23 Oct 2026 09:09:34 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c4524f226sm5063406d6.27.2026.10.23.09.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 09:09:32 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 5/6] hw/riscv/virt.c: fix base baud in serial_mm_init()
Date: Fri, 23 Oct 2026 13:09:12 -0300
Message-ID: <20261023160913.24992-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
References: <20261023160913.24992-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfX1MA8DN8k6cZ1
 rFA2xygv2xLAm3zTmIVGH5CU3vsk+XBMD2OsA1mIlTuQTshcF/a8eKnXLoen1qMMOD3BvDmxI2N
 ZqnGuSTF/PMWEFGL4kZGFhqfksWQl+xxXiHVp2cHe49zIshRlKxLaoN80tllZ7WBnQSuk9mYgks
 OxxcWibgBtoYhZfizdWOhG/MCvKpUrh7GfNbiifu1nP1eMM7M14QffYlRe+Eo3Lw06Hdmgn98nk
 hpCj6xTY6XLXWypGhB3J8awZnTNrZi5NiU6o/HLD8IEk4aEqhSPV8y1nTpb8cCE353X8sq+3pYD
 4Wi1aLH8Ao+8LXYK8IUHa6X5dgFfToJ9BA6vCfKEgb4MkjzQ9stxOes3xaNf/6Udq8CW/rDRlmf
 Pv1ZflFqaxEwDxG9awygWY4zUY6GAdU5HVFOLAPPTMkuyIWxeI2dLxYh3V/hOCxcvgMT6rXAKz8
 p3h84B2yfe4xH9xQwpQ==
X-Proofpoint-ORIG-GUID: kgn6iCj64f71P9_6RoRcDnBCKlCYsfQC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MyBTYWx0ZWRfXxQZpL3BL3mJi
 bFzJ1U16miKRC17b8myqJVUp71esJ/150pXl6GKMYAdt4LtvzPKu4CX9S8JkbP1NxUcobzKRQGZ
 hLd9Vf5E1BQFOj2v254scwTdlPF4bAs=
X-Proofpoint-GUID: kgn6iCj64f71P9_6RoRcDnBCKlCYsfQC
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb86bf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YBD5noFLO0MiZe3rPCsA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230063
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

We've been using a base baud of 399193 to create the UART devices
while, at the same time, reporting a clock frequency that represents
a 230400 baud rate.

This pattern dates back to the initial RISC-V port and so far seems to
be doing okay.  Linux thinks that we have a 230400 baud serials and
nothing seems of.  Or better yet: no one has complained about a
potential bug in the UART devices since 2018.

All this said, set the UARTs baud rate in serial_mm_init() to match
what Linux has been seeing all this time.

Fixes: 04331d0b56a0 ("RISC-V VirtIO Machine")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/virt.c         | 10 ++++++----
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c4447d971b..03c17ce7d8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -908,13 +908,15 @@ static void virt_machine_init(MachineState *machine)
         VIRT_PLATFORM_BUS_NUM_IRQS);
 
     serial_mm_init(system_memory, s->memmap[VIRT_UART0].base,
-        0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
-        serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                   0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ),
+                   RISCV_VIRT_UART_BASE_BAUD,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     if (serial_hd(1)) {
         serial_mm_init(system_memory, s->memmap[VIRT_UART1].base,
-            0, qdev_get_gpio_in(mmio_irqchip, UART1_IRQ), 399193,
-            serial_hd(1), DEVICE_LITTLE_ENDIAN);
+                       0, qdev_get_gpio_in(mmio_irqchip, UART1_IRQ),
+                       RISCV_VIRT_UART_BASE_BAUD,
+                       serial_hd(1), DEVICE_LITTLE_ENDIAN);
         s->uart1_present = true;
     }
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e516898f9a..f66d2f3342 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -121,6 +121,8 @@ enum {
 #define VIRT_PLIC_SIZE(__num_context) \
     (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
+#define RISCV_VIRT_UART_BASE_BAUD  230400
+
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
-- 
2.43.0


