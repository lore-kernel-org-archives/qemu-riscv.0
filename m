Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1D9C2BD09
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 18:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMtTS-00018S-Mc; Thu, 27 Jun 2024 14:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMtTQ-00017V-P6
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 14:03:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMtTP-0001M0-5Q
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 14:03:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-707040e3018so5698923a12.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2024 11:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719511434; x=1720116234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAEbuMWRBzQhtzD9qy0BIESVSrOd35nsQcBa/S7f+Kw=;
 b=ucUhODRpQUnzl5mVD1nKMZl4ptEf1xudg8JOp+PRtq1tiVI6X6bZmfMDY90U7y82iG
 topoq18AfXYQEaym2iTKmSaAzus09cUqEor2k41CHxEVJyghRVIGowz9WiGxCFUJbtCI
 MUpV+9/SdL13cjZtM403LEKGVzjYxOlcV4djUkVgCKj9Vu16VW6Z8Y/yP4cG2aYH2AvR
 ODk5GpU27rY7MzUtJfhwUhjSmNFlctplOatV1HXsvkc1xsYU/sDYRsyj2Ch3SDrXUtCL
 7s+euDVusjhGT92ZW6et+Ui6/Wu01JC9Xby1MWmX7fgvR/qopbLUy6MWFi5VdGXeGY1U
 J79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719511434; x=1720116234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAEbuMWRBzQhtzD9qy0BIESVSrOd35nsQcBa/S7f+Kw=;
 b=q5alUh7/Vj2EgNy/GUmycVDE3WbRKL6+/bVDJCKVuHSKopLk827i2Amho5nM2HTAZJ
 2bpATp866JClVpOsj0db/h4pJcRbCRfwL235AcNtw5/TymO0urbVjJYs93bmbWLd1xTO
 OlkCGZmwfqGyPxl8qE6Vznlz+T1Ua5R1bfmhcl00SztCp4EPkS9RlXdsQency6d4SkJF
 i0KWM410nIklFwTXNv1eEFT1n2EzZvEoS81B+0cew4dMKy0WK5Zqdj1Ul95N/thGSwCn
 A+KV8s2Ay6daO7ZYNMFFFQ1Zf495qqFdabzOJzWZtZpd3HirlRbzHOXXxlVTJTByzVni
 hCkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGGlcGpzYcBHbcuqFC0qGKCLQwZPnxJ0cSM0B8xpromHSauwlVt1eqJV5ApekUxwk9Xzqcabs3W1QxBWiXChsRwrWuvvU=
X-Gm-Message-State: AOJu0Yxcx0iw61Rjpk3HnAE+WtJZZbNPvbw49Gc+Ri5q74QMNWF782Qy
 lRCLtVNWUBVd3dce8EfxhUAzbH60Y3BVvEgZZglQPa3jPB4vtVKWZtGaO8+D1lA=
X-Google-Smtp-Source: AGHT+IGXSFP2+4psHHtj7esSeslMhh2C2UF84vt8IthcQqZ11PSL1nqfb2oPk9IXGLeFYnnwxWNdaQ==
X-Received: by 2002:a05:6a21:3289:b0:1be:cea5:c77e with SMTP id
 adf61e73a8af0-1becea5cf6fmr3546140637.7.1719511433704; 
 Thu, 27 Jun 2024 11:03:53 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70803ecf764sm2170b3a.106.2024.06.27.11.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:03:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/3] util/cpuinfo-riscv: Support OpenBSD signal frame
Date: Thu, 27 Jun 2024 11:03:49 -0700
Message-Id: <20240627180350.128575-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627180350.128575-1-richard.henderson@linaro.org>
References: <20240627180350.128575-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reported-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/cpuinfo-riscv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
index 6b97100620..abf799794f 100644
--- a/util/cpuinfo-riscv.c
+++ b/util/cpuinfo-riscv.c
@@ -13,7 +13,14 @@ static void sigill_handler(int signo, siginfo_t *si, void *data)
 {
     /* Skip the faulty instruction */
     ucontext_t *uc = (ucontext_t *)data;
+
+#ifdef __linux__
     uc->uc_mcontext.__gregs[REG_PC] += 4;
+#elif defined(__OpenBSD__)
+    uc->sc_sepc += 4;
+#else
+# error Unsupported OS
+#endif
 
     got_sigill = 1;
 }
-- 
2.34.1


