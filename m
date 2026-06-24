Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BCACDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:09:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB8r-0007Nr-CV; Tue, 23 Jun 2026 20:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB8q-0007NL-AY
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:06:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB8o-0003B1-Lm
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:06:56 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0wro1177658
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M2bDB3WX/4cfzI5MLnNA2V9fGf9bdsUqT/08tNTdLTA=; b=hBrHL5Aobckj7/cT
 fqbKCGONwVkRhMTELUMdnJnuWh9h6oOh/2MpSNgCzYfjBSNL38upVup6raWWHLjo
 zgUOAobQ/aiFlnS1qLEx1OcKtit+8fb6ZCIw156CQtaPy7akw2yDMmNk1x1/LpjN
 v5LgCutwsx2oTjEUSvHLNC363HUZdLYgDsR8XXwiClQPBU/KvsQe13VPPgHDKV9R
 hg/VjEksurrIgVVUoCw+JsRn19uhw+gQawllWYnlWL79ixhyNIQXWxSc2S7K1DXl
 YpJtzhKumnGtT05d4QDdpRbhyBTm8bZuonRUvTKCQA3GQUMkPwIbRixevv6yZgto
 f/ED9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6bd8d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:06:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8e0df2461fdso15055726d6.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259613; x=1782864413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2bDB3WX/4cfzI5MLnNA2V9fGf9bdsUqT/08tNTdLTA=;
 b=jQ7Eb/izMdFct9ZkQTJ5cyq8uJhkSSnsIV3AbWFqiS8i55fK1Bmc6Dw/kHjLXgkaDr
 +v8bKWKvPf5owVDZJgCtrQ2aBfuduxKro3Da3sQnFvGecdOcD8PYu0fEevxOLPEpX3oy
 y0lNiAa56Gg986qqX5q2lhqvOyG8XJazHSIY9EMQgeS0mNXADnwVYC+u1wsYRp7WzJXl
 IVNwRHWsF2L5yoPBCni0HcHNDQx3SkseOZ3AOTJEFEFfBq9PzrHTB+pciJOGEQmvX96A
 3ZRBGykr2ZM9XvDGVCuwJB5pR415+1Jmn85AjK18afRlBRe2SqyyiBuv2tO3muyGK+bo
 /jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259613; x=1782864413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M2bDB3WX/4cfzI5MLnNA2V9fGf9bdsUqT/08tNTdLTA=;
 b=gfWPc7vcxqidBm9mgXOBeBZ6ezGlLplQywr+Aa5eiSxLq3nKqghq2atDjxqsrwo8Ll
 wMgARhR5f+80M1tLORJnJXCRVSZPGftRjmvfx518UrR1xTlMGVAtk6uKobzI4KrIZscS
 OhqC/Jhb4e/oMZRZLMS4jtEu0rHCe9Z4voEb3GHI0QlrKiIPnzuY0433hu17EVdJOyEt
 RfN7IXj7jAkwbNTR8a3bDivcWEEDBxdkGze8sUridyb5waNocPI3SwJxbLYw9b+DzrLU
 ZmznYXdUn+hbhIoSaOa17uj+oPP6ksXYnwn6x5hz1v4SG0BMy1YQweED64kSAssypaXc
 F0Ig==
X-Gm-Message-State: AOJu0Yw4j78jWD2JB/cMsALQ0bsj68ij2ZTOjPBbKeSv6+LGbF+ri5Ty
 3Ceam+XpPblKKZuGKAupnkEyDTVVmqSYvfGAln5BHfb9OfbCDUMh/eXxMALGDvzE6swUEnmabD/
 cm2GvBL4o0LFWgru4iG7/1RzXXdMQfMUKlzhVW0xRK89DY9ihS5Qgrkjygg/O86ocoA==
X-Gm-Gg: AfdE7cmi9nCg+ndlItEsei1dINQmXcE4VmwGUQCmttTNSxivupAMrZu03BTfXAJse3E
 Er7F5OpudhkR5LGXISp2bMa8c+dbFYOW6SKl+gAeGSyhvH7+sO4z2fnBySW3u4ANwhUEJCB4h2p
 uhKTbzqhbQW/d7qmFG1VdPUmKtcFh/Xm3z9/0IQFCOFsymH8JKmrQAf72dfANZPRGwnp1Vre6PB
 uhCCZWFDFRoyi1RiS6/K+zqk0nPTdSDFl/PpUE3JJhEsqoLkkjQ3Hzi3LoOYy0DFagcfAsrVZIs
 cR/dMmXOGS4XghLo6kAyu2wqmcZh2GUQUASBgkSFqjboRzL5tZloXjKsezGLQdz2LtkOePdoByD
 O0chcjgTEl5nHQ34Fzab9S3HogwM1TXDeWenw9uspIghz8A==
X-Received: by 2002:ad4:4591:0:b0:8e0:4469:4284 with SMTP id
 6a1803df08f44-8e52d8cbc56mr19819006d6.5.1782259612953; 
 Tue, 23 Jun 2026 17:06:52 -0700 (PDT)
X-Received: by 2002:ad4:4591:0:b0:8e0:4469:4284 with SMTP id
 6a1803df08f44-8e52d8cbc56mr19818696d6.5.1782259612575; 
 Tue, 23 Jun 2026 17:06:52 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:06:51 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 04/24] target/riscv: move pmp files to tcg subdir
Date: Tue, 23 Jun 2026 21:06:11 -0300
Message-ID: <20260624000632.2149359-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _akK7W59MiIbeytudYXCaG2e_CPjnwO4
X-Proofpoint-ORIG-GUID: _akK7W59MiIbeytudYXCaG2e_CPjnwO4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX8inISF8odzNX
 BfZb81154Wr8KNpzt9NaDdPQPyxzLZT/WFFtDevLV7kZWnIcOe0zbO8c6NA1omATr0P3whxsuOQ
 Rq1NaRbb+jW4TjcqtlIMshtAdBI63cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX3jEoOXQqQMHc
 yAzwGKzfMj/l2nnGggAuU09Vst/GBuxxZ9fgTnPoqJwIIKR8yLRVE8HytTZrNL8VIOHId4JD9EZ
 9o7vTFPtt6QL9KhzHFSSZ3kQOvmmGX7+z5boXhSxoFLWUVhxEqift4h71kjN+sgOl66zPJF6D2u
 Aj5HHhlfWOVBLbk4Qzx0kf6K6wQapRuMToTUs1LPFK6CCFY4WpE+OhBwkT6IjAaCYYA0HK53dVa
 YBAQ2xUc4U1Z6zcprzdq6tfXW3vC9UXcXyxWvWWwDDQxxyQMQC7A3ylkexvh+Ux/o5nEZzIY8y/
 KLJ9iq/E00O+qostFwB8Y92vN7kUhs8w2b/jzb8nv2HBvGDmjPy2DrZYLn2y+xOYbDS5o7/H0AX
 GfC40+A8D0cYphYaCCrIvUDxl0EIgpdsIrFTim0M3YOsowb+bsHGhtJWDHSAW1LKoWdbC8dt+zY
 iwN/cwVeaiPNtlBYyKw==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3b1f9d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jGktlri6GTd5LI-DgqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
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


