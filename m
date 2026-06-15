Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6B3CD98E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 20:40:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZE4V-0002wf-Sm; Mon, 15 Jun 2026 16:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4T-0002uf-DX
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZE4R-0002BI-Ei
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 16:38:13 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FIxErC884111
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=z4yQns9jU4e
 p1zWTD35WRA/ea/hOTSXawKKLOYOonNM=; b=CYySII+5rcWBWKq9E+OqgT1twql
 DqXNStuiF/1Yr+2SRZ9qh0U0xD68o9W06O7pDJSVhrN5AAf0VKpOY5sXqHay1yJf
 LAmaAHqv4hz+YYVEc16XgEROf4I9GhFchIBL/yMa+KuDmbTLpa07AID8QZ1mMs0y
 3GmJ9SlhzLg4rxU9BSHVqhrfDT2HWPXhO0vfN4I3D0mdEbjEsy4vQ8H0NTX2t0Yf
 D3cPc5JS9xLzmzZMFfmOCoEhbvmt07gI4e3aQB1hGyMlRyVv8ov3A6bkLUxKUTIp
 PJj0SgoWtDGXD1KjDGGehwZWXukiOBPU6u9hVa4ieMWbIex5+tMWNk/ViAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa72tsw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:37:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8cecac0e467so80934626d6.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 13:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781555879; x=1782160679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4yQns9jU4ep1zWTD35WRA/ea/hOTSXawKKLOYOonNM=;
 b=M0ALupF5zsgQiuI9bA13zEtz4DXr3NZU4eAlAbCYBTKcUTKSZVG2GE1Ts9kg5/rVgU
 jxWCS6x+I+XDSqZZs0qK2ad7jOKsOkOEaEvMS4uvpZg3/m0h9WGXlg7aUwLAaz95nEUz
 fao5SWXXJWmrvcoGj8ukfCB6rR94zP4sAEo9OcuoOQwHRlfoaPNfD8q4gyFggngcBC2c
 8TR4E0SvQiHOESlfdauTllGv0V7tBtKolRwXF5wn7ENT/nNXtV5l8x119A17TlfH49A2
 i61ed0VVlA+15ahKyfaRh2JJAsZ3pWPYUz5gWpnVj3OWi2+Y27puyA+JrPIRBT8RnY+Z
 AFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781555879; x=1782160679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z4yQns9jU4ep1zWTD35WRA/ea/hOTSXawKKLOYOonNM=;
 b=fqi/a7jtgenHaroukvE02TW/NLVNpB+n1AtkjsJQ5/ZCtXf9A1518hZNYUCuQRmwYn
 4Hhr8d2UE+/BDT7d8gfcpwcFVvbCo72+DQsqdBQH3T2eJ9F1sJoOVZDun9hbTd4JgZqQ
 TseXVJPKWtJ/qalqoKCOu1tTU7J2fSnk1/7FY7joU3vap94xRmwQIiz8V8mMvwSae1gO
 G2RwG9ALsfkwbf0LNKhd/dyzbdh4FtkV1O7l55D46OXCW+DPEsedQDbeoegK4Zzny0lA
 QQZxilDoHxjpp5PHA6ez8aXNtZM+VN4U4ZvQjqdU2qqHcCYNI1OrWD6xoLT54cK9iEi9
 obpg==
X-Gm-Message-State: AOJu0YxaTWUfWofPVwH5U3hnzgeXgHRISDAY/7GkISbnODO9NWXZEXe2
 8smSmPsn+mj7ZipCaXbRH33VowlYNo6li2cHk0+rzkGq5t+qW5snkQ02q9P0J/9e/PqeEoaBzaZ
 8zGHbdiEvYWfuw0uzj0HfnNr0cnCVen5iPhqtdc5+lFOlvk0pIy5EI53P2Q==
X-Gm-Gg: Acq92OGjuQzEzJZRxleLP6nuGKwDLzFP035A9zge8sKDLzpQnotS3eDFuyzthJbEVgH
 Sjvl5X3hgop/W41gJhcl5NglHTffGZouIc4jrG+s2S7cF2eV/s1MpaakD9YSowqtaB1Vy7zhXv9
 DMb0SL2hZE+wTZUKhymuGCMHsX0tTzsdZbhIiQYkzkD9sBUBQ0zku+oTC2ZYUTMdzXur8rD+e5a
 20cdCDc577yinLlU26iTZJ1R8567k4xRktrV8AJHYzINqgU2ffQF6rQa/6wv2uE9bVMA0n5vG4R
 cQCDTSY8hxvcE93ZZPxtQyRFec5InUcNY6+1ZwkdazGViapeH3rUaEde+KlZh6+dKcypxQkeFnI
 OrWvVEnU2Z4Gmbp0jvAMtueKm3mDciEn6u1q2szv7hQco/O4nKnKdbl4OGe8=
X-Received: by 2002:a05:6214:1c05:b0:8ca:10aa:e1f9 with SMTP id
 6a1803df08f44-8da1eb4096amr11165346d6.42.1781555878816; 
 Mon, 15 Jun 2026 13:37:58 -0700 (PDT)
X-Received: by 2002:a05:6214:1c05:b0:8ca:10aa:e1f9 with SMTP id
 6a1803df08f44-8da1eb4096amr11164926d6.42.1781555878267; 
 Mon, 15 Jun 2026 13:37:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f4740fbasm9749906d6.29.2026.06.15.13.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 13:37:57 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 08/13] hw/riscv/sifive_u.c: add cpu-map, cluster and core DTs
Date: Mon, 15 Jun 2026 17:37:28 -0300
Message-ID: <20260615203734.954428-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lbOsDQvh-C8KRnRHYf8A_nP5zPXS03UT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfX3zZ+Ed+XC5PP
 vmjfL/rV8yVRXs9K3Z3Cwn6oAilu371lAEAilEq8dZmznXOJLcw9GWRFkhwPHsxkmtvx6SCKZBt
 7HjN/5zn2FWZNnW9m6uHqcOH1DoRsro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIxOCBTYWx0ZWRfX/gWQtf0RNNYk
 IiyIsKlQQHF8SqdGks/CpqBb8nP6gxQflAQYbZR/rDz0DBsuExiCb5isSAihAHg1Qemn0nC0XrT
 +2bNO0DfGWUwcWOXSPNi+vXpdKtjss4NPs2wrkuMKrZp/gDuVJT/DmjQUjT/NRwsJt/0E413kIK
 ti5YHqv5I0It4Z2S1b2w2xW5+Pu96TJ32dhH0TG4xdHQJNJ7M6S3pvV5HImjw9VkTgUfDH2VHX7
 pbYhFodjW9E+ll4rjepDfpXMsrJuUlml/gUaDZ98cKmzBhpdO2wysS9c1JPpFcfB6AIM1piWeBA
 kul6Ad4wwNihl+EsmxMjJtDN3OnLn3LhNFOMIT2AApuPLp85PsGCK3XjBPsbqRgfFbJkxQj3iBv
 kcRrP8zieXT0fvHbaZJ3RWFip1p8iOLzg9lxYzfeYBa4IJyFdKXEgOK4Gst1oA7SHQVn130Ez8B
 wf7L5NdN33L1+8cZD2Q==
X-Proofpoint-GUID: lbOsDQvh-C8KRnRHYf8A_nP5zPXS03UT
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a3062a8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=De3kZSdNAtJ2C2JbOQQA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150218
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

We want to consolidate the CPU socket FDT creation into a single helper.
'virt' and spike has the same code but sifive_u does not have cpu-map,
cluster and core subnodes.

These subnodes are present in other boards even in single socket configs
without NUMA.  This is a strong indicator that their presence doesn't
hurt a NUMA-less board like sifive_u.

Add these DTs to make the FDT standardization straightforward.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9a791b36d6..a4265fed0f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -109,6 +109,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         "sifive,plic-1.0.0", "riscv,plic0"
     };
     g_autofree uint32_t *intc_phandles = g_new0(uint32_t, ms->smp.cpus);
+    g_autofree char *clust_name = NULL;
 
     fdt = ms->fdt = create_board_device_tree("SiFive HiFive Unleashed A00",
         "sifive,hifive-unleashed-a00", &s->fdt_size);
@@ -143,11 +144,17 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+
+    clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", 0);
+    qemu_fdt_add_subnode(fdt, clust_name);
 
     for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
         int cpu_phandle = phandle++;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
+        g_autofree char *core_name = NULL;
+
         qemu_fdt_add_subnode(fdt, nodename);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
@@ -173,6 +180,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc");
         qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
+
+        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
+        qemu_fdt_add_subnode(fdt, core_name);
+        qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
+
         g_free(intc);
         g_free(nodename);
     }
-- 
2.43.0


