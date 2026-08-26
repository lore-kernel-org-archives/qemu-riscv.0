Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FEFC61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 16:49:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzGnf-00063z-1n; Wed, 26 Aug 2026 12:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGnc-00062G-RA
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:48:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzGnZ-0000q7-FM
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 12:48:28 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QDupW9910348
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2xwFh4IjNi5
 ZPP2cvlmytxr2GRgCFO2TpO0YhBlo5+c=; b=G3nWEyBxOOIREk60QJANyNtH3JK
 UanJMeS92uUjShTzdavhCplhPnzOrkBMnqeNe16lkKRWY311IYDYP+kTdIqImQ5E
 Aa9/oM72cX/MIjtjYCq9rsw3A0VwkP/heGS7T47v8xylFBJmU2A08tR/dyqxHdE8
 73W4QMPIyU7udl13Ll/3HJBYehdqt5aTm8mMg3Meo7GV+WRJ5FccQzYwDb/buCkc
 oiJB0GQGk707w3ME3WkBuFZDuKlvkjLi1FzHaCfBxs2kspgzm4EoYqx44s3V3CUS
 9fOHJ4hF1gIu/2g+XiGiuzCV+mwd9avwpHvPxqMP178IhvNUGloOR4S7xxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a93cw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 16:48:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so12149321cf.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787762903; x=1788367703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2xwFh4IjNi5ZPP2cvlmytxr2GRgCFO2TpO0YhBlo5+c=;
 b=R1OscclNA0PuyJeieuxPUSXdktAWdGAj7zuzH9QldWOoqyeI4tT6v5gpRdkYD65KLQ
 2BgBCBAf9xUla4iGsT2UgvWZl4DGcjIksVhUOCrTIDU8uNHoSprnb6bfpvHdRvWJh5nB
 YXr1bVB2s4dR855Q02sWbndoMBd/ydRshJcE/o8EXKhgptDllOU2PdAx02aN4O57grms
 Qu99i21PMiPQ6zGfkazUDZoJlBFZkdPcY6U8IbiSVMc+vL1Tsb2TdpujEc3bfNReC7ii
 AHT7lx+VUw25hOuYHb/fASq2u3HrFZ8j2d2XKcw0PRGV21OOyVHRrTgHjlFLtue3wc2Z
 Aysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787762903; x=1788367703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2xwFh4IjNi5ZPP2cvlmytxr2GRgCFO2TpO0YhBlo5+c=;
 b=GYdeDrDm9wHtetnAm+1DVcnvk0X29Ezx2O5BpdmZgmclHiLh9Q5RcpUhXj7k5L0o+w
 xUi8fixHZ4lXWNd/cBRX6fC5gMiGD59IXYG/YbX2mPb/MMc6YKoHiag2QOQJqYZirF0B
 v1Yy0Wfr8NRVd3Kqqx9uzncMJ3rJoe3zGCHNSxV2bLEFNZBtHlwckBAqixFe1OmwnfgI
 k6OS8Dyb0FINaXaSjrE/QmEFQ+bQJOC7tRyWD9+UVa1zwjcQguSNXpFHhGwAUAB8Fpqz
 M0OfXl0oEINkiaYDvZVfxzRDe9T30cNiSLMyRH4cFp8K9iWeRchpEeORNmH58yJclJKK
 pENQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoWz11w3nAq/H5hVrMn0+Yeva3xsiWJlhaxXPsaKm5FzMMaVTKK3GpRX6BedZKak5JCAOYBJxBevz49@nongnu.org
X-Gm-Message-State: AFuF++nSAEGCwYxjD3ggU3Y/IzBxcWIR7Heu8tHVOQzM2Oimt7svN66O
 lapvl6lLvRpumHpWFabuzr3HVeQnYmVR8cqxZjxyog/hN9tTXoxfd3BZULabUdfHcg0wNwmNwQe
 5Pr3bFEtpd9aSO/bV2TySJD/GD1CYm/u3QihMiZRjEPFIFyK+3IZDpZwBWA==
X-Gm-Gg: AR+sD13GfHTASeBi0VaYfz1gmqsMPw+eXQYsrP1tyogICqG7nUp39zQJTS4yHU6kqAM
 sH9JDsTNVueTbLDmTC/dsB8On4h9RYCMtZtLzpNy49q/UQEpT2PU8miDgxLSerqyqDncitupvEk
 UkWZqC7Pl+ErX0DSFnBRBpFB7BRFWOWJz1dQcBkvyI9g4nUbHPLiUWpQN4ziPwKSz4tSv5zPOdG
 zI4KtXenrd7z3xCveeUeso4SajoLwxu22XphmCjpWfavZeo0ppZxiuo//hGHluz6DlkMwvgNvND
 CUvWw9siYISDOU8czj3i1EhU9TIQp64nKkhPassphdjLjMpf8pMhe4eiQa29OKv9ehVakfgUd2e
 VTbV6BxfS+wDYNzsJvmVojGzimSa0CKkStHK2zw==
X-Received: by 2002:a05:622a:6102:b0:52d:3ccc:968b with SMTP id
 d75a77b69052e-52e42235c7emr90311441cf.9.1787762903083; 
 Wed, 26 Aug 2026 09:48:23 -0700 (PDT)
X-Received: by 2002:a05:622a:6102:b0:52d:3ccc:968b with SMTP id
 d75a77b69052e-52e42235c7emr90310361cf.9.1787762902468; 
 Wed, 26 Aug 2026 09:48:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4275fc3esm20092651cf.25.2026.08.26.09.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 09:48:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 01/13] hw/riscv/fdt-common, virt.c: add create_fdt_flash()
Date: Wed, 26 Aug 2026 13:48:01 -0300
Message-ID: <20260826164814.44335-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l5lH6Xo7YpivqkbsVl_xvH_v2VmuP8mY
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f18d7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=agbqTSZeYTzrP7BmR6QA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: l5lH6Xo7YpivqkbsVl_xvH_v2VmuP8mY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfXxrsG7v1/JciN
 Rkr1z4yq70rDXxQgAkXWoCgw+ROqzYd7I773UHmGRVK0WdWnA496x1TPyLyeA4YNdQaLbwqDNCC
 o7Vh5CwBOnjrKJPU6AgDrcnFFzIav3rHfHcB1P/2yP61c6wojDJOuoj4Snta9+813UjdT6DzQkw
 h060sYtBYZ+woxR1/GAfCTzqR3ZC2HTjf/mSVvYcZz4/NjjWsydRvXqMIUJXYXUQ+X7ZRMlR9pH
 uyfH4uBVrxtNIlnf8Md5m0BnSI+Ar1ti3SAQYrGap20gC+MUQA4RxQeZLaCxQ05tyVkqIjv8Upo
 H9wHyQcil/7lWXosl231oVFME1mKeU5NxUlHLnp4ib40OdsvkUH9IWTjAytbY3mRatMA5IGQvmG
 q08K3O/IXIOCGRU8w+oV0/pIMZ9S7q1+gCv2Hg2yHTqTloknfl2C8qbUzgBSGIjZlfPgQucrjsY
 NYbV77QAqEPrEPlioFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MCBTYWx0ZWRfX+8KwXBMZTK+I
 Hix4ymw1vF3mjH5IB0lQRBTmhV0JFnIpy0J31faiRhYaNHllakVOYlPFaVQVUQDq4PMnBps1ibu
 4jCML/5LXmcna4yGeujS2VrP078WClc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260140
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
---
 hw/riscv/fdt-common.c         | 12 ++++++++++++
 hw/riscv/virt.c               | 18 ++----------------
 include/hw/riscv/fdt-common.h |  1 +
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
index aa143a618b..e74423a225 100644
--- a/hw/riscv/fdt-common.c
+++ b/hw/riscv/fdt-common.c
@@ -282,3 +282,15 @@ void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
    qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
                     fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
 }
+
+void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize)
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
index d58656f70d..33a121abd9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -865,21 +865,6 @@ static void create_fdt_rtc(RISCVVirtState *s,
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
@@ -1040,7 +1025,8 @@ static void create_fdt(RISCVVirtState *s)
 
     qemu_fdt_add_subnode(ms->fdt, "/aliases");
 
-    create_fdt_flash(s);
+    create_fdt_flash(ms->fdt, s->memmap[VIRT_FLASH].base,
+                     s->memmap[VIRT_FLASH].size / 2);
     create_fdt_fw_cfg(s);
     create_fdt_pmu(s);
 }
diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
index 1729a6abc6..6e438e0278 100644
--- a/include/hw/riscv/fdt-common.h
+++ b/include/hw/riscv/fdt-common.h
@@ -36,4 +36,5 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
                      uint32_t cells_size, uint32_t ndev_sources,
                      bool numa_enabled, int socket);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
+void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
 #endif
-- 
2.43.0


