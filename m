Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB924C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFB6-0000dm-Lz; Tue, 21 Jan 2025 09:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAz-0000Xl-2f
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:22 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAw-00035a-JF
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:20 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so3264202f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469457; x=1738074257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TsVY/fcRHeZXKk3a5d2Km1G2q9T8ML5TT9t31iGbzvY=;
 b=NfXod6/rdzemCPAe4mdDtTTVgoo7y7nMq/o094G+cJwnJVpmBIVRUmtN3/9cGuec6q
 F569eYFvRyOERouYEgHCZJWJWy8R7tV1bnzas6k7NU6C5NH6VTpEivlFkAoNypY4q90W
 wbHP3nMRf0hqL3pZR3sV6GnloQyuBIzykVVAM3ni1ncbsVOpAqnS2KtgU9gE21WD7rt+
 e4ihH6NFnbH+LxSOh/AtlrUwSLf9ITzyweCLpqJEtVI++sitzdu4YhzFegx4cCLdLirI
 UJ5aZzLty/1JmI1qt1aMgdsRH5IN1dVw9kidF/s9WZ9MrhDIs45BYqeSFKK9JlvJxIFm
 77sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469457; x=1738074257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsVY/fcRHeZXKk3a5d2Km1G2q9T8ML5TT9t31iGbzvY=;
 b=nkBjaPY8CUTQVwh4Y91yo7Ef17BH4zqgStp3ZwqTxyvp+cBoZ0bUh6m/8oUxwywJV8
 zkIu99KUqujLERfhD8cqUAzWGrMbn98fjVw2+X6mmNOZuvSSsmSqJFmEyKx46wytfULF
 s4skcTPd7H9iaWTzdIcx+RIkOpZ3Z1RPPCiE5nyHLntjbse4c5vMsrUtNknMGYQ6hbW2
 TNz5Mbj0wC4VCajjK1EvB+R60tQH3GWcP80i0cIIR1Rn0LzxDH6RV1MgS7svbmQiK4Ll
 +TcR8wVd5vQDCn5azkZuqOkkuhi8rR24rpNDVa+cwMgVAxknSchcp32RKZY87wAjZ0Yj
 9cQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr+DPghu7P5rd6iEfc/86NgbNi6JnWRr6Tuk2FJaGnlzm+46/ReYzRZwAqFrQL2E0Ck8bbKhcGw+9b@nongnu.org
X-Gm-Message-State: AOJu0YyV1fV2Ou8tevzdqW17MjgGfk9fA3CovlhcvxF+Z8Nuy/0AiBLx
 mQ1h5OmMvcyU0m5+yB2WjyyQCkj1uJjg5vp1A7f4utG3ehSGOAxvTXFZ+Vc/Ofw=
X-Gm-Gg: ASbGnctn7rtNSHuZfoSPdXRsfbcBh4apQcRCWeL/noHJmAtfWkziDaM402x6jpL4mXE
 i0o+LWD37KpBEIcGIRoCTuPaWRPWxcAJ/0QjaInWuZH6G1UA6N/xeRA8Z4aiOAN7KF/pKvamRL3
 TIouuXquBGtv5FjxD7HQf/PkFVR3Q4Oy0O/yPOpSdPnNGxw8zbGrnRVp3WR9Il65k12Zz5USGMl
 LkFq5TRliSIkwRex7mjHopbNL2+DZXQxkoAvyIZ39pBGN+BoJCdIntm2jGmQ4C1Xh8vDqooldyo
 XzMVSXcGOQRQOaALk5UrSCQK8N+xlpJ0yVJyKBFey0xS
X-Google-Smtp-Source: AGHT+IGTydqLNfzweZB411kRbV7hpURXpknMF7xt9dbj/T0lfmlVTsVP5DxJy6Q4H4Keq+8EUtkGcw==
X-Received: by 2002:a05:6000:2a9:b0:385:dea3:6059 with SMTP id
 ffacd0b85a97d-38bf57b64d5mr15824747f8f.49.1737469456865; 
 Tue, 21 Jan 2025 06:24:16 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32755cesm13442420f8f.78.2025.01.21.06.24.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/28] cpus: Introduce SysemuCPUOps::has_work() handler
Date: Tue, 21 Jan 2025 15:23:20 +0100
Message-ID: <20250121142341.17001-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

SysemuCPUOps::has_work() is similar to CPUClass::has_work(),
but only exposed on system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/sysemu-cpu-ops.h | 4 ++++
 hw/core/cpu-system.c             | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 0df5b058f50..dee8a62ca98 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,10 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
     /**
      * @get_memory_mapping: Callback for obtaining the memory mappings.
      */
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 16d5efee12d..7b16bda2250 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -25,6 +25,10 @@
 
 bool cpu_has_work(CPUState *cpu)
 {
+    if (cpu->cc->sysemu_ops->has_work) {
+        return cpu->cc->sysemu_ops->has_work(cpu);
+    }
+
     g_assert(cpu->cc->has_work);
     return cpu->cc->has_work(cpu);
 }
-- 
2.47.1


