Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43673C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QWe-0004q9-DV; Wed, 23 Sep 2026 13:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWW-0004YV-7z
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWT-0001BO-Jo
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:47 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTdb84051264
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kRgYgQN0I68E441Z6FdMRIvgm0ZT03zmfUCw+g3PTWg=; b=JlLKVw0ElzDUVHJK
 Ni43HEFvUiXP2AWV7nFngcMz22cFMlCnfoc3+t0Cwia4Y9+WP8ij4NnrPRsf5WlQ
 d2fP/W9B95TUiZZm4kkY/mgZU0FXrw316l2h1GQ2uWh9GKrluD8Efb039ttAcQvR
 qlyXktrk17DqEQmKjS6IWJOD/vACBotomCV5U3TctWS9WtsvuM09ce+4fRkWGgpC
 2ObVsdFGIDUgsVd5No8Sc+lBFERhXKFM8x/g2kBYLaep+IvCfhqpghNlq9Jl+WOa
 a0PL2SbXfeqG+A4qIDdVhN+5zMmsM0CdKerhtZ0069dlQVaRdpHeCweCk9UTfvbi
 td8HwQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n36gb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7847917c402so995638137.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183553; x=1790788353; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kRgYgQN0I68E441Z6FdMRIvgm0ZT03zmfUCw+g3PTWg=;
 b=d6mDxwgaJeZOCENJsn+KJ0BsyBNyb0L21h+xIVq4OuoVzu/rYeQJneCGAmQAA/Vs8m
 jfT7JdgpG6K2N78mTcMKVOxC/MtjcTHsYO7vrFWvxoTsNn/IQyRHARrAfobRxFs9zMjF
 3LcP7hNQh1s8mzQ/40Jyk9KwAM89Zxz8wmy7iqgpo5iPQNPkJz0DIp3l7JL4MWbvZf4m
 RTcpmcjGtgEE6DJ3rox07badJkHG5Uc4ITyXjpvQCk+ajD3NJkhzSedbc8Nd8jDEmn/k
 aaBrUQg4zM6d9kYZ2yUJXoCP3tyhPSxCoV30geYQFC8Irgq1xxgDrwA2/CMX8U5QX0uT
 vmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183553; x=1790788353;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kRgYgQN0I68E441Z6FdMRIvgm0ZT03zmfUCw+g3PTWg=;
 b=mA18A9gv8qaZeEQ33nly+R7JrPFIp6kDBxwDLgDpqCYGu/CFlD9oLm/f94DGvAisEf
 V7tFHMxVoBE2Jn58sE1dhhNCmm+8CAkqb+jFBBB3v4//+ZCgo9VR4NIRNDoK5D3P9nSx
 3DpB3YRksYsR0j9GNgCqFzT1sCB5xcgK9LQzUSK8fM3QFMFVa5dUNILrMtoXAMHMl8DR
 7HGXMmqWefNtPrLMaBEZMYoMzHqx7UAoOD1Qf25iIATlF+ATIYf1LU1Nxs17xCuGKUNA
 ZbVnwfd/Pxrd4aSNFWvdQdoVR9mW+hEZ3nrjHhGaU0shOFQCDKlkhx5Aitv1wf4YS11O
 1+GQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByYFJRvqFWlS7mNYzFaBHlrKsdq/pHRtWQasfgei84oHsx8k99uNTn3j7upiw4N1Yv+tCyxBqY9gUi7@nongnu.org
X-Gm-Message-State: AFuF++nFCImX2ULQo4JTaI1pzs6lo6SlEex+WdW09NiVNGRUurJ6WhYq
 0p9/TXYRX2uedc04v1Um4fEj7OUs2okPLJd0gMNdQ23elyL1WKfslChawyBgcC45amYjBHXGxiW
 bHD1lGAaBxCXhNDFZ0eYG5HAtuRzmqVlypFkh5eLkdwe+FlgalTf5BuTdNw==
X-Gm-Gg: AYBFou2DqVVk/7u6FOFP5H154GcHlr1SXiX1YS0DVtJMTF3GGNNFOj/2HOPla4xWn1K
 BD+lgvLplQ26qHL1HkXlacXouWY5dFT4/o9YqwTzwLBb2gTz2mSRgWdYj01sy+FTiWe8GBU88G+
 yq02Jj7DpuBmvW1qebzqT5YFptVUihY+Ko/dCCzWZlDXzodIJm7G//rEWtY840oPydodt8omIy2
 ZY/5OAPlamCvR3q7+93vUxtafjSW/NkgnBwXdcJnFaPrqWs3jY08UF9TzNSTH43c62ywjfpDtTk
 zHBZpKU2tFClaz8Qtju9JUbmSgAbueuwMddxs9sbaPt82Ta3xADagu5qDYdW9dT6Db8cjdkVgct
 +rgx2Z/nwSy9OjSM1yQ3/QS4DqwVwTjlMQvpyin/x
X-Received: by 2002:a05:6102:6886:b0:7a1:f951:664c with SMTP id
 ada2fe7eead31-7ac1c78da3amr2579083137.19.1790183553499; 
 Wed, 23 Sep 2026 10:12:33 -0700 (PDT)
X-Received: by 2002:a05:6102:6886:b0:7a1:f951:664c with SMTP id
 ada2fe7eead31-7ac1c78da3amr2579062137.19.1790183553101; 
 Wed, 23 Sep 2026 10:12:33 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886848646dsm7548518f8f.10.2026.09.23.10.12.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 10/21] target/riscv: Skip empty MIP updates
Date: Wed, 23 Sep 2026 19:11:04 +0200
Message-ID: <20260923171116.31276-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXx5noDMqkBaii
 eDF18LpV6nhvZ66kpHfXeoGQNCaklLwm+WcrjolN4oKwY5xNIqven8cHvLiTsjmQoPOM2tB3LlM
 4sBiKkE6p5ihpUw3548EZzURLORFBoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXzfgdNU+MZQvN
 tSZmgX3iJKX/ta4A0gKkB+YJSbtWqGJzEROvy9BxNFU9z52GThbB7LPb4IG1HmkT7Tvi94okwTs
 NVPUdKKcXCA+9is0F6mFkVMWFGYNxB8VesvzKpyY56IdB8qFh01WcQKQNYaMH6sIrkuJsutSQul
 7rnzOe/q5gqW8RnoI+DodL+gk5ssUFmH26pDPRy/MTQCmA+VZm9vWOLk0wQ/b/J0A3kr2jAM8A1
 4+rODC5rzZWu/HSA8j5/9sunI0hv43O4toya6wtkyE/LJu5JK/1zyJ/iaALmsBL8QmXX3Ea5I6v
 9bmOn+0urQUCQVNyDmkA4rH1lffviIcMkEh+scn1VGlIfO0KhxDzORFrvkxzON0r5zssBdQtvry
 phERGaJgG32f1jK6ndRKghwSJ1P++80wESbw/o4CsZIEZIpqFkUQu70gw2OkTKAQpdfNf6urNPg
 IaNYzPqD0m/lHPP1qjg==
X-Proofpoint-ORIG-GUID: ifVy1jpRXjPjs--mKQub-PbUO9Ohc7zJ
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab40882 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EurB-bMe9Chw_IDMuCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ifVy1jpRXjPjs--mKQub-PbUO9Ohc7zJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Return early when the effective mask is zero. This avoids taking
the BQL and processing interrupts when riscv_cpu_update_mip()
cannot change env->mip.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/tcg/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d92226527..be64f9ee8f2 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -580,6 +580,9 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 
     /* No need to update mip for VSTIP */
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    if (!mask) {
+        return old;
+    }
 
     BQL_LOCK_GUARD();
 
-- 
2.53.0


