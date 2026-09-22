Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DBFC98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93kF-0007Wz-9S; Tue, 22 Sep 2026 12:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hz-0004RM-0j
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hx-0002YI-4f
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:06 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjVxZ1058308
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=; b=ZjSxuWWZhzYvfDsX
 Ba/AmxUDn6I7edwNCDrZkY19c4bXh0Iri2c9g5fI8mKgJpfB3Srt5qRZWvlHpxic
 A70GV0xTg1Nz84H27jUdZxhb8EHJzjZ1YXZoDDoJOeJIajzqTFpNtRqbACZWQ/NI
 Yk+QwdjhKIuu0rWDYxW2NQDC8pDx+qngsAHZq4+rZsG6EejOE4k1ew602OFDqG73
 y0eMO3PJrXWj+j6diamEfJpGnosYgsFPbHZd7fbcsC0/pzLWCTZ6OpkaY9W/B3VD
 B07jGsW5BtWQ3w8rgUlBV6SCR1oGlNUAqN176/Ufgh9MobAvU4x6gH2fEpfQFcBu
 RyeWZA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5ugxf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-98087b0c5deso3418539241.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095853; x=1790700653; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=;
 b=AYYCS4lP4bRrMjnY9xagiMvN1X1K3E5l21Ze8/yKwMB11THoQTrV2NyRovrMkmxyUo
 D2EOc+k05DpyXN6piSvqGr5pX3yrfZr+7HLJo4jakyWLJfGXK/GDbQcTYP2J16LwIWbf
 4LgDMUbWzr7JT/m63KxabtPMrLyjc3ebmTvgbWqRBsGlPu5LJ6PQYtmugJVNyNehIiSM
 cmiqA/4/i/vrmzs/UVKCXJZDMpPQqG6rwn0ItvwdSzLrZna6+pXT93dPNE/WsQd4d6Ul
 8/8bUAOBtVpS6711Gzg9La3HXMM9hdqb74Pboli5YW7uAFscXkxF0XLaoYNMFncYlPdS
 j+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095853; x=1790700653;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kDFRggGBgd+2DtAqNLeUqcVcpYvkyK4ydCRh++BAI8w=;
 b=PPVu8ik4CtbTlo+AtBYimFWhpC8JeMEevdspjk6/34F0LSuzOzMfaSMT8fVPeG6AqW
 6NG5jb0h1RuOkjkUYWFfQUDGLXCRm7f6Tmo70XyoXISulXs3XyKiZg4gsHOKTJfmr/FZ
 dNkN7vtBZBUOVQqfSwumKno6hUltPSkvI8nx2D24DeA56I3nLQJGHCn3reeVkUkiIlCv
 2Uksr1YdYgUvXl5F9q2Yi1W9pTEDvzvaJepHHy2QDLAtnKTJsGDF1VmcBFty9x/r8KlP
 RUj6+LYx1SNm0Oa1fAM0D/unTgyaaYsr9dJzbaNzKnVuY9f8rAPlGy5FkkYf88Zb0Old
 ZRqQ==
X-Gm-Message-State: AFuF++kaB6AE/Ql8yOiFdyee7Ds9EGlYNpgCOqkJinzoQpRJ+wjTDcCr
 o0z2O5o4WLFv2w3VCbljVSXVy2kPd37rPF7Vq3Q1OQOz+Ou22RMUlP0oLg5EJfGKC9BtvmBbVcR
 T0VShIytid3Glegnko4oHWJS1KB0egr9jByYLHtnECOYwJjgl7hgc33qI8g==
X-Gm-Gg: AYBFou0haa3+3+8vQ1gJY4TlL+6nIMaoKLp13f4AkVblTmOkdcvN23Tc+bKyaQ9aEAR
 wXxXFYJR8RJGxO9mBihFiQM8lZhBOj4toAWr0BdfLMa/xAr8Uo0jw67AoSuAVus74ifaNc2N4ZK
 GZFUoh3/b0VqadkR6Fuuugq5TfaTp5fHLFt7RxyXxyiBjKHJDrOgBmKUmaoe2FZ3YpDckzPPGih
 YU9WauZGHrI7n8Yad1pI/zzgemuCPNl6SwJyQQ2zSgu8OtNMb5ncyun3CNAFIrvFM0xpuybJN67
 A/GHnmlsUxPJdYSw1H371WfT03NluoVkpTLhbfn5uVne/+6PKFl0LZpstYydLfdHeKJUERhRNZE
 uPvS2l1Vthb0SesxZLKS9IjPIN4FDiQHjC0Z3vE5p
X-Received: by 2002:a05:6102:8552:10b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7a7ad9f8177mr5127594137.1.1790095853177; 
 Tue, 22 Sep 2026 09:50:53 -0700 (PDT)
X-Received: by 2002:a05:6102:8552:10b0:7a7:ad9f:53e2 with SMTP id
 ada2fe7eead31-7a7ad9f8177mr5127568137.1.1790095852801; 
 Tue, 22 Sep 2026 09:50:52 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdabe8a2asm68093685e9.4.2026.09.22.09.50.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 10/17] accel/tcg: Refactor poll-while-halted flow in
 cpu_exec()
Date: Tue, 22 Sep 2026 18:49:28 +0200
Message-ID: <20260922164936.15189-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DNh2rePr7U1Qakt_lTtFXc5ETsyHxs4H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXx7EGT1TnnZel
 n3dER1Mu8dJ3M/UNnZGKNAcjVPbPdQT0mGHZiaqxiHqQp/2586SGgbei9IvnQrIA2OYwLPFRRQ9
 MyQy8wURAQY8S4qlkMh76zBAoXrr29c=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2b1ee cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xF3Xt6V14tk6trZ56bgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DNh2rePr7U1Qakt_lTtFXc5ETsyHxs4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX7sqj2f0uxaEW
 7wTUrkvQhPd+e9QxT9RS8SoM9tkUKt5odkDo6vrpxoZ1ldU/KZaRtOshbiWKOm24NbzSqeE2sEG
 SUxTGHb8+Yx48nWegs7xX+4iCJws9gmT1T5K3SiIcY5RqUeW3xk2nAHBLCJGBVJhqN9th4xEt6x
 szR5lO+9f/j269/eX24OzPM0khbg2QTyH+RGwag3usLEMqETBagKo5F6VEX3yIkJAOU0Uf2gR2s
 ayXZIWXYFQ5KP62WZRo9iUyoMJFSneHGhmgenABkApCF2vO7J+PZzfi/SbJZ48+wnQpVb6KJQ3K
 76OvZZeoEIFB1wArAnkgmfv1OCkfk0LTZ+3e049IB0xkbjDPwB+qx9/uP3+6YXLH1hq2FpqRDB0
 9gApCkzxOazg5D2g8vPrVvjeuVnjFc5N5sD0xLT1JO6uMHI49h7INwXiXfiTj6/EW/O6jGe2vrY
 2E5167t2tS7G1zFkrtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
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

Invert cpu_handle_halt()'s logic to read in cpu_exec()
as "if halted, poll for async events and find work; if
no work, return". Rename as cpu_poll_while_halted().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 46b723cb734..76182803592 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -654,18 +654,18 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 }
 
 #ifndef CONFIG_USER_ONLY
-static inline bool cpu_handle_halt(CPUState *cpu)
+static bool cpu_poll_while_halted(CPUState *cpu)
 {
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
     bool leave_halt = tcg_ops->cpu_exec_halt(cpu);
 
     if (!leave_halt) {
-        return true;
+        return false;
     }
 
     cpu->halted = 0; /* allow execution */
 
-    return false;
+    return true;
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1027,7 +1027,7 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-        if (cpu_handle_halt(cpu)) {
+        if (!cpu_poll_while_halted(cpu)) {
             return EXCP_HALTED;
         }
         assert(!cpu->halted);
-- 
2.53.0


