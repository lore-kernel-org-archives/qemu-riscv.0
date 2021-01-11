Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyhf-0001fy-Kz
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 10:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhd-0001a3-2S; Mon, 11 Jan 2021 10:01:53 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyyhb-0001Vl-EH; Mon, 11 Jan 2021 10:01:52 -0500
Received: by mail-ej1-x631.google.com with SMTP id g20so83123ejb.1;
 Mon, 11 Jan 2021 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xngzeQsXbx86Y0kY9uD4ruhCQIyXt4hJmccYItVWSgE=;
 b=JU8/uZzyfrbCCh0sfNNRgDfkqxalS6KTv/bDHUEEQWCbD2O+7GHhpXW5jPv2F5/Otj
 ED89jPRaY4rSPbLXDOmAD4pYYOFh4eiGlSUL5E1aYNUwyOBYmM590+O4CHqGsPdJiI3T
 MEuO41mbNYK9zfHoRye9MP3MANfc3Y+N9cPHyaltOIJjukQ3bgE/Di8uoGiph0Pw8Nz5
 O7qDedIU6bQIH39IeJ3ycpfwG0BsWJcqrMAgxCp4I9fDHPnKN4QTqR+yDdZXClXKY/BC
 pBxKlz2d/G2tNiPmZpAQxqWOPqpburxAXsusZUsAlQZ6twjehGHFpIxNlxpAZi+Fvmxh
 gsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xngzeQsXbx86Y0kY9uD4ruhCQIyXt4hJmccYItVWSgE=;
 b=fdcYO8G2+U1MUF5iikH3rYya3vx95UUft2kL7cdrsdHufwJSaw+Ko2TUmEwe2vzbgJ
 k+pMFUnbvnqffy5fDmTpGVdWde+oQ37UGj3Hfws8t7lCc7OqWoQBPZEx+VvnQjLmHdOT
 SGDP4LzyAiLy7RAzW1f+tZiAIdpt+EAkaOXLmhE+u0H/9FU0CgHgyb53sJ8Vh/MSVnhG
 uV8pXMf7Bff5BoyPHv9E1V/uLfddb0jdP+d8/qveo9cZA799vafrQRX3j7lRswKlqVtK
 hZ1PgPXdPbmep05gBvZ4M4gyurXquOYHBSE2p3CUjhx5tgW3yKaGOagR1+4PhJxe6c+D
 TgEQ==
X-Gm-Message-State: AOAM531u9uvSGG+jClZUJUBx3ejG+2/9M6j3Y2dboC8YaM1Scfuhvax5
 3I6kRTp5F0KzaQ4RUfPWT3+s3M8wLQQ=
X-Google-Smtp-Source: ABdhPJxhDeFTNk2Ehjp96NDAKoPS7SZvuzzlTjnuMiEpwVOKkdWW0y7TQXWtxKdkpf5rmRU4AOoFjw==
X-Received: by 2002:a17:906:fcda:: with SMTP id
 qx26mr11168873ejb.213.1610377308517; 
 Mon, 11 Jan 2021 07:01:48 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id b21sm51043edr.53.2021.01.11.07.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:01:47 -0800 (PST)
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
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [RFC PATCH 5/5] tcg: Restrict tcg_out_vec_op() to arrays of
 TCG_MAX_OP_ARGS elements
Date: Mon, 11 Jan 2021 16:01:14 +0100
Message-Id: <20210111150114.1415930-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
References: <20210111150114.1415930-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Mon, 11 Jan 2021 15:01:53 -0000

tcg_reg_alloc_op() allocates arrays of TCG_MAX_OP_ARGS elements.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tcg.c                    | 14 ++++++++------
 tcg/aarch64/tcg-target.c.inc |  3 ++-
 tcg/i386/tcg-target.c.inc    |  3 ++-
 tcg/ppc/tcg-target.c.inc     |  3 ++-
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 97d074d8fab..3a20327f9cb 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -120,9 +120,10 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, TCGReg base, intptr_t offset);
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
                              TCGReg dst, tcg_target_long arg);
-static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
-                           unsigned vece, const TCGArg *args,
-                           const int *const_args);
+static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                           unsigned vecl, unsigned vece,
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS]);
 #else
 static inline bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                                    TCGReg dst, TCGReg src)
@@ -139,9 +140,10 @@ static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type,
 {
     g_assert_not_reached();
 }
-static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
-                                  unsigned vece, const TCGArg *args,
-                                  const int *const_args)
+static inline void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                                  unsigned vecl, unsigned vece,
+                                  const TCGArg args[TCG_MAX_OP_ARGS],
+                                  const int const_args[TCG_MAX_OP_ARGS])
 {
     g_assert_not_reached();
 }
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ab199b143f3..32811976e78 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2276,7 +2276,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     static const AArch64Insn cmp_insn[16] = {
         [TCG_COND_EQ] = I3616_CMEQ,
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d121dca8789..87bf75735a1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2654,7 +2654,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     static int const add_insn[4] = {
         OPC_PADDB, OPC_PADDW, OPC_PADDD, OPC_PADDQ
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d37b519d693..279ec4b743c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3137,7 +3137,8 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     static const uint32_t
         add_op[4] = { VADDUBM, VADDUHM, VADDUWM, VADDUDM },
-- 
2.26.2


