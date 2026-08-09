Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298E2C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7c-0000iI-De; Sun, 09 Aug 2026 18:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7b-0000hO-Ft
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7Z-0007IP-IF
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:35:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cf50c6f235so13090335ad.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314956; x=1786919756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AxawyJF+CxMbbSAkKOZ1E7lL9hppsqaxpuxPNg9KJhc=;
 b=KBlX4Yn3lhVbATv0LMArVnh7PyxytRQk1UEcnG9ykl+OENXxAXyA6LDVhYtNZOUSDV
 rMR0ciCmhTD4YguRA9WRXT8Xcpzg3EEhYeH3bY96HjeY8R1XaNA/V2XwfFg/L3MR97gP
 SfiFnMrql8fA+/8LgUURVtk15VsgNZF7SrLOCPsZbka71CFpeC1iJNyFofngZiAPvctA
 DLyP9RtDCXMhIpd1oZKB2uP2P9D2+JZAwl+e5X4rP7hrQuXVIjNykIWuNtXo3Ox50E4y
 ZDuBNGuXbvcw9Ru8atsUwRHv5HGXG5PhL75NQX5ynE3pf4K4hramu2NmEm8Wj5AQg5RU
 31TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314956; x=1786919756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AxawyJF+CxMbbSAkKOZ1E7lL9hppsqaxpuxPNg9KJhc=;
 b=fEU7huAS4UYT2QmTAvRTNCs2cQHT1gtoD7mEwJvmL9vNcfHpSwVsXuzfniJX1XNXip
 vNrvVApcMvVZWHkWobLUBC+KR4RRsKLeiW/ak393KVSbLpOcAIni1MKDHdwWQ5Jhyuy1
 zhUNgDQb3VRR84UcYl2DMT8Tz5HKtr8OGVrAMd70usRpsAc1L4rGTEgQyPa5RHuVjSyL
 NFsMGl4ifjbsrH1BuAvfz/niyqqe73X+f/VFXI36ioci7fHJ+aNiPuKbbCXHfP3GNhaW
 dwljgr2owfR4jMyx3FlIc2jkPO2EqdzGaZ0+TAsMa7n01PlKhxFC/yuRxgdlTQ+rI863
 fPrA==
X-Gm-Message-State: AOJu0YyXEztAMbhaLZhoul18Schj/dQm1wnM+xGxpEUIHMlR8Hybgpcn
 dwpOSb7YrYoeUg83pMV7T1LSGSTEiFrFobwYb847pg/UlW4sc9I78/Zs3sEq326DOX8DoevJF0r
 xImVw
X-Gm-Gg: AR+sD13ttRk5BlhLLnJn87NMo9VcxxFulF0zCv5en0UlEggjC8VIcPXbL+Yr1KTodWK
 Ouwf5VK2lPIkBmKTydGeTp2voR9x+8NvrLrhNitoMNNKac5abLZJ/WjGbL1tGq4KVeqMJtVTodU
 G8kWxnf+eD/phS83fwei279Qwm459C8O/tOe0NDZkNe0LIcrnjBy9sPMaKU+TrI2NeZrzUA7aoC
 NbBJ9HUfiZQunhPwRmQb7oM/urmb3wWlfhtIphRLkeXSafN08dIs6ISDeFUs80oVdQrUHKcqjCy
 420eBhij+PBakGhsRAdpeUOyNR8JhgiEXXRl1ee+Rnkip2VS0BFYeX611CkzNadxLhv9jH+dA99
 OZ5dESRs8+/WdlzgiDNpjT9odFT27C35vBZzKcp5zBZkqYgQUIgYb3pPLwFAXgznsLbJpmueF+1
 f1leOeG4ZQtLjQnexGIGgAdSHNEwgb+ZGa8CxMOuxS/o/WGkC7EWLMlF/kuPXRspLkMF6G+xjd0
 ZYDiUqFhxqWsDZMcW4M
X-Received: by 2002:a05:6a21:329d:b0:3a0:bc61:62e6 with SMTP id
 adf61e73a8af0-3cb85dec66bmr39506448637.8.1786314956275; 
 Sun, 09 Aug 2026 15:35:56 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 07/56] disas/riscv: Reduce rv_insn to uint32_t
Date: Sun,  9 Aug 2026 15:34:56 -0700
Message-ID: <20260809223545.730664-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Since 758dce9c98a, the only possible values for
instruction length are 2 and 4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h |  2 +-
 disas/riscv.c | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 91ada8b531..eabe193b4f 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -11,7 +11,7 @@
 
 /* types */
 
-typedef uint64_t rv_inst;
+typedef uint32_t rv_inst;
 typedef uint16_t rv_opcode;
 
 /* enums */
diff --git a/disas/riscv.c b/disas/riscv.c
index e3fbc26626..012f90fce6 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5491,10 +5491,8 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
     return format_inst(24, &dec);
 }
 
-#define INST_FMT_2 "%04" PRIx64 "              "
-#define INST_FMT_4 "%08" PRIx64 "          "
-#define INST_FMT_6 "%012" PRIx64 "      "
-#define INST_FMT_8 "%016" PRIx64 "  "
+#define INST_FMT_2 "%04x              "
+#define INST_FMT_4 "%08x          "
 
 static int
 print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
@@ -5530,12 +5528,8 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
         case 4:
             (*info->fprintf_func)(info->stream, INST_FMT_4, inst);
             break;
-        case 6:
-            (*info->fprintf_func)(info->stream, INST_FMT_6, inst);
-            break;
         default:
-            (*info->fprintf_func)(info->stream, INST_FMT_8, inst);
-            break;
+            g_assert_not_reached();
         }
     }
 
-- 
2.43.0


