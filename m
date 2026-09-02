Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0074C61DD6
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:23:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1mmW-0003IB-C7; Wed, 02 Sep 2026 11:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmV-0003Gv-9u
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mmS-0000HJ-2B
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:43 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682DHXg3468446
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 15:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r2aOxU1OdRH+ieAz6UeTtKs+gXpfulUXbtYA5sNg/bo=; b=Kr7C+ea3bee01m59
 f0ahN8xaJFC6QcUa5zei1+XAzrxlVm433/QmjeMg22pIrGprsUw8AEh8+J2KPCBe
 FBhzBAjWR7LRmjS46UZZbEOMY2/G8md2WMtgBKC5HZPqsy98HAgmA26o83NgjLSb
 Qha8XLBPuY7f2t/2MB+ODXb3LSobiCW+yblvbmfmOAll+QIld2qSz6d/jYtnnuB4
 bhPhIa7610XsNQY24txrv2mOObyhR+NogSBOewCNK3SEy56yuczSiT03rjgWpFk8
 4tUBgeFxMJcClfe1Usv58MlgK1X/EqQsBg+ocGYe2//Hos+C8JejiciOxbEW0mVE
 TdWwvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0f9f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 15:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-939281526e1so35737285a.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362487; x=1788967287; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=r2aOxU1OdRH+ieAz6UeTtKs+gXpfulUXbtYA5sNg/bo=;
 b=V3sxVFJoPe3tuERGw2OlV5bEVUYWiiUwJyVjNTwUuIMOmnX/2bkS/FecWTLDfGiIdB
 sSQSXmgaHoWk+JiK+dWLfIBNXc+5pXmC/BvGJyxmK/J8Pp3z/XPVhMxD8UKQC0b84JVw
 vXfFrR5GpSSQ74SUgbnC5R13M5CglGYsG8PreJGFSD0DBUy/8irJOjiEPPreddl2GFpv
 2L/uDwou/3vTkdkpXqDrAc4xdRObWxKoLD3o+hZukxTWVJn1jhStYHG+EYlW/NvW4Ljn
 8oGenuQDaT7Bz9UEND/jamN6ybXXqZ4BvMUojHYUKE8jrCNcJrjTdIY8kUGlKAxksaSe
 74VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362487; x=1788967287;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=r2aOxU1OdRH+ieAz6UeTtKs+gXpfulUXbtYA5sNg/bo=;
 b=iiuk68e38cARH4VzR8vV/QzwLBmaHZ3nTjCPcmeAzFXEUE57CcC31X4+FT/7ZsJQeW
 AhQ4N4QX+z9gN30kf+k6lnumLJAyuAQ4C8nl7B4c1gnvSrECF9KQyBE2ehESLmCAcsha
 pH/NuCiiWyx4zsM9RyQ/E3NIK0eZ1bzUaiHWmahlVL7BiCGBuyJ/xpreUMTFH37D6jXv
 BKmSbDLzxp/MEfDQ7V6TtLpdSVEbjqiPyPjewYVUrYTfhZAEa2TaeEREtkyim0gGLdA9
 0zZmMSi0SKe0+YnqOCZXnzR/HgkUJSv1ESW0vznRjCN4dL7ZMX6x4bGPMKIcZYmaewv1
 HU5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrabTjSfhcReSLl9rEoa7PKElz5lQdMNj8GIlqS51nmOZWjV+GGqXN4uySkRqpzbf/AFqL+A62hu6Fj@nongnu.org
X-Gm-Message-State: AFuF++m0SZ5hz0RPcJsXjloDyDXKyGBAEaQ3yupQoVcJYiI4y/GJ1FgX
 EO4t4r51WbLEDdylv/7VvoiW5SKZlA0MO9kxOhryUM3jBxDkn0v0hn0n9vbjBLEr3gafXArMDaK
 4AglRaLbWyky9GSmZjn9Pq1ad9Vigcs1I7y1JyHx0p2OeBLmooZUbmDMy4Q==
X-Gm-Gg: AR+sD11kLxvQ5sXDWyO1cXCrIJ7yBgh6rwUQ6OoXUGBzE5m4Y6jI3szkGiLsUkptsJD
 AOEWmSS9M9U+hVP7FmhNoVh2FB59ZjNdmcM6AVOJtLdNYADyw4te2jFCwYFM41pzYCxQRlz3puk
 ATrUeRtra4mBzqgukAxHiOCXjXvXcJ9rwEF8wjBzgh3jyHTsoJlUrh6sEVc2ndyn/F/FEYdrokM
 eHgLctvqc3wv9cebAWioU7TvjMWz+l1SZU2nm+ZUZ5Cwoeytt80dVqjASDDAMv/Pl1oE4V+Pq1P
 oKrlwefEsG5Zsq4+wjrPiRAzuCJfRYJ2Rese7Pp/lBcFxJfw8Cgv0/DyYP/2j73M9WMOlB+B/er
 p1ZinfnXXQaZdsLAe2dmFiRF49QUoG4x8qAb8/7jK
X-Received: by 2002:a05:620a:630b:20b0:939:3fcd:4c3a with SMTP id
 af79cd13be357-93960e009f1mr569569085a.17.1788362487096; 
 Wed, 02 Sep 2026 08:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:630b:20b0:939:3fcd:4c3a with SMTP id
 af79cd13be357-93960e009f1mr569559685a.17.1788362486541; 
 Wed, 02 Sep 2026 08:21:26 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e7f8f9sm7097056f8f.9.2026.09.02.08.21.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:21:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 05/11] accel/tcg: Document do_interrupt() callback contract
Date: Wed,  2 Sep 2026 17:20:36 +0200
Message-ID: <20260902152044.31291-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6dHz3EYJXINGhHnUPk9jZulgly-i5Rzv
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a983ef8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=knkeNUhTHSQ0ZtdBXmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX6fESI19vZN8t
 ztXViyK4ofUGr0uEJMhfrPaKJT5aNsokdtpi77mXoaeqA7EiG0CI2gRjAicgtTO15h5pxlrX3en
 6i8QGxc8IqAjteD8JIOHiHLaonjTqZg=
X-Proofpoint-ORIG-GUID: 6dHz3EYJXINGhHnUPk9jZulgly-i5Rzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfXwWRflFHaYg28
 7z3AgsWqbj4B46wp3+T62LTE951YxU/h1zjB+dKoonX6G+Jrm8hlG6WeXfBkmD5Ll4ckh3yhn22
 usMt1+lgToiRoyL1RvPRTu5Y2pj602ImoTw4uBCDszyFVqHZ4ddgn6zk/3hpgnioU0ccLKO6YOk
 B138/zUuQlh+2ke7QX5PT5YP/Ca1//4/TF8THbf2BFY7LdZrJNV8ksDnK0t/8z5eYyhCbI0csiK
 DF8z6S7gdYWmnTBwKN1mFaI7CJZD+fbbnfNonOit6GLTnuNhL/uxB5tDmywfXVA5CoX6I54FwaL
 xW506YGnHMlnBUUZJleY7CJx3EJoVY5Sc16V6/v17PLfU/H72Kq+sftFLKREw5KfW2m4aPh7Sub
 sNszKYNIjMElPoZdEnoBb0jw/DjXS+2Jc/H/PrsZ23tKJkfeaS3bN24BeM7E5XSAM5UkHEGcFGd
 AD5tfuSA0hb/q6bFlyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020135
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

Expand docstring to clarify the handler is called with BQL held.
Add assertion that this callback is mandatory and never NULL, since
all targets must implement interrupt handling.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/accel/tcg/cpu-ops.h | 11 ++++++++++-
 accel/tcg/cpu-exec.c        |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index 87850402203..13df70eaa9f 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -169,7 +169,16 @@ struct TCGCPUOps {
      */
     vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
 #else
-    /** @do_interrupt: Callback for interrupt handling.  */
+    /**
+     * @do_interrupt: Deliver a pending exception/interrupt to the CPU
+     * @cpu: cpu context
+     *
+     * Called when cs->exception_index contains an exception code to deliver.
+     * Updates CPU architectural state (usually before executing a guest
+     * exception handler).
+     *
+     * Called from cpu_handle_exception() with BQL held.
+     */
     void (*do_interrupt)(CPUState *cpu);
 
     /**
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 609931a0d6e..2fae2c024b8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1059,6 +1059,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
         assert(tcg_ops->cpu_exec_halt);
         assert(tcg_ops->cpu_exec_interrupt);
         assert(tcg_ops->cpu_exec_reset);
+        assert(tcg_ops->do_interrupt);
         assert(tcg_ops->pointer_wrap);
 #endif /* !CONFIG_USER_ONLY */
         assert(tcg_ops->translate_code);
-- 
2.53.0


