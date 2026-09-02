Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37BFC624D3
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:22:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1mmO-00034f-3D; Wed, 02 Sep 2026 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmM-00030a-LY
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmK-0000Fy-UZ
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:34 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682EdTK12947802
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 15:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +YPNLAnu1HEAYVb+feaZUL0eZ0sSfOiNmPRQjU24rs8=; b=E0R1wYBZw7yRHNTj
 z0iYW4nAYBxbStmxtH5NOl2iDX9zxcP7M+8ocutI2+iae7gXi0scsAFvMvi3hxY1
 lkr3VK1IX1AystE393oHZnC1K1vc+HxWC+lUolRLAS56FwAf0yxyyPHqCC3oX43F
 seSBprsV2vGVJegxae83m4ftHbdDzRZo+NYLfTywSKSRtlxrlm4hQ9VsExw1eQqc
 cbxCJvOk8mE2Flcqi2yzxmoi4wBpfkLEC1ot9wiD7qix2CKW98gUXAtGO6pWF7Wc
 EJcCfvpi/a4+LakL+J+qHiTdAObnAKZ8h8p8q77YmgYifdR0+qaTHVksOGEHktMT
 WlM5Vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrng5c3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 15:21:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93915f50a5cso513182385a.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362480; x=1788967280; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+YPNLAnu1HEAYVb+feaZUL0eZ0sSfOiNmPRQjU24rs8=;
 b=hXL/ShQnX4Va95LXlgzVW8gm7PBlQcQerRJywYJnbtbAiyWJAu2gQnOhBAJIcbhghX
 X4NwwFU61O+LwqZxDKJeY/seuYDdVIGXWTfG51+70V+O4YJnJYtipt/FTidmytAWG0Eh
 +Moc7LN1+Y1jD+JmM8MokohqNI83mT9Otsedpl0EKbwRGVwb71zFMiyfmHQ3w8nFDkEe
 aW8gab9SOeA9DEplzphRocQRPEqdv/M2s2R5Au27xYu2WT6h3QYXjrUJ1w+tBbZe9iTZ
 2FS+MQmK+PzpOo8CSUxOgx7bMBlJK7oA0SYmFdpQqWYES6MJfI8J66ZJC9Xbu0/r0+tS
 2hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362480; x=1788967280;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+YPNLAnu1HEAYVb+feaZUL0eZ0sSfOiNmPRQjU24rs8=;
 b=nLvi8RpazXi9hYwtCjZ+PiiinlRssKJITkxyU8romo6KzXQRvHmTTF2eALPb0446cu
 xly/bVqnGW6D/7PeXHTGBXG0w3nDOqw+d/6htQWiexCHLnodhBONPkBdVwGPcm0mixWD
 C+zhc8bpKW6AxIREEZl5cyiwXXT6kmKBJeCS2Xx7q1CvcMG6wDOG6GEDyWru7wUHaf+M
 4MIahy0lbIimEKpGENF4A7etb4IZTZHsA8KOjeugP8PXEDJLiZeBmsnJIiopXG/b1KCv
 OMshdvnHzr0dENtrY8dZteQJ/XxuQOpm5nrCdWaG55fJhKBDLLC1sQwvliSRb3Tm5lNc
 kboA==
X-Forwarded-Encrypted: i=1;
 AHgh+RprFATE7d8LSB6yvuT+PG6twaC/bljt0MnsHFomoweua6DRpTwBaaBdIkWbV7v62YTBKa59uGyNNGMv@nongnu.org
X-Gm-Message-State: AFuF++kO595fOp7yYdeUHNURCv8YAjGOrd1eiMI6Lzm9rT25v63Bahuu
 vW1IY8UDZA4wNTDDXNTzpIjDhT8yZ0FCRf0uslKOa1FpwVrK5JEM731MYJ5yTwvKoGu8Wkzd9Vj
 F5g3HW1wr8W513pf/XbbmHt91PzSphAJpfrE+be6MK7wLPIBPlSyOCnTyqQ==
X-Gm-Gg: AR+sD1020CwRxqPfb5fTvqSvXFhdKN5neKIcWFg317P38mHMKN5ICk+5FLnCK2EM6OD
 GoTez1US/XkUpr/G0rqalvQm3U7agUuajkb06nLLpssuOxrbRz6NYulSqkPrGAD+uih2uQtGQpL
 IqCWYzgRL/kMVHdZ29WP46I5CyuvZpP2NgkzjxTMLs2+tLLp6ZCA+v6W2/PT94dNLpUOqinnsdc
 fUS08EOv9FWKMfGUAm2kzah6a1oYaUirwU5EIqHgMMEhVYAo1t5gXCpW+SPpwtkyxTt21YhW3cO
 w5UWmDJ1jFCBrP54jYBpBW1HXFePOpKZ0XziAvWHE7HJHewVCttCC+z3dWC8mGWPG7vUOdaxvhx
 pTSxH4rFelr0CtiTnXp6ct79T6gQK/Dd1ehlui6Zo
X-Received: by 2002:a05:620a:4553:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-93965bfbc2fmr430856585a.14.1788362479984; 
 Wed, 02 Sep 2026 08:21:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-93965bfbc2fmr430843185a.14.1788362479299; 
 Wed, 02 Sep 2026 08:21:19 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce591f846sm26874605e9.1.2026.09.02.08.21.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:21:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt() callback
 contract
Date: Wed,  2 Sep 2026 17:20:35 +0200
Message-ID: <20260902152044.31291-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bVTF1ARbGadxVr3z_1eTrdua5oSETYhB
X-Proofpoint-ORIG-GUID: bVTF1ARbGadxVr3z_1eTrdua5oSETYhB
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a983ef1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SWPfrzv3WwVL6hwBn9sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX+Ye1GepNuDVV
 pwxIWTTST5Q2wj4+7KUzj5WzOFdUJwdTMvdVp+u/7U3M7BxS09xep3/Fc5ntFt9F9wWkLcriYF6
 N1hiSeScjwwhBFTXIwZl63oxaAoTLGTivotJnBpmUZeBbBTUt2gvCxU4l/LDVzPGE7R/nCpn90l
 z7QI8WFLurUreYDTSQ2iGPPhQRRu/Q6f4+3f7CqMaYhsOqaxQ+a8G+7rIYFJfbePPYGWQ1xW7u3
 bcEC/83hBRhA/+Qdck1k13xf39hX7tFeBLDKRFhMRQO+Z6uoGxfJdzdAO1gw3TGZ+/HuWRNa/fQ
 QCdy+Rx5zalD9BI+2kHQxJ51XQvTkgryINfdGE7+5iZsrbMyqqPum4KrxCL8aZD/2FDau4JkdaS
 eG71DJgUQ33rYWCo/AJPTO6i/nSG0Eo0l/+LR9DPDTuiLySuZn6U+vTCQnKzso0ZZ0lWzVLJOsY
 G0xYBoHWNtRXAjwIf+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX8mBfown4rr/r
 s/mcgULzOolV0E4a4+8ixMHCMBaITYN0AP/6ApGsLzwClcqpeaN5wQVUQ/wvj60+HL4Vj9DMm01
 GUyAh93MFDyLrlTjaJaZAh/cjgLLhhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020135
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

Expand docstring to clarify that @interrupt_request is a bitmask,
the handler is called with BQL held, and document the return value
semantics. Fix typo in arm_cpu_exec_interrupt() documentation
(s/inrerrupt/interrupt).

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/accel/tcg/cpu-ops.h | 15 ++++++++++++++-
 target/arm/internals.h      |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index ded7cc700df..87850402203 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -171,8 +171,21 @@ struct TCGCPUOps {
 #else
     /** @do_interrupt: Callback for interrupt handling.  */
     void (*do_interrupt)(CPUState *cpu);
-    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+
+    /**
+     * @cpu_exec_interrupt: Callback for processing target-specific interrupts
+     * @cpu: cpu context
+     * @interrupt_request: Bitmask of pending interrupts
+     *
+     * Called from cpu_handle_interrupt() with the BQL held. Process the
+     * pending interrupt according to the target specific @interrupt_request
+     * masking rules.
+     *
+     * Returns: %true if an interrupt was processed and the next TB should
+     * be restarted, %false to continue normal execution.
+     */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+
     /** @cpu_exec_reset: Callback for reset in cpu_exec.  */
     void (*cpu_exec_reset)(CPUState *cpu);
     /**
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1775835ad50..551a6b4a872 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1248,7 +1248,7 @@ static inline const char *aarch32_mode_name(uint32_t psr)
 }
 
 /**
- * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_inrerrupt hook.
+ * arm_cpu_exec_interrupt(): Implementation of the cpu_exec_interrupt hook.
  */
 bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 
-- 
2.53.0


