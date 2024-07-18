Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D43EC3DA49
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 09:46:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sUNhn-0003yx-FB; Thu, 18 Jul 2024 05:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sUNhl-0003qj-M6
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 05:45:41 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sUNhg-0007fH-2q
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 05:45:41 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eecb63de15so7914651fa.0
 for <qemu-riscv@nongnu.org>; Thu, 18 Jul 2024 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721295934; x=1721900734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/7VI3SrH+zYbARBw7BAZJVT4QrnBg3//kUdSkwSc88=;
 b=lvhCLR/kr5rUecCPJAWbY3Y4wSN4I9Dw6jIxwj2mfokY4BgFH8jjMftF2q3DgNNqu8
 qXvsANQXcEhx+V3X+LL/jdxcWwdSf1L0+kEnfle45uvsaaLgghktDZtpWCa2Ztzbt066
 byJjLmlXKLu4CGIU2EEUbk++7lR87PtutAm69crsLOyO+299ChyOMgZj6W6D8oBZrJ4E
 ZtC/vlFhyFhKWX1oCnavhSaRPo9DCbukfd4irdhlYrUKHHZd0VsCN+iet7MxDD6uRETQ
 kUeMXIpwjHijsq7APK9RlAPZYuX5lDICNvYolZgxT/rkfvUZb5BnBznhYTRioiGKmPCq
 3ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721295934; x=1721900734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/7VI3SrH+zYbARBw7BAZJVT4QrnBg3//kUdSkwSc88=;
 b=bCYqA8Cy8wD8YqjLspTpxnKqcE3oyNawe7Le7pd7VRFiS3FPp1KjJrrYhRV+esY9/6
 BhMgJPXXtrhx8+79PPPDRwVO4NrZuOMzF+1rmy/hHHKNpYVoAfXJqO7PCFlrF8qcRZMh
 AwkLu+qTrDJMhAEmsIsJErsLwpIX2fvGCYXEtI3e8/pg88PvZKkUMdQlx05erw/7SX7P
 vZnAG1Xe0+oeJFohdl3+eojHZN3vbCqZRhA9xXmYfBtvuYUQSkOjzF9Y3zEnZsg3aI/I
 dnSSYmVChT5rI+sg85d0ccb0U7ReTsUMzQkYmC62Wzf/Su5WifefC92/xWb/h9HkKoSn
 SMoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkwqkZzeWGniEvIXo6I/M9xEvzPKnZxKhMgYC/7Kh1IlMUtAVWdM/zuS9XjR1Lk17ApGcIjxkuYdedrw44GKOtaxzesDM=
X-Gm-Message-State: AOJu0YwIfyG9bSLtwkXOqaLeoDXuyv4Gojjs7YxwC0VN5U9T6VZBmnq7
 Tv1YDHvFv0AVyhUKD8rX33miCKTxAIaJStOrkmUNflJT86sf1rNJBIDk9MrpYNQ=
X-Google-Smtp-Source: AGHT+IH7mkm50t7cPihnPA+Mtp7c1MaBPZ88YW30rwtZtUvq/IeLelvANvv5qyYv9a3slQ04XnZLtw==
X-Received: by 2002:a2e:9b54:0:b0:2ee:8d07:3d51 with SMTP id
 38308e7fff4ca-2ef05d73becmr12317431fa.49.1721295933810; 
 Thu, 18 Jul 2024 02:45:33 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24a76f02sm8189084a12.2.2024.07.18.02.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 02:45:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15DCD5FBD9;
 Thu, 18 Jul 2024 10:45:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Anton Johansson <anjo@rev.ng>
Subject: [PATCH 11/15] target/m68k: Restrict semihosting to TCG
Date: Thu, 18 Jul 2024 10:45:19 +0100
Message-Id: <20240718094523.1198645-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22f.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The semihosting feature depends on TCG (due to the probe_access
API access). Although TCG is the single accelerator currently
available for the m68k target, use the Kconfig "imply" directive
which is more correct (if we were to support a different accel).

Reported-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240717105723.58965-5-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
index 9eae71486f..23aae24ebe 100644
--- a/target/m68k/Kconfig
+++ b/target/m68k/Kconfig
@@ -1,3 +1,3 @@
 config M68K
     bool
-    select SEMIHOSTING
+    imply SEMIHOSTING if TCG
-- 
2.39.2


