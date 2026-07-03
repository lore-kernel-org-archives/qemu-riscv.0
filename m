Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7444AC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:06:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiHB-0001Kp-Hh; Fri, 03 Jul 2026 14:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiH7-0001Jc-VR
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:05 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiH6-0002AH-BP
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:05 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663Hirlw678924
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W0lCwyo1bZxL3ygMC+yu8al/5x7vqlkz75EomM+PL+Y=; b=AqKUx70BtgrgvEBy
 QyFgYcpys2UmG/IbEyoZxFGFiLID89C22vL2C7+9D1N3Lyk8tAWB2mmerKjC1yD0
 /OmGEn9gdWaaZCZuy4Y4+cAuvfFytMNsE8FUJ0EeFIYrSZjYmNQsGbxlHzEPbxjG
 hY5YKyAu7HOdWdw/3iyrrYXtse8VnRrWz7s5STGwQ0O1J1D5UIXjbS6HRVMDKEx9
 735kmYWXSVc18MijB0fhFXIFrgbScXlcZPdAgElq27b7JRkt7lzpDsOOip+w8TRv
 LXHZneXOZkw696oNJDOGGHt4n5KZJ9jT7QR0y8kqSGgxYA7CHHRs/oV/hlJm3M6V
 lM/MgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u328yv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0f0a0760so15556891cf.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101962; x=1783706762; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=W0lCwyo1bZxL3ygMC+yu8al/5x7vqlkz75EomM+PL+Y=;
 b=hTMZHHO9LA5IAr1Dlom481F4OuTOU6rtjNbeBzsWQdGJP29ZCAAWH+PopZsYCOIOyd
 Z2SQ3MIeOR5nBVIVdjYn8IzN63vn5oWVHyQesjixElEGDy/SXpXAcFKWUHtyRNUh/69y
 81ihtaaiGJwARHusm5cyqYplvUbxxT8XbsCxmiJu88520t+FeIFTMvw83uOBFJNjCC3S
 O5eHeCZTiMoBO6TK2nO2rKEaoEA56u01zI6+4B6CZvpMzyAjIKCLiZblfN/ytD5sVuDn
 wpWlgyRlVTCbfILW7oKR35AEWrnblLsMYIHDtY5N/u1BLr4BhDIuAHPU2ejq389NEA58
 ezpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101962; x=1783706762;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W0lCwyo1bZxL3ygMC+yu8al/5x7vqlkz75EomM+PL+Y=;
 b=bpqGDesGESnL6aCeSTH13SsKZiaJN2CS6UcHz+ftX2Gw3pApVxKXq9s8S67NehATmI
 Pmt4sglKunu7INsJQW/xw8snoALBVHB99CmgqCQm7v1XDPAFJKhmjFYVriluSzws50lE
 CMV2WV6/h/79D+TP3dyfiHuIYQScCpdkkeeK95JfcTThWROZRX57f2DGsuU632cVd8AG
 6+cT50L1nX/Y44+vMW3981IqlyKLxjsltqlNGDi+CQ4nxbtOLWnEIP4uzSosuD8O1BJj
 fc+zto3V80ENdGaNpAahXlWAH8bq17WZH7d0gw8omh0d89tPT1udTypb7TbzKxhNLyfp
 145w==
X-Gm-Message-State: AOJu0YyUMZCmSfb6UK6aNaUwZ0Q/ccPUN5YhGsYe5aYdfcYGey4nEJlm
 HFNzgM26foW4eOqMWmSGwN/Py8gRNFAjJFUO5tBC2x+hYqXGuN1H2h84f+ZXsTiT9gTcey0Dhlq
 T5+OrzpkezWQTVobsLoG1X4JZghT+8OWVuAIPQXXMV/oH8LYvY1MMMpaoYP9qjwfllg==
X-Gm-Gg: AfdE7cl0aCzNwBE0C3pwyfWslkTn1K1iS/n9BV+W+6OcsJ68Sn69Fil2JUckAKn8bjQ
 mwKoGJWRVBXSd2ffrnBvUJQS+6LlujrNaBfAtS54Knrdw2BeEwUEJL8+H/VLZMXSYaMSjhsGNsB
 7K0t8jJH8AmS3/AeblIDUe+Z2jn7lA/4n7pnkDmKB1eIVUm6q3frPjzPFwoPGMDebAzyigN6SvS
 +VXV5xovmXeq2/B574CKh6+8arSyiK1anaodVDO8icIbSkV/TTD/11twolm2im4qopOQHixOiql
 C0MQ4bB6Hldr+oI1mIlV4ncjlNSUycPG/4x88K6FXElCM1OCkMFDUGGFH/qcCtNihSViBSksrVL
 CG8XuXt00n9KHW/hr1V2AHQtXWqXHRnIshC5s495tXNvHPw==
X-Received: by 2002:a05:622a:5c1b:b0:517:5bc1:e1f0 with SMTP id
 d75a77b69052e-51c4c0a7f01mr10920381cf.0.1783101961862; 
 Fri, 03 Jul 2026 11:06:01 -0700 (PDT)
X-Received: by 2002:a05:622a:5c1b:b0:517:5bc1:e1f0 with SMTP id
 d75a77b69052e-51c4c0a7f01mr10919591cf.0.1783101961324; 
 Fri, 03 Jul 2026 11:06:01 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:00 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 06/24] target/riscv: move pmp files to tcg subdir
Date: Fri,  3 Jul 2026 15:05:18 -0300
Message-ID: <20260703180538.3346781-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pVEhsgKtJPsrNMDKqu66ia77sNfzo33f
X-Proofpoint-ORIG-GUID: pVEhsgKtJPsrNMDKqu66ia77sNfzo33f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX1qPatshoS4fN
 I8McPgIVAB1qpDgLC0424MYBny5adxoH+cYpJNvXoNqh78/ArHOlRML+Mb4FhS0Wj2wP1O0Djvx
 hndcOeJy/o0FtWSOzu4IbX95DBxXTLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX3ctZUhctrpYP
 rqArLdj6bt+5msk4tpUQU0rWTH9J00SHUSYHbl5bMesfcgUBvAPkq7qFMMKBPfzTkF/t08jemfq
 WSQP8Mf/LVwXqU/cLRh/fZwhgBeQ8qD7jU4i540JH69gThAMwGe2A/piYFF1WEJUbAIcX8kk5Vz
 y/3suyAevE9NFOh1l9Cc/vGFtWo62cvtgY4rYiuquR7IrtXWZS12f0ltAahx7PCLXCRkLETflf/
 hsMO1mtNhKZMBzp20NkGM75ZcstjX6WxwhkPueu7wIKaSRP98ytm3PDSR9td+QyRst8pQ+UjGkn
 vigj31jMImEt/c0gFXr4GFdFTs5Skl62CAmpDOom2wKj7ocaYn+N9gPIYY1UBtyMZ2wD2AfF4Y4
 gWOvUWcXB/cuWhYCzY30X8LQak3CFz440Z+awiHk4IR2eKHyHYfw+oTu7jpNEe2JRax6vxUoNNa
 dvC/eBAK9loJCoE1O4Q==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47fa0a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=jnI-slyzAa9jSDvEpakA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030181
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
index 82362ef8d8..ecf2913d42 100644
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


