Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14351C43327
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpU-0001bX-VK; Thu, 02 Jul 2026 09:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpT-0001au-Vt
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:51:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpS-0007z8-FB
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:51:47 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0Yvi505060
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jF381ehenRVkW5eehrJwcSfY8zbW3H1Slv9sIPsOo9c=; b=mUTxCoYksxZfDWpG
 yjvl38l4/qUjR2uR4/X++PYofo/jIdJMvgbsclWBNTIg3vjKFlExInPPllmhi25a
 QamqiU5xTcTNjDeNgZULwiyjEPpT9jasdXTQD638+5UQIJLdTzPoO4uu+YJ78ABj
 DGtdpbZfTcBb/yA4KZB6ufRU1GgkCez80ZtKNyyyuXbW43O3HTBRcaKnFOIh4/GY
 1+CszIFf/eRlCJrlPrvNGNQkEdFWrc+VxAFpNXbizBcYR0F9+feLt9hfwQPfoqWy
 yZg7mAEVldeyQGgXW/3nYngSeG4dpczRG88ZZ1XsfIpYGMRW0BfIpxE0ubryl029
 B6NOfA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb269u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:51:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-9693878131dso506139241.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000305; x=1783605105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jF381ehenRVkW5eehrJwcSfY8zbW3H1Slv9sIPsOo9c=;
 b=C55WJFUI9qwrbjEztyBSJBm3Yi+0iiP8Jb954pz4QNHPXDvG5iNXUWBOoWZXmCyFHh
 IQ5HxKiXZbYnJl8VTML4J5dGEyhjmC+OJnj/lzsec2Bp2XURXjZaZJNW313Dlw6tJfxP
 vce6oPoJhKEzaGcw9PhEKY6OSaixmQuyS1UgiOBtGgLrPU2yvSihA/TQ1Erb/9IpA8BP
 u8sCfhM0o6gYhxeNCoyuQasFdsasayCg6mKvi/1ULkG/pwDk8KhgmjmDv689N//o2bWz
 cj1QSfqSj9qWI4Jq+L0Mcopc+TD7crAZ93ti8mLPJCSABewv2RR7HqoWSsVtdlXkfsNx
 q6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000305; x=1783605105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jF381ehenRVkW5eehrJwcSfY8zbW3H1Slv9sIPsOo9c=;
 b=mr6Al0h1oVBALfZ22fbtnujqsnc0mlCXSNqlDLr2k2II9MrOu5bMF8/1jeG+LMjPcK
 VJ75PzydKdXTxyiQwFNd0O0GpYxlhRicx+QNetxEbnrDQEGEAgurTf9PQP1FbyVReJ9v
 0HRZTc+L+6LDri7VsaXEjgrU4LPkJHrwsvkMwBjvSZX4ZKYwF9zmYpfDCUH+YPucT2R7
 VuojS3uxGvNQFojlLEEfLgaKuw5jedSRfJfmXeViBVCJpqpeF1ZgR3jdZ9qZ9SDjp+uZ
 AYCPGqyMUaq844lRu4QzQulxsRMO0rMJ7XqcR3Whn2jyZG7OnRyfwk/rs4/CYVQ13irw
 9mhg==
X-Gm-Message-State: AOJu0YxHB3/2Qjkk3f1b3zGEngWdUopKDJpNNTTLawKQdzGW/BCQ5P+f
 r1WT1+4ZrzIMgc6fyBfkToygXBFimo/6x/SKb9rhd5c9gD0O8rl63Zd5sNKnQIThW+pQc/p5dAX
 JSxzNQUmR2LuN9PdSR+HTyCBZWJAskjLN61cyIVRgZUpUVEjOfn1h3Z7UiFy5xQOvbw==
X-Gm-Gg: AfdE7cmVNV1TPh6sMWxTjxV39cXkbuSgit+95zOc8ePdPwI3vO+cSOxNHnW5hf8Snss
 r0cIVYwcr5RyJ3es5fhhhzri4yMeKMHSLFc9VlkKWFlVa0/ErxPzHDQDjau95EKoObLeoDqqrCH
 2a/P4dZfjuAa8ij1uzOCj/c9Fr2Npvm39QW8AFDkFAYAIwgrgcXrVUQ+z4Igj418SGpUSguYykO
 YyAefApFiU3Q7Waht4qHK1DCKYq5jqVu0pevV6bbbbeN3ov0kUUkUnGbZmY+t4a4LS0QxXC2z39
 TLo1BAMV4oEsszeKU1A0ifSGVA6MRZ9S7UGqsv0a1jpFZ/4zGwhKwKW/0zyyZNr3MkaywOkysUD
 G8sKV0f1TmSSARkMzYkYXH5KDbr4VkwgKJ1WJlvTl7YgFbg==
X-Received: by 2002:a05:6102:8607:10b0:738:f5fe:3c42 with SMTP id
 ada2fe7eead31-73bd2d50c63mr2491747137.9.1783000304986; 
 Thu, 02 Jul 2026 06:51:44 -0700 (PDT)
X-Received: by 2002:a05:6102:8607:10b0:738:f5fe:3c42 with SMTP id
 ada2fe7eead31-73bd2d50c63mr2491727137.9.1783000304025; 
 Thu, 02 Jul 2026 06:51:44 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:43 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 04/24] target/riscv: move pmp files to tcg subdir
Date: Thu,  2 Jul 2026 10:51:06 -0300
Message-ID: <20260702135128.1188021-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OpABH0xtdTxxDe7_amydRuCdKCR_hBkQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX2n39oiHEebTx
 /dEtyn0OPkLeGSsVmc8YbNWgrxKmPAOI6eaHyDP4BPPTq9G18WOdaN0hwV+WEV7o3PRXcFuEydi
 aYzPY0/3VEyPPMa8yj11r8FDOolrTkU=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a466cf1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=jnI-slyzAa9jSDvEpakA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfXywbJLnl5PwKo
 kg7pEPjj/nyyVxPIgQkrYUxIUiJLFbZf+VxG8iCzYxFVoQnx6KWLS2/PxoUdWoPyzcVIiYLRDgw
 A++eFFORSPrLiSIDsoZO8Fm4uOnL/xRn5ONvo2uM1OLPfAJi8ArVgdnyMSziduHJusRvj0uVRnl
 MIJMPbWwFH2OvC5kRiq7ikqUENYyLsnM+WhJPCBz/0Dx5vb9mwX4SEzzjbAoGkJCTAf40ematAP
 zn9rNNL9gzS6QlURaZjGZrtPs+F7aPFBj7hzh0Iql51hojNbjAt90lm05FqPTyNYNoCFMJ9G6i9
 7mtSEmEGzJ9N3NBur5sUfzm02ZLODripF2KFxhHpxYFdAvjcdekQlLeZjt+YdzYicmKB5RTykKv
 dT9CG1wi9b5gmdsf8wqG+pALL9/DG9hIpqYjbEdhNk1JvVP/ni3vxdOWdov9FU4jW2I6BiTqm3O
 pL3nzxyvclSGQS248GA==
X-Proofpoint-ORIG-GUID: OpABH0xtdTxxDe7_amydRuCdKCR_hBkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
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

A trivial header change is required too.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
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


