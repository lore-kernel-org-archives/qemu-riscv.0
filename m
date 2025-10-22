Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4078ACCD1AB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 12:57:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBYOk-0001QM-Ok; Wed, 22 Oct 2025 08:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vBYOe-0001Pd-2j
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 08:56:57 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vBYOb-0002nu-Ot
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 08:56:55 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso8773660b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761137812; x=1761742612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LOO0KdkHNx89CU58iBA7rR0/YEfe+JIC9zq+WuZvcg4=;
 b=ox06EU0Cp0FraEcGbjyU8pQFHlgLNCw9GlX4vX1C16ulb1E/gB+apV1jUMuDuIdEEU
 DFynLy0b2QuOw3+Q11TL8jpwOktSFhT3qMP/Pq2Bg3TFbWpHQ7SX1aJBynrn+KAwrSYS
 x890oJgYjJ29MkV+3+BZncbKtLN6IP7Idp8Ykw6wTM5eTZ5IUf1pfU5AXo9N+aDoJhOJ
 rIoFNz4aV2TJ27vZDwJcN1u+ki/WHINeqswPg6eddt9ueYTkFTvn82RH05HexwwaaR0g
 W39PogfNcrtWnPmBhOQh58Eh01AJWKbOvwCLFqtDLE7+b3I1bGc46d9cKwsm16qADYiu
 TETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761137812; x=1761742612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOO0KdkHNx89CU58iBA7rR0/YEfe+JIC9zq+WuZvcg4=;
 b=KgmAuIb4YWry5R4oXEVmSJCtJgiU6E9RClYipziunP+GqbJPzQzqYSaBbtFdxhDSfR
 7NygPoCc0zmM5gw9gBPyVsIk7Xn4xY7LD9WGl07QD1hfKBa+oGKjEUqsWdRn1wW2I2RD
 na/mwreXVHKocqt1Vy7uKDkRRvGVyCmgzU4lWhNlbO3POXmt2nZ/F15rx3ljUVFJhnWM
 RamkAX5/xHwsfK+S7OYsRhEQn1I6B+HMfsDB02nTyGFFdq/9Kux/Q76QunfGlDODDNQq
 jW1Ei9YuUHCKFyyhfuvW/gEHRypw6MzjXN/DI+5+7Y8xWImvwtWUXYuOHNJtw7FbCY1m
 XPOw==
X-Gm-Message-State: AOJu0Yymq2z2ZUnmSTkc9m0Z/f0vJggTbonBvFUCXxZfwdy/vZ3DyoJ8
 UrJIJ7+xKkZsfR/ptO53iqRC2vfqB0lgkD4deMss4FW0LSc8P8iU/MTxedp1BNYlxKg=
X-Gm-Gg: ASbGncuedLlyDpROoo8KXahUtm+aztmCRM7A4OPA8gxjOnnrsmeIrYt7qSK65Ud0qaA
 opOLTgh2SYhMa72uTAcnV/KTa5zgTDE/G+AanEdsOdtXSmQtBV40OrrlKQPYRN+KsnIkY+Ger9M
 nuh0ofiY49ne4qiCnfUmv3KOwVHOFkOWAPCAxdmH7tnfLlE762fEINrlJw7l08zWZ5lMNADrp4/
 iTgf7wmSr4EQb/6iuJrFBQOV6IiDlKmi2E8devD5qQBpm+/3lUulp8w2jc+GQUH5tpy/iaJihV7
 mO6Sq7zosBF4U45ocZdMZFv/2tEQe3xtYVEQWgfCFksTFlPABHXbi5ghdinmwqk21v9kUh8OGxT
 kUxzgOLBNLSQevJj+T9p754ZCva6I4x0L5yQRKP1ZZ7wOmBQQAL+IutBVi4bfEjszOt9z1CXy4g
 M426JjEdstEOwLpaz8E2MSC2WPlA==
X-Google-Smtp-Source: AGHT+IERjfi5Y7rlk5D6c4f1utj6ef9JMt35zcVoqns+kEA6uDPUYuz2bNlVs7xrORPxrNuM7lHHTQ==
X-Received: by 2002:a05:6a00:3a21:b0:781:4ec:4ec4 with SMTP id
 d2e1a72fcca58-7a220d30df8mr25903150b3a.31.1761137811775; 
 Wed, 22 Oct 2025 05:56:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([189.38.141.22])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010d96dsm14394685b3a.60.2025.10.22.05.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:56:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] target/riscv/riscv-qmp-cmds.c: coverity-related fixes
Date: Wed, 22 Oct 2025 09:56:43 -0300
Message-ID: <20251022125643.588947-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Coverity CID 1641401 reports that, in reg_is_ulong_integer(), we're
dereferencing a NULL pointer in "reg1" when using it in strcasecmp()
call. A similar case is reported with CID 1641393.

In theory that will never happen - it's guaranteed that both "reg1" and
"reg2" is non-NULL because we're retrieving them in compile-time from
static arrays. Coverity doesn't know that though.

To make Coverity happier and add a bit more clarity in the code,
g_assert() each token to make it clear that those 2 values aren't
supposed to be NULL ever. Do that in both reg_is_ulong_integer() and
reg_is_u64_fpu().

We're also taking the opportunity to implement suggestions made by Peter
in [1] in both functions:

- use g_strsplit() instead of strtok();
- use g_ascii_strcasecmp() instead of strcasecmp().

[1] https://lore.kernel.org/qemu-devel/CAFEAcA_y4bwd9GANbXnpTy2mv80Vg_jp+A-VkQS5V6f0+BFRAA@mail.gmail.com/

Coverity: CID 1641393, 1641401
Fixes: e06d209aa6 ("target/riscv: implement MonitorDef HMP API")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---

Changes from v1:
- use g_auto(GStrv) instead of g_autofree
- v1 link: https://lore.kernel.org/qemu-riscv/20251022110524.483588-1-dbarboza@ventanamicro.com/


 target/riscv/riscv-qmp-cmds.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index c499f9b9a7..d5e9bec0f8 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -273,12 +273,13 @@ static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
     }
 
     for (int i = 0; i < 32; i++) {
-        g_autofree char *reg_name = g_strdup(reg_names[i]);
-        char *reg1 = strtok(reg_name, "/");
-        char *reg2 = strtok(NULL, "/");
+        g_auto(GStrv) reg_name = g_strsplit(reg_names[i], "/", 2);
 
-        if (strcasecmp(reg1, name) == 0 ||
-            (reg2 && strcasecmp(reg2, name) == 0)) {
+        g_assert(reg_name[0]);
+        g_assert(reg_name[1]);
+
+        if (g_ascii_strcasecmp(reg_name[0], name) == 0 ||
+            g_ascii_strcasecmp(reg_name[1], name) == 0) {
             *val = vals[i];
             return true;
         }
@@ -294,12 +295,13 @@ static bool reg_is_u64_fpu(CPURISCVState *env, const char *name, uint64_t *val)
     }
 
     for (int i = 0; i < 32; i++) {
-        g_autofree char *reg_name = g_strdup(riscv_fpr_regnames[i]);
-        char *reg1 = strtok(reg_name, "/");
-        char *reg2 = strtok(NULL, "/");
+        g_auto(GStrv) reg_name = g_strsplit(riscv_fpr_regnames[i], "/", 2);
+
+        g_assert(reg_name[0]);
+        g_assert(reg_name[1]);
 
-        if (strcasecmp(reg1, name) == 0 ||
-            (reg2 && strcasecmp(reg2, name) == 0)) {
+        if (g_ascii_strcasecmp(reg_name[0], name) == 0 ||
+            g_ascii_strcasecmp(reg_name[1], name) == 0) {
             *val = env->fpr[i];
             return true;
         }
-- 
2.51.0


