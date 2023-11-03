Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7FBC4167D
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0LZ-0000Bq-Ht; Fri, 03 Nov 2023 16:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Kw-000898-IA
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Kq-0005Ni-Bb
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso17531705e9.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041603; x=1699646403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOqnYMzgaGsmQAv+x6tXhfxA9uZJN4iQTJsdqhjfa28=;
 b=XKIVIIeAwb/pWmcOfETXO/HY2D3p/WyIr7W/m0acW/mR8ShxDR1FDhErXGAJRThTEJ
 c9hJdGaso1bHiB6cQiyz5FgDCJwzk9czmAmIR/FcW6zDPA9Y4TpSck5CPlC+MavBa5KP
 cT/JAsFdWtltqVkF65Sm7y95S6snYkH5LSdG6KenPq0piDjGtnrGg2flJziL87F/ptaR
 LoCUGmSP4z12jYB0iHOpN2lj7CYqUSmHSl+KGVUUfPqqVQNWQNy7IyS5f4MZbnwNbpQx
 VcQMF2oeI9urMfki+QdMXekf+EHu20c7nS3vp2UEP5lqMSi5GHO9NCLluagT+Fg4+L2j
 eKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041603; x=1699646403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOqnYMzgaGsmQAv+x6tXhfxA9uZJN4iQTJsdqhjfa28=;
 b=VqqFNh8Lxiz4ZzFQgY2taUWgRoB3pyHxyMLzejh4qnDPgK3iFhAl59a5fRDfAoWmaM
 4ElOmPj1v3pQHKUzv5XlTu84X4kRGlDg1klGqz0CaFSqEH18XLKM4VIM9ZKvTudBCvUE
 WWEB35IGeXiIuPPdKgXLMzI7dW902VvLljoEoBK47y26RpQBHC7IESyv8cy/WHudWim9
 a5dC28ZnJ1CB0wrci3BU9QQXtSoWSJPoFG0cCsyYQoDTEGotjwrsLScu9dqesSiW5g3d
 F0ddO+j+Q4kYVBkie/eJpseA1AzHmufT86wDvwkHlqqbTG2EDgVGNTSxI//3E0x1Yivq
 3wJA==
X-Gm-Message-State: AOJu0YxOaSMxxg8n8T/xFj1DUXUkVSkcLjVFOhC72pafzTu10Si5XAHn
 ADifwzf3aQL9qmK/GDCjWdG70g==
X-Google-Smtp-Source: AGHT+IFbCNVfU00duo6w0LFutG8dZyPnarbZPQ+cFJ3BFR9qm2Tnlj1AbhEXJiHi1Q/VMzCOE7tsKA==
X-Received: by 2002:a05:600c:4687:b0:409:5a92:470c with SMTP id
 p7-20020a05600c468700b004095a92470cmr7452713wmo.13.1699041602815; 
 Fri, 03 Nov 2023 13:00:02 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bh7-20020a05600c3d0700b00401b242e2e6sm3562227wmb.47.2023.11.03.12.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:00:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 252A965744;
 Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 05/29] target/arm: hide aliased MIDR from gdbstub
Date: Fri,  3 Nov 2023 19:59:32 +0000
Message-Id: <20231103195956.1998255-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is just a constant alias register with the same value as the
"other" MIDR so it serves no purpose being presented to gdbstub.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 104f9378b4..a681bcba62 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8993,7 +8993,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
         ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
-            .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
+            .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST | ARM_CP_NO_GDB,
             .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
             .access = PL1_R, .resetvalue = cpu->midr
         };
-- 
2.39.2


