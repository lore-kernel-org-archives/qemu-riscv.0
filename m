Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzjuL-0000To-SX
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 12:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtx-0000BN-NF; Wed, 13 Jan 2021 12:25:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtr-0006Hs-Dl; Wed, 13 Jan 2021 12:25:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id g10so2334698wmh.2;
 Wed, 13 Jan 2021 09:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CsrU5PzWJOqWBM621BtsUfkniXFxs+sJ0jZIwq4bvko=;
 b=tZYvrIRroKpXLJ5e/pihISRDSjdwOQ93ujRXBjbefwCHz1KbtyPkMV031mAsWRrJoc
 7rwBIF0eyiQvMcOM1N0HRz2kO4jzmzxx7RMN/sVKOhNWbRucyuqoxpRAd9FGxs3rgVMa
 pMUVcxsUE87I3JT4F52vFREa6b+kPsymTRW5c2bHiJkdmi9PZBRxVLPpcsPwQC04kPxH
 pezV3qHV3zfAzqqf96lc4dc0SBIoeCxZx4JJI/sfWW8RzbmrWReU+T5yaGv+2dtnOL5w
 3puQ833pgroSlrDZr8aavGBT1DdHiGuhEa9sh1+x50DBoLWaLmtbGwpW2Xbnhda7n+4a
 4Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CsrU5PzWJOqWBM621BtsUfkniXFxs+sJ0jZIwq4bvko=;
 b=tgeEFaF/rkBnZHE38lbPHBi4BhzHgqDIDykV1g6Hv9FDSz62ngCdbpIDbNJFhrwU4o
 Rq/NpFaJjoU1IiZKQb6vO2xuDsRdLZR5i90cW7UKfbSb2qciCUl23iyRwhoAXLbLe2R2
 327WipdkGDuA4C7YVeLJ7LM8NRGdfVeJfIqCZ1tixJ1sm/rBovFOgh1HCEdDXsBs5NBl
 CAZ7geuiesY6pqyABK59t1wLRlpd7bgom7H4t73a0uO4SYhFHj3Do296CUtYQAcoD2HD
 nk44/1pi8wb2hZgwqteGS6nwTGQNFdmMUxLCehjZ4lKgR3fjqIYMKMWuD9MkFYbAunCT
 MtOQ==
X-Gm-Message-State: AOAM533+BpaTna7atrcjdxs50+z1NCdba9yD5UkDEhiT5zip0W0G0mGt
 bC0XouGC4zRhr0nxiFu81k0LzO7V4u4=
X-Google-Smtp-Source: ABdhPJye576eM2Ebv7gU2u8PS2+2AyG7/UyRx2o3UsvGh7li2vvj1bw6ncnm9r8ciqfb2y4nUj3CDQ==
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr323192wma.0.1610558732781;
 Wed, 13 Jan 2021 09:25:32 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u83sm4066965wmu.12.2021.01.13.09.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:32 -0800 (PST)
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
Subject: [PATCH v2 6/6] tcg: Restrict tcg_out_vec_op() to arrays of
 TCG_MAX_OP_ARGS elements
Date: Wed, 13 Jan 2021 18:24:59 +0100
Message-Id: <20210113172459.2481060-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 17:26:05 -0000

tcg_reg_alloc_op() allocates arrays of TCG_MAX_OP_ARGS elements.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 70b747a8a30..b8f5f8a53e1 100644
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


