Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1282C83F15
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 14:57:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qadfE-0003Wr-Tk; Mon, 28 Aug 2023 10:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfC-0003Vf-UE
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadf9-0000he-6P
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 10:56:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc23eso31220575e9.1
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234577; x=1693839377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0c9RUkLqeb/dUA6rdk/b7YWrq3qs8i6j4y2xORygss=;
 b=lMCqUxq3kCSkpFfLlHaGc43t/H8kjzJrNqZwgE8+i7pZkWKd3kZ6qy0MIKlsaTCpa7
 OZd840XQDIqp+YbIlyMK96SA3+Xs6c1VkYI9QAQOfLhuDkng2U0COkn3itO7AxYGkY4X
 5QeCCX2OKwa08nsl1O2CPfZmYZyqJ9eh3k/p8K1EFfout35o2I09Nh9iuMeQNumMrOrP
 7tyeLSDXjREbmxvF4BioxA5wP18FUatwWiz/Q2rR+12L9XkZYA5RZb3riKR6ahx3gSo+
 P+70K9Sub584uZBhO4dbH8smLwYTtfKGr82TYCsDFCbL/IwKvjNuFMPqEbs3UfpPrmGV
 Vq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234577; x=1693839377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0c9RUkLqeb/dUA6rdk/b7YWrq3qs8i6j4y2xORygss=;
 b=ihrR2AqyqmTJF1dXjdbdsAA+U/vnccSPEjAUvLyMIcbRpslxPTx/bQlbotnAdTiMZW
 7Lv/wXhcGFohT4hqitqBwE8ngYg24orbkwXyFHZo6Ls+vlK2wMpVwFr4AtcTgzA+G1J6
 qdCEy6ZBX5iC0nKwrMwBfYINwIAMW/LXPp/gFsCOK1abgfIbn8dxPe3TF6JWdeXM4j+Y
 u9hIwLfASam6JZ2ttyLIn7kITYOR6aaoAWEfKfD0gajo+2f05r/1XaJqzReHRTj75QSc
 elgm50PywAk2bKZ6+IjWTkTX6GAqFD3Jf61if2hdEJZNvJb++PNExVwMd4kjLzd19jvB
 6c4Q==
X-Gm-Message-State: AOJu0YxHilJNQRc3eG+kv8JcdyiMk2yn5QBWkDazpouPozwz+ESLVmRy
 foCrjeiJQGAbCuhMC2TbJKlFcjsa6blzJAPImag=
X-Google-Smtp-Source: AGHT+IH8LHJo7gZTtmitP3v/Wqoj+m6D0mGjMDfoK2eVsNPqEevC5RGFoMKtQlURFl4sVPTrgARqgg==
X-Received: by 2002:a7b:c455:0:b0:401:c436:8999 with SMTP id
 l21-20020a7bc455000000b00401c4368999mr3828849wmi.30.1693234577802; 
 Mon, 28 Aug 2023 07:56:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a7bc4cc000000b003fed8e12d62sm11070682wmk.27.2023.08.28.07.56.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] target/translate: Restrict 'exec/cpu_ldst.h' to user
 emulation
Date: Mon, 28 Aug 2023 16:55:42 +0200
Message-ID: <20230828145545.81165-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Only handle_sigsegv_accerr_write(), declared with user
emulation, requires "exec/cpu_ldst.h" (for the abi_ptr
typedef).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d02517e95f..b2f5cd4c2a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,7 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#ifdef CONFIG_TCG
+#if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
-- 
2.41.0


