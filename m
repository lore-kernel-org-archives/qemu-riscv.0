Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C4CA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:07:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upTId-0003R5-28; Fri, 22 Aug 2025 11:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTH2-0001yY-UK
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:02:02 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGd-00051n-91
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 11:01:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-24458263458so21227745ad.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874878; x=1756479678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tr18OZZ52dyGR1rp5GdhWCgXctWVe7+fEbjUyyRt8KQ=;
 b=H6g4C+FCAnQc2VAt8ENTEU1uaOosyBORkscbOJ1EkOXBS7/NtxKHGAA0KQ2izo+Tpw
 jUYf6WUT7xVHRFp46oPBBtGOXiizsifkgiBRoAZJpIPGmulY349jK9I0wXZF3dErngyc
 1aK936yF0hFykQHHDL5+AkYJ2T8lj87j/QTppH86CQ3qtq6JuqLOWSzFqb2v58gMnw50
 34/HfN2/ByiZOiKA1n03Mc1XkCHe3WX5whbMUkT1tuHOXwY7AL1HUVkeOMEbKfFfkKn4
 x3Ei4z18u3speVEuM/eRye9O1IPkoAYtC4K6XLeVoRpr61VPg1olTnKlCBPSR/j9m7js
 HqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874878; x=1756479678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tr18OZZ52dyGR1rp5GdhWCgXctWVe7+fEbjUyyRt8KQ=;
 b=seHT2hFq5xKBUTUNQg1MoQabtfq/qyMAXMIl7FfuJ/hEaJrk83PcEdaqW59eRD7DDX
 xyaOkXgouItAtkZs0ij8bwc7xJaFPtlVruhsjnTKIEnJjOIxUH+fllMCJJeKasb3RKeH
 qlwE0vEEtC+kxRuoi+T38VHVU7RwI+ngOjkZkCgJ6uCmp6k0eVcshsKuWlgzO3Zu5TrG
 IjtVspKjjfhfy/ytgCN0NPoLcPuoAto/vdSWHGfXQ+5lCSs8vFZug/Ee3VeR5UcduOA8
 6RbZFVpX0l2t3xNUY4NMSVm1wSf4wtIc0yAw7v877bmZ1NF4bNawxyPUx4xhcwqp5xh8
 cb2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJrHS4krYJU4VlWQDYzOWuYTlq1V13VCoPckdphuQmiRKFYYMDtfPbpFHEYR4nrnUK3tgLGBPtnd2y@nongnu.org
X-Gm-Message-State: AOJu0YyFjkWcADzNy9CDjB2D800oedduToO1kzJZqpZqsQFv55IRMiFh
 adVO0B4zP8b6CqV1OfgtTWlTawrwR2oLv4X7gxzqL9N+2dwuLeBJdULFWzWGBn6OJYM=
X-Gm-Gg: ASbGncvsTB8Eq3Va6oGp6ziWCq4kGQ8HJUBxw8A+BzsEQks05r3DP7GpPKt1sYZsCCQ
 n5wAmJ9OMXdjG/rlzXTFQfh+cR4uaIk1+pL2XJ9lJnUgHJPsYKQR6XbbJ2RrKNssBBFya12WyD2
 2MggS5zyzVsg8T3NdP0mnqLE/EvY/ZaLAq+7qpUs1GFsLLZhaBEGELr4ut/UMGBCTFqsVhki/nM
 XMhOVK+AZ7yso67DaLA7RI0nnWSxuym/BtB7MrNLGCmqZ+j1gzFHb9d/czYqkAGFwnrC6ycxWC8
 l1YLb85YfaLY49gcJjyL8yyinnCa6Z3j1EoXswnmplL5r4tjrJrviALryUyVlzWpW5zzLjyInxq
 pC2zOqvFQ/TaqBEVafTZfEfIFUesXc7rNrOW6vdUSLF0=
X-Google-Smtp-Source: AGHT+IHmY1fp1Cnt5Cfmqq6A+WCY/Utr6plzTnkgl4R8m0dB61vyWEpaa6QPYLHacKF/IvRmjv9Mqw==
X-Received: by 2002:a17:902:e84d:b0:240:417d:8115 with SMTP id
 d9443c01a7336-2462ee1a943mr51648885ad.16.1755874878302; 
 Fri, 22 Aug 2025 08:01:18 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 11/12] semihosting/arm-compat-semi: remove dependency on
 cpu.h
Date: Fri, 22 Aug 2025 08:00:57 -0700
Message-ID: <20250822150058.18692-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 55d7bf29ad6..a14de23d45a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


