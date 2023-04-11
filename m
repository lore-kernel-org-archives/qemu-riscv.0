Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Rw-0004KX-Uw
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rm-0004AG-2s
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:23 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rh-0000V7-WC
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:21 -0400
Received: by mail-pl1-x629.google.com with SMTP id o2so6252772plg.4
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sz0V8vMtRGVbrYAv3TYBEb/m0VtaqYXZfpQLz+M3/Cw=;
 b=FbeFLkelKPVM8Hd85QJAcC7uhKLnXWP0/Q2PgLkRBvtTt2JdENAJgFSomgebxisYPV
 lEzTnTNGf8AfhrcLCp60IW6b8H1JdfWAXNN/9Y6d+02xu+/a/kAaSB390h1JQQ/abP4q
 yDYqkEEa5jMRJx51bvAtjmqnnb7y3hcztyxDc59JjdeTQ8mOGhpYQ8aS0Bz6tTH/CewX
 HpobDDyvm4HQiSxrdz3WvsFIeouGB9VThv+4plt5+sq9mDmg3A/nmkgQ4HLIF7OF3Jeq
 /j7w42kFUrXnwQt2ae5ElPsIpzVc8667Fr3MUjMa5DZAgMC+NyjTBuiAO0Yr6xMbGP87
 mS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sz0V8vMtRGVbrYAv3TYBEb/m0VtaqYXZfpQLz+M3/Cw=;
 b=VDl3Qodf3IPvHAvNkvwUnLooTje5RVRWdn7f1jGNotZO9+40xI9lqE9isTrY9DlQpu
 TdJ9hDjPLXVTFAZOlluAJQ79kP7vk9aJE31aHWo3yAZdAUPgHsBHUIj4h71vrlrZxKcH
 ir8uLQrKZv9FjC8ngrxvgfZqgql9sxzo7OeR3okXSJixRgAs9zunnsev+/YYaYUXib4a
 qCRovMl5/8SNn4CfKaj6aLeHw56+OL++VwLJ3a8+Vm1hp0h4D/wQwafl8u2tq0j8lBdN
 Vdfd6m2GscBeioqMlcnaP8ErAYvUqx/1Ey5GOBpDZH5FYEaIeoFgAKi0YKsoKsKeHLjL
 yHOg==
X-Gm-Message-State: AAQBX9dFW9jNM4lQgJWOw7TD0uEnDKWYmg/Fhs5v+XlOw4zJliklmbvV
 uH6SeZuYng4nBVkWG9ilTR0egw==
X-Google-Smtp-Source: AKy350bPjDm1gh757hOjNegHzuqfvxhIDrs4Dtgs5Rcodi7wk5h9q1bM5rsbDyN2Uu4mSU2OoqlIug==
X-Received: by 2002:a17:90b:30c5:b0:246:cf1a:569c with SMTP id
 hi5-20020a17090b30c500b00246cf1a569cmr2253887pjb.35.1681175116626; 
 Mon, 10 Apr 2023 18:05:16 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 01/54] tcg: Replace if + tcg_abort with tcg_debug_assert
Date: Mon, 10 Apr 2023 18:04:19 -0700
Message-Id: <20230411010512.5375-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:05:24 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 4 +---
 tcg/i386/tcg-target.c.inc | 8 +++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..100f81edb2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1174,9 +1174,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
 {
     TCGTemp *ts;
 
-    if (TCG_TARGET_REG_BITS == 32 && type != TCG_TYPE_I32) {
-        tcg_abort();
-    }
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
 
     ts = tcg_global_alloc(s);
     ts->base_type = type;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5a151fe64a..dfd41c7bf1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1369,8 +1369,8 @@ static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
     }
 }
 
-/* Use SMALL != 0 to force a short forward branch.  */
-static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
+/* Set SMALL to force a short forward branch.  */
+static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
 {
     int32_t val, val1;
 
@@ -1385,9 +1385,7 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
             }
             tcg_out8(s, val1);
         } else {
-            if (small) {
-                tcg_abort();
-            }
+            tcg_debug_assert(!small);
             if (opc == -1) {
                 tcg_out8(s, OPC_JMP_long);
                 tcg_out32(s, val - 5);
-- 
2.34.1


