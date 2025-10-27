Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19224CCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDLA1-0007Dg-6M; Mon, 27 Oct 2025 07:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9g-0006d2-Ek
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9D-0007do-BB
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:52 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b6d4e44c54aso794496366b.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563538; x=1762168338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGapUoTaewrM/kono1/xvH1foLM0vdOPsMqSeCNHNKo=;
 b=TPCnbBCw+kIl9OKanfgeySBuGrIOk05JF4J9dLOG/QEUv8A+CAsGD0YyXOR324ou7j
 ArSgi0Qfq6kAQxmzjZshsuZdkjTPg1PvKabFsqvA5Ie4k2UST/wu4tcz6BQF5hppWDfE
 iTx3r+h0rGIrFY0Bwip8YymWXy4JRKLfzlYJl6KOB7tLQq58FkNzM6mluwQpjjiedBKA
 77TtnMJArEO6degYPA7P3MrYpEUsLurHWtwaHMGYfFqvEPOvq8+i8oUDsx+/dBkn9mdJ
 UeO3PjYjW/l6mXbG/YSnnzQn9gvIas//U+iNrhX0R75kUBWhYKoTxXEXtjxbTehV10Bj
 r1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563538; x=1762168338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGapUoTaewrM/kono1/xvH1foLM0vdOPsMqSeCNHNKo=;
 b=TCnTWQhpFJePkBNbIArFaslJPIgExkONbCs04N3HMiVLVv9to3bhyxaaWlCVlMLpmN
 Xjpl7+TlA6eiIULwmUV9/TnzPU8f2d0z9uLNnuFKNel+YX4HnLrDcC9/avapImfbFaHu
 eip9gl3fcyRzLLpKqVolfhTgpC0MrRT/16RGmmUuBQGkVHLNlHlvbirjWuHWdJYhPWD1
 3yHzoX001rS1W5WrNivPYA8fE+dohBvX1Em9qLOiX5KFIA2XKPrZhr02qQutMUCI3+2e
 FnX28vSIbrrvAJzM3xvvHDI0hsqoG9+ImUu0+3r/LxzI0dfIAYltuDufth2uYJ36Tgw3
 RfkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVA4hEBVq15nPLmWdkeveoydb7PQnqbDWXPoiq7aFMSasast4xsDRrrjHTILn9kUOWsi5D1yZJyGeo@nongnu.org
X-Gm-Message-State: AOJu0Yx2NMbJ9FMl54dfhEvvtIPgJLbqirbOJM3GTVgamYaW0xorDqAF
 f/JoPGcDDTfGOXCGTtPE+CMSFrPxRCPndtOP2u29zYgHnKkbXSzswLZvnWfdnJZ/2cQ=
X-Gm-Gg: ASbGncur/ykEPuSg+7axVcu+R/wD89EuFu/5WZ353a3XX+lZ3Cj6G0MpKeDEKsI556s
 C+fAhz45z2uLyWbTNSSFZa62ULG0F7upmSMOCp2zF9zRSnZ8DwxFa3pA2wnEfPZ/QHqbqU2v7nF
 kwlEvlMAKGN5bvi+upGNetfz8dPL7HzOjIADz8luaa4YG1S9bpe0A6l75TeeSaSTv7CGVtLO3t0
 SkG7Pokarrcy4qJANrL2OwQpnx5l7xPND3jGvByy9n/Pkh6Sinqv7FbAZZTILB0yWrrdx2RxwVD
 KJ6GkKybSrJWtF+Rme2uuSyMcP5IqJLXkeIDhJiAMq/k+afkqzduVUgoCr9qosTZq2R9AyWHize
 zeqce53YRUU4vgVpeuW4+Wnjd6fyvrPbJ/sBRk/II5NaWUWkL0flj1mfI5Ligswwb7lBbPc466Z
 XLsURcPcHOhhU=
X-Google-Smtp-Source: AGHT+IGtBMpHIebheyONrWsxP0glj3ZoIlLecwrjIGlCGS2qBmkZj9gRmSWXNpNrJHhHYenJu4IrlA==
X-Received: by 2002:a17:907:1b0c:b0:b6d:2f32:844a with SMTP id
 a640c23a62f3a-b6d2f328766mr2021446366b.22.1761563537679; 
 Mon, 27 Oct 2025 04:12:17 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6db2b010d9sm87578966b.43.2025.10.27.04.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A2BCA5F909;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 27/35] target/tricore: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:34 +0000
Message-ID: <20251027110344.2289945-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places an exception hook for TriCore targets. Interrupts are
not implemented for this target and it has no host calls.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/tricore/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 610f148a237..2c8281a67e0 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "accel/tcg/cpu-ldst.h"
+#include "qemu/plugin.h"
 #include <zlib.h> /* for crc32 */
 
 
@@ -29,8 +30,11 @@ void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin
                                    uintptr_t pc, uint32_t fcd_pc)
 {
     CPUState *cs = env_cpu(env);
+    uint64_t last_pc;
+
     /* in case we come from a helper-call we need to restore the PC */
     cpu_restore_state(cs, pc);
+    last_pc = env->PC;
 
     /* Tin is loaded into d[15] */
     env->gpr_d[15] = tin;
@@ -90,6 +94,7 @@ void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int tin
     /* Update PC using the trap vector table */
     env->PC = env->BTV | (class << 5);
 
+    qemu_plugin_vcpu_exception_cb(cs, last_pc);
     cpu_loop_exit(cs);
 }
 
-- 
2.47.3


