Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5646C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:21:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw29r-0006jP-Se; Thu, 26 Oct 2023 11:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29q-0006gL-D9
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:26 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29o-0006IG-Jq
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-27d329a704bso809845a91.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333623; x=1698938423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAUDHg5SvFHq8f6WzNLKNQdJ5ooAkR6tXZ2miRiTziU=;
 b=Jo2bdQcYWJwLWsgbPtgmZInTtgWWCW+QPeD6ICePN51jZ3cHsplIoDqudLGQlhsTV0
 tk9gXc8zREyKJYKGxHZvL59C6pNwvPn6I/6/nynEYXKidiiEwMYLhxGgjbLeuiwp6q8K
 X6m3zFZgr7Szv9qoO2BTEzJDtE1b5klDbq8iuCwKodQB78D08izcKSy/uZm/b9hRiwhC
 wTiYnyK+RSoweQojoBhOY7PJKNYwvDG7GnU0m0ajMmT6BeTOqTpCuq/IVfIv9o47RGJo
 s/hGaQQLsvTmz4q3tLts2OHTiGMqabpTsu2Eobgpz4X2iuyQGVNcj7Ui467LsQhLLdCR
 cawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333623; x=1698938423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAUDHg5SvFHq8f6WzNLKNQdJ5ooAkR6tXZ2miRiTziU=;
 b=p2JoAHSka7mY1+4klSH2qEyF47hdWivHGMgK7dH34e9QN4ufjSgTxWCWuqdnO80APx
 vf4gZ+trzwx+8X07pYnUQ+tC1SvdrcfB5+zVNmqfcJz+cF4PbGaAYY50nck8voD2hS/2
 fBnY1s/kXLpQSv697Pp63o93UgMW/BPZA3tYjskaixPwUqVcuoMoTVfVphQ/wI4D/1Y5
 ln09APxC+/16ZDuaDiaYERvVoPWIVCLBE37x/FBjP+4mLGJuvqgiJ3kny8RMSK0aZMSj
 IPoyHHDaXCBG7gdb1ZbPrbXiP3uQwVZFDwyGLoW7+8pdXyRpk+xW/nDSyXLCe7ppgrr1
 YxKQ==
X-Gm-Message-State: AOJu0Yz2eJ+0jac3k3o95NqO8BhDYnPxqyE6KIxGwY8LVn/gRohumMfK
 yUrSv9TNjY3xFuZGIHwk3Hv9pQ==
X-Google-Smtp-Source: AGHT+IFJeP8lzwUg2cYbxY8BScLPjbXfHXAZMLWr21z6bmlpJBEjrUUKgGOYMnPtuck/xLmuW1osrA==
X-Received: by 2002:a17:90a:94cc:b0:27d:af4:c8b with SMTP id
 j12-20020a17090a94cc00b0027d0af40c8bmr15795377pjw.36.1698333623196; 
 Thu, 26 Oct 2023 08:20:23 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:23 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 03/14] target/riscv: Add cfg property for Zvkb extension
Date: Thu, 26 Oct 2023 23:18:10 +0800
Message-Id: <20231026151828.754279-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1031.google.com
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


