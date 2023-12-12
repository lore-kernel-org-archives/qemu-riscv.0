Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2077C46CA2
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:37:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1zB-0000jj-QO; Tue, 12 Dec 2023 07:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1z7-0000WI-73
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:37 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1z3-0007Rq-EU
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:36 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50c02628291so5906053e87.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384530; x=1702989330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWTWSX0YuZXSOblIfpck8oXRK7z4+HrveIQtpqWVbLc=;
 b=R4mMcVNa+UV4X8s4FX6XEmoG7d4qmDsLXRUEK+Sf/KC7oSMdC3bzuf6h1C1ILQExSP
 cH9Omz4E1FxO9Jfen1i4n7W8L+lXT6w6vojvdzBxYrgq/TLHcM/lIvEOTkA/pTuPIwXh
 qYIkIGbVWi/skv6rQnudq8mUt7ecTqIUUTn11RCOMf8HLng1VSQsUkS8wxMEHXiCefTq
 kccFAy7M5pa940fTmj6A/hDfaK/giVwiLy/icigeF2LwJdvX5j1kTT0IAFDQ4Nlds2OG
 bSc8vueHStXM6u4XHCPI+Aj2R5Px3JYZ1K2NLFRgeJYn1fBhBmEYyYeo2OYLGyV3+ZKi
 J2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384530; x=1702989330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWTWSX0YuZXSOblIfpck8oXRK7z4+HrveIQtpqWVbLc=;
 b=G2cXs6NqyauiXVi5RptSDQJeDP/MXY/IMsP4veQUQr0XIWN4xjMgmzVuOaXy2+RV7C
 ZVNQhKSWaelhJ6Gz3gYxWi9WU0pamIqcsFNi9mCPNTaZm10ss/m+FOEu11qI1ATESU6X
 00OhMcMLsQsF1ds61RSD/UiQF/SzPb2R5czwuUSG4r9H05WrF9Du+mi64R7mBh+kLIhM
 EAdi9C2+QLuLePq/T7BHezU87rGOHgcTUE9sJkNPfbVsBanGgNZckzBAlUZRXWFXwqny
 O/+xypyo/ZyZ7OR1L5pRjy73ijlH3ZYNmm2iCnpS+lTqhjZ5FTxH8n91nW8EXPN2wwTO
 qS+w==
X-Gm-Message-State: AOJu0YwccBy0RiQAp7cB3xBbuhYyFYdrl4uzk8cQeBX/tMfR8fLct+KI
 8XcgZTbwplbsGhCHyy7efYM+SQ==
X-Google-Smtp-Source: AGHT+IEhYJrFKPlMafPspSJiUftn6/m/li7QS7vjKyB+2LKFfs8JwApwiBh+ARJeGKVQyAF+ouWHZw==
X-Received: by 2002:a05:6512:2810:b0:50c:e19:b65d with SMTP id
 cf16-20020a056512281000b0050c0e19b65dmr3729352lfb.85.1702384530474; 
 Tue, 12 Dec 2023 04:35:30 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 ty6-20020a170907c70600b00a1d71c57cb1sm6227530ejc.68.2023.12.12.04.35.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 12/23] exec/cpu-all: Remove unused 'qemu/thread.h' header
Date: Tue, 12 Dec 2023 13:33:48 +0100
Message-ID: <20231212123401.37493-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
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

Nothing is required from the "qemu/thread.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a7b5737d3..26b44ca125 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -22,7 +22,6 @@
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
-#include "qemu/thread.h"
 #include "hw/core/cpu.h"
 #include "qemu/rcu.h"
 
-- 
2.41.0


