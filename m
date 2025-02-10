Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B5C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc7V-0002QR-3Y; Mon, 10 Feb 2025 17:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7P-00026p-7L
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:07 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7N-0002vp-5I
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:06 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so33773575e9.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225944; x=1739830744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=na4NIhR7KjWn9JvA007jmUlM2ztPp6QYgo9rPBZi7l8=;
 b=AzS3onoxhCp7MlzD96P5kLZDVFz08q+Zu4WdLHoJQHZwgblTZv3W/ygJkrZoQ0P/Nb
 xkLUOc6UfzySYbsPXqa77+wCDoR9M3bHg/3aoyhboJ27W33mUhyS/4fr69LxKc8fV/37
 7s7IRuUzAsvBhAn5Iud2tunZ6S/LRoTO+MVWQb+cy1jZFq3bKRGePKZIJyGOskzTIMox
 etLsg2nqmVIVD0c8ncVis92eughFdWPKLgkHqx+PyKfbaq3aUXbxjEbgwCVheM/mcIa3
 NIwhqdSH9xQIvXIZK2B88OYs5m7c0+/bh9jChn/iyyCJYP4ut2wSJAZ45G5SJnXOx1g7
 FleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225944; x=1739830744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=na4NIhR7KjWn9JvA007jmUlM2ztPp6QYgo9rPBZi7l8=;
 b=cqptMXkBCc/GkLctBghxlCPq5bxNtWJ9DuKGblJc+SpUSnaXGtbb2gNJximRgx+kOc
 HvC0YXT9tojdbA5KTeh/Y36yr5vq7eXhFZ6hFBh52LFw0OBhPFefwhVAkrrlB45oZKoB
 fm+1inqRXTpF8et3j4Q1MODZI8xWmrBRWgZ2Bdr0W24XXub/8JgijGUbkvx036bsyKCk
 W++j5qz0OGiElYhVGmLywPW0vmM4xpWcHVKIFkvOUJH2IW2j5dywC50d1Wr+9Mg3InVy
 /X7Pm7NYCwt/eEbK6q6UMjRwK90f7ZaGWIpZuNhTPrEHF6gxNuh0+GOWISq5+tgNNMsT
 5D/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc/B9BJctFr35dwPb+D08LD+2hKPiqY7HTP0s877lVYWsOl0XI4uH7ew2pwkG5HyaVbn2knzkGPxJg@nongnu.org
X-Gm-Message-State: AOJu0YwTcPmJbj3NIFbgBWS7CsRjVZ+3R7MZtFROg+yriWMzBfRC002t
 LPoRLnZaSj9HdJowzzH041xhNSXb3ac726AoMgs9yF0l3nmE+JvNblPaf9JiKYI=
X-Gm-Gg: ASbGncuT2IJ5kahOyPe10D+AzQjJudhilcMIQUeLo3HuY1+70x6RioXpzKrZpherCiD
 jA0fSnGd7YhDWq/S7JqfrNtelPxfLlkP778EQkS9hO3ib21mRnksAbEGc29otPRA9uv8p85uxHa
 vUSNOTJg2I4/7vdk6x2HSBPtKhSYGt6EzTHODWyn9YTsN5TBLcGOysHaFfMEg7VayKG+k1dh0vJ
 5JncX+X8MDsZKjBcHu6TYGBDLusy42zVYh/5o5ua9m1k2o6/7yj1E8mRbXCv29m9Tw7lSzp1Z3y
 GolJxUP+U6cBGjgEyrZTynYRkpvJcfMIHSPX/JZyXvIdWc345pN2yzSPuuAzLFA+XQ==
X-Google-Smtp-Source: AGHT+IF1X+ivutFhg212HzDYvb11p3QbwvnR9zgzwgnfQ8SmqYk+TasUSFJ7PknmU9DfcF3SB9N+eg==
X-Received: by 2002:a05:600c:4fd4:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-439249b2af8mr119969575e9.27.1739225943639; 
 Mon, 10 Feb 2025 14:19:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4438sm197149585e9.25.2025.02.10.14.19.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:19:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/10] target/ppc: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 23:18:26 +0100
Message-ID: <20250210221830.69129-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Have the CPUClass::disas_set_info() callback always set\
the disassemble_info::endian field.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 25e835d65e7..e816d30114b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7398,6 +7398,8 @@ static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
 
     if ((env->hflags >> MSR_LE) & 1) {
         info->endian = BFD_ENDIAN_LITTLE;
+    } else {
+        info->endian = BFD_ENDIAN_BIG;
     }
     info->mach = env->bfd_mach;
     if (!env->bfd_mach) {
-- 
2.47.1


