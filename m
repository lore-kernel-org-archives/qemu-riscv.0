Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZF-0004pL-Io
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZD-0004o8-V6
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:47 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYw-0004Xz-6W
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id o13so1885303pjg.2
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
 b=wo92Lmrg8YD5vmSAR4Njag3d7RjIflVg0qFT/FuisA8HWhC99wUN6pl72nAHTHIXC1
 m9qx2+ZH893MqiWmY+ZKAOMKIMOybMJ+CNP82Wn/2U7Ihku+KQJz9oddghm+k6QqLbY+
 /T+hysSGmq6i9kOGePI8M25ZlcAb3W0eub1ZvUInIqI3bK8DMIOukN2Y2RUEWTjchQPr
 YPp/mdD+aqWKlC8zPhN1Xn7PbIGuuyXS3Q8tzsHSWvU836rbpVaBHHKMEpfeySPrJps2
 kY/3EqK4L5ZHCyGHndh7yLAvasBEFFEYxYjbAs4XolIH+si8uitooS3Bh0G+wzyi4RCp
 6tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KwGYqVGD9ayC3AoH0H/svPpb9D46lwJjNWaf8TUEnLU=;
 b=BnbtnNtxuHJmKzGKbXfiB3RZQaFouSS4rkIfTDe4A+WDffomCmDFkM9Ef8C4AdxNUl
 6PmKGVgl4lUTG91vrRJdgaoDulxwl/N7KyYHWbXZ9i8kW63zCNRvQQbv9Azy9JXhgRkI
 /VFeg6HWjeJTC9xBp43dawW41XTqPZByL700a8kdJS/7Z7mBZ4NP+E6KJilivAYQPILO
 3KQO5B0LIvMeHbtGvgoUQqCz61/AOHC7GPMY7IxDrsaM9saR96vvRqTzwL7mUqq6qOH4
 2wOOPJbkNVyAPY7JRU9QEOoplPKtDrUsQrjTdOkXDSLeuLJb7sdbr3WTwwB9xM2+LZUn
 RqRQ==
X-Gm-Message-State: AFqh2koLy3U6C4iA3Ir5O2G6BC1ECL7mP8wdtr/4dSN+HqfsMnIX5j9U
 WbW/BG/+4Fp/GLwrftxIZCLyqY8TYVfghrui
X-Google-Smtp-Source: AMrXdXuvchFuNHxD5uxFyiEdD06AjVAaZQm4Sg+cipC99x3zOt9lqSTMkfEKHS3DFSMNh8ifrvfB2Q==
X-Received: by 2002:a17:902:7c08:b0:193:13fc:8840 with SMTP id
 x8-20020a1709027c0800b0019313fc8840mr6381304pll.21.1673145448869; 
 Sat, 07 Jan 2023 18:37:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 07/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Sat,  7 Jan 2023 18:36:50 -0800
Message-Id: <20230108023719.2466341-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:48 -0000

This will be used by _WIN64 to return i128.  Not yet used,
because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  1 +
 tcg/tcg.c          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2ec1ea01df..33f1d8b411 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -37,6 +37,7 @@
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
     TCG_CALL_RET_BY_REF,         /* for i128, by reference */
+    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
 } TCGCallReturnKind;
 
 typedef enum {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 092cdaf422..c032606b21 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -731,6 +731,10 @@ static void init_call_layout(TCGHelperInfo *info)
             /* Query the last register now to trigger any assert early. */
             tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
             break;
+        case TCG_CALL_RET_BY_VEC:
+            /* Query the single register now to trigger any assert early. */
+            tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0);
+            break;
         case TCG_CALL_RET_BY_REF:
             /*
              * Allocate the first argument to the output.
@@ -4576,6 +4580,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         }
         break;
 
+    case TCG_CALL_RET_BY_VEC:
+        {
+            TCGTemp *ts = arg_temp(op->args[0]);
+
+            tcg_debug_assert(ts->base_type == TCG_TYPE_I128);
+            tcg_debug_assert(ts->temp_subindex == 0);
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ts);
+            }
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       ts->mem_base->reg, ts->mem_offset);
+        }
+        /* fall through to mark all parts in memory */
+
     case TCG_CALL_RET_BY_REF:
         /* The callee has performed a write through the reference. */
         for (i = 0; i < nb_oargs; i++) {
-- 
2.34.1


