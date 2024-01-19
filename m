Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B56C47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQn9y-0001nR-3L; Fri, 19 Jan 2024 06:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9w-0001l4-Br
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:40 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9t-00086D-M9
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:40 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3376555b756so388604f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664136; x=1706268936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJxZlcfmNn+4e6fRmCJ3mMuWcpZHQmskZZgo6KbTC98=;
 b=uc81YsZDaSV6xPI+QOb2Yl2GiVFLxUe25a1VDl5q3lxPNpLQtxRWGJxxE0SL+fkS9c
 y5ICy/oHW05DIy3Y/VbXaJ+ES/EMElvDtyCuBqR7FFBCk0AJLF2u+jFrPYUG3Bev9hfm
 BlvKYA/6rU7VMlpWtixoRK6fsAwmBhWhvyI+1NfojzXyvtmPkcGOIK1VsaRxDuXicmYP
 U2/qkCxfFbeDADr7XzAyoDkj0FZfO2UnyYCVEq4NbYvepwh4zBsSGF2PvuWPTqnzwlrZ
 uYMbTLOZkY2R+y8YvSum7DTXsFa8F2hUaxnLC9s0UBQkCyLZ13OfmH+9l4MlRnwOs4kU
 Y2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664136; x=1706268936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJxZlcfmNn+4e6fRmCJ3mMuWcpZHQmskZZgo6KbTC98=;
 b=LraqSYi7nD2aba+TDdzeMH+DLFfvkzLR2QvkeBAgltsELar2M774CSajkgkFNwm/ju
 E2GLPIx5HaShuVR3RUm4X5xOBQf44VYdyhIa15/RmDGZGdw56z1isu47TAkVOnukAx6E
 CYQvQL/ZUlSbUlS3S2ShiqDZt35pTYh0zuHhXRhQIldEB2HEcufUtMsHuyQQgValZTCw
 +go198jjSWozFY9ZWJGAV27MObdOe5AZCILcD2QCePlzozZn8AiF9kEg45XCw+wna5E5
 dUxGGbVnFETZ0cxt9X0qh38NvGmsnMjFtzpLo2YazYMtvcVJkWxt3crtPY3s9tlvQDox
 g1jQ==
X-Gm-Message-State: AOJu0Yxks10e0VZF3yVV+N8asZpBpjpPlykQiY4jnTL+q7aHkk1k/+bg
 flsneaJi7WyUghKyeWe84sSdG7x4Jw0firVpHxI4MRmXXMHK0e2BSFk/qmwsOaI+Rrgjs5bPk9l
 N32uDcw==
X-Google-Smtp-Source: AGHT+IE15xVnAXRnmREdh56jH/JKIC2h6HfF65gUmnvCcnNp+wYreVQWy4tG/anjmUHtzvNlJtTS8A==
X-Received: by 2002:adf:e5c7:0:b0:337:c134:61d6 with SMTP id
 a7-20020adfe5c7000000b00337c13461d6mr492360wrn.39.1705664136006; 
 Fri, 19 Jan 2024 03:35:36 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b00337bfaa944bsm6284306wrq.54.2024.01.19.03.35.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/36] tests/tcg/xtensa: add icount/ibreak priority test
Date: Fri, 19 Jan 2024 12:34:35 +0100
Message-ID: <20240119113507.31951-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Max Filippov <jcmvbkbc@gmail.com>

When icount and ibreak exceptions are due to happen on the same address
icount has higher precedence.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231130171920.3798954-3-jcmvbkbc@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/tcg/xtensa/test_break.S | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/xtensa/test_break.S b/tests/tcg/xtensa/test_break.S
index 3aa18b5cec..4c618feb5b 100644
--- a/tests/tcg/xtensa/test_break.S
+++ b/tests/tcg/xtensa/test_break.S
@@ -129,7 +129,7 @@ test ibreak_remove
 4:
 test_end
 
-test ibreak_priority
+test ibreak_break_priority
     set_vector debug_vector, 2f
     rsil    a2, debug_level - 1
     movi    a2, 1f
@@ -145,6 +145,29 @@ test ibreak_priority
     movi    a3, 0x2
     assert  eq, a2, a3
 test_end
+
+test ibreak_icount_priority
+    set_vector debug_vector, 2f
+    rsil    a2, debug_level - 1
+    movi    a2, 1f
+    wsr     a2, ibreaka0
+    movi    a2, 1
+    wsr     a2, ibreakenable
+    movi    a2, -2
+    wsr     a2, icount
+    movi    a2, 1
+    wsr     a2, icountlevel
+    isync
+    rsil    a2, 0
+    nop
+1:
+    break   0, 0
+    test_fail
+2:
+    rsr     a2, debugcause
+    movi    a3, 0x1
+    assert  eq, a2, a3
+test_end
 #endif
 
 test icount
-- 
2.41.0


