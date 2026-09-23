Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C8BC9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:14:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QVv-0003ja-AL; Wed, 23 Sep 2026 13:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVk-0003Xt-FV
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVi-00015O-W7
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:00 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGU81k064470
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NsAGRdq+9vptvPtJkbZuTIe/H9s+dn5Lcf3IVJFeHdY=; b=LgEORBPwh729Uug4
 6YleYsrEZ3iYuhpUzOS7iGcHLk8nrtr8qe2YuKlBeul0HlafiwHccFORvCTEcw2j
 uy+v7oT5XxL+8hoZDvOP/4KNz0LB26mogPO4IH7Rvvivq15bX+SA3xBwGdhcwApr
 GmTaG68CNUkdRuHm+GJoEGy0F211KgT69CePWgwrpBbZvZ0vBkEH3D0dHv6K+yPy
 xeOgRr1EJSZzvOKi4gq/HsZViexaPisK+s96OOarvhFDPpGkWHc32FOdwq3Y0M7d
 eRuMdTDmV35yYT5irAPlKc2L/aDLsTD+UUiSvkJ28sAJM75swwx8vhRguCcj/wcI
 pbXVGA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbh11u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-980c3b71002so936795241.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183517; x=1790788317; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NsAGRdq+9vptvPtJkbZuTIe/H9s+dn5Lcf3IVJFeHdY=;
 b=M0hc+/9Sr64GmyB2T7v9vpFgIWrrHHPAHOoJl4NF7ETHYjftTWgte49ZS/qpRmyxn3
 NDqs1pzTazckciJ7ulVswzlFig+ceRxSh/gHsY11HPVrZrUB/c/rJEtF1MJ+BjHjC+D8
 GCenNHmy3XrOGe9ZndDLNZ4Z+oKlyDyFFA/42vvjkm16Iy3g9yFb5fq8jeKHy5xGQBQb
 MrVwGqyMh2Dxg2YmweaJwkw3DMfKn6JH5SZlWRy/3w+ED7Ew0WDUHVX/E5pahW3mdpGX
 oUfOlK4NlA917lmakVlmW5I2DiQVBqIx2i1f9IsQ5Zodz6W6Qj5d1MNh8NATXVyC1sM5
 jq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183517; x=1790788317;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NsAGRdq+9vptvPtJkbZuTIe/H9s+dn5Lcf3IVJFeHdY=;
 b=z8PSp0I23vlAYqxP15h8VQs3xwqJNKckLLW7tVGb4YSszqUMhmWJSRuke3ni0yZjmf
 EHfLNNUBJtBZwl3Z6ddCrBqs2LiWLBFYVzR7OMLFbidNz+HampzmDK9e3ETe6N22qMAK
 rnwY6O4XrFe+5bHgmPd3wdtxKNygwKkCr9Vo6bNQwPzvfpYF33FCpC6GTj5xyh6hpy3y
 w0xEKJcXPe2yVCZd4QR5myu4PSm6oDSfUgG83adR7ynM/yHNBNKvp2hpFfrogkEyNDOP
 RkzqPD/H49m2AxgWMvkLChCSYVR3T1KM++QqDTyjKunm8Xwn3EYQG4VXTXjnBp6cvAOO
 6Hew==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlRvMl1Frz+u6pLdTE96sH9xdr/hSBBMI+jINguzCf0Lm61egM+vX9G0b3O1CiUUMXnEfxFLO0bij/@nongnu.org
X-Gm-Message-State: AFuF++mLLtVBeC5LuGx1yXpGu1Jz+bjx/K7so+GyyAo6zbcEl5azY+Hj
 RanRUeoYTvkbqKeW0Qb7wsNRmMq1kKaaz4JnhP04trqx3F/gUFYnWEttFYIjDAI7XnnG8ZjWfdc
 HOWpBgx1QsEwVPG2iIC/C4CcKewdA+8+4LjEDzkeiHFR/mMd0f0aO0YH6Nw==
X-Gm-Gg: AYBFou3QX8Yx+RaiFZ8ymqzuebLnswf4YzqOmLfyv1NsgUE587llpbmWhuD+tXWmoyk
 0N4vRNRMur9UwsA12AU89uVC7rMqNwzXAd3Now1wwUXtLjTBwbsUvp64uIBZbpoYR0k35/KJDos
 nq0V1OXLYCYbhK3gaOEKuHwvk1KD8muK1HEVrZfLDmQW7dhumRuUkfumAXlnhq0qNNO9PK/eoWb
 0A4z0FxsI774p0vBa0hXktYNIi4hv+4sJaRHiZX06+i+UNuRzm/gsIl3omCw/EqO3hKEaXcg12c
 GbdCc75DbOW/mHG7rEHiRUSuWF2mXmc4Sc5plU3tJ+MOt+kjAPCEUsKo0Z2J2XS9p+IQ6UiYGz4
 ZSn1f4pcgqrLbUYURQyzRlxnKmUuCtfQlYAkleYGY
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr3177277137.9.1790183517170; 
 Wed, 23 Sep 2026 10:11:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr3177255137.9.1790183516625; 
 Wed, 23 Sep 2026 10:11:56 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdf158147sm66316385e9.0.2026.09.23.10.11.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH v3 05/21] target/s390x: Access S390CpuState atomically
Date: Wed, 23 Sep 2026 19:10:59 +0200
Message-ID: <20260923171116.31276-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX1G5hze3gMO9z
 D86OiumDd3bScSndKVO+UyAEDWqpkHGlRiCdISmjs5H1KrHx2iHXysrVnOPymMtxg3c+KUoaryZ
 yyZypM05KQhuEXZaAJgLju+GGUqCQqM=
X-Proofpoint-GUID: Wx40A_roHE-eO7nA_KNXzJDzziwnHA0z
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4085d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=jkZ4ftcXAbePN3d4lLkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX2eIC+f0H91Jr
 9dGVOswPLSfBTZKufqGEtAfwyPHzoLOdEBuEAbitHCrhe8vmx/o9ZyipN37UY3rfkXw761gIn28
 Mwo++YX5qkNaW5FEVPSMWiT/Vctj8o/COih5Rh/6fJMVzf9WPZcnNL8zpV0hnIytjf0gDsr5X9w
 GMpdpqtnMZWwWGroxNz4iQ974gv42rW6ZliLnNga81hsioUHT8CilsBkWGr52GlxRdToWe5lpJV
 PgvNqjMRSutvs9q5woovdKW3fefLd88KMrQEj9EzO82JxJ4tDRmd9/+g/xpo1y9Ecmd3Y9B52W5
 L0SgmUqyYx7kcuYbmzZW5gouha/xF+fqlP9gyNUUYS8aclPV6qbq2UN5Ps9C36jIP0UMT7SHSJw
 4fI8Sw10sIH+HBv4N1jFfyG0o/L/eRs9dy145txdZHj2ePXW7LmSrInjiXuEKBD83gROxRFuAJV
 liEIP3DUfB/Y/ho0bfQ==
X-Proofpoint-ORIG-GUID: Wx40A_roHE-eO7nA_KNXzJDzziwnHA0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
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

Use qatomic_read/set() in the S390 CPU state accessors.
This avoids non-atomic reads in s390_cpu_has_work().

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu.h        | 2 +-
 target/s390x/cpu-system.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index bf9f6ed1de2..ef73b15218e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -855,7 +855,7 @@ static inline void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu)
 #endif /* CONFIG_USER_ONLY */
 static inline S390CpuState s390_cpu_get_state(const S390CPU *cpu)
 {
-    return cpu->env.cpu_state;
+    return qatomic_read(&cpu->env.cpu_state);
 }
 
 
diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index fffac09f241..d38de4fea2b 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -272,7 +272,7 @@ void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu)
     if (kvm_enabled() && s390_cpu_get_state(cpu) != cpu_state) {
         kvm_s390_set_cpu_state(cpu, cpu_state);
     }
-    cpu->env.cpu_state = cpu_state;
+    qatomic_set(&cpu->env.cpu_state, cpu_state);
 }
 
 void s390_cmma_reset(void)
-- 
2.53.0


