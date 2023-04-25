Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORj-0005aY-Co
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR8-0004FG-Fo
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:52 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR5-000549-BH
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:50 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso6837697e87.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451285; x=1685043285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=rMKJQysLKXuVdE5xNwwzuvY92+k2XiQhe8H+YtNOz5CBLxQotHSxmW7HWBbwvInB4a
 VVz/f79zBmukyRjcvpUNH/7AitUmW8Lp0+pqr81Kox2Os8Wxxu0cS043bbs9DjEfdKgG
 IO3IHFefwXirMV2CoqmGqd4foIggkUhWArdo1guilWiqq83pXL2A7Z8jyuW4/aY82q4q
 EgDAYAyKUwzL5UZdY58pfju+ernZnzywt/HOjWJjSkg66/PdiGhkMzMh4dcH9eSY0BXC
 XZ/cUmyAGAr1DASSHDlf0JKIJUJ8b2lBgah7iMo/FRjMg+RrZtGg2C/UcRcJeeqqf6FI
 zKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451285; x=1685043285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=e9TdTxphc8A3RxrL0dnRRi0teu0qM6ZQsj9vj2Bh+9vjdJ4QCBBNh+p/bpM4LDniiF
 VVyHgL4WN2ps/9MLg/JLP0vCdad8UztP9xKK1r6pJmL7njJWMN7GSZ9RBKUXRNMhQHmA
 IKRJ2Lk7QYV92tZoRY41a3pL0x9EgzL0QfQJ6GFQ3VFfLndp/bV9hGN9/Jpd/N3vAvg5
 WH2kbypXK/tZ20gaJxE4JL1cqVuSpdy2xrO9tsDuF4ZKZT+m2LF0WrnzEQ4nzQcWgl1M
 4S3X5aJkcdb6srYvOWn7yV2FS5l+W8pNbiIcawA/jkrZc9MmHctR6V3XaEq5dNF7LTD3
 5xdw==
X-Gm-Message-State: AAQBX9cwby6jNXkeaUMJlIB/9sIvE7nVvv+7ZK0WnyTNTzgNtph57xQp
 iSdp0outJHRsmuswJf3koPCZqQ==
X-Google-Smtp-Source: AKy350ZtIwnfzqwSniORirQzxmJGeseLWMvg8sGgwcL4SEy/PzHdIEsZ8bmTc+T77AGQ5An3DK6IGA==
X-Received: by 2002:ac2:454c:0:b0:4de:e802:b7e3 with SMTP id
 j12-20020ac2454c000000b004dee802b7e3mr5187676lfm.19.1682451285752; 
 Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 30/57] tcg/sparc64: Allocate %g2 as a third temporary
Date: Tue, 25 Apr 2023 20:31:19 +0100
Message-Id: <20230425193146.2106111-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x134.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:53 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e997db2645..64464ab363 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
-/* Define some temporary registers.  T2 is used for constant generation.  */
+/* Define some temporary registers.  T3 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
-#define TCG_REG_T2  TCG_REG_O7
+#define TCG_REG_T2  TCG_REG_G2
+#define TCG_REG_T3  TCG_REG_O7
 
 #ifndef CONFIG_SOFTMMU
 # define TCG_GUEST_BASE_REG TCG_REG_I5
@@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_I4,
     TCG_REG_I5,
 
-    TCG_REG_G2,
     TCG_REG_G3,
     TCG_REG_G4,
     TCG_REG_G5,
@@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_debug_assert(ret != TCG_REG_T2);
-    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
+    tcg_debug_assert(ret != TCG_REG_T3);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
 }
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
@@ -885,10 +885,8 @@ static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
 {
     uintptr_t desti = (uintptr_t)dest;
 
-    /* Be careful not to clobber %o7 for a tail call. */
     tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                     desti & ~0xfff, in_prologue,
-                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+                     desti & ~0xfff, in_prologue, TCG_REG_T2);
     tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
                    TCG_REG_T1, desti & 0xfff, JMPL);
 }
@@ -1856,6 +1854,7 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_O6); /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T1); /* for internal use */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T2); /* for internal use */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_T3); /* for internal use */
 }
 
 #define ELF_HOST_MACHINE  EM_SPARCV9
-- 
2.34.1


