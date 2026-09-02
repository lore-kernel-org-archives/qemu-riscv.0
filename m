Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66601C624D3
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:22:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1mmm-0003ab-Pz; Wed, 02 Sep 2026 11:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmj-0003VL-UC
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmi-0000KW-4z
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:57 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682CR7ed2252097
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 15:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UJpne1gOhrg51mvH9yKBs1FZAHlDg3KE1SVFoAMoBeM=; b=bdc7SC5tKL+xiyN8
 ZtlBXyVJhbDdVukHTeykLrwUIQ2OmlNMIEGOAtJ/hXtTxCEyl5KUHWS/nuyQzjyI
 nVEYURafEKu7ReSUCVmgATPNwQnZUavT5EDNuX0LIMa5p/ObtfYOf6cE5DQ7Pdj6
 4YNJbSTUnLIOBvZLnjIwHdTquMPcQvfXwGGdDfxqIepr2qnV7e9e1j2Qm9UMX4Sq
 SPIN7W6rJ6zHuRNJamSLDvZ/ugflAGLUMlbwEFo6dmDRxOiI8wmjd4T505aj0Elq
 VjFD7YI8CGMBQYcnkt+4redP74PlYbDpqsGxs+PB9flqVl2/2HeIVuqFC89T2odg
 bYAZRA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2nb2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 15:21:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-738627c7908so283236137.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362503; x=1788967303; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UJpne1gOhrg51mvH9yKBs1FZAHlDg3KE1SVFoAMoBeM=;
 b=CQFnYWZAr4wAQmGb2qm7p4gOtVP+WybXn7s5NPS/n7ghlKygskYQRmYO5/zPgQmIHy
 z3hAjnnU2wBHSjhZuuuLCVwqEJyLpnTFCUmnDcjH+9LL/uftEa/8rqG97nNOhodiU4zI
 p00iWS8haq8RmIZgyZImP/dzScDIfc4N7ZyaTnozpFZ7rI/2wsMn/xT+fk7ymndEik/S
 zVAa9uZvN67zw0+2LsxqWN0DNkpM1JxSZGBsiaUx/3fxsXvqY1Hq2O22rXja1uMFejPD
 pD4lQoBL/oVArk8MR776JRRM/lcAKOPPdpdX+/rYpUXlUcfBvdRFkvB7myJ1kP05HNVz
 8Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362503; x=1788967303;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UJpne1gOhrg51mvH9yKBs1FZAHlDg3KE1SVFoAMoBeM=;
 b=hxvO6leinkqdKD8tw/HROJWdJEs/uCrwOPi4wjZ6xvhZNS4ia0sqN/KB0MEL/GbKDv
 8C2hlCs5CHbor3AaQOsgfow8HBOXYrh0mEK9IiFq7+2IJUTjJbZUS9e43kNlJ8L5FrNW
 n71bZ6LNMUIIEnxKxgLXh8myPoaMuI2636u22OH7xSZsocF29F+K6c61cDCSKPHD/utK
 6I18W5kf67rrzQtaFy+jhz7goH9X6XUqjQTU6m4pw4pGM+h/6w7mXEvcZJfA6+g8zv1R
 /ps3KXw3NaIgGKF2xwRDSliaaCM6vw6e5W7lt1zcAZ4iNmSgvvfoxAamzSV/5hKK2lSw
 cDbA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKk4qejldLUgfpWD+/QgVU1QvaAv+FkUfncxAONC6FF0y0lQi37ogwsKoG9QAvtOSPvHTs62SCpCKS@nongnu.org
X-Gm-Message-State: AFuF++nX/Z3YBL2vVdBz/QOyHU4bD9QslH3P/vma0IB9rVy+o3OHJVwd
 i0dltG4f/HLXPMtdt8MWxOIjIpQVM75nlrVh4ugSs9nYg4/qI1LMB4ahoRO6LOF3PwiXm6/mvgF
 rxlXqzCB70cUu0mVGYy44RLmBWmD4w0Nw6eK8b58q4fWV6dWMxUBT2xDwkw==
X-Gm-Gg: AYBFou0YWngUMXgXQbkMVpCuGgvscNHmhgDiFUm+f8Uq5C3egESNSDuS5iUZz9MBi+o
 l9soJIeigP9YXj9ABCGLZf+zdHFQiYBlxfR42TGpmIEy967UuVgHT22JdaV810d/zQtF1iKeniA
 OMPVFKD5aRzkLZtZFZJMmPVmmJLqqC0pvSCcVTrA438yLJJcqR8IoBbvyGx1zzD+BuOZiJdoMca
 Yi7eIqks6okzIocUTPrNJaJctHVw8mAfSVcZrywIvt+HRqV/3hFx8YGS1AWdK9ccbQzEczik8z+
 R9hUTj1eWgZD4TjGeWEiF+RS7zXLKeRLQzli3d/DY/3jkpTjdJ4Cmkp+X0HX+1Md5CJ1OM7ssBj
 2bdAY7cbyK0V8A5qRIExQZ1i73jARhTOI/Ulq+/Ql
X-Received: by 2002:a05:6102:524a:b0:77c:dbae:f9d2 with SMTP id
 ada2fe7eead31-78a1f2df7a6mr1579427137.9.1788362503322; 
 Wed, 02 Sep 2026 08:21:43 -0700 (PDT)
X-Received: by 2002:a05:6102:524a:b0:77c:dbae:f9d2 with SMTP id
 ada2fe7eead31-78a1f2df7a6mr1579397137.9.1788362502696; 
 Wed, 02 Sep 2026 08:21:42 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce47885b1sm76527705e9.14.2026.09.02.08.21.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:21:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 07/11] accel/tcg: Add do_interrupt() wrapper for targets to
 manage BQL
Date: Wed,  2 Sep 2026 17:20:38 +0200
Message-ID: <20260902152044.31291-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CIv5CPQQBbOQ85DDIHqrwryISichUr-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX11eLIhU0hlWY
 JoXqHDfz+wYKXylqDvN/DRE3EZw0yWsbh6g2pfMxLMHvNC4wIEpKtF0nOWxsCyVTjmawieZt49w
 w97foOeiXjyz9BrbNLigELLAelBoiWh4YUbyNgQHaQTmNRAUd7MfKaZDCSr21168yZBw+JHYfo+
 WXZZgu4yqd4ni+ZghpzCc1Mjj8zzC7pAURjeKUJgez+swqr+oV1uB03EnRdMDYE04e6MHAdtawj
 G2P+vcCEqGZONclQegQXtRqHYZXjpDTKXoJFnTzc4yYTQZdov5PNn8Kj2e9Tbnhth9sczLN92Rl
 Zs2zIIWIlBiTacZLj0SF7aF9b+PJK5Y/ZIbtOgqgcjEeh0NQGkP3lKggTbN7JJyV5/VUNhS5l8B
 NA1DHvwx9txGxYkHeAB/b4dnZ2kQwV4zag3rOvn2S9TOMpqZccK4QyAaXG9bXmA4AUEU0Efabex
 NDYHXcWHvsBlEcoJ4jQ==
X-Proofpoint-GUID: CIv5CPQQBbOQ85DDIHqrwryISichUr-M
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a983f08 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2yN2iZOksrgf2_ncbZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX3qh471BEKy8F
 COpdNvT66bxZaKIwDv0SF0PXbv5261Kq0fZSYixQuupDrK52oc7sHc9SbSHdBQMAoAk27Ng1j7e
 A/yeOm6LynSBt+PQHfOgxQK+vzdb4gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136
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

Add TCGCPUOps::do_interrupt() as a wrapper that targets can
implement to control BQL locking independently. The existing
do_interrupt_locked() callback remains for BQL-held contexts.
This allows each target to decide when to acquire the BQL.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/accel/tcg/cpu-ops.h | 14 ++++++++++++++
 accel/tcg/cpu-exec.c        | 12 ++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index 2e97f79a373..e2e67f796f6 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -169,6 +169,20 @@ struct TCGCPUOps {
      */
     vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
 #else
+    /**
+     * @do_interrupt: Deliver a pending exception/interrupt to the CPU
+     *
+     * Called when cs->exception_index contains the exception code to deliver.
+     * Updates CPU architectural state (usually before executing a guest
+     * exception handler).
+     *
+     * Called from cpu_handle_exception(). Implementations must acquire the
+     * BQL before modifying CPU state and hold it for the duration of the
+     * handler (this ensures safe access to shared CPU and device state during
+     * exception delivery, which may be cross-vCPU).
+     */
+    void (*do_interrupt)(CPUState *cpu);
+
     /**
      * @do_interrupt_locked: Deliver a pending exception/interrupt to the CPU
      * @cpu: cpu context
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8d9c203f222..4deb7e00571 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -727,9 +727,13 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
     if (replay_exception()) {
         const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 
-        bql_lock();
-        tcg_ops->do_interrupt_locked(cpu);
-        bql_unlock();
+        if (tcg_ops->do_interrupt) {
+            tcg_ops->do_interrupt(cpu);
+        } else {
+            bql_lock();
+            tcg_ops->do_interrupt_locked(cpu);
+            bql_unlock();
+        }
         cpu->exception_index = -1;
 
         if (unlikely(cpu_single_stepping(cpu))) {
@@ -1059,7 +1063,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
         assert(tcg_ops->cpu_exec_halt);
         assert(tcg_ops->cpu_exec_interrupt);
         assert(tcg_ops->cpu_exec_reset);
-        assert(tcg_ops->do_interrupt_locked);
+        assert(tcg_ops->do_interrupt || tcg_ops->do_interrupt_locked);
         assert(tcg_ops->pointer_wrap);
 #endif /* !CONFIG_USER_ONLY */
         assert(tcg_ops->translate_code);
-- 
2.53.0


