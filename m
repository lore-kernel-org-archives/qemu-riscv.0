Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49EEC9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:18:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Qau-0002KP-Av; Wed, 23 Sep 2026 13:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXY-0006VG-Ii
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXW-0001Lm-5f
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:51 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTrrf596174
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=; b=puIIDaR63fI+3uYW
 4W041okidglmLhaedEalM+0c9Abq2Ulva1r/iFZAIWYWMynbEo6wGxrhMRQR6osd
 T7avsjHucBZcCIp4PMifaa3wwBWPZE1nFXq0uht2afJ5Nxis5kfw4q8MlredVs6o
 ZN0jKjpC/Ki7DJocls0cD+1tT35n/s1ogq2/bPR6QQIeEwkVLCo46ULFzlPTMGPj
 ncNNI0MZTORgw+SCKXdRbtfEmNt5xLEMbxAaDnioO9nMzXGRe9U5Y2zWXPVCt+rU
 Mmj1nHU2F0sV2cxskhO/qiJflsdCG7+NP4aFD0yHDHt2KfD0Du9lZSJDHmaraJfo
 x5E9oQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3ps-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:37 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-97cb2f3c6f7so283870241.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183616; x=1790788416; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=;
 b=d6sYHpVgNmlEeLNqX5jXHqbgusCAdWT3w27nRelHZMBfRUJIwvgBZ5y010HroZS2EO
 ZGq6GJmxvR5/vSzn27ZdHgf+PQkCJxCFSmwEDFx/Lee5dHz8rvo2ZPKkigG5RaF/HPjV
 l7udpy1hdtiloAz3sw3KWaZgT1xI+f+GlUI3BsaVeIQffC5Hi6UK7FyYSZABocKqC9Im
 TfbJxfUcL9tWsO4T2azCAk9dhbJ/CEzdgqIPNkkw0VUWu2yIHagy2YDKSuY9AdBRnO5e
 VU9CVRC/b4oT9Y5StAXe2ihDUP5mJc440E6gY6zdcEbiTe9UbYsq7E8+yWb1iuxnqT51
 wpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183616; x=1790788416;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/5gPZ0r9el1io2TJV/MmocNJREFtJ5CHkCI5Btb3anw=;
 b=i+o8bKjacrf+VUazWMI+4RTFlePuLL2NZzRSRjUsMy95DiHgVGDMmNioxJSm1rZqmn
 BugD53afw/SbNKZpWvHDYY5ohSOCGrX/TAyiHJEgKg+2Jvm59vo40qIyotugGVj1KdCb
 l0kg1AqYHxGFkVD1ZBQWkMXOEOXZMXt5Jy75orV5mP+wvA1noPo8v0ZWgntsE5lAieSs
 A6xCi+nw6WW0irJF1cvVYNrk++615a7HO51FS3IPPBZgr2ISYsEESNWdNeOQV7vhyUTA
 43/z003+wsh5g73rpExEJ7YIK+1Lt2UP4aemHyGf8UaHZRFM6lLIg/P0yauwPblSbw/4
 XMFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6HftUt9Y4h+mGhfnV3TCaQZq7+trFfeksQ6P8vnrlyBVUNUgTV+SFfVEv0pO8FuVt7o3JqX9CBK5K@nongnu.org
X-Gm-Message-State: AFuF++lEnStXas3kSqtTdl+FlCyk2I8VOVI7rD6eUHhLl+i5AwgQZocr
 r+lhh70unvJyaSYEeNZ41wLovI1yfZE6fuAkFFVq3G5kIZhJYzmsDX4kSMSo4hJFyw/MUQLxadc
 PmxZS0ERZ0Lzb27X6CXhZpQUAXcHNpVOkZTdlBtuUqF9aNFptc9ADEs6pcQ==
X-Gm-Gg: AYBFou3/Zpow3ClZJizQdnZFyZXACYX1XBW98rXaCOaue60K/rdNGZfVsYx/Qel5jsN
 WS0H6sm/Q8JgR4jjLjmQvnR8c9ad42zXgbW7NrwGjsbODO/vICDtesN89A+P12v6EK88SgUr6kt
 uHG9E530VCmes8XplzlqnZ+1TBrV4Eit1eCu9fW+8q2cCBP8ih+mi14J0QDjN5B6Yi+jJJiT2w0
 fA0CRhL74zwIz7g9QNTNBd4S6aCrmkqpvxv5cdACGvksmmw3IdJufiVrmKHrKMInTk4n+E0533Z
 gbPkkbVWRrOYfIeEw6hUpPRS4OtcdrA47ZJ740Gz1E4ewe/Hgawr5Frlm3W8lml1i/OJSmBgpM4
 K1aLrpqSDv5QYgOQIQjF+0skywQmwD++hlV/KIyll
X-Received: by 2002:a05:6102:8083:b0:798:8ca:3452 with SMTP id
 ada2fe7eead31-7ac1aad2aa1mr3022011137.1.1790183615261; 
 Wed, 23 Sep 2026 10:13:35 -0700 (PDT)
X-Received: by 2002:a05:6102:8083:b0:798:8ca:3452 with SMTP id
 ada2fe7eead31-7ac1aad2aa1mr3021994137.1.1790183614917; 
 Wed, 23 Sep 2026 10:13:34 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5de187asm317215e9.7.2026.09.23.10.13.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 18/21] target/i386: Split APIC polling from
 x86_cpu_exec_halt()
Date: Wed, 23 Sep 2026 19:11:12 +0200
Message-ID: <20260923171116.31276-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6BjC0ofeKCU94bT8MQon5fzYj1wrBd_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXz8+j26VlUk9I
 I627Fg30MqPrHfIMJYRXH/ujDI+qh/lzuqi+i1N00CN7c1TU5vq7hpkZZN8iH/uuDrFsIgwwpv5
 BoShwsTtH5kcjjDE0WyiOoqYQrrdtYkdWnITkNos9PDr1GpQCe8USnvR41Nm0xsBbgLFx3BvMdY
 lwVEjUwpx6beXrt9PDP+sJo20YK0wdoh892x9rocX59lxnA0X9MNPktImAGRd8kpj6X+pWes15z
 QHfY4eBoIC17QBpqR4MJZusn2/PgnD1nhX0fXRvKYHaNLJstmKYpm9xFckQwyt9EBXuwcVZ2JS+
 T6Qfsd2sgvON21yxWYeBpDw4sIslrGWH+urtZu7LkjgCj57PPe1XmfE5n7mZzqusZdWceeIKeCG
 nMZ52KEa4K6+OKxi3GrBmIEnmeUjZmkEw9c0DDEJHBlvcKEE0yulQB8xrgXpOHyfCZZ0K/ek+jz
 bj7Ku6gqSWSFLFojSdA==
X-Proofpoint-GUID: 6BjC0ofeKCU94bT8MQon5fzYj1wrBd_M
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab408c1 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=h7OMh5kjI76PbTVxvEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0qLBei7fcqBM
 udU0Yk5yfdY6c2iACJ2eyLwHLUyh5YmkwsYy2cn6U4u8h4EGfVd40vxJ5y81LEf3cKjLQOWd0Pz
 zqBWWsoMboz2LPA2wfuPOnHFt3euH4Q=
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

Move APIC polling into x86_cpu_poll_during_halt() while
keeping the remaining halt handling in x86_cpu_exec_halt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 +
 target/i386/tcg/system/seg_helper.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index f4b2ff740d5..58e8ca0bc1b 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -37,6 +37,7 @@
  */
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
+void x86_cpu_poll_during_halt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 8c7856be81e..9ce608a0bb7 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -128,10 +128,9 @@ void x86_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
+void x86_cpu_poll_during_halt(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
 
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_POLL)) {
         bql_lock();
@@ -139,6 +138,14 @@ bool x86_cpu_exec_halt(CPUState *cpu)
         cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
         bql_unlock();
     }
+}
+
+bool x86_cpu_exec_halt(CPUState *cpu)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+
+    x86_cpu_poll_during_halt(cpu);
 
     if (!cpu_has_work(cpu)) {
         return false;
-- 
2.53.0


