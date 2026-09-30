Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37D2CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:46:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByNc-0006mV-Qo; Wed, 30 Sep 2026 13:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNb-0006lI-5i
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:46:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNZ-00017o-HJ
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:46:06 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHf9nP1110250
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NKFkuHP5kHsFlr48mIqBrzrwJma0vgwROjVU+AFRLRs=; b=W1A3obzCX5JBKYEW
 0eK8ADbLdVLvZKN18kOqHfVfO+T4wqG5qkAv37xm9gE7/t5bYG/yhJT9vVRxsSwx
 UOrLoUhTdG9l4S9vOAkSNdp9fdDkviO/2pUDFVOIEnt4skMcCN+6pfFBoOo0Fq48
 LKNN7w6P2gOHy0vN8Sf/Fy6kbuYVddA2bGBegTqzosi5Mss6IDCCczREcK6YJqXX
 KsaSfIrTui4EMh969KCSydRVk0W5zKxGd3slLdMFXnyb7leCWo82Gmp2Znxj/7a7
 ByTYNzlHvhlDHiiqom3TQi7xgPXDvKJ8uPH4FUCqbInwEzlVLZIkgzeYj/BhCNq+
 wyYrUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh829fp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:46:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a082c014aso8046385a.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790363; x=1791395163; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NKFkuHP5kHsFlr48mIqBrzrwJma0vgwROjVU+AFRLRs=;
 b=Tl+WEOLBbup4wTWjkq2iKjCqb7VmVuCkUn5d0GWgPfmn4ICcU5xuZ6hVWl2noNNKGb
 GZlVRM9sMblj60zZtQf8OY8UIqW6VdIkhCEXJ7Q+DT/paxXX+00P1leD/2WwPEbpleHQ
 obY8HvvIfaQc/7PSk0eIG78NuAWvQNOx46s0GP5KmPS5g6xck+mGCfYqFpb//FdwHkRK
 yzXmrv5XnbySlLEByfT4MX/Rt5B0XDiN7800riT/mEBzp0DAKsKU4AuPVk1ShyzD4iZ1
 eo0aK2rlGxaVJjy7QgZI5SiAtEcT5tqyjTZa7Zcx36iK/XPNfLsAo6gBjO4KK1Wgk0O/
 Zcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790363; x=1791395163;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NKFkuHP5kHsFlr48mIqBrzrwJma0vgwROjVU+AFRLRs=;
 b=zFpgHSY2NT8qx/5Ak4ua9QYPD3FyplE0hIqQOuAmQKdXzeFxKkiCJ7Cve2R8IZ4yA8
 Q7QS1XcHN3/py4q0j/6HPOVzzqzgOG2HmA3qUlkO2wJnLCsH1vmhJF6JxcDrwMcYVPxy
 7zrFL3YOamaJU0ZnBGWN7ucrI+93bXpApETO009Lr85uBqk3MeNIeCyLYb//xyu04ADt
 Dr2xpaYbwQyn6DTfq7zmeK2zM4xoWcprCTm220LWeu0lkLIpszYh/lSPRMhp1bIOVj0j
 n+/SCid7EFq84o/hBmZUaapfW/BdV3fh55i1beWXZt9fHZt3MmztAvjLcXLNxgGJq6Ch
 sjNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpuYWKwNZZBrNzRKNDiEveSX9OHaQRPt/M/42DqOnJgSI/JXUBAsqOjnURVPNFj4zWgHNgWpbUu6DE@nongnu.org
X-Gm-Message-State: AFuF++kHTn5ojTsQqdRgsc2WawfNbwrkSzxEcjhcWrJr3pcKOvUmp7gq
 kh5LFyDJ5scEBghbmTn8DN9uYlBkuWYe0/punDrb7au434AGUv5SxcDZgtl6piK4GFCLkNl++44
 xoj1wjR7JBCSFcTN1wjMkIAhdFkdT5aSrbXHQVzRLQ/kxX5Fw89jHIa+Crw==
X-Gm-Gg: AYBFou2c1WmM2ucwYvwAgNYd21Epzdpwt7yoVGZod9OkqS7R74Z2BGCIEQMQrLVkfQL
 3OXpqyKk+jcxidjVqHm0wb3m1fi0eaE2pS99vZmnvIcfpz5DiATg4S+xVPA4YC4uKzN9NicHMnR
 QQ6zsAzHS7UU2rs4U8UY/FfzXeHxjh1HCa2gXrsX8J/TcbMr8iaEWSIshsnOkLaOxqVBalMd5Vg
 gXaU+6QvmWhBVhbrGqRJocuvTq7kJV0qX8QEe9Fy1gGKVdhnbJPmPYKEJjBLg2m1Vbh3dxq84OS
 OEaVCwm/Ngu+GV8BguA2w7JlGCbFqahhU+HiMAQQQBkkswj1xjGifsuHHYaNHS13WToK76/TTXw
 +68JDMAJ1tXCpEk6dIFBFp9g5pPj5NvkTByv/iYF1
X-Received: by 2002:a05:620a:2942:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-93cb5a5c552mr74605685a.14.1790790361537; 
 Wed, 30 Sep 2026 10:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2942:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-93cb5a5c552mr74598785a.14.1790790360809; 
 Wed, 30 Sep 2026 10:46:00 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068bcb8fsm655488f8f.1.2026.09.30.10.45.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:46:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 7/7] target/riscv: Skip redundant MIP updates
Date: Wed, 30 Sep 2026 19:45:07 +0200
Message-ID: <20260930174508.81497-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174508.81497-1-philmd@oss.qualcomm.com>
References: <20260930174508.81497-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfXwxRk7GSX58QH
 MOUMwl6QrXgyiUuJj2UBMBB4batdT/hG2F3/X5t4mg5eultb404tFzJfCYOq3MKNIMxlESdpGa4
 X50OuWnymxtQ14EdXQOrsIDwbEEGcJ2WBm9/12X1RagywHAmvpgQmRhKYZfzg/ip899vQnLVhzW
 x9G/iZIXB+yK5mB3x3VmHSZ9RsPzuuF2Wz30OcNc6oWuBxoyqN73Y5vnrViqESeus/QORMr5gpc
 s9TpobliuOkRmZG9821ENnO4hnsbVZnmBEeouu9spdGC8q1lUZWMW7btdgEzxQspAM5XE3UV+iX
 DkhLpDyBSlTxnDAUGA8XWfn1E7TyC5xNtjazWCUghA5MMNSFRFuBz2qDgDv+kY7rYARSie7nASm
 AK8KEmlWkZnReonBSokDTz9selbH9BFITRM6tfxTTUD1vyAgdJSi3ER6cwfMnBY5sRGvb2CiF+H
 f1xgfXKvXBhV86mazkQ==
X-Proofpoint-ORIG-GUID: bPzq-FDwPIqMCuC4FAFiDNdlzd9vKKYK
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd4adc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wLUV87mrs9pMXVOQZCMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bPzq-FDwPIqMCuC4FAFiDNdlzd9vKKYK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX9oJOOoBbhPxO
 4kZXo1B8W6SArD+/ishRwBiueMB62Lux0nEVJ90P6mbVBgjoaIOuPhqHQgEHsR/ktdCu1J6Lauf
 Cflj1rZWvlWSUURiL0c0k9mKAVs3+nc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300070
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

riscv_cpu_update_mip() was called with a zero mask only to re-poll
interrupts after updating env->vstime_irq, where the VS timer keeps
VSTIP (see 14cb78bfaf4 "target/riscv: Don't clear mask in
riscv_cpu_update_mip() for VSTIP"). Move that re-poll to
riscv_accel_set_irq(), which now calls riscv_cpu_interrupt() directly
for the zero-mask case, and keep the early return for the no-op VSTIP
update.

No caller passes a zero mask anymore, so document @mask as non-zero
and assert it.

AI-used-for: code (prototype)
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h            |  2 +-
 target/riscv/tcg/cpu_helper.c |  6 +++++-
 target/riscv/time_helper.c    | 11 ++++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ad731bf5d34..6173360e407 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -694,7 +694,7 @@ uint64_t riscv_cpu_get_mip(const CPURISCVState *env);
 /**
  * riscv_cpu_update_mip:
  * @env: CPURISCVState
- * @mask: Mask of the MIP bits to update
+ * @mask: Mask of the MIP bits to update (must be non-zero)
  * @value: New values for the bits set in @mask.
  *         Use BOOL_TO_MASK() for boolean values.
  *
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index db7f2bd6de7..16b2c486934 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -579,8 +579,12 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 {
     uint64_t old;
 
+    assert(mask);
+
     /* No need to update mip for VSTIP */
-    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    if (mask == MIP_VSTIP && env->vstime_irq) {
+        return riscv_cpu_get_mip(env);
+    }
 
     BQL_LOCK_GUARD();
 
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 29bbebb96fc..6bd917383e3 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -39,7 +39,16 @@ static void riscv_accel_set_irq(RISCVCPU *cpu,
         uint64_t mask = irq_or_mask;
         uint64_t value = level_or_value;
 
-        riscv_cpu_update_mip(&cpu->env, mask, value);
+        if (!mask) {
+            /*
+             * The VS timer keeps VSTIP in env->vstime_irq rather than
+             * in mip, so callers pass a zero mask only to re-poll
+             * interrupts after updating it.
+             */
+            riscv_cpu_interrupt(&cpu->env);
+        } else {
+            riscv_cpu_update_mip(&cpu->env, mask, value);
+        }
     }
 }
 
-- 
2.55.0


