Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401CCC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:06:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiGw-0001FT-Ko; Fri, 03 Jul 2026 14:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiGt-0001EP-SW
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:05:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiGr-00023Y-08
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:05:51 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663Hjbf8532921
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MwoyJ3+n9gbZYNrn4kY1BYNWBjSGHcQWXOQ8WJCYYjM=; b=BjiETFJw7CQIxKeq
 nlFWanOu6WQkCijuM3lN8FpWkszKsf7eAZvsqLDPGVKLPrcQT1newlbCbMDMq9by
 3gR4CEKDt8uvmtcZuXsa+iT09OdlOdQMiMQbHlGmlb/fGklOswGS2T+pO6Q0zY9q
 Yk65Bb/dhWKbFBet3quKMi9NyPu91Aiw3fNj6cVczjd9l9sWUVpwjKcPgZwKqhNr
 evTSmQnrrhfCR/G2WWlAGjgfZYcAPRu9iYmIukF9oHBr+PONrLjqZGdSQ6MWI4lg
 tWRvTXLkm1VsbNDWnSO+SxTCuZLhVezVGz//qcVRnms5V5ECr8aDBCZR0JZ99G5q
 iPqxQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3gqv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:05:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8f08560ea44so8554826d6.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101947; x=1783706747; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MwoyJ3+n9gbZYNrn4kY1BYNWBjSGHcQWXOQ8WJCYYjM=;
 b=CpuhAhkudczIST/AhzVXHO6OvzqxJJCcUatKrRgMqXqm+sFODZP9+X4j6cm1PSRcW5
 4oO2kleXl+B6e8Vs5MOmFUA7vnmIJrNwmJq+8fbOEtlf4xmTkvzaj2T/MMXXbLJeFszU
 csh3xz6PscSdi11x9/91kHtMCteVOm0qAFLt/KV4yeLhQ1pdqasNKDBoNa4qQmRfAIJ0
 G06bsQPNb3VphHTdLKvL3EX4P0uGmjrJExU8vrTOCGiKWVOj0pjgNyz8e2CXzU1WgyTB
 1ebh/JF/LUNfVJ4Jejgwu6F1Vynq26Y2OnHlpuIWel/MoLlLfRoH2Wzlr4OaHoBUkjsc
 lHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101947; x=1783706747;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MwoyJ3+n9gbZYNrn4kY1BYNWBjSGHcQWXOQ8WJCYYjM=;
 b=k4AHk6eREA6FBm51b12gWjFoQXpPC+WPd0VvTPc5eQK5eKljbjyJcvxi3Ouu+CSGrw
 EheqQMbVFMZphz/GDOS6Dfau/OutxIMaV9gdz7K12uPqmtbqjx2RhtCeKE5EhmFE9h7H
 xRwWcf5Wy61hZL63MKC77WGhMKHoUXdqARsQt8/0qUu8xiWzLKj6GCAECG7yekrwEohP
 sh2Jcjnu7og3geoGAkyvDeWDVYiXlFt6/764ciERsoX4KZ0prLRXAHV3btPHxy5u/lYN
 Mr6p1h9NMr3lnHsdTv9Uwk1pC54Fvg8C1PN7AIoBHRyCl7fDxYLfvc0yMWO4Xjq/+NTE
 Kg/Q==
X-Gm-Message-State: AOJu0YydyVFtgUC9wd0W++ji0StPPwD75fvZxjJpk7QfpwlUcvRD3ICT
 GxuU/pjorCWbiEmtiRAzPanJ/pY483C3n/1nz54V/ICDQ6nkdAQpVuTBg5aScIF3n/3Reg3BiO0
 +qQJKKZDwuXPihKI5o/y186Xn3Iy1RgeQUJxzLJGme1UpGT4d9UW4sIpNww==
X-Gm-Gg: AfdE7ckcNFgSdGj1/E9MGgBdiT/CXK6lTndowgJfUwOmI15uKZMvLGLh8q4BlmOjzZ8
 WAOXsUIbZvDIEVzRIqrYsEMTueCSetP6QChoPJV99JaXGFzWNdxi7P+dfTe7dZIPlWieeF1R+aE
 ya2T7NuLA90FQGBKkHBlgLDnSKNqEzLnyY4GSS4kzDWx63Bglpd9+rM/OBCzuWk4M2kplgpMBti
 hjIAb6C7d0jaZcXTQVpDa7fw7VJCR6H0+znLescs6gli+aR2boVy8BbJZ3IgrQoY8oHko1sZWQ0
 MBDCKEPUk3T3iLrl1QcE5FjaPtWMtg05DipgQHysBINptP+8c6uiC9LmCUgy3RqyZSX3FKTjhpx
 ogAbO6rqAKaS8xdDdssnO+MZyQmJhOLDvw6+Sob2rUqrY3Q==
X-Received: by 2002:a05:622a:40c7:b0:51a:8c9b:6496 with SMTP id
 d75a77b69052e-51c4c3851acmr8126811cf.58.1783101946420; 
 Fri, 03 Jul 2026 11:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:40c7:b0:51a:8c9b:6496 with SMTP id
 d75a77b69052e-51c4c3851acmr8126151cf.58.1783101945966; 
 Fri, 03 Jul 2026 11:05:45 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:05:45 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Zephyr Li <fritchleybohrer@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 01/24] target/riscv: Remove unused tcg/tcg.h include
Date: Fri,  3 Jul 2026 15:05:13 -0300
Message-ID: <20260703180538.3346781-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX/VE1F0cHF05W
 9AILTQKVztEyU99/v3eEMKReS8VolAsapQGamA8YrC/l/F1dkwvO/nJ9G7R4sJk5qMICCktn7Nm
 Rl9nTvRLa9X/8HwfyzDEaYsf7kZBayE=
X-Proofpoint-ORIG-GUID: C5q31Zg47M8E3-ICWDw8u7Zav2Zp_bM9
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47f9fb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=beEPI9FAKrdLFu6WGxcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: C5q31Zg47M8E3-ICWDw8u7Zav2Zp_bM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX9avyr7Qxgzzl
 qmc1V/F/6IYRrgYJhSJRRKfbHQhxMzm/Ce85p/2rwySlmEWSWdhaXgm2PMyKQwHHX3SE4ccBP5l
 U7WHbTlhuqDdy1AtH42tyIybCWi0xN4w71ss66SN0X3fzsIfY6nzvZGN6aWjBSc0GEBU/PuJXkU
 /azFjNSYA/aCegZbzNx3FAApZfUpZN0xml2ceiZuUVX4B8cV0EaF0PiDFmsfILbmWlTDVxEUzxl
 PKdQXfoyvoZJ/Yf9GFqHUz0DZZfNVCETGhLpjjh65QJJbnQ42EhoQYdLpSQZBg8RuWt1AOBSTQJ
 QCNrWO9QJyjCYtlWrQsz4PmYVPBrMYYHZy89/cS8EDT4YUaWogzuCmvxIP7fSt3cglPcttUKAPO
 K03oLCx17A2pWfq8TPd1acHprIjFQG9o/8Min9ZVrpSDiGsYP2WFeLMPzZmUtvXDrWyNEyE/Spj
 eJJ9va0eOBCvIudY8VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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

From: Zephyr Li <fritchleybohrer@gmail.com>

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4d2eb281bf..7664e686fa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,7 +38,6 @@
 #include "system/tcg.h"
 #include "kvm/kvm_riscv.h"
 #include "tcg/tcg-cpu.h"
-#include "tcg/tcg.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "target/riscv/debug.h"
 #endif
-- 
2.43.0


