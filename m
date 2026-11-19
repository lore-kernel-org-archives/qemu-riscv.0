Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E3606A32F
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YAE9Zo6W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCdQDcFP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTxRK-0004Cb-83; Thu, 19 Nov 2026 03:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxRH-0004Bx-Ve
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:16 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTxRF-0001lK-OA
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2026 03:24:15 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJ6vWjV330681
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tGilkePA/I6
 Z7w81HYXyow4LaQeCJgl//68K2X2Vikw=; b=YAE9Zo6WmPhAWf4FgkrpcEq7Q4t
 ga1e5kIOeXe6pzL0rllBrIIYocryxoMlcfcqYNIiT2CoBPPwwtRK1N7Q1ImbV80k
 dtJ/oY8D1qqvXPKcLjQv0rbGMzLr9nbFrmQ9/Q478I9m8z/vE51lnX9ieytQk976
 rxPBoKgktPCKKFumw90Iq0Zn1Arq8dN8Ss110ySStnxYl/HrOF8hxqXvid8EzX11
 aYiJKaDkPHnqi5ncaGC543T0BKiNNBgeTMhkz3smq5sAQcKnH2yVlo24gvZH5Ro7
 9K1U2QMkMwoSUrhJ2UdGSAhuRF/bt+XytTPfgCl8YJLRDKNPeI95D9FHZew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkg4e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 08:24:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e92aad34aso381261085a.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2026 00:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795076651; x=1795681451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tGilkePA/I6Z7w81HYXyow4LaQeCJgl//68K2X2Vikw=;
 b=TCdQDcFPzo5VHVcKv0y8p0PnLujLyGClU7x/E17/+PUsHQPBn2HIvvCDdDi49iRuGT
 qhgOg7Ltok/LabnWLt3RbNWwVcrztyl+Y4nb4JWZAeDMGddYKSqFle9GVj8Gc8kA8PDp
 JZ5XFehwZcX+4DH/3pWGYAh6ribYFvGsdgOgPgiDgW4leLwDPVmJ7ZKzJDhszrasofLi
 Va6J7fWX5CPNA/mXCosMDltjCdaemdp9Eeb97j3tfv2rFQAge9WaGImdS5VLUKCGvZLC
 yNyebhp29YDfX0K/+xsVuBMsYyOfmbEpktU8Vb+C6eb6+f8gH2ywuX5wWYu+4JnVLg3e
 flVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795076651; x=1795681451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tGilkePA/I6Z7w81HYXyow4LaQeCJgl//68K2X2Vikw=;
 b=zGJHujNHJVuI8bR0Xio5Ma6qD1YBdaO9bYr8FnF8d3QXdd4k/0GuI7WHOFfkLvvp/K
 icojuiUTzhu29QZVVFBM8/gNTTdTjQXBa9r22cLAUZ2Eue2+pwxFKFq8kP4WSV/FJhfu
 W8XjOetf7c+iGo+L8OG02PCb+K3ZnsyvE6G1zgjozN2rwqa5sMpia0AAwVy7p9J1NhVL
 W7LEd7iiBbg9pzC7TaOjBXIVLWueoGI4Z11+jKp/BuyarDp77t882f/bMiFEsMLGKmtT
 TiEUBsGmD8HanEHz8+hwuTP28FXwr+aU24PqhQPw2txLTCizWEGhdkO/lKQ0SOxsSRXs
 gXGg==
X-Gm-Message-State: APuU4Z+lrFSgPOzsZUm+gCz3ctSQe1hapPY+hfR81zD4Z+rgUFjGjywU
 YmO2EJl4p2gki2Y1bjTEy4s2jqVxW0yP8RlYz3CHzOED7dp9KiUnhEptfj6uhfmk8FEwlX0uc68
 wmyw3NLfhPQcdrs13fWtFhfJga4o33qEg62ccUWYDO2xDmKlhfdXYnSW+cw==
X-Gm-Gg: AYBFou3wjbmgHl/5KFZ1C3AUcWdw5sZHxPJDtVyGE10jSDxvybR+ST3hkseeoRrQtJb
 aTtCLSLXFFdRBGNiHun7KXePacyv8XC7JlUP7opYdRMQKD37C4NQC+7cDuoeSXd94crS43RvPUl
 rJiJVc7IfcfQ8zkYXaY660W64j+oHwQ1OIB/wb6/asi/wpYF10j7esLLwqXSXmmRUL1gMuyHusT
 +KcLRZ3FyphAT1bEhfChv5BRZmlMmYX2P6y7WT/nuDtF04CbN8m2wLH7np+UBzXRZuvYbg0Ml4n
 R5RuAHBHW4+L4oKb/hB/H614RaB14YMyAo6gGkO/CzZwc8BvptEASIyo27wA8p1TUCMGuXlTlvV
 xZ1PArWUx3tcL2SZG06XpZ0wstRfs+mrqXMDcnPZlzAfhBErCgOE/Rh62lcWhdPyNdSMScdceSI
 sn6ynoXzG2
X-Received: by 2002:a05:620a:8801:b0:949:3644:edc0 with SMTP id
 af79cd13be357-94999574d97mr903379185a.17.1795076650903; 
 Thu, 19 Nov 2026 00:24:10 -0800 (PST)
X-Received: by 2002:a05:620a:8801:b0:949:3644:edc0 with SMTP id
 af79cd13be357-94999574d97mr903375985a.17.1795076650273; 
 Thu, 19 Nov 2026 00:24:10 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([179.193.8.137])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9211a6318aesm34524136d6.39.2026.11.19.00.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 00:24:09 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 4/5] hw/riscv/virt.c: fix base baud in serial_mm_init()
Date: Thu, 19 Nov 2026 05:23:54 -0300
Message-ID: <20261119082356.1264726-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
References: <20261119082356.1264726-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _7W7QoaH_psg0Pb_mS0JSB1AvEVn2_KZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2hw0P6tjkshP
 fEiXaRsqAjucgasnjg6zmLlmDl+sDFluBmeVZYkFauH3pKmxNxMll0nMnWXFNHasiO1spvTfNB1
 UFOGbu1xaoFcthav/aB62GDt8cwKcq7Q4bltoB5nK98BLIPhxm0K0JN1mKa8SoQwdYwC/k0wMIn
 KlVWPw9UemUrEfuDIw1o6MWyodpVr6KQONBZdkR4B5VqOQ5mF9pi/nIQY4JGr5E8e/8XPqr2/2e
 UmGn7fsXionVhHaL2oULS4Nl9871Nq5nIchNntVZ4IQNXOGTcmDDaNfUJNTjA5xJH7DsKvXC/0z
 0Ydz8Q0HoOw4TLzV1lyjyyDVpSgrGP6KWovvsqTHMpvxgsDOiCj73O7tQ+k2im/YFwjlh5+qeSr
 bz7mTHtvXZc8mx/ei5J4ssX04xzpyJuMuiFe43pAiLm+ccosNwD3XwATwUDSvC7SgMVYHmDTvkP
 nf/QB9vG8JZoh4p81oQ==
X-Proofpoint-ORIG-GUID: _7W7QoaH_psg0Pb_mS0JSB1AvEVn2_KZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+HAk8fYg7xzu
 i15qkLQuAX88+oRjx60FTqQkRieeKJrVw39goqLN4AFcYTmbfXaCTWwDtzZwSzkTgKIM0GjZno0
 Do8751J7kk2MRKmJtzm5g1pqxmrKYmM=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb22c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=a6tGUzlCxnQfwxx7nGpYxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=YBD5noFLO0MiZe3rPCsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033
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
index 9eccf62d4f..9c621b5939 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -929,13 +929,15 @@ static void virt_machine_init(MachineState *machine)
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


