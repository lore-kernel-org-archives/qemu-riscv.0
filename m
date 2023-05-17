Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EE9C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:58:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzHez-000112-3Z; Wed, 17 May 2023 09:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHes-0000z5-8U
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:38 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzHek-0000UY-Vb
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 09:57:38 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3944816b579so477922b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684331850; x=1686923850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAiO4x83ijNy4ajX2j8DN3y60DdS3AGTCOKSTObnjs0=;
 b=hhRoaTUM3UJU6ZJrmIxH4b17wQkbI8Ib7Cycglor159Mh59+vcCMOR2BL+9iMaOp++
 o0+SqAdXqArkLZ3VyzDIMWILdD4QIsiE7qrQpMbPo3PEWqZqR3wdKXoAQv69Mut483R9
 gBc1XexY1O3qPERMVVeeVa9lQGu7eHF2QOi6r/HZQ0eeNSGz8vl6nJIATViSMDJgz/nm
 JoKLUr2lzn9AC19KzhfEHPoRq11iBtQCJmzQ2o0WIAEQQkhJ6AROJ/fqLXah8xo1NZms
 +vu/HbIvfo+8i5YB1Br/kaVsw7eqIne9Q325mhvTYPvJeyfxDducx3yXJlA1MzCLbEke
 Tb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684331850; x=1686923850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAiO4x83ijNy4ajX2j8DN3y60DdS3AGTCOKSTObnjs0=;
 b=UFT/Ji2QxupPhnl7pi0hnZf9JUlxNwrqA+UlS28isWKvGGQEWWeU0YZOQeJNfYPfqs
 5jI+t9Jj9CCn6pW2Iw+qh68DBqhzmamgKD9a+px0HZhOdvjsu4Yglc0CD4Q0oEdkDZO1
 tS9SE9OPOjYEoUv7FPxo6cTi7TcLWgCOIMEtGo0fMVPaks36jEgHvgOGAdT/3itJ1aMI
 7KCB7dpu4qVtaTSFJFFfsPDmIX4eeePAvMFjuzM8qnb3vEBk9lJN95xtFaKOsvW/5XkP
 Qy/KL4pZjq6sM3KVRgJccJV1LexyjB2o3NLs76TEymRqpF/2/mtb4OZ3n1Clz1fCG9PD
 Fl2Q==
X-Gm-Message-State: AC+VfDxmZFve75rsGgbqmLu4rA+7roSRo747KbEndGYytCN9nxEKzFcy
 qLEM3vVNQ59mIcDcoOAOON76opxji15x+naWxKQ=
X-Google-Smtp-Source: ACHHUZ4kQNdIb3rX9W60cuvgg58VHjZMxo41rbn/zTSJyWVCXByQSxe1kHvW6q3CxjF6E6xBJ8CJWA==
X-Received: by 2002:a05:6808:1415:b0:395:f484:78bb with SMTP id
 w21-20020a056808141500b00395f48478bbmr8235519oiv.13.1684331849935; 
 Wed, 17 May 2023 06:57:29 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a544815000000b00383d9700294sm9409562oij.40.2023.05.17.06.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:57:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 02/11] target/riscv/cpu.c: remove set_vext_version()
Date: Wed, 17 May 2023 10:57:05 -0300
Message-Id: <20230517135714.211809-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517135714.211809-1-dbarboza@ventanamicro.com>
References: <20230517135714.211809-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e6de82afa..bb7522bb3e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -871,7 +866,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.40.1


