Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZR-0000EM-Q2
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZO-00009c-Vv
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:15 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZN-0008EV-5G
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:14 -0400
Received: by mail-pj1-x1044.google.com with SMTP id f16so4144412pjt.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82BoFk+pEx0CdeF7uaEVVUl7SfuHCvWy8t85i9SZsTQ=;
 b=Fn8IZXpAc7MCaiuiZ25JlQA2LabEcam/2/IMXdJ1O4uKpkwnUqRnzzCDzancnQTF5A
 teIzdq/yAZu1fRlcYa60F7K94ld7EZ2wAkXCBQ8P5aFyQZg3MAEBSKVZoJRo1KUkdfVK
 UqCpis03sVLQgTpoQmDTkqT5URfXQL/E+lHHdNBaJWzeYtXIGUKT63RTZCaUnI83Tjhn
 0L8sOS1LM9sZd1cL3G4wjQq5C1ti5qX4vBIKkYbGZlu640cKpfiltb7l4yJCSspNmgPM
 1RaFlM0Wz0aCUZ9q4OSENlaP4lxCBvfslKKcJ0LbcpQC9QYkMo1J1Z7kVVboWg12+JX2
 gn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82BoFk+pEx0CdeF7uaEVVUl7SfuHCvWy8t85i9SZsTQ=;
 b=qrl/9/GaiiJUO+kOKsgpVEdCQOj5lz7qBQjSyscTU3fqxUgC/70+bs/tVnaOVyhpRR
 i9IREy+aoOQYnaTv2hOT641EIi5Np+bJNBK9AmZF3aOffX6SRjRqpObbzgIzJOwf4ttK
 PLR9OBJyfwBPXa+JuWhWIE76eeS+LtYSb/njtwZ7gfwLOd0VF7czQNeUc8WLqg3jQCXY
 wvRR19EXrRmQDEyEhYOEDqW6Jixg6m3PPPkxOOoYFnzcVtzd+QrDYESYjUZojrwywBry
 jqX9VpMgvlhMjfZHOtQn3Iyk1Pah1kvJWNsZgMxb2MYLOyBv6l8F8W7KCpoR0HIgVMuK
 3avA==
X-Gm-Message-State: AOAM530THg7FJLQ/paSwQ/FK29yjk/r88ccSj4Y5p0v9g/jU1lql/YTR
 Yh+ETYKN2e1FUD72km3OTmtwFg==
X-Google-Smtp-Source: ABdhPJxB/kyIx0JQ3A1RWxiiWUx45JeZQ0oeQnQRBpYlj4sr6vwC3gFYkPU4oCiLT9TizJgBvzVB3A==
X-Received: by 2002:a17:90a:2367:: with SMTP id
 f94mr2932434pje.20.1595550491869; 
 Thu, 23 Jul 2020 17:28:11 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 2/7] target/riscv: Generalize gen_nanbox_fpr to gen_nanbox_s
Date: Thu, 23 Jul 2020 17:28:02 -0700
Message-Id: <20200724002807.441147-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
References: <20200724002807.441147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jul 2020 00:28:15 -0000

Do not depend on the RVD extension, take input and output via
TCGv_i64 instead of fpu regno.  Move the function to translate.c
so that it can be used in multiple trans_*.inc.c files.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.inc.c | 16 +---------------
 target/riscv/translate.c                | 11 +++++++++++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
index 3bfd8881e7..c7057482e8 100644
--- a/target/riscv/insn_trans/trans_rvf.inc.c
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -23,20 +23,6 @@
         return false;                       \
 } while (0)
 
-/*
- * RISC-V requires NaN-boxing of narrower width floating
- * point values.  This applies when a 32-bit value is
- * assigned to a 64-bit FP register.  Thus this does not
- * apply when the RVD extension is not present.
- */
-static void gen_nanbox_fpr(DisasContext *ctx, int regno)
-{
-    if (has_ext(ctx, RVD)) {
-        tcg_gen_ori_i64(cpu_fpr[regno], cpu_fpr[regno],
-                        MAKE_64BIT_MASK(32, 32));
-    }
-}
-
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
     TCGv t0 = tcg_temp_new();
@@ -46,7 +32,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
-    gen_nanbox_fpr(ctx, a->rd);
+    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
 
     tcg_temp_free(t0);
     mark_fs_dirty(ctx);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9632e79cf3..12a746da97 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -90,6 +90,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa & ext;
 }
 
+/*
+ * RISC-V requires NaN-boxing of narrower width floating point values.
+ * This applies when a 32-bit value is assigned to a 64-bit FP register.
+ * For consistency and simplicity, we nanbox results even when the RVD
+ * extension is not present.
+ */
+static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
+{
+    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
+}
+
 static void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-- 
2.25.1


