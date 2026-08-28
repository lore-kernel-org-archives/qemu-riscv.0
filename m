Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DBBC61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:40:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03MQ-0007HQ-FD; Fri, 28 Aug 2026 16:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MP-0007Gi-Fz
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03MN-0006TM-Os
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:39:37 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SKZq844122319
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bP2TM9hnKPVBATNAxSJcFqIOG/po49HZ7jY9qs2bEME=; b=bFppLdhxQEev08ac
 98p1m82POQ5O6cBzMcu//0VTeqPBbokTTMo20jfWz3JSlwQ/P8JwaeFZ71vq5S+E
 7bWGCLqRaQ7god79PVTDCO14slRD2FqLT8/KNQERChVk448MDwsNrYDjY+r7Aspq
 AV5JVv8YJo4nodDkCjqQ7RYjtuA0DZZ9nICeG6g+mll9vhyCGhjEIbWJmPYzr9mU
 VngFCvybk/XlongN4RmQ2huQn0+tcisMB5K2CWR89MzK2D0D+ANtxYM7omd/TnvQ
 Cw02sq78ozHK/pTCX9glElqwdv1lfZfObgd51ticvjUf33J0tkpODPh6Iib/jVeS
 0LscJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgq80c5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-936708f129aso136534185a.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949574; x=1788554374; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bP2TM9hnKPVBATNAxSJcFqIOG/po49HZ7jY9qs2bEME=;
 b=ZLujZ3V35A4Fl1ni6cH5xjHbj0/7hpt5PRwShDK3sH5PNH7B4i4kMAW4noPtisW8U/
 RqENIzHaaSqDUQF9/6+D+HLOcrTFlbeVo6aZisbmIE2H0wX9ypgSsNic70LBgg4DQB0I
 ZVt4xCRJUxi1dL9+xdFxiCqgXfGaubeCOgzxtg79goGwBsStrTRpe7ZJ4pBla4gYw8Me
 Zad9YtYlIrQVkyVUZ3KV18Dv6tndY42oebLOyXKHtnzBn1QYo+129TtNHyX/xFxQOPoI
 /JlP2Mtuqk38ozj4kwa05oZznDApnYNdnAUOvAQQ+Js6hpAOzn8M15JfCp+6l5WSnV+D
 eGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949574; x=1788554374;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bP2TM9hnKPVBATNAxSJcFqIOG/po49HZ7jY9qs2bEME=;
 b=jnQOsNJlIYLdaKi/jg7ejjjCY6ecWFJ/sr8R4fuyJCwgB/T/pI+6eY2VQOk9cpeKHY
 t2D7HaMm3WLSEFt9vd3b6PeOcnR+4Kd70LJ+nzb6CYIlnjKA2OsIfwxmk1Y6EzXGMdBd
 IJ6JuHVo+vM8Cg3nQq9G7A0qWf2qWtAgF3wVq8hKCx432TDcwYE212mwsekZySh1xoLY
 vz0l9RsR0bOGdFjhKyIgnNnjppzx2UZU9dIcceIZtlcMcA4ar09VDZutf6lKKWE+nlHu
 PsVyWBrKLyMXX4bFUOnFylSa2nfkZHWeMFKXF2E91XgIOEv9O1slHTHYWBpO4yyR6xH5
 11rw==
X-Gm-Message-State: AFuF++kszboci8gwQxtwfkmMGCHd8LHDeb6UKGt3yR9qy0IpAnZ0tK8a
 /ZNYkDTWr7BNxCIFRhb7F3vVZzrSQeRmFQVz+EO8O5CQ8z15NDAi3bawwW59Rl5w03TKSjxPj/b
 OPrl39YpDsyx2/evFGs/R2WPhqnlGrTKQfuv6Tp5S54k+/cJYq8nyw/Bu9A==
X-Gm-Gg: AR+sD11xAwcR5BkTeWIUADuD0hwwZNiDWJJi2rfvYeV/NtOFKmGnnUVRCDJ3xdzsv6u
 yw63tX2nJVO6Dne//GAL5GwHNoWTb/360kKyN9fC0wKmqnWjgoEmOJ3hb/rvhi8qKU+b8qZXeBD
 l+D7bYwD+xpjTkFL/5odxlHEZh8KR8OUVM6uUEi9TN3d2qyplRHewIGIrYowMdQ5xzL16RzLgy5
 L4vuoJvpVICHMX7Rpcoaa5Mwbfn+Mb4fx98SjIHX2atRPcnkWGf+ScyIVnqDWmVBKh70Tjnzo1X
 BaG4SJQ7lJEhip27wmx9h5Niy+a5DpnE22LwfKWCH983+CJB87htWeTvDq7H3JgjLWFCSjdgl3s
 I32ZT6130eBRHMCbP/92y+h/AM+ABLLajZXSsZw==
X-Received: by 2002:a05:620a:2b90:b0:939:1f43:cea4 with SMTP id
 af79cd13be357-9391f43cfa9mr532396285a.15.1787949574078; 
 Fri, 28 Aug 2026 13:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b90:b0:939:1f43:cea4 with SMTP id
 af79cd13be357-9391f43cfa9mr532389185a.15.1787949573552; 
 Fri, 28 Aug 2026 13:39:33 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:32 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 02/15] hw/riscv/fdt-common,
 virt.c: add riscv_create_fdt_flash()
Date: Fri, 28 Aug 2026 17:39:04 -0300
Message-ID: <20260828203918.350131-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ATPaH4UZRuBRLwxuKy1nLUs5juVtPlTT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX5DYJj07QRtOh
 MZYqcktn6wag+C6fy8OQr/dddrfKpbLT60cUVCqkrDDE6HYeTfrf6lSKwlnqW3n95vnebCc95Mv
 OmA1volnBzzzJDEoH4Z4M5Wgo5S3joI=
X-Proofpoint-ORIG-GUID: ATPaH4UZRuBRLwxuKy1nLUs5juVtPlTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX23P1Nr6YmJ0m
 qlIEIR8ca6vuxi/Zc+nL7A8rqon0jXmSHYThUCv6Z+7F6KGEh/Z4wheaRSkv7LrBMuDhN4/jKKe
 nJInFlgApiJdPbPebarVM4PBBeWaLUVAnL/ErifLIYE/jrEIalRxCQJhEjzuXMd6wMHXXIPu5Q7
 JWowBdERYjk9fUMxGdODSw9MQzWBdsbj3f0Ykro8ROU/tDJdrA0R6mu/0wJfvtVAOFMcXoMSwWH
 qFHVFseLyCeoYjVXxHIH55x+uxtipgUusFkrYxlU+yE/vusYBkYFxG2tYYNylepuZHchxuXeCNA
 0CNQZ4QqtZHWBBdS/lpTQRFSWesHz3epQM7SsFelI5+B1Ms8DMRsLJXITxboizIS9qj1nBfFkRl
 D3c/CvjW8ZfM6yHxu9GDaSJPok9+AA/v2eSq4CRMTY78DfnCHqMNxZugCF+REqqs/ipm2viWhld
 q5kPqtLfA+hqrzjgEMg==
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=6a91f206 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FRSEYCzRAAAA:8 a=plQfXIS7czum7OicmoMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
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

Add a common helper to create a cfi-flash compatible flash subnode.

This change only affects the existing 'virt' board for now but it will
be used by the future 'riscv-server-ref' board in the future.

No FDT changes intended.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu@processmission.com>
---
 hw/riscv/fdt-common.c         | 12 ++++++++++++
 hw/riscv/virt.c               | 18 ++----------------
 include/hw/riscv/fdt-common.h |  1 +
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index 3a8da03cfb..6fcc1ce21f 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -283,3 +283,15 @@ void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
    qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
                     fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
 }
+
+void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize)
+{
+    g_autofree char *name = g_strdup_printf("/flash@%" PRIx64, flashbase);
+
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 2, flashbase, 2, flashsize,
+                                 2, flashbase + flashsize, 2, flashsize);
+    qemu_fdt_setprop_cell(fdt, name, "bank-width", 4);
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b796220fc2..e48337dfd9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -867,21 +867,6 @@ static void create_fdt_rtc(RISCVVirtState *s,
     }
 }
 
-static void create_fdt_flash(RISCVVirtState *s)
-{
-    MachineState *ms = MACHINE(s);
-    hwaddr flashsize = s->memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = s->memmap[VIRT_FLASH].base;
-    g_autofree char *name = g_strdup_printf("/flash@%" PRIx64, flashbase);
-
-    qemu_fdt_add_subnode(ms->fdt, name);
-    qemu_fdt_setprop_string(ms->fdt, name, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg",
-                                 2, flashbase, 2, flashsize,
-                                 2, flashbase + flashsize, 2, flashsize);
-    qemu_fdt_setprop_cell(ms->fdt, name, "bank-width", 4);
-}
-
 static void create_fdt_fw_cfg(RISCVVirtState *s)
 {
     MachineState *ms = MACHINE(s);
@@ -1043,7 +1028,8 @@ static void create_fdt(RISCVVirtState *s)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_flash(s);
+    riscv_create_fdt_flash(ms->fdt, s->memmap[VIRT_FLASH].base,
+                           s->memmap[VIRT_FLASH].size / 2);
     create_fdt_fw_cfg(s);
     create_fdt_pmu(s);
 }
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 371971d79d..b422da6aef 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -38,4 +38,5 @@ void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                            uint32_t cells_size, uint32_t ndev_sources,
                            bool numa_enabled, int socket);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
+void riscv_create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
 #endif
-- 
2.43.0


