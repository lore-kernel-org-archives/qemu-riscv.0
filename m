Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B4C98311
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QYd-0008Ga-CK; Wed, 23 Sep 2026 13:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXO-0006Ic-8W
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXM-0001KM-I1
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:41 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTYtK595296
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l6Mgb7WSMEr3uGW/YJJ4fDEAGk+u6GelQD4cQHsXAfU=; b=f/UcJ4hef17o7Ihs
 dCb0N/0GNCEFQIvNfubVnDhE0AuPP3nceLIaIRUmnNDlKXcJ32PKasJGI5JulpdS
 F8pIJHerFwDy88dsVfJBlZrzw99siJMpKHZUFwFIrkNyirAX7EM1Q/WGIr/dNshp
 jxyW5lRASX9vuavAxq4uj+JFl7roeSotW1HSV9IzRGPoA7EvJDctCX8g1TF2GKGt
 gVUwPJE1/aX/x06s5XKUmrUl397OwmFl2SsZZXoT9XtpH1YyNFj5++rOHPws7da/
 hR/CMFOzcPv+6K+CouNK7oVmLyqQ+sXxArpMGXdKokUNMSLdpzT4zrc/utYX3n+z
 ZfNcBQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3n9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7a5ed2517b7so379264137.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183608; x=1790788408; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=l6Mgb7WSMEr3uGW/YJJ4fDEAGk+u6GelQD4cQHsXAfU=;
 b=JI0scpYtv3BhzjeqZwM4LjF4MeayDckZnkpiI85B/rqNYAdiSk/oLz3OR8+NE6brp+
 Xuyrekgx8Zd993UI4yh9xCPcGQMDij25vZAoO5XRXXou4nc4lnr8VHAEbSNdzkf1rZIA
 B5socl/UXk9FWKwh+4osHBYVdT9AqpVt5A1odIt1R/4rciPbIGfVjHJ6dmmq1HJthwcq
 ISKvOensuDseAPnPBEf6WvB8psiWIvhL0kQXiI8sMpg3Ra0hSxqXhgwRTtcw4pXbFYZ2
 c1cxJ9yrx6iFAbKWwBOzVNveLeHKnsk31OY6KugcWt8dZRUj2z5ovvSPJ3l/AkGaF8eG
 zcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183608; x=1790788408;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=l6Mgb7WSMEr3uGW/YJJ4fDEAGk+u6GelQD4cQHsXAfU=;
 b=vrnijIfENbu0Jm1tqCHDeD/w2oy2M2gnTHeh9sDu9Ngc4f9pw1ANFqiZsoYqwsagjc
 ZuQrrQa79Nou8dctd0CtZPPvdOvpT4Lk0SnPCIB9IAOYnBnS+T1/+d2vsWifn1Xw3cvs
 IlfB/U44nv6LqywmO4Haya9vmEDV5bwdvYJ0FL/xr+GJsQfDdgmLIOLKPgnZI5umSYmW
 peRFYiG23/Od9gvMhN334zBEj+eoYIZHCdvbAIMPMyn9c66eyTltkTqqbiuqXTO0bfSl
 JyJeNz9MAP/ez7sZcI+hVLrVlS61CdEZkiACHpSA9c9b1m+jMCOuXDGNJctPistWs2Ji
 dVkA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzc3+X2ojfnvfs0gv0k2hsOlJHjeBOiWhj4ietYEM04W9ST/rn6gl0NNXVq88Nhc0DH0BN8rFXVj7c8@nongnu.org
X-Gm-Message-State: AFuF++kmjxd0rhPSkAeoDFwE9pIyjrtWbRrOIOE0/mQtnU0H6S7ZGJNj
 i0QdecDgNKmwFzYy7J3CysojNXPJo+E8cNl/T4Nk4tb9Gx84fmy/Dcoy1LX8UXgypibaeJqvhUZ
 WU2k0fZOKnErUJI3A2uJC5fW1lIKo31Osyz8NqOaD2NaHG+Jl9lQL2gyCSg==
X-Gm-Gg: AYBFou3G6rNzwrjPnG6dBDdHQ5Y4qSelcO5Eyi8kGa5QMv1GHwL+suryUE7TO0hWh7L
 VNnoUimThZUZiJS/+Rn9RUWN4Pu9zeYh9poxNXdsy5wioRlbkk5yp427ObM0ayTqhDLqbwMECq+
 UOoCxZsYqTjT4dcOTb3mbZ4r1enyc3ywh9Gwo0J+d7ui2QbU6mbyxfMmMUaN2CxjyyV9jbo1fqO
 JfyUnFPWQprhikVMTlfW78u0sYL+czw36eIDxGoVVYrhIASqMs9Xk4uPx6ZusYs9Kehw0oxEm4O
 wabF70XYXRTAfTTbBHR+924pxLwGS/czatBhrYKWfe7mVlo6XTxg3cnxvHJlLjjIwa0pbqx4aDf
 JpDxWD2nxG+BaYOWVxMs8P3O7L+e0/9kCANTaWURL
X-Received: by 2002:a05:6102:512c:b0:7a9:1f19:2d40 with SMTP id
 ada2fe7eead31-7ac1e6594c7mr3146544137.32.1790183608025; 
 Wed, 23 Sep 2026 10:13:28 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:7a9:1f19:2d40 with SMTP id
 ada2fe7eead31-7ac1e6594c7mr3146521137.32.1790183607545; 
 Wed, 23 Sep 2026 10:13:27 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886876c119sm8895703f8f.15.2026.09.23.10.13.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 17/21] target/i386: Use an acquire load for
 interrupt_request
Date: Wed, 23 Sep 2026 19:11:11 +0200
Message-ID: <20260923171116.31276-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: buwCre7ADnqUuqTFDtNhDVnz-D_Yncbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX5H8B2PG37pL/
 jb9ugWKI0FrLbLCQRzGxrXfsVwDV3YiffY4GqFcL44/agHqkEZ4CSNZecmxZtUc0rOumLbTIdcF
 GHDkW9czIx6qCpfWzGMeGRZyzSGzcED+dKrWj1tCbLLnf5VxEcm91RKF3Cye0ON4YenQLgfCJNY
 yDATaJVLMr1xevQJV48/uSQm02CVly7WyebZbHFIvV27f2MUgiQBgi/HmV3OCe5hRhKGv3rnb9G
 9Teuy0yFC25CVor9PU9+vA/nrHReF6yeFI+bEuWvW0mPQokUD0Pc6ojNGqeHm1ceRJaRO405+Ce
 nD1ZlsntLFHoSqtVbZkItxASRye8UzQYKwzg0KpTgNRpwiOnyCuhgAGyLIGiEouT0cuYQN9M55m
 Vl2xH8O0FcAr8BlWEKeMJbgN5dHYlheMypYBlfQYkJUhm6czvIaftJhWsuENZCyWsPlaFc8e0+T
 ZoUCuvAhcInV/Y8qaeQ==
X-Proofpoint-GUID: buwCre7ADnqUuqTFDtNhDVnz-D_Yncbd
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab408b9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=8gObA4T9cFbzhFTk6d4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX+hzVpuiheCDx
 GY8RueGUeqYnzJ5Z5RFfq04cmHAiLgj/bi1AmWFgZVxpbN8gX7K3SOSfbE0JAUxncpjbZL//u4N
 BCSq8P4f3MLDt3XTFUUvhwbMBX3hwtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

x86_cpu_has_work() may run without the BQL, but currently reads
CPUState::interrupt_request directly. Other threads update this
field with qatomic_or() in cpu_set_interrupt(), so the direct
read races with an atomic access.

Load the interrupt request with qatomic_load_acquire(), matching
cpu_test_interrupt(). This provides the acquire ordering required
before x86_cpu_pending_interrupt() inspects the CPU state.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b97f144aea5..ee1aa3a5a70 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10640,7 +10640,10 @@ int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 
 static bool x86_cpu_has_work(CPUState *cs)
 {
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+    uint32_t pending_interrupts;
+
+    pending_interrupts = qatomic_load_acquire(&cs->interrupt_request);
+    return x86_cpu_pending_interrupt(cs, pending_interrupts) != 0;
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.53.0


