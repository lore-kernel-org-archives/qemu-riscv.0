Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CD1C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvfaR-00056A-BN; Wed, 25 Oct 2023 11:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfaP-00055V-Tf
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qvfaM-0003Yz-9S
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 11:14:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bd0e1b1890so4705908b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698246857; x=1698851657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAUDHg5SvFHq8f6WzNLKNQdJ5ooAkR6tXZ2miRiTziU=;
 b=nO71+nE2LdFony8l6el+fEBx3wWYRnBwipmu5DnUoynMwrsHMd1jHaozY0eweQTCrW
 rUpHdxksmx9pKsxMQZCm840xECEdxRTFbvMfnjSHv4KFre3UbiK7Cr2iqPM6VvrZK3PM
 GQKQYEhtB4EB9FUj70paHiLBGqwiFAnPxoigsYf2lDyx2MzAfwWTgYFRO/qdBPmsUkCY
 JGdNNWz+80QjP/I1h2DXxm4T3gWBzG3VzVK6rbJT7N5rUDC54z+RJ3TN9cwViWxw8jC7
 IXHgYz/lCEC3lJfq5C7Meb3Iub80fsvm9TP1AZcBd7D8hJX0ixQq94qy0v3HbIAYnI47
 hBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698246857; x=1698851657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAUDHg5SvFHq8f6WzNLKNQdJ5ooAkR6tXZ2miRiTziU=;
 b=IBIGcucGtK3hBoYPNkwjCtEbQ4w0j9RcJCEgVSq+q8yO8k6kNRnomdl6NwONuJzDuL
 HJw2OJvEY/HgeLGXMo9Y71Kn7VvPl6j1hg7sQJfGHlliof439o7RHdN0xIl/CrqomGyc
 dGJW1bohVEJb+oHe6TF+mRSXqcKcAwHkzILtHS8Lcmf7efu/8cFFt+mG4ENA5Fkz4OaO
 UX1fjjBb+vXr9tzsQZYR0hKPbmVWiRNkR3f42ryDsoJmIIhsTQChnoyaFi647nWI8Z1T
 yB61F2FdsGtQ0WooNQFkmeTiwaywIty4EVSYS8GMX5GX/2fnLht8e3/G0GrF45olJXN/
 /ODQ==
X-Gm-Message-State: AOJu0YyTOc4DRi8U3vNz/iWEct/3VBdfjo/EBmFLA3wbwBuWERiGMbd2
 JSbAvY0XP2gFYvDraceBjLRjTg==
X-Google-Smtp-Source: AGHT+IHICGbDwjDioFBC4TlX2oY8iVWoHsycALrhM2a5WwNdNBdt4RB0eGm3S/WYhS4vA3ZiiazcHQ==
X-Received: by 2002:a05:6a00:15c2:b0:693:3be8:feba with SMTP id
 o2-20020a056a0015c200b006933be8febamr13774975pfu.19.1698246856668; 
 Wed, 25 Oct 2023 08:14:16 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 w14-20020a63160e000000b005b8ebef9fa0sm2677807pgl.83.2023.10.25.08.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 08:14:16 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH 03/14] target/riscv: Add cfg property for Zvkb extension
Date: Wed, 25 Oct 2023 23:13:27 +0800
Message-Id: <20231025151341.725477-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025151341.725477-1-max.chou@sifive.com>
References: <20231025151341.725477-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42b.google.com
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

After vector crypto spec v1.0.0-rc3 release, the Zvkb extension is
defined as a proper subset of the Zvbb extension. And both the Zvkn and
Zvks shorthand extensions replace the included Zvbb extension by Zvkb
extnesion.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index d8d17dedeed..935335e5721 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -88,6 +88,7 @@ struct RISCVCPUConfig {
     bool ext_zve64d;
     bool ext_zvbb;
     bool ext_zvbc;
+    bool ext_zvkb;
     bool ext_zvkg;
     bool ext_zvkned;
     bool ext_zvknha;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b9eaecb699c..1b08f27eee4 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -508,9 +508,9 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
      * In principle Zve*x would also suffice here, were they supported
      * in qemu
      */
-    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg || cpu->cfg.ext_zvkned ||
-         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed || cpu->cfg.ext_zvksh) &&
-        !cpu->cfg.ext_zve32f) {
+    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkg ||
+         cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed ||
+         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
         error_setg(errp,
                    "Vector crypto extensions require V or Zve* extensions");
         return;
-- 
2.34.1


