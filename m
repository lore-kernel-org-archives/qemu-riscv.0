Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD91FC001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 18:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTRGo-0007jc-8r; Tue, 08 Aug 2023 14:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTRGk-0007ij-Fy
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:17:23 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTRGi-0005fX-9d
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:17:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc02bd4eafso51018625ad.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691518638; x=1692123438; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kquCB3S6DJznCAq/H5AtwqsePfIU1qyDH4Mkk6K35/Y=;
 b=khdZrlcXeaaPKDopC4oHJQ6NWDHGQCTaf5f0xg3eY1ZrbJbW/Hzp1Kcv66ws86YW70
 4CHXi9tka3naY8eq/GB4wZofDo/KFnmSo1JMIwxPf5vGLI6RnFqX3bxfslJ8NJooRpy7
 +cW53FlgLhzoKVKA2GP0bMITAIF7WOpNrQXhixvoJnsLKJtFndsxfu/HZ96FTltoM6Xy
 /KlD5z9hejQLgUuFs8+tp0lCDg1j6RdbssSpkpjPnu6u4zGfJxcBHFtlywWQ7yCvpE16
 OLmKAUuex+GoOOp7jCeG96B31opyfraMVm4OhVkRyOFlsQ9ufsYAKOvxFCNJtLnXLQJE
 73DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691518638; x=1692123438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kquCB3S6DJznCAq/H5AtwqsePfIU1qyDH4Mkk6K35/Y=;
 b=kqNSE9w6Ggil+iF2QHtGROFst0yOY06fDHwyRb9W2ZBcWPOBw1XmgJmtiXo9KjSh/Q
 nzUNScPoLSFKqB+FmYNJZcQkyu8kWtdKLDn0ObSO7+B5nrZeus7mKN6XiO1NFySfif+J
 qxfqz3hQt5WA9/hoI0apwehHxFm2rBRnvrW4iX5nzSUouKr1Rz2T083UW3fS6mdYI97y
 +Jj55pcqWQiOveB+J778idLKvK8ZHUEGQOczBMIlPQfkIQtHYsIlUDxvwH1zPx9qrIdw
 jxI6QbZBVRbtX5Y8AG7EGgdLS2GT/osCcCSZCUoc5BSoVrFQVTZO+uZyeJ9EKcLHIcZ6
 SOPw==
X-Gm-Message-State: AOJu0YyXBeNo/rnfBLQj3QyJHUFAIk9Uv6+xMK5bar6rfbnEtaPL3Fag
 D+xvx7QBiJLhYK0Hd3Nja5nCnA==
X-Google-Smtp-Source: AGHT+IHRNdTnFXFxEC3CcXKnerO5NqxX5uIBofvheXY2HtiNQUyU8T8uDRgT/CNyB1Z4+xuLBGsnGA==
X-Received: by 2002:a17:902:be0a:b0:1b8:4f93:b210 with SMTP id
 r10-20020a170902be0a00b001b84f93b210mr438848pls.45.1691518638513; 
 Tue, 08 Aug 2023 11:17:18 -0700 (PDT)
Received: from vineet-framework.hq.rivosinc.com ([50.221.140.188])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902b78500b001a5fccab02dsm9337248pls.177.2023.08.08.11.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 11:17:18 -0700 (PDT)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH 1/2] riscv: zicond: make non-experimental
Date: Tue,  8 Aug 2023 11:17:14 -0700
Message-Id: <20230808181715.436395-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=vineetg@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

zicond is now codegen supported in both llvm and gcc.

This change allows seamless enabling/testing of zicond in downstream
projects. e.g. currently riscv-gnu-toolchain parses elf attributes
to create a cmdline for qemu but fails short of enabling it because of
the "x-" prefix.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453c8..022bd9d01223 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1816,6 +1816,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
+    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, false),
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
@@ -1832,7 +1833,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
 
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-- 
2.34.1


