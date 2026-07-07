Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D153C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 12:29:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh4ud-0001GQ-K2; Tue, 07 Jul 2026 08:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wh4ub-0001G8-VZ
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 08:28:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1wh4uZ-00074f-Ae
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 08:28:29 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8fcX3755388
 for <qemu-riscv@nongnu.org>; Tue, 7 Jul 2026 12:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=x+eM7xyVn3Gaa3cXI4PRrw
 a8AFuCO71E6Az4+JzqQYo=; b=ZDWazmXEyPcu1S/FSIDIg5qi5kMwtx6LRZ3Q0C
 KJnBmy5M1MU+5c2MXd7EFXy2mI74oCD3rlNJR8+qKCB4eANh4MCeuzFvasr5nXGt
 S78t2N+E+sooPQC1m19hpDUDb5weExW5iCq4PHG72jsVFKZ+8hrr2f9f05A1ODWD
 iFiUQH92yO10OSs1B/ZG+S7/pB7AcyHnahJs7hft0ZfTvEEQ0249WpyZRRC4ElgX
 ReqyQ9VkUiEChDdxY+Kl2jpG6mGIiMxBYAR9BfTN9cAEJm7H+hgS+vM/mVEJwsVT
 SQrSAJWKA9E3kme+r13DRJwT+9L7YEPM5E7E9I/bKiu4NiOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep12p6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 12:28:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c110a3b6aso59059181cf.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783427303; x=1784032103; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=x+eM7xyVn3Gaa3cXI4PRrwa8AFuCO71E6Az4+JzqQYo=;
 b=hC6GsfiosScPr6uvxePqpTjsk4/WIcIVa+s7cAPNAqOuRpGGI2r5MSqCYJumtf4x9G
 9ra/cO4btw4UPyqre3Ketr/+wgaPXdVBIA4j4SbTw4kIJVFKtM22n+GhJnTDBcxrUzQq
 pDWvKG7+BGZZk2MuaWx4km7uqKAljj298FZ/YXiecbDwXsJxiH+tBKLhZH+Nh2ZF02MN
 J7ybbYGPSCZEm9aD/TrtyLwpoUimcMElZznxjBOovInWSqt2AwyZ77ztzj6IAy1lXOlD
 p3mHuOjUafVrF2dv456YnD5pdTPD/xIDAnZVHgduy2xxsNJ04Jxd28xZPGVoKB9hJQWB
 X6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783427303; x=1784032103;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x+eM7xyVn3Gaa3cXI4PRrwa8AFuCO71E6Az4+JzqQYo=;
 b=qeXVy4tAXFxGcQRGGi8Km4Y1xt+o9Wv+FK/4WFXs0T2c+HHWVJJqIQcA+P6rrjdQAT
 H3dy3e8xrAIaIQkFuLUtYuSoYnvz6hif1697/irvdYQuTszB5bV2jfKifaAs7dU+svQs
 WtitI5bwQUWl+o66M3FfpeBKkrN3liQ9UZ96Bs8SQpTBd1yMw62AI/PODXQAUtoU+94V
 F58HibJ2XJnRnRTMC6OeDpaw/Wc8qaKuTryW0PGmiGx24EunxI5B9GOo+UHkQJayASZS
 14U9Q+XI1jMtMVAL8/5lFTTqbQ2S4xpQMbHvplj6Hkltovv/GEdWgNaFXem1TKBtEV9P
 CiLA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpOtsGg6fwcoj8Bt3ktG6gMqKOUzG0Ba9uIT8b/Ehw1xjQUg58c/DXQLaiJKl/kAUPT8lUwM+VeQaT9@nongnu.org
X-Gm-Message-State: AOJu0YytV40yeWg/Lj9s956E60mooPMO+JV8ijsuwYQmSGOqDCUvHX8u
 b45lOnX+cpGh/5D4rkO8/37x3Mn60N5QmVQQ0obW5fBvI7AG7U1g8/swyhxxCl2VKbtuy3gLX8p
 RrHbDfYLAzQKYlH7Gnl1LvcQDjV4Vik9htILpIIq7i5ExdKHbYfpb7qaJZA==
X-Gm-Gg: AfdE7cmbMXfvxwomPatSdjmuBU6NhXcMG8jHeee1cYsCARc1lEaF6+8LRUxPgQGPKnl
 vEog9M5rGJg5UbrRgaXckk1zpxi69G1/ZcKgxy+o0kDoNW7aO3iQ5X0HeKyfgYKguLEouvA8cOm
 7YVcFrQtmY5bRWUNcYksFrpxdVtJ4U4TOYSe5/O1DjR9FFzbOAqKLC0TIWqfH/a+UrAVEEjXHlS
 do2LAxeMrrep9s/8WfRbpzBcmU8+F4ZeEFsP3kMyA0TfpkeTzuiK32NNKOAcl13fW4tD1uaWcW3
 TiSuN3KHpNiIgL32Bu9NkoW0qLE6sSTTZg/Hny4Yb738X29DOFoPnKdiNdJHKeYbBUixSvNmOdJ
 05B8mKghNgbLDlu096ki/O7bZIKfJdTiYi75Ba0e60LE/x/c=
X-Received: by 2002:a05:622a:1183:b0:51c:22c5:daf5 with SMTP id
 d75a77b69052e-51c7487fed2mr50746241cf.38.1783427302599; 
 Tue, 07 Jul 2026 05:28:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1183:b0:51c:22c5:daf5 with SMTP id
 d75a77b69052e-51c7487fed2mr50745961cf.38.1783427302055; 
 Tue, 07 Jul 2026 05:28:22 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41b281c9sm113321691cf.9.2026.07.07.05.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 05:28:21 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, daniel.barboza@oss.qualcomm.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] tcg/x86_64: declare MO_ATOM_WITHIN16 host atomicity support
Date: Tue,  7 Jul 2026 14:28:19 +0200
Message-ID: <20260707122819.114105-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eUajbadCg9Ji1NUlsdXlJXbhkfNQSs-i
X-Proofpoint-ORIG-GUID: eUajbadCg9Ji1NUlsdXlJXbhkfNQSs-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfX34Mp5PqxtGSw
 sC7A3Wl1+19nk6JR0gv0YdPcZ2+yTk32jSbfr/1hyRBYXNKNCdtvaLx+cBNToDeujQoo/nKcis+
 +AWd2bG/Ot8lN6Dw5IkAaUEI5kZ0sZc4OUNofuHcg9PgV9fcF62/HsK0gm0IuH+ku9Nw7tlkHIf
 k0ulZ9WkCoKLpCPyMZRxK6aXeHL2sb2ZCgIGTHucPaRMPup1uhuhSwnVpWgvKDO/wvLmsKu3qF2
 JXGaBHzgKYeU0hf+t8OZwfy73gC3hvEYhxs8Fl5E5KzY0Riod87PDjNHgnBFvmSCjShmtGP4tI4
 VS0I0FATMuZ//9GlQ5FCuhJ581TpWmmHwCqLMQnEt3sA9GkNNSySO2g9d/GEBNJpgDBgXBzCDDu
 ufiBNas1Yxgeg+cvLW2naUOsd4Yq8kF68/QndhoLErxHimFFFqEke6/yEdq3tQAIIhik1KWnfgP
 +KrnLzE7BG3nlPB15jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfXzoa7L5JeDLtP
 sAbVKGEgwPVwMnwtyEoliqlDLu9iPDk8xkKwxwHa/QcjQ4rqI35YqHHaDo/fhf9R8MiBV/Un4t6
 r8v91Z3qxVymAjv9p0guvA0A2jPbZUc=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cf0e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=KYt7obfHf2zODsdViWAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070120
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Just like aarch64's prepare_host_addr(), x86_64 should use
MO_ATOM_WITHIN16 for the memop when it's capable. Unlike aarch64,
which needs to check a CPU feature, x86 has been capable since P6
family processors and newer (see Intel SDM Vol. 3 §11.1.1).

Since a 16-byte aligned region always fits within a 16-byte multiple
sized cache line (x86_64 implementations always have cache lines of
at least 64 bytes), then this enables riscv cpu models with Zama16b
to use the fast path, just as cpu models without Zama16b do.

Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 tcg/x86_64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/x86_64/tcg-target.c.inc b/tcg/x86_64/tcg-target.c.inc
index 92251f832738..99b6559eed88 100644
--- a/tcg/x86_64/tcg-target.c.inc
+++ b/tcg/x86_64/tcg-target.c.inc
@@ -1934,7 +1934,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         *h = x86_guest_base;
     }
     h->base = addr;
-    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, s_bits == MO_128);
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_WITHIN16, s_bits == MO_128);
     a_mask = (1 << h->aa.align) - 1;
 
     if (tcg_use_softmmu) {
-- 
2.43.0


