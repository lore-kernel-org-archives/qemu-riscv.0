Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF7CCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:15:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL9z-00078Y-NK; Mon, 27 Oct 2025 07:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9f-0006as-EG
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9D-0007br-Bo
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:50 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so964568366b.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563533; x=1762168333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OP5xRq/2+HQuKT/1mrxcUI8zA2gE9pSdxS9XYDeOM4Q=;
 b=OQLI7QvPFveRCOrwb5IIxbZ1m4mb5TJzkJJ6nH9l0AZmm8RDsHn+yvLeMLt+nkPgRg
 ixpkyPtRT1mmvJ9Pni2bwTqn8sK9wx8tQiCvY6VCGrysawJJpnNhqUP163nH3DAIVZoZ
 p4RqWzy5/zbWmNM/s+QzcfxR/ylQ9DC5hDK3YrfCGLYuhQJLs2EcYhn0DLZknB07Pts6
 D6lWWD8BTICRsMSOq5JxoSg5haT0R6S28S59eZp2tt3LiiAzBXxJ/reSoCBrtjkj+Ly6
 BbWexSNj7fhEPmJCeTh/F0rinFPsaVAxpWqueNJtyrGPwTp8Arlp3uo99ozKrs9iyktn
 DPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563533; x=1762168333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OP5xRq/2+HQuKT/1mrxcUI8zA2gE9pSdxS9XYDeOM4Q=;
 b=Suy8oYDURApkbXEH7vx8JhFU9F48a8uDhfVNNjmVWE3Bx8J9dvZqL1Vl+5L1f9kJbD
 Dx5O6R4THh2ed3QBgTSS5AMtgJyR3PjtUTjoeiUrdDigQSko0/+tFEzRa+uWhGLpfv09
 ueLDELwddrsYLxALo4XEWj3UxiLow40CyZgDu6K3uGjtzevNA1EQwd3xpiV4JBeDXoUK
 vKIFNociWo3U4DHJBSfZwaw6+YauZdJ1n3ZSMmeOgYKCYXOYXXxvS9XZ8SSOJqn5ggD+
 TokeWu53EXnD2SQqP05o5KfkVszgMGly3mHXVwDJJBrDYBm6hub5BM0MO0wDlohxPzb/
 ASbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYT8bIWHatkHV0C1X5L6BSb79QfwkWnUeZrqtVI3pXmEP/JgFWk4rioZ/d+Ue1r1FjNdBp7Jhl4V+k@nongnu.org
X-Gm-Message-State: AOJu0YyMC1/Oc08JPcy/CAKCvrz6iM0TssUfDZ+7UeJS6CWZSoHZoiEL
 veymmLcy7f1mElP+pU4CGgvA0wps+S2hBQ8SE0w0mrPYcZGqtIQkWgZ2FLdgHlk7aFQ=
X-Gm-Gg: ASbGnctnu1jP79+y8wFJ5GERi5LyY25SUhBQYDlZg9RdEyvxCYfdlLaIFVjsuRj2LDY
 i4kglHfnxkkRzCSS5PyD+nBPXWkExQvnKhHYTtTkDqNhjRpNRhIp6AQautuRQgNrORJOOS/n3Uo
 VjRo7SoBYX9LfEKLvsdbtW57WIRa424Plq5rHi6Y1gVN0PzjQrDS+buQSbSiQRkN8vnjGb44Bit
 BB0gc7MOe0go4acDb8a3WGHzL1EUyg3xMj0S16XgvR2J9Io9Rd7LRXzbqFt+TeGju7ENjwRXVbF
 aOTUP8PdOjgkeCdUhjl4pProUSWdPLiiNXzrIOwFuS4LB2VQTa9aiULickSE//rAuFIGUGirOx+
 FVCyAnAJqCHqY8P4jYPZNcEiDDD+f3WQ+aQCPdSN7ZOeZpvzUkTAMX36hatkywpieZo4/aeooKp
 GU
X-Google-Smtp-Source: AGHT+IFf1e5BUD3bGIAW80hEOc4A/ZMLN+6c91S7j0DbPYjB69Ht/8CPBBkQ+pHOyAdD1COvmtiQuw==
X-Received: by 2002:a17:907:7f07:b0:b3f:9e3d:daa4 with SMTP id
 a640c23a62f3a-b6d51c50982mr1328725066b.65.1761563533351; 
 Mon, 27 Oct 2025 04:12:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541e99fsm728060866b.61.2025.10.27.04.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7247B61534;
 Mon, 27 Oct 2025 11:03:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 35/35] semihosting: Fix GDB File-I/O FLEN
Date: Mon, 27 Oct 2025 11:03:42 +0000
Message-ID: <20251027110344.2289945-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Sean Anderson <sean.anderson@linux.dev>

fstat returns 0 on success and -1 on error. Since we have already
checked for error, ret must be zero. Therefore, any call to fstat on a
non-empty file will return -1/EOVERFLOW.

Restore the original logic that just did a byteswap. I don't really know
what the intention of the fixed commit was.

Fixes: a6300ed6b7 ("semihosting: Split out semihost_sys_flen")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 61001267965..c5a07cb947b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -316,10 +316,7 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
                                 &size, 8, 0)) {
             ret = -1, err = EFAULT;
         } else {
-            size = be64_to_cpu(size);
-            if (ret != size) {
-                ret = -1, err = EOVERFLOW;
-            }
+            ret = be64_to_cpu(size);
         }
     }
     common_semi_cb(cs, ret, err);
-- 
2.47.3


