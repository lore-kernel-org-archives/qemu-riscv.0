Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1051E7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 19:15:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMB2H-00037y-Gv; Fri, 13 Dec 2024 14:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB1o-0002Vw-IB
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 14:08:44 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB1i-0006Xd-Gb
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 14:08:44 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f31b3db5ecso794443eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 11:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734116916; x=1734721716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMmfxBtIiIXQAk+hQuWMNvOte8CftqHpp2z6mVglAAg=;
 b=PsxB3Kt1Pk8kIaIYCsx4pH3CLcCzmAfQl5wzZhRHjwv2y14bVCXrNxWcztlBvtMqoO
 58jJvPb7Jn0wJeLovvy8kpVuG6To+UpTXbTqbJARQfTNsEcCNgLhnifJX0re/MJDM1nA
 fCXIz5S25ozjGGYHeXg0EbbXMY0kmtD1mOHEuaYN56ZTcdcrhrJ/DWzGGGY5tx8EPTeg
 mSgm0c28nbL4ykBAKfHGLHj+e+Bw//Xoae+2k0itRS2JeFQ/IvN6Ogk9WWkgFZaaUjcv
 VeMmlFfxrtC2O89CqlJeV/cJGWRZjh/FxTOBWkGJKfNgbK0fX/BbXLjVTRW7Pog7KiK2
 mRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734116916; x=1734721716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMmfxBtIiIXQAk+hQuWMNvOte8CftqHpp2z6mVglAAg=;
 b=a0OZmYKWnOR7UeniTNGzOPcZWlDtBNtoYlAQPTSxHh4TktxKF5sXHrlf5uoNO5cr9E
 3NLaAkXjN9oZvbbbLXlr6Ozl/OUBcIbv9wt5/buJ1X3r27viIFnbJAUckFCJbl1uucoU
 N24o1JWnU9T862L0QMEhebC/Hv315uGgGdfM3H1TT69nERsngF9qfRo2cpZoO7oXPKBI
 OvC1298YbBiWfvpH2BiL5ojSXrNn0DRb+0DW0G0PbsQDsweJb426dWgULHtVnalGg9JG
 wQ7jw7hfGSXuBNt78OV6cgBgnXeXlLySgAbYs4WlhdTRuMQ1DotlUKYQ2ounkp+gorS/
 +ZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5MAC+4405N18SUqWscSJysHGN2NgsrIRPJw7lHl2Laf5yWWi1LHQIAFRzVzp6QevaYg8+lBO4mbKw@nongnu.org
X-Gm-Message-State: AOJu0YzpYSxEXGqlNgnJHYz/TifVuSkvrAiaTJs0rvG/56R8xTu9dpxq
 0D+soDv/FFQrWWeNgYs9ARS/XFzLTksx7TE3vCH+/LMZGEd5IpNvuWuzWcPmI+s=
X-Gm-Gg: ASbGncvt0IP5XoSEUZknfuuXrqXr2tNW7DwuRtJvDRRB1Ho07nleDoV2efEhfsknpCE
 g2T4xf+n0d6LeFZ9ejZzHfrnA5JVY7BAGVdWaX9KLGok3IA9o/dmf4gjgn7uBaCCV2ZGf8JzTgH
 aCtQWSSDHzloA6w6G7QtiEpeJrSo4XEqVq3GWeR0mUsIe14NlGgkFkK1xXM+rQc03fH66Yf6f63
 R82yAWnR/2N0Xi+BB5Cqd2WdwZuEnOuaJ9tqRcFAnhxXOgvVpsaXs7QGzyrnSd/
X-Google-Smtp-Source: AGHT+IHR9dtrRL4g/E7x0+FRYpPWMzlKYyihfOxPXAT7iSgrm3iYxLMSyRaqRPWEIdZBAwzGSr5TAQ==
X-Received: by 2002:a05:6830:380a:b0:718:a52:e1cc with SMTP id
 46e09a7af769-71e3ba3a182mr2496590a34.25.1734116915785; 
 Fri, 13 Dec 2024 11:08:35 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:08:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 08/71] target/riscv: Constify all Property
Date: Fri, 13 Dec 2024 13:06:42 -0600
Message-ID: <20241213190750.2513964-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 80b09952e7..4329015076 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2661,7 +2661,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     NULL
 };
 
-static Property riscv_cpu_properties[] = {
+static const Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     {.name = "pmu-mask", .info = &prop_pmu_mask},
-- 
2.43.0


