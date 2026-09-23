Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33FBC98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QVY-0003UL-Uw; Wed, 23 Sep 2026 13:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVG-0003P5-SS
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:11:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVF-00010S-7i
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:11:30 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGU2ht3106204
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yfNMtIQVH/g1hzhti934J8Nc6bZ3Ap2ifCd+bJEPDr0=; b=eK/WNOIR/wj63QFU
 Z65UluJyeKplPpSSde9H3q7bWyD/lSk9kfgth3H34M5M4gJtaoE5FYJ86IH0GoQZ
 LYqTAuJ/1csNE1Llkzpt53WUw+U3Cv117MVQcNyF+xaaTnuBpBycJqPJ33DKThmW
 r632nONfQB88qynArqWdpT+rYP6D9WGs/pO8MkYzTnaM1ZOtF12FvROP1JlpZ1k2
 yNuozuxSzaiDHT6Byqfx94Wl9RrF2ERUDxuBiPeyP79Hs6Sk3zatzCQM8yhZhV5E
 MhXf+HjmKRhJAIYn2rscv4L7fTcQS8vBzT0e1HlQM2ZTkgLpjf/mrzkOVsZO/Mh2
 /z5R5Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwh0sn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-98513b850f1so186697241.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183486; x=1790788286; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yfNMtIQVH/g1hzhti934J8Nc6bZ3Ap2ifCd+bJEPDr0=;
 b=EO8ePoC2XFMuwGiStxiZmVJgm4Tu9tdpJQQTgOhhfyw5Hze0q16H9ttqKlr7nzV95/
 bPnlKA8C0V8hLXaAMpBILkFIDmIgjyon6DW9V2ZTaJPoGU4VHfMEEeeDdev5LQpMqJ1i
 LEGeuuXulreXRjsMIB+t9TF/LZIsjZYK5kBCDxF1FzGSOyZfCAclV9U4/UzdfPbtPxyR
 wLHp/tyYiNxLH5r6Sg8sVQ2njHJdgC73nNa3iYVlr7oMrL50N4rkzXZ4AdA+GMWCtCQv
 tqyaf8gwzLy8fHWBLOdoli1/oCZ8sOrFCiF1ckld8bCKYRP/VjXE5GusDaFdETZCBnud
 CFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183486; x=1790788286;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yfNMtIQVH/g1hzhti934J8Nc6bZ3Ap2ifCd+bJEPDr0=;
 b=cqt3YM7/kriLsYOTPFVRzx5fYXzh/Js3rcip5PXkzOgHa1Fn5V8fA8Q6GHU78V1vW7
 6pHc0bs/cN8D6vV9ajzPEfwa1fasgpX9urXpM5fCWHhIskRPW27BNjeKAX1Py849v9Fd
 EvSLf2oGZVMGl9NWEHDRO20WRpQDxSIfHFe/aHo5DUjKorXPovjW5/j5P6D32CsEiao4
 DWh3MV25Cw0JuMg15qO7Fs0+iJg29uRLdcisc4JGud4wbwiJQ0gR7VWAn+tZy8Ehr08q
 yJwFjgfRJWrVQtzWkXH1mtivYLCOLh/8j6ItNEh1LpUIqQT7AVYKVErcxKU/zU8Bw6wN
 9tjg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHVh+HQ/GEXOJOR2uFCZA4DAP6ElSgrJNTyNTRWqLYR2y3lNVm1AROALkq/j729QVSQUcdK0G8YRC6@nongnu.org
X-Gm-Message-State: AFuF++kqjNFxuaN6OkWo4Rin7S6YtBreJLfjFd0lQCEmH5pR0gxLDQds
 LxagHRtE+VxyU8E/QZb4GAqZ3Tj1ov4ariSrrqYQ27pPpL+RcXDAeJkEIxDbALlgf96VjdGzE0V
 3lQ5LiY6wv6p1Xjj3BySLlvIc7oERejf7Il18iubzdUietwLZ7c+tegOnRg==
X-Gm-Gg: AYBFou3T04b04ukYEnTN2YV7CupklUe14AYRG+FXiY3BY5sY4xRKZCkk+jxdOepnH9K
 SRVUIVr2lHNsu2Iek2rvz2oA44gW/ExKqRfX3w9F9c/GMtm2uEgJy2WBJhBLuHHj4CNOCr2c6gc
 ktG+F5p4ZA2XpnrviG2c7AYQf0QA1Fg9udRIBoJZHKYqDh2IF/gM9b4BF9/mzyxqrQ8xHNhWPVs
 4AdidYVrCVWkhZ9FVK56/c+zGWhkNaxvb+8qP4zXJib/PX4AlMeBoN37FbD7qfrY6ZHvmbg8KUb
 1J2o6ei3V7RIGhaUaveA1S8Kx/G1G1+zNvSGxoapHFEv3Wh5k6RH4uOZFUErdl+Y0qC65ZaZvsZ
 g2+QA+YP8r0oM2kaSuRYtq29Tp9GuG1C5k9+OqjC4
X-Received: by 2002:a05:6102:e12:b0:7a1:f7d2:e845 with SMTP id
 ada2fe7eead31-7ac1d2d8af9mr3158158137.21.1790183486338; 
 Wed, 23 Sep 2026 10:11:26 -0700 (PDT)
X-Received: by 2002:a05:6102:e12:b0:7a1:f7d2:e845 with SMTP id
 ada2fe7eead31-7ac1d2d8af9mr3158143137.21.1790183485919; 
 Wed, 23 Sep 2026 10:11:25 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868886e45sm8575710f8f.31.2026.09.23.10.11.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 01/21] system: Document has_work() synchronization
 requirements
Date: Wed, 23 Sep 2026 19:10:55 +0200
Message-ID: <20260923171116.31276-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX/xIRR3MKBdDe
 54kQvDHNiAKEbQvkc6dZbipKKjtxe1rY2dSxGlIiII7H9SjSDmxInqZkpk6/VYozt6Q7Udji1Cs
 NJ6ysKZtUXgMrN8WoJcgXP5UDF2kGjv4TpY7igN2CtJ631e+iHsr+sXyYcbkEIKXjWCA+fINFGW
 mglo7XkccerFBKlEUmDyMtXahflYjmMA1kiwSuerdkE+HRCvZjVyhcQskQKyytn9kyLvOGmyxqK
 Ax2sklTS2KgirzMT0W4yyjpmHoHObixOkfrhS2Z8ZXFLJ0NgTh96cKLgV3BFxa2ym11iv3L8uC7
 rtOytj9mbY7pOVJk4bFk6aPvgHWrufQBDlt/Y4d8q+JGqlvA/TwvO3+IcufcAaJAnKauDyOT8xo
 oamFWjl/vD/gCyORbLDlh/jr4iXK4tBqax0iAAWu2e1XRhNzKywa+xWIxAd2Vs0lvN14lKZ2qvO
 5LUFRV+eDEyjy4ixKOw==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4083f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XUsUnerbLd2lX0N3J0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXxyixxmQvZaOB
 o4VBpOL8zUhjin7a6Ws3ztpxQ5g2KdpHVs4KG7v9vLzoZEZuF1PuQrnvNSOLb6J/uV/LSz9j+s1
 j0SkNlgfo2gop2y5Ff6Zzijl8z/ao1Y=
X-Proofpoint-ORIG-GUID: pJ1xZMj5dFwimwRD9K4ZqR2d4SQhIjRW
X-Proofpoint-GUID: pJ1xZMj5dFwimwRD9K4ZqR2d4SQhIjRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230068
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

Document that has_work() may be called with or without the BQL.

Require implementations to remain idempotent and avoid consuming
work, and to synchronize state shared with other threads without
acquiring the BQL unconditionally.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/sysemu-cpu-ops.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index e56eea18b78..d125540262d 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -19,8 +19,10 @@ typedef struct SysemuCPUOps {
     /**
      * @has_work: Callback for checking if there is work to do.
      *
-     * This function should be idempotent (i.e. not change state) as
-     * it will likely be queried multiple times before a CPU resumes.
+     * This callback may be called with or without the BQL.  It must be
+     * idempotent, must not consume work, and must not assume that the BQL
+     * is held or acquire it unconditionally.  State shared with other
+     * threads must use appropriate synchronization.
      */
     bool (*has_work)(CPUState *cpu); /* MANDATORY NON-NULL */
     /**
-- 
2.53.0


