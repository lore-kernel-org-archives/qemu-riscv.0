Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC9606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GZTCrA0x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+OdQ+3u
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRTjI-00009P-1P; Thu, 12 Nov 2026 07:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTiw-00081P-Ls
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:17 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRTiu-0002VE-7h
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 07:16:14 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACAmkXZ2555491
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NxI1+DZPSHm
 2OBNcqU8iwN27qQ+ivTMTIzJsHGReJeI=; b=GZTCrA0xIHlGRzP2uwLxzDeHi4k
 b3lE/t470dnZgSHmChX5gT9UlH8quAOLQeZVJG43Zico+yPsDYLciXB4VRWY4sBv
 5ir6jWvgk7Kh56+VDvyAAVOE6WNd+79UHNUyv61tsvU0eNmbe5c5IyH30rX6XJ2r
 eCuOvxWA0uUjrjRE1cnRmx7egnjdmGSPvBPMdod2taBp91JN3h5vdQRFQQxZfweV
 qLXRVvJFBnaNHlkxVtQqnvaYElPhcyLXVUt2DQDLlk0y5AsRJ5nxhXGRfoyHV6PQ
 0PuUwc8drb0PNGE62RMb4ZYchtMKGxCtldDwn7MWqrGHgBi8st2D25YPqjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j095b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 12:16:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91eacf20364so86620506d6.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794485770; x=1795090570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NxI1+DZPSHm2OBNcqU8iwN27qQ+ivTMTIzJsHGReJeI=;
 b=R+OdQ+3uNZkJ1zznx1dFIKJ/Ut+6T4EVRBheC8AwOHOKnozjl/lO3uZQ/HtPpIUaP2
 AYqmSOmjP13D39ZxDIyWY94eWxl+Gyh10/4PksKEVHMOPZXUL5+zyuAzhVh3g9Bkou0T
 Ozsiq5NeMenZw2El9SHvYoRJXWMGi9lU3L1hc+Ws+CQO7gXpbz1LCoLzDqFnbh68DUwb
 p88HnPhJ8GuvfciTUMylR0m4jUMwRSlAyXSwfRRvbhgfa5i4rwyvwVECy046CZ/CaOps
 hvd3saKZBH1/3v4Z2SCeq/HkkQBcsazH/wb5NwNEZwrUfVDAmrYlkiBuvN9uHNelCwkp
 +6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794485771; x=1795090571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NxI1+DZPSHm2OBNcqU8iwN27qQ+ivTMTIzJsHGReJeI=;
 b=J5AGeMlHynGbt8mAkQo6qsTtKSh74YUiSXrqggTFBqjbLGDQy/7opXdnnJZAaS8N7r
 vuPK8pAPx6XJrEeNdWrGihr91TxWb82wKbgLDx1vc4+2SAVqhb/+6Sh7wCT5OgeOTiMs
 RB5kuV01Jc3zG8KU3c3f1kPTCCk+r9IJXhU9uEUvEu38Sr9/0x1U8eSCGkhE2H9VK+CL
 o+pHYo81lp6nrNIhXfk/Brzx1SixiVdmncbDQg6UfLxeaXqJCQVwpuJ/M22AiNNFjQj8
 XiZ4pWLt78OBHyIf/CZ0UBGtR0g6pXgVBXGEpa2psX8x+qnMAXxgMOhr7S1w5d2qDsh1
 1TtQ==
X-Gm-Message-State: APuU4Z9DqjHviWEoX/Vu2wV0etl5jiHMjsnu6SE1e9mcGwFhE4mUXQin
 KvkLtwDaUGpsKnLLeCHJ7U6AIJ7pt6IR+28UAV0UMxiqY7UVIcxXIc4uxLjVrQka0rP7n2n6yjH
 lvZ8ppf9YreaMdIBlXinQRmCEQ10uDBDhsOdayBIrLvdWX2gVfjNtJoKFWTgogdwfzA==
X-Gm-Gg: AYBFou1TXP7A8pZey90X/JKyI1t1hP2dP6uWd579owXCouPY3R/PgtWFDFK/d9xHBuj
 2MmobhDXA+KV+5QQef/NV+S8WuMqpVZ7Hv77rpFhOCFU9cvDibiWpe7/AtWGAK/M7tbWt/0gEtn
 +GvkwS6cVmUZDXhPl22n0D3cFuQz98h2hoS7Kv/24vII1ZKc45AlnmK6VZKC2nANZ5QuHRs9ibB
 L148RbtjOVZGzZv+hpeUODGikwHlmtYjIJJAEKygaWFbFqLuoOdFUxm7wZRjGXgG5ouhPEvV0xI
 qATbrdWjiwslSXKDb28ZIzgOHTDHDZrcl/8tVKgSj+vBMZ1q/VS8K3wSzzxYWf/E0PpJSMgFQXN
 l13HMMoB0DfXPZNaM8vme23jLZS0hkvzxhXq0KyCE0bX3uLYDhQaYi+meHqI22FAIq2p5KfPjKn
 FCeuGOpc5RWO8NFyQlikhkHa3zug3W+nEd18QkAqY8SBr5
X-Received: by 2002:a05:622a:1c1a:b0:536:6902:daea with SMTP id
 d75a77b69052e-556c0ea78f7mr90885361cf.23.1794485770365; 
 Thu, 12 Nov 2026 04:16:10 -0800 (PST)
X-Received: by 2002:a05:622a:1c1a:b0:536:6902:daea with SMTP id
 d75a77b69052e-556c0ea78f7mr90884791cf.23.1794485769676; 
 Thu, 12 Nov 2026 04:16:09 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550af6096asm73538651cf.5.2026.11.12.04.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 04:16:08 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 3/5] hw/riscv/server_platform_ref: fix UART baud rate
Date: Thu, 12 Nov 2026 09:15:51 -0300
Message-ID: <20261112121553.485439-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
References: <20261112121553.485439-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX+wLD3zFOX2Kd
 klfs5ZcSTyMOrmw5QcZ4lTFvmcs+M9bgp26L8AsxoTAbW4kqg3ay5hjafVHjsu/gWhNU71GrUUJ
 0vhDOD6Yrbg+0b8+PFqQpWxhUH82E7Q=
X-Proofpoint-ORIG-GUID: hVk1vECY32H_eSV8nOibAbDw32WVuZNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0OCBTYWx0ZWRfX895oYynF/kLd
 1IFlQwl7GpDtNi6rcp7EohDiwIWUHQeRPqv6toVocheIghwNEMdXydheBP5lkkGtOOhtUWwaaL/
 o8EurmzTq1+kbaRKo4JUqByt+aRKxEZBtCngWnt63ykXszdetWxZHDBcNkalbbv4mJzjRz/nL6c
 bSLwHWqIuFxaKuXMIy9C0ygxUqX8sOaZ8NBt6VhWqfXbIiEmU+Zh80fsOpJ8I602NslxjseIXy6
 KZHx5057KUPj08C2uhdSMKi3VZdNxAgmOL/3iQVeUFCvKkIFw+0KlcDn13oCf3IwtwMBaF94DoS
 vNS83v4veVEfCibPz1JDfnEIdhbZ8nKv2l+6F1RML138X8PMfBHcO7+rDDf57nKmIzCKgUHqJFg
 lKVbp1mFNFaBMpKMpbH+nWs7d08twiyc0ryC0JEIzIYhpuVUhDVDGFnukYArTNG+dtIvjCFaupU
 JO5vA62GX8Y2OfAGoEw==
X-Proofpoint-GUID: hVk1vECY32H_eSV8nOibAbDw32WVuZNu
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5ae0b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=HwFc7jivAAAA:8
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=HyuSmn1QhchWdNVMt-0A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kr7TZk85JJIQSqC0cl8G:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The riscv-server 1.0 spec requires an UART with 115200 baud, per rule
"HPER_020" described in [1].

At this moment we're doing two things: the FDT is being created using
the default UART base baud of 230400, and the device itself is being
created using a baud of 399193.  This odd value was inherited from the
RISC-V 'virt' machine when implementing the first interaction of the
riscv-server-ref board.  Linux doesn't seem to care: dmesg reports a
base baud of 230400, a value derived from what we're writing in the DT,
and the serial seems to work fine.

Straight everything up by setting the required base baud of 115200
everywhere applicable.  And for good measure let's also change the boot
test to be sure that userpace is reading the intended serial base baud.

[1] https://docs.riscv.org/reference/server-soc/v1.0/server_soc_requirements.html

Fixes: c2fa4320803b ("hw/riscv: server platform reference machine")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/server_platform_ref.c              | 8 +++++---
 tests/functional/riscv64/test_server_ref.py | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index d727ea6c41..af5114ac09 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -68,6 +68,7 @@
 
 #define RVSERVER_PLATFORM_BUS_NUM_IRQS         8
 #define RVSERVER_IOMMU_HPM_COUNTERS            4
+#define RVSERVER_UART_BASE_BAUD                115200
 
 #define TYPE_RISCV_SERVER_REF_MACHINE MACHINE_TYPE_NAME("riscv-server-ref")
 OBJECT_DECLARE_SIMPLE_TYPE(RISCVServerRefMachineState, RISCV_SERVER_REF_MACHINE)
@@ -315,7 +316,7 @@ static void finalize_fdt(RISCVServerRefMachineState *s)
 
     riscv_create_fdt_uart(ms->fdt, &rvserver_ref_memmap[RVSERVER_UART0],
                           RVSERVER_UART0_IRQ, AIA_TYPE_APLIC_IMSIC,
-                          0,
+                          RVSERVER_UART_BASE_BAUD,
                           irq_mmio_phandle);
     name = riscv_fdt_get_uart_nodename(rvserver_ref_memmap[RVSERVER_UART0].base);
     qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
@@ -613,8 +614,9 @@ static void rvserver_ref_machine_init(MachineState *machine)
                                                     RVSERVER_PLATFORM_BUS_NUM_IRQS);
 
     serial_mm_init(system_memory, memmap[RVSERVER_UART0].base,
-        0, qdev_get_gpio_in(mmio_irqchip, RVSERVER_UART0_IRQ), 399193,
-        serial_hd(0), DEVICE_LITTLE_ENDIAN);
+                   0, qdev_get_gpio_in(mmio_irqchip, RVSERVER_UART0_IRQ),
+                   RVSERVER_UART_BASE_BAUD,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[RVSERVER_RTC].base,
         qdev_get_gpio_in(mmio_irqchip, RVSERVER_RTC_IRQ));
diff --git a/tests/functional/riscv64/test_server_ref.py b/tests/functional/riscv64/test_server_ref.py
index ad29094dbe..fa7225ccc1 100755
--- a/tests/functional/riscv64/test_server_ref.py
+++ b/tests/functional/riscv64/test_server_ref.py
@@ -71,6 +71,9 @@ def do_test_boot_linux_test(self, tpmstate_dir=None):
         wait_for_console_pattern(self, 'Linux version')
         wait_for_console_pattern(self, 'Machine model: RISC-V Server Platform')
 
+        # Check that we have the intended base baud for the serial
+        wait_for_console_pattern(self, 'base_baud = 115200')
+
         # Test e1000e network card functionality
         wait_for_console_pattern(self, 'e1000e')
         wait_for_console_pattern(self, 'Network Connection')
-- 
2.43.0


