Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F16CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNP-0000SS-GN; Mon, 22 Jun 2026 15:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNM-0000RT-UD
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNL-0001o8-8i
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:08 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVnJq2691749
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=s9Oa2MR8QAO
 3i/c+5hYDpj196wEltw5TlciP3p8bU50=; b=JVRMFm0Evfv/hyO4+5mMD7o3qay
 QjPjapEtltfOvE11trdUgQxN+MONPUscpysss09x4aXzCNxnUtmj5QhZi7ZKAhIX
 T9mkhyH5QrZqFSBFOPEuS0/9bs0Jr0ipDVb002ytfUl4XdvK15L3YiYEvjW3iITw
 etNkuJlgMmZTKssQZhTOO+gDQKZYH2Vz4Fu/Dq49ye5I0JWlu6bvPsj1aBijMeKo
 kkcrnJRzU7Gy1Rxlvp6YYiNszFZV9HDlxtxZY4BvWLBRGOe7qjDpiRGd5Hjl79XM
 nD+HNZTWjmNaHN2SDSgEw6T5kymbXfyEdoOWlMivFYMY5RrUYYR/dTdnqbg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn1d1v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-6c33d75153dso2834654137.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156725; x=1782761525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9Oa2MR8QAO3i/c+5hYDpj196wEltw5TlciP3p8bU50=;
 b=JIiCCLfN+ROIHJfGRSMOPQahpw9k3iUcDLXg4zdNnSGMqrT+3qPs8IW4m1LWJvpKhN
 Ygdde4GeIPVJuUddbHvP0utQNmwqgZ4yzCK5soYvsLDiaAEj1C2g8CgBdfx46Ng4Pn/3
 UOKi7w9qN0AYJuca/nURLyFC9au2rqs+ikMjXcyLJ8XycMtwvUYIG4oIOI7h65+93Xzf
 gHFsUKS0c3GXbljswxpvJ0nGTRKeo7vOOwsNZfYXe9thFXlB32h/riBjZj1ouzb9g+Ra
 laDEjvNBWh6EFI1ujLPN3LivdC5bdv7pPpOi+JR8UfBop1b0wZZBz1M7VgrdqthI82y7
 QzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156725; x=1782761525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s9Oa2MR8QAO3i/c+5hYDpj196wEltw5TlciP3p8bU50=;
 b=IvKe4EDNRt5UTGuVh+sYg2KSQEzjO/0OzI388uQ6Mre04QERDO481IOlgKHzb6ex2M
 0gHgZMaDt5xhrnbRtFSucG+j2aRrC1WYNBdtis2BuEYPgEeQvhcSh+9eRMo6sFvWVaKE
 KRv9mhKJnM67ub9dwGj3KAZxQBAGNRdUqZda+IY7wDq0U+gy+0XCBFj7n/DCYeT7v9jM
 iHf7KWBOVdPc01qCwMALcW9S97Ss4IqgRx7rL9p4XTUaDqwSfLCTMcYR9ZK29joolCUV
 Fv4QHPZoHcanyyPvi2SO6gxnA7CwK3bYzeADlu1MpU3/n+EjaD2Zecn5VmBr8X53CtZT
 Ofmw==
X-Gm-Message-State: AOJu0Ywd3J6y6/b5Cqa+QH+sNSgt9SDZ+SiC/6bIaOCLTnxRnhVsJlI2
 dNxyOydMbFzCJu/K5KqcNplLkCVZWOSeR0bQDqBBfLpMvpSq3orpQ7iyRE4PNi2qB3RSG07YBUZ
 wyTwCBM2Sg6yavYXHK813BnqGMNeSlQNC3UxhGHP4o4qFGk3ufvfJp0WA5Q==
X-Gm-Gg: AfdE7ck9eJFUwb2g2PtHrED3+e0iGn8i3rIC28zo7Pshl+vGgtL258z33vekZ7AQ2E7
 9utzKEJpGjZzUSM7Z+jJCwMigpGxSTUXLfP9MdNsV6SoK4XBMvNmxWk454NadWnCCnoE5bMBO0P
 XM0avRgTjdpbotWRMWz9XQfPHLw2X2+oFsjHnyMdHvBiF2D0073bnSY2mynvjRB+bUKsGArk8AA
 K1894Oq6fgqlzTx+Ax8tn4vxgjmXs6Hqh6g2oPt7mQ6DG+KxqtT3Ya+IVAuDKSUXBPdAYuesSNU
 zqOSi9k+47DjgY1hAuRnDUhg+kgTfhqi0sfqei7tolQr5haIAiOWxJaxiIBH/ZDyERgVfNzIG4M
 bAFGX/rqgiKM7Ke+b77GXffBeVOLpEfoCiEtrlTjwYXo70g==
X-Received: by 2002:a05:6102:8601:20b0:6f0:3ba3:7d84 with SMTP id
 ada2fe7eead31-72a75fa3c17mr6119453137.5.1782156724898; 
 Mon, 22 Jun 2026 12:32:04 -0700 (PDT)
X-Received: by 2002:a05:6102:8601:20b0:6f0:3ba3:7d84 with SMTP id
 ada2fe7eead31-72a75fa3c17mr6119405137.5.1782156724495; 
 Mon, 22 Jun 2026 12:32:04 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:03 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 04/24] target/riscv: move pmp files to tcg subdir
Date: Mon, 22 Jun 2026 16:31:20 -0300
Message-ID: <20260622193141.1449724-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xFM1aGdEjR-_mn3qLO2FSC1ifhEiepox
X-Proofpoint-ORIG-GUID: xFM1aGdEjR-_mn3qLO2FSC1ifhEiepox
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a398db5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fhcCIlfuyIdyhw9Sb1oA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfXyUDjgUWUdWtR
 C9CVxNXtWcZJEqFHWPiIjFnqGnJAqYaqK5XbiXDWSZQYn2izmiLKm+4/LcynE1HNp86SDfgNHLk
 rbG2THj6drp+dIexRsRrkMvWspROwEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX1q5cB5nsghD5
 8m2N6KVCz9TCxn6T5/pFNm1B4MD/JPWRODdQ/y0O52o2a/l/XmTf2Uc7/NPUQzxTl62sLvVFKsh
 lCoidHiDLvwRb3dxNGN5JqWbI9AUQZjfAdnTPXFe2+N8eKLd49my1BGv6r9W9GfFzJOhO5ELYdW
 zKbv75JqeBqf3MngvPwejcAswQZ/TJyiJRlfRCdxB21tyUlN5ehX1Sz1JKpp/HAaC9VhZ2AKZae
 vtvYlkzF6Lp7Q4ukCamVK4e0hYoPZAbXnggCKc8x0Se5SNJSbsyHbKcY4QXYdZpTvLKjje6x/L4
 ZV0+ugerBLoeZSPICMe9f8jxlNkJANKULmz7hLsU+2t3tnHfeWQD3LbqeLJXCE7SD06gaL32vqe
 sjUsL0jEGGwjGomlC6cUIA8MLsMJP7CJXqqyLpclvOWSmITTypz76pVEJCCNYypk5TFdiAmxCw5
 /7MpenV7ve4NkzZb76w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

A trivial header change is required too.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.h           | 2 +-
 target/riscv/meson.build     | 1 -
 target/riscv/tcg/meson.build | 1 +
 target/riscv/{ => tcg}/pmp.c | 0
 target/riscv/{ => tcg}/pmp.h | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename target/riscv/{ => tcg}/pmp.c (100%)
 rename target/riscv/{ => tcg}/pmp.h (100%)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bdd28d329b..f0c78c1474 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -183,7 +183,7 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[];
 #define MMU_USER_IDX 3
 
 #if !defined(CONFIG_USER_ONLY)
-#include "pmp.h"
+#include "tcg/pmp.h"
 #endif
 
 #define RV_VLEN_MAX 1024
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 61874ed0af..42d0f6d538 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -22,7 +22,6 @@ riscv_ss.add(files(
 riscv_system_ss = ss.source_set()
 riscv_system_ss.add(files(
   'arch_dump.c',
-  'pmp.c',
   'monitor.c',
   'machine.c',
   'time_helper.c',
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
index 5684fcf985..a05ab642f4 100644
--- a/target/riscv/tcg/meson.build
+++ b/target/riscv/tcg/meson.build
@@ -21,6 +21,7 @@ riscv_ss.add(files(
 riscv_system_ss.add(files(
   'debug.c',
   'mips_csr.c',
+  'pmp.c',
   'pmu.c',
   'th_csr.c',
 ))
diff --git a/target/riscv/pmp.c b/target/riscv/tcg/pmp.c
similarity index 100%
rename from target/riscv/pmp.c
rename to target/riscv/tcg/pmp.c
diff --git a/target/riscv/pmp.h b/target/riscv/tcg/pmp.h
similarity index 100%
rename from target/riscv/pmp.h
rename to target/riscv/tcg/pmp.h
-- 
2.43.0


