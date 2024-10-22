Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A967D1714C
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 00:14:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t32VW-0000GN-OR; Mon, 21 Oct 2024 20:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t32V5-000089-Ot
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2024 20:11:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t32V2-0005WR-1W
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2024 20:11:51 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20caccadbeeso55522865ad.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Oct 2024 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729555907; x=1730160707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wtdGS6j59IEw6lp5Sp3jQrC+uEbTCdVdwYMkROoHlk=;
 b=Dx3puJDS8mIOKwmY/eoW7N+ycmwirbpIKtqIqarukorq5hOU7sdJBwzkapReKTQZ9+
 EZwpFQr/tpjE/ShbpW/KeFrfYCepgSXMCz8+rmeyFKKUQPP5z6jSut/QVK4Pkcx6tage
 8jGMoN9e4cZUEwY+blfKHlwZSBag1W90S23ZZ4W7jFvfCK2lP9e0kK5jUgO75XUwQkvz
 VX1uOuDpaJlxoTW8bhl6br6wz/60DZhczky4INolvSxGyc8u5aJP0u8uQtt/6kBtKTZA
 5zHNxnBtuqw5mLwdpW629H96Xd9qNAIWNqN8Y7hvqY/iVlsFXldhoxXQWWgbZJsDuzxD
 pymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729555907; x=1730160707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9wtdGS6j59IEw6lp5Sp3jQrC+uEbTCdVdwYMkROoHlk=;
 b=KaMdcyJeq8fijJClvMIK7S0W/6lA49snl1sNuCpgAWMpGwINJs5dpkt/OuLibmuQ21
 5VWFN5LFB/596+kW2cjRJz4lBzdW6EMY5n6hdNeSYl0AlMAy5JmZUe91IjYM4FSQwYHx
 UFONrV3IgGSuqftgEp5Xvsbxe2u+3aUD283tv/jhCSYdyqVIWax6LeNoNM/mKRWgOihB
 ByfgYzXaWq/7GojWPHAMR9f45iw7l8Xeg08QS5DFgIxuJ3HXoUk0V1g0Z9eE8gGW338s
 xN9ZYInDEEBhgFp7Ck71xUljihaRLX25URr/JL4Sd2dJIOIBo0nIAIS3ZMNwnJSLi4F6
 oTtQ==
X-Gm-Message-State: AOJu0YzkmteJMufgrwly1ezjH7wlTtBEddz+ilBsIEtww9DO90muZ0vu
 SQsOMx4XCBhFWjb1IU4e2o3/g0oXLT/GGGrG07xj2nvOQQmRY0JgcQleQ+PML/0=
X-Google-Smtp-Source: AGHT+IHPaxHbm8kB5Pd/TaU6LDvpmvdcS5seUyDuZF135l4WnhgwA7oolvXIOH+MXmv4AT/JBA3iUA==
X-Received: by 2002:a17:902:e548:b0:20c:b483:cce2 with SMTP id
 d9443c01a7336-20e984f03demr8796355ad.60.1729555906664; 
 Mon, 21 Oct 2024 17:11:46 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7f0f6462sm31681145ad.272.2024.10.21.17.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 17:11:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, alistair23@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v7 14/14] tcg/riscv: Enable native vector support for TCG host
Date: Mon, 21 Oct 2024 17:11:34 -0700
Message-ID: <20241022001134.828724-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022001134.828724-1-richard.henderson@linaro.org>
References: <20241022001134.828724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

From: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>

Signed-off-by: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20241007025700.47259-13-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index e6d66cd1b9..334c37cbe6 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -143,9 +143,9 @@ typedef enum {
 #define TCG_TARGET_HAS_tst              0
 
 /* vector instructions */
-#define TCG_TARGET_HAS_v64              0
-#define TCG_TARGET_HAS_v128             0
-#define TCG_TARGET_HAS_v256             0
+#define TCG_TARGET_HAS_v64              (cpuinfo & CPUINFO_ZVE64X)
+#define TCG_TARGET_HAS_v128             (cpuinfo & CPUINFO_ZVE64X)
+#define TCG_TARGET_HAS_v256             (cpuinfo & CPUINFO_ZVE64X)
 #define TCG_TARGET_HAS_andc_vec         0
 #define TCG_TARGET_HAS_orc_vec          0
 #define TCG_TARGET_HAS_nand_vec         0
-- 
2.43.0


