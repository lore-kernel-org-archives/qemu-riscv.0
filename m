Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082D1CDB482
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 22:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qssIu-0001be-Vs; Tue, 17 Oct 2023 18:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIs-0001ah-Ds
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:42 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIo-0002Uz-Rn
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:42 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-581e92f615fso409463eaf.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 15:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697580758; x=1698185558; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtEJKckoNw0Ykb9iqkOPeUtRXkS38Xbs5K+yuRMiDLo=;
 b=E6RTdNZB/fJelpzjAdHlZwDafxJbbvr7evkbSLsJBLw7H6S9wp1je+3TIEkcwT4XcK
 /0iAwKspMeV5Dy4f7IufrPFfPuu9rqkln8iAgMJKJLTO0CdVETxra+S2FtHSfwA95Xm+
 A12GSEwb64ET/IskIXzyj47Ts5xFmLcI+ZBd7+a6ctGu9IZTWFMsafmB6/ITp3lY7Nv+
 rh2PdvPjuSFWbLvPf1y957hFh2h3DyoyailWRl0loy3Zq7f+c/sHmUgZHbfNmlByWqFk
 n/vgFmp9Nouky26AmDsxy3gLIKLsnDd/xNWuR70ZmJaRIfuz7xTWRmGpJxs2GqoyEn9F
 +wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697580758; x=1698185558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gtEJKckoNw0Ykb9iqkOPeUtRXkS38Xbs5K+yuRMiDLo=;
 b=Q5X/kIgx9EiRAtQVWO5TRk5vfahghIiGFdpo5nN2xQpHol6UdXsQQZwGGGTqPkxAhL
 uhO5K7rFWsvOeMkc4ghWBrP+CGH+DiNkydfftXpByGPfI2SOc+iY5KO8PFeY5mTQo3m9
 39Mb6IjvlCS/nbVPSsIE/zsx1BD4A2bEYFGZRs5EJS3sWJMYRlcHr4DRspKy0CHGXLrh
 33eG2T5kmF7K/NI9dY9YV6jygPRAPa/+6f1sYjFAIFZRKc3Ht7wwFSoe7vzapQR4LPhx
 3ddv3yvECqgINWrefwc4QajPC8srvLvFci1nfMyFVqMw1qu8bQ9DDyX5SNm67dMmqt3i
 xWng==
X-Gm-Message-State: AOJu0YwodvI1VbUUDhcFVHjFALsuf7gLL/Lyh4L3Y+ZAbq+9zo9j9OzJ
 I5LrMfT6gVqHDCXrLqQtSWgsGA==
X-Google-Smtp-Source: AGHT+IFTomQtlx2Fdwb6WFoYL8nxgbGHPkA2r3jRYxttldqSgW2MpqpjgIzQ7RiePn95G+an54U9cA==
X-Received: by 2002:a05:6359:2a7:b0:166:d1a1:7738 with SMTP id
 ek39-20020a05635902a700b00166d1a17738mr4656759rwb.0.1697580757722; 
 Tue, 17 Oct 2023 15:12:37 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62d14d000000b006be077531aesm2011023pfl.220.2023.10.17.15.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 15:12:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/6] target/riscv/tcg: add ext_zicntr disable support
Date: Tue, 17 Oct 2023 19:12:22 -0300
Message-ID: <20231017221226.136764-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017221226.136764-1-dbarboza@ventanamicro.com>
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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

Support for the zicntr counters are already in place. We need a way to
disable them if the user wants to. This is done by restricting access to
the CYCLE, TIME, and INSTRET counters via the 'ctr()' predicate when
we're about to access them.

Disabling zicntr happens via the command line or if its dependency,
zicsr, happens to be disabled. We'll check for zicsr during realize() and,
in case it's absent, disable zicntr. However, if the user was explicit
about having zicntr support, error out instead of disabling it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c         | 4 ++++
 target/riscv/tcg/tcg-cpu.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a5be1c202c..05c6a69123 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -122,6 +122,10 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
     if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
         (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
+        if (!riscv_cpu_cfg(env)->ext_zicntr) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+
         goto skip_ext_pmu_check;
     }
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index bbce254ee1..a01b876621 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -541,6 +541,14 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
     }
 
+    if (cpu->cfg.ext_zicntr && !cpu->cfg.ext_zicsr) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicntr))) {
+            error_setg(errp, "zicntr requires zicsr");
+            return;
+        }
+        cpu->cfg.ext_zicntr = false;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.41.0


