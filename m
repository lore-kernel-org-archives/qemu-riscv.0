Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED98C9830E
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QWn-0005KD-Vm; Wed, 23 Sep 2026 13:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWl-0005Ak-2t
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWi-0001DK-PW
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:02 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGU6Jn3281127
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IeLVm5/+AbWfhQYlNgRIjGIoDIVppu1o783xUoR+s+A=; b=Av6laJltTdL/EMLE
 iTVMtsWtI/PWMZnlA9r2vRbBaHC8TR+yoKjcPz/xnGOEsHt94p+EtoF0QAyo1bhh
 2NqZstN0xsTGEVACBsNvsseVAO17NuOlJi6G62Rbn/qg9ILOCD14sqY+UiFy0WWO
 cBrYZkFNGxOhyKr2WP8T1dTyX3Nne/mYPl2TQmrhp3DyR0VdPB8iAGHsZ2rtvyIg
 2Do3x/qPwMs9G7+DVxYwMawury/u68Kt4sM7roZiSh1mojfKl0kfnqZCAKDV1cAl
 uxbgAtnAkTTgqQPxvp4hyhfKegHlTjUdFqpkJoUPkfD3WRoQXxbwYjsuH+qway6E
 UmEzAA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqjub5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97e99615e0dso62375241.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183568; x=1790788368; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IeLVm5/+AbWfhQYlNgRIjGIoDIVppu1o783xUoR+s+A=;
 b=JsPekU0DZhXuLZfM3+wUgqr4YWRXcj2TsbU2wVHdmsYKqoqbjV+tyxg4+p2YXqBhYK
 Jqoji0ZxXNQ36jEKxM4MIZrS6+CibmRP6adXykvjrFiJ3Dh9pPAW0374EeidkT6B9pQf
 aJjj9+Pli9OL6q1AyV3qaPLYOezZfpIh+2nUpCSfAdGxdt8BofMYBO6Ogp7nJhBnTwyp
 oWEqg/hP9NhtgqqBVdOBAJOWaa1PzQ8K1IMHwohRJjEtK07W9ej+pzFwo0COHhDedVh0
 ci3r6SB0xNtitk0q6qjrhe67cvbZRshhr8VkZC9xhZ5uijemgnZZftk9XH1v/CB4x739
 +AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183568; x=1790788368;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IeLVm5/+AbWfhQYlNgRIjGIoDIVppu1o783xUoR+s+A=;
 b=q09GMw1jFzXtUy+4RYZ2dJlRiLijPXtZznBFLyy6anPgUSh9OuCZhJfAVdoO324oNk
 EUYBIl9xf4wC8MwUXjhl6LOg+M2UStU7GlJbnr+Qf38GQrZC/X/zX3gkWJS8HzIkB6fe
 l49hrsdND0Ch3oV50fOXkzInr5LNHs5kNRu0HCG5NZFw4oMLTr9lIdODb7utJUSCTzln
 LXRVVMK2TQzZ6xXbc+AvxC+OMyHppOr/XrIg/9HeDpvGGt95d3KAue8sxgn7YST5U4Yy
 k28tk+YY4NfPKicOKl5Fh5WNG3nCyg0+8yfe+otp804raUcbMPVfg7CnCUiJDru49WXs
 1xCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFXvIawxyQd6jLJnZI4M1VeH3ZHNgpP0ylA7NqsKe+vRUNrr1aMBWU8iiIy69Iamodi5wL3cyOxVE9@nongnu.org
X-Gm-Message-State: AFuF++m5cVwCgLVVCr7doxcmuvY9Cmcja937QXHu2RGpQz/NuMUPuvL7
 DUnJVpcDjQE4fSAprCL+dARs0efSbDbADJU3l9O8YLtHTOlLXjL7nP9HvLMtm3BA+SJHi8AJaRZ
 +eMZ9yqN9T/JqnVjX2a2ob1NgSEfJ+BpSf17DQycMn129RZflRtH5WVPKPQ==
X-Gm-Gg: AYBFou0J4nsGFDwGu7GCWfk3cP/Hf5CkatnRhcpvCJcr8H2dWmxw8NduXOd2x3wO2ms
 CCZXkCOsxagZFbXDvMBzygSJ7XWeql/6Zv9NeWzuwHzXDCiSiydqvC1Zdn0EnrfK3c4Zi8Qahn5
 XALOw39BE1YqzRPDyiLNI/M+KdeWhaOsMUnQajh9r4wFEN/JKmKvnz81NWEojMxwmtwjgCKyzOO
 uq8sJJFVekUhk2V2ZyjrCG99vkTnDswChyX6r0DPXHKD45AfgGqDxKWO6XoQi8pYCwZP4o9lE1d
 Wb92/pX2ll1DZLtnz8at54WYBgoDKQQs5C1HU3k6EOsqBj9yhjXzqOnjLULEdgsIO49aBcVBIsM
 F+hVXOm6V4asP38CxDFAvYU8/UqFseMW37eWIgCjA
X-Received: by 2002:a67:ef8e:0:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7aad0a9c60dmr4313407137.18.1790183568425; 
 Wed, 23 Sep 2026 10:12:48 -0700 (PDT)
X-Received: by 2002:a67:ef8e:0:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7aad0a9c60dmr4313381137.18.1790183567911; 
 Wed, 23 Sep 2026 10:12:47 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5bae53dsm875175e9.4.2026.09.23.10.12.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:47 -0700 (PDT)
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
Subject: [PATCH v3 12/21] target/riscv: Access MIP atomically
Date: Wed, 23 Sep 2026 19:11:06 +0200
Message-ID: <20260923171116.31276-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SG3f_Lk0P4Ys0DdDyeRQY1eAp5U0vcSw
X-Proofpoint-ORIG-GUID: SG3f_Lk0P4Ys0DdDyeRQY1eAp5U0vcSw
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab40891 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=-7qWTPA4ftCRTD5zRq0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX94pECsB8xnS/
 PBgPAVtS008JrBFUGOd48CQljpxquANzXzTt2RzpRkku/2Jt45scKQQT9RjKiLzGA3dbOIla1zK
 ZP35XmiZvrAaq0TjoqyJcnX+vSlJpZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX+2O1a7PoAFPP
 blOo+joi6uawi1pZhZAQE5xwUxR6yLxS/5sreAUPgTpxiPS4aLUPEJbQFJkzBbCrj60OpdpQUEh
 I+ohPW0p2q0dEM6io2e+Jn45d7+YG0sU7kYFimFEGqXxiBYy+2FHQXs0I9okdLXldquJ+dtu1kS
 ZyvZ8hZ3qWth8F+0lNf0dkMZhxhRXpUQBON8YhGmgzcqrB9bNbXDbOxubRcSFsK1rT8HnfoHiVm
 wWm/HR5cjZhPfVnm5XzpGd+SBXxg5V1ijsaJZAksgloon8Mr3bZsVAaQwWt5iPkRg8ldnzGuM9G
 np4V4S3StzBMWsUs5ZcHBj1MlhaiwuOpedtQXo0mAVfWeNYCNr8RjtZwzPsc/F1MfCM6HX2saS9
 uJ/v6qGakTd/0NRqKCDRMy/rllssBtrVv77QRi7I/WsLOEReO4rji2DZNuElR5125trfIAyphqI
 5w1XfFbpsE+SdMPN6zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
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

Use qatomic_read() in riscv_cpu_get_mip() and qatomic_set()
when updating env->mip. This makes MIP accesses safe for
riscv_cpu_has_work(), which may run without the BQL.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/tcg/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index e524798d312..2081875a206 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -528,7 +528,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 
 uint64_t riscv_cpu_get_mip(const CPURISCVState *env)
 {
-    return env->mip;
+    return qatomic_read(&env->mip);
 }
 
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
@@ -592,7 +592,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 
     BQL_LOCK_GUARD();
 
-    env->mip = (old & ~mask) | (value & mask);
+    qatomic_set(&env->mip, (old & ~mask) | (value & mask));
 
     riscv_cpu_interrupt(env);
 
-- 
2.53.0


