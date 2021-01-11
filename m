Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyhZ-0001R9-B8
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 10:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhX-0001Ls-DV; Mon, 11 Jan 2021 10:01:47 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhU-0001Uv-Ro; Mon, 11 Jan 2021 10:01:47 -0500
Received: by mail-ej1-x62b.google.com with SMTP id qw4so25081193ejb.12;
 Mon, 11 Jan 2021 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Yz+q+sYA548DZkc3uhP8nuaBAcly6SiME04TkIbzu0=;
 b=PejHZBubdAGZ3MyD7BeZLf8GSdxbtdEHpKiQ9OZWiN+wMSNTTFCH0Dg/97ZjM4TXW0
 2OVKBZTjbqVrY9QarWetjQKiVb9iA7gwDkFWgpO3N12SQhqqg3dLkQkHgjNcRg0UHbbs
 Ftgx5PJDU7PNcUMbb2y8OB/TZpT5oUx5XLyVm/Y4VATRlwJs2K2nv+YkikIH+MYn42eh
 56qJvEX10gjPgw3fglxqCm08eBnuSw9SVthdVU7HYjJTw3uyP5Q/2NZCY3Y/1CsKJSqL
 5jhLPqxFCvEA3k615otkxN40fRBJ4vwFQNB3JVhcv4LvJJ3Boe4I12zT8NQjDtAaw9b1
 wsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+Yz+q+sYA548DZkc3uhP8nuaBAcly6SiME04TkIbzu0=;
 b=hlPKEm2Z54PsHKHKxtQrAc+lDVQgTq+jZMuZsF2WxI6phvYWZsxdvh3nNFL0etmNJp
 0om8fc90ta/yp31E6cf7mUjs1xEL0L3Y+Ze/XhAIFLo0mc9bU2DuVVfPVeKunvI/vrgb
 apnLCpUnGUgm7K3pJ1zZXLzlNcsbJ0D4glTWe+BTsgqFTKytUltl2t1D/wld+N2+ojcH
 +edvquipRO+NbAL5homWpYtSCsq3qZcMtBjNBR0H4uvPJP19IYMpnVnQqhkNjPNWJGBW
 vqfJD24BiNqSjxxaGIOruT5Dd2ZmK13kF9nbOUYw0bS+2AWuBBN3AA8vffxjDJG14RF4
 Jx1Q==
X-Gm-Message-State: AOAM532whLmfjTMmuNsnqMl6ov5DqnOjlMukY7sJ8pIu9zNmEArkZHkJ
 TvuVmI9v/RU9KKPW/alr7XrLd+Eh9Zg=
X-Google-Smtp-Source: ABdhPJyGU5wbk10Z1JnKHb2TkfqvKDTRbwtSey20RaMhAP4tkhOEORcuywDvafrzzvmQZsoeJt1DcQ==
X-Received: by 2002:a17:906:d0c1:: with SMTP id
 bq1mr10818129ejb.202.1610377302012; 
 Mon, 11 Jan 2021 07:01:42 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id cc8sm68591edb.17.2021.01.11.07.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:01:41 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Subject: [RFC PATCH 4/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
Date: Mon, 11 Jan 2021 16:01:13 +0100
Message-Id: <20210111150114.1415930-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
References: <20210111150114.1415930-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jan 2021 15:01:48 -0000

tcg_reg_alloc_op() allocates arrays of TCG_MAX_OP_ARGS elements.

The Aarch64 target already does this since commit 8d8db193f25
("tcg-aarch64: Hoist common argument loads in tcg_out_op"),
SPARC since commit b357f902bff ("tcg-sparc: Hoist common argument
loads in tcg_out_op").

RISCV missed it upon introduction in commit bdf503819ee
("tcg/riscv: Add the out op decoder"), MIPS since commit
22ee3a987d5 ("tcg-mips: Hoist args loads") and i386 since
commit 42d5b514928 ("tcg/i386: Hoist common arguments in
tcg_out_op").

Provide this information as a hint to the compiler in the function
prototype, and update the funtion definitions.

This fixes this warning (using GCC 11):

    tcg/aarch64/tcg-target.c.inc:1855:37: error: argument 3 of type 'const TCGArg[16]' {aka 'const long unsigned int[16]'} with mismatched bound [-Werror=array-parameter=]
    tcg/aarch64/tcg-target.c.inc:1856:34: error: argument 4 of type 'const int[16]' with mismatched bound [-Werror=array-parameter=]

Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because such compiler hint is somehow "new" to me.

Also I expect this to be superseeded by Richard 'tcg constant'
branch mentioned here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg771401.html
---
 tcg/tcg.c                  | 5 +++--
 tcg/i386/tcg-target.c.inc  | 3 ++-
 tcg/mips/tcg-target.c.inc  | 3 ++-
 tcg/riscv/tcg-target.c.inc | 3 ++-
 tcg/tci/tcg-target.c.inc   | 5 +++--
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 472bf1755bf..97d074d8fab 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -110,8 +110,9 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
-static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
-                       const int *const_args);
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS]);
 #if TCG_TARGET_MAYBE_vec
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg dst, TCGReg src);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 46e856f4421..d121dca8789 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2215,7 +2215,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 }
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                              const TCGArg *args, const int *const_args)
+                              const TCGArg args[TCG_MAX_OP_ARGS],
+                              const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2;
     int c, const_a2, vexop, rexw = 0;
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index add157f6c32..b9bb54f0ecc 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1691,7 +1691,8 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
 }
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                              const TCGArg *args, const int *const_args)
+                              const TCGArg args[TCG_MAX_OP_ARGS],
+                              const int const_args[TCG_MAX_OP_ARGS])
 {
     MIPSInsn i1, i2;
     TCGArg a0, a1, a2;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c60b91ba58f..5bf0d069532 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1238,7 +1238,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                       const TCGArg *args, const int *const_args)
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d5a4d9d37cf..60464524f3d 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -553,8 +553,9 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
-                       const int *const_args)
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     uint8_t *old_code_ptr = s->code_ptr;
 
-- 
2.26.2


