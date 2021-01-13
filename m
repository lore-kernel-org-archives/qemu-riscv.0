Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjuI-0000Hz-4d
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtq-000099-MR; Wed, 13 Jan 2021 12:25:43 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtl-0006AW-OA; Wed, 13 Jan 2021 12:25:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id k10so2301946wmi.3;
 Wed, 13 Jan 2021 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbTY58aO/0J5mVZOizL8/L5H+yZ4rt3Ds459buh/Uo4=;
 b=uoa946qK+eG5eMCIzS2cz6yzKuNu/TbYio49p1yhcciT51de1vXX8hnCRTN6lZxLdh
 2CPDKNODcNGqKK0ZMIUo3lLiFGnqCz95hUZSZdEggWPdpRPlKUlm/ccrw2XniCjE/cCo
 xWJyBtNpoYNy2Ro8lrTqpIF9QiRdAALofRFxiIVAqiiFUQT7Cw8NeZfu3yHdWoysQNB9
 uIlLcQcfiMaxFiNjjkcXv3CU5tS4iiSi4+ZvpZO4VAnBtlxELdaNOFdMYqt4rlqFr+4u
 Mznwtep1Hp5wvKAA1Xukf28WicT5hAO2ARCgWEI8wAPIoLPN5D0AFijUCTjpAGivhv4b
 yAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nbTY58aO/0J5mVZOizL8/L5H+yZ4rt3Ds459buh/Uo4=;
 b=LsRiI0A34qU9zVnjDAp8QzxlFPhobhvlk9cDmSlO8svxmqc5nvNcAX/aN7FmgZ9Jt9
 n90oFeyQULTo6j/YVS0fCsWOP2/3iKYoq8O6CFtXcUa28eqwnMFli7T4/3AnJtZ1Ejcw
 9kRcZ06wXyfJ3ElyFfN0DzvDSb/6QzFrt7GxnPh39sLHUHUVj1OQQC5g6ZH7ijBt0d8Z
 sfPgCL9/UUnoh3vwzOK8lJMLhpWrX3oOisJDQc1PoTnSkXqF0oZe8XH13J1hDgxkWgFw
 qjjNZZxom6QEbE8c7IQiJROfdZ58BmrLZ8A/EKdCJizssOTkSd1WPEqUMT6Rp5xQ36Zw
 VuWw==
X-Gm-Message-State: AOAM533ZTiyRufhC1FQXiazDFCdyAK3WFvy12pxz4+REW7AlInufxAg3
 CdDkuLQMpU2gX1btjJJexQhqgdzxg2A=
X-Google-Smtp-Source: ABdhPJxR03gA0wrsFd/XfrZXq8/5cAsQbe8rZGIFSVwI83fvnhK3DyuI357dOUM4Sy7cVHORHVggqg==
X-Received: by 2002:a1c:a583:: with SMTP id o125mr258893wme.91.1610558727675; 
 Wed, 13 Jan 2021 09:25:27 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 125sm3862219wmc.27.2021.01.13.09.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:27 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 5/6] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
Date: Wed, 13 Jan 2021 18:24:58 +0100
Message-Id: <20210113172459.2481060-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
X-List-Received-Date: Wed, 13 Jan 2021 17:25:45 -0000

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
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


