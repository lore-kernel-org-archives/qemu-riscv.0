Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B5606A327
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwIOB1IC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aOYcj5F4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRTjU-0000YU-5w; Thu, 12 Nov 2026 07:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTj0-00082l-Nc
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTix-0002W1-Ed
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:17 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC7obr92818859
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uQX4PMKh7dM
 hXSe32oSNpxkmTAwd5otkRrgQIcHy3tM=; b=FwIOB1ICrntXKpwZANvwANw6IeV
 FxQBG3UAUTX2YojpXOx9z0I6UNNM2mM0HiV2U+mIaIUSKfl5OJE4FoKNhBn4w9Re
 9I7KD854ml/KyIGl7wGf3UPmpL9/5O0Jl5UemJ6qAUd8pry+mKuvG6h3WahjFIDg
 THK8M6SjAh43Y14D3YgaFrPg4BbckGAadl8tKxNU14lZEVlb3MbEKaiYRHB5uDRi
 Q2QD4YiTjaPy+V9vsW8MuCY+64XparUuTXpas5hRFSf5u04Q82rGUzxy+SStGfN+
 yXM7WJoeP5KNySLXVd5b5VSLMQGrw0WsZrpnKJEJPjtlelagIKbCEmX9yPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18xcj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-537548d4bc0so98788081cf.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794485774; x=1795090574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uQX4PMKh7dMhXSe32oSNpxkmTAwd5otkRrgQIcHy3tM=;
 b=aOYcj5F4M8teS+whP0BMsu9HpXzpD2QvWw5LJD7sxKkXHqP7Vy03DjW6DwNv/9x/D9
 Cov+/PEQZHn3DZRW8GRPYvCgCyiB+6/yn4lRuwpvmnMxNBwkB17WwDLFLOJdOOjAP3eD
 ZbOyJiwygI2pLbSyGyYzH8qyNm30YtTjXC3dscjU3hJEfPaPqpRyjK3fApCTSerA6igH
 rxgNeuPA3/JMg/MGCDkWFKvHbsb+jlhmq1DQFG7bFTU0dFcOrXGaSgH+J9iBwiM+RoTC
 tPmCsNTJLybb+SznnssZc77exyD4U7vkrS2ZyxXVCY8UWAucAXvPIM7j3jELWnnWWaUz
 Rnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794485774; x=1795090574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uQX4PMKh7dMhXSe32oSNpxkmTAwd5otkRrgQIcHy3tM=;
 b=2CKCrzlGfiVkq8NUY8CseORTSO0a/3/nxD1XQFlMcTvZ+eOCU1r6B3qNvvyhSoQmlc
 L756n1em/i1fRYnr7gKmoBNSyPK5Zripyvz+4zSfHv0D9UwMXu1uwDEkwsJatD9CcleG
 luz598rs5vGdATLfyzRftV6v82ugqAMf7J5GYgD+lPkbZSZoN60D6MiVDQlqw1Cnfk3I
 iF7ey/6kRwjQKUQi3+URwxajKInKUc4XJ2Op4ZZoyUx4e/NMvfUXj35QEVHVKzZFxP5E
 jw1tbRkiQSEeMjH9tILb7RQ2DceG7B2qSobNHM92GkKoFyG/6GtAD7tnljUS/uKTSBfn
 aKlA==
X-Gm-Message-State: APuU4Z/Oc8gJJdtWnfKfFQP3MCOjZQZuouCyJaaqSZvHNo3o5Ii62EdP
 +XOXYZa3Izl0qzto/QaEviC3hS4roAwnQccsaJM+xC7pgX3rCznaqaiKXBIZugze1sy00F4PAXj
 AixPReY6dV4SQ2hupO2parzQUsCkzSsbRchinwMn3iD5uA5dl9IYoRxrWGQ==
X-Gm-Gg: AYBFou3bi99I4QPX4DqdNyXjhh4x7ZLyJKIhUhrjgf/yaeIn+XwPxidr8mwM3WLiI+g
 l/KQDmBq/rVID52HHbjyPMUwLy8qX41QXDckaN9UqQ8OYhz7Msy4pdP9ke4DusAggH7pRGomFMA
 V37tCaE4jVqzqBitgw7pOEcsFN+G1IW3mMfe1b0z+29QzpP5xaqHOWLaVuQHTyQHp0FMOiJf7o+
 KjdwGKoRvKK6FoTiz5M3VyQ9P0xE0S8+dj/dhrVfQttZxK+oL4WMrAtz75+W8S291gMJPvCA1Sr
 ppU/ZSx0EeOc7OFAtdY3PZWNGsipJxr51RS6OZH5rYBSItSq+sJRLND8sB0OkOCpSOpgFKGRDlt
 3zTRDgwseLPcNcEWY/Rl9B0yUyvqUBaL1r+4dsXRXettXdURK0HTDtxRY4LbfiPEebK0G/JzH5+
 HOqgvMBFfvVw9Hs3xrQKZ44gG9u+2DzsrrDzG7guZTWROY
X-Received: by 2002:a05:622b:82:20b0:559:af0d:a4e9 with SMTP id
 d75a77b69052e-559af0dad13mr18052121cf.51.1794485773546; 
 Thu, 12 Nov 2026 04:16:13 -0800 (PST)
X-Received: by 2002:a05:622b:82:20b0:559:af0d:a4e9 with SMTP id
 d75a77b69052e-559af0dad13mr18051811cf.51.1794485772930; 
 Thu, 12 Nov 2026 04:16:12 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550af6096asm73538651cf.5.2026.11.12.04.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 04:16:11 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 4/5] hw/riscv/virt.c: fix base baud in serial_mm_init()
Date: Thu, 12 Nov 2026 09:15:52 -0300
Message-ID: <20261112121553.485439-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
References: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX6eHfl+ObsBsz
 0zxkuQuy0ey/zX0EV2RIfqZGuyAXg8mjleSAZddkwK5fBnDWN68fvLr+Y8KfNcMrXqp0st8RcKQ
 el1IxsjtufEpgDjhNzHoPj10Xw0elKbXXvcV6YQjzMP72iQLigrSu5RrbUio8Yxl34CnQLk8a5m
 vWU1addrk7VMdWM+22OZFNQ+vbCaL9Y75D43BqOuPmXnEPc/a+0xxl0lm2goQiWrZrDvTnP61V+
 MRAE1Uaetri4bkljKcgG2x1pzHM/Tsmujz4w8PLUeOhPgTXr5eW6F7eBLP2/wgaEbiiT1zWuSb4
 50C5EBdNenQCmYDJebBYVYSh3C1Mz3/sTHvCBZGAfwSFuAxa166HHDQ0ImE2DZ0xP+uu2Y+3WaN
 ZJP80AO7YAYvw1ZhRsrU35RzAByA5/04iZs/P2AENldAfXcGXFfKE8QZlsprdp4AjnDvjY7Ga8m
 8vvuyPRqoKpf0M3474A==
X-Proofpoint-GUID: 32i2zGofB5pEiCgh5H686P3iVSjsAPLy
X-Proofpoint-ORIG-GUID: 32i2zGofB5pEiCgh5H686P3iVSjsAPLy
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5ae0e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=YBD5noFLO0MiZe3rPCsA:9 a=kacYvNCVWA4VmyqE58fU:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX5+jGGAMCUgBz
 qvTwSpyreUm6i5NRXOM06PmTITTe2m5BN7R1RMIPakLHSRjn1VnXgrfkOBYBTQKIzZZU2eS6cpg
 wzdJzlsxzPUGXja3Pec0rznhAQtyq3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120048
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c         | 10 ++++++----
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index dd1b02a7b3..08dee967ae 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -914,13 +914,15 @@ static void virt_machine_init(MachineState *machine)
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
index 6e4fbf4b64..63907d7362 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -121,6 +121,8 @@ enum {
 #define VIRT_PLIC_SIZE(__num_context) \
     (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
 
+#define RISCV_VIRT_UART_BASE_BAUD  230400
+
 bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
 void riscv_virt_acpi_setup(RISCVVirtState *vms);
 
-- 
2.43.0


