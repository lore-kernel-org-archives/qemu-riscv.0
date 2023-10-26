Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E652DC25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:20:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw29X-0006aF-Cq; Thu, 26 Oct 2023 11:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29V-0006ZM-U6
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:05 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29U-00065r-68
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:05 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so913823a12.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333602; x=1698938402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61ZMS3NPRFqHZKTu/SPe5ruHdrWMd68xp2LyStvCuls=;
 b=D2BnB9cMLXW06SbPVgecyIbL3Aaokos8E6RJ85yrkgclrok7DGxc0v8JRzUAcN8qT/
 EYWLr4V/g/E5RhtK7MvgGD6nQlwZ6vOUfPGHK2umI0e7GOF8RbZ4a7sGdd2kvjynQPlA
 wJufya/pI+2DXQYcO1gbiEOUBID0YKXtEucjOxAnln/MwxqqKMbuq2QRM7UDmKsVYFZ3
 VyuK27Ism3IPDhV71Fbo3r1xWy5hZsVKRktYAst5+1rDgA2oAd1oAxfuX0qcr2E6bm2L
 tWtkDwIxgTNqn327pkjELdMiIFlrMCdHkHhjPQrm8+QhNQUoLRrd6DRaEB5LB2VxwrsX
 9REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333602; x=1698938402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61ZMS3NPRFqHZKTu/SPe5ruHdrWMd68xp2LyStvCuls=;
 b=seM6pDXtJmoraxOD5gF05DhPHa9Tk8Xteo+ZSaA19gX8eFpn9kgi++nWCmcCKhFMbQ
 qAu1/i4vYf9bwqbwNT90L5B6FW4kKKrfuIhYKkbdQ8vgUJtBmqIcI/YQMHJBYBrzabei
 4745XSrB3nz3dQdKoOP9KAQCqPPRtKHqPmeRfBMMA4wGdyLtIFdtxdJdWRv6p3vwvuBf
 sxqWA6dRoD68/DseV2vpEGUqSTV7vDLn2uzlOJHx0jNU6n4uNsJ67+97hu9y9qLiIvyz
 lojQZXRLLfxr7S34fLBNuWp1CB56i1NdOrAbPwzx0+dRZ2A+wXfKr7RsGonuY+gSNG+1
 b2Yg==
X-Gm-Message-State: AOJu0YzqxIcB8HaHUucNUjh4BZl0TPzQafK4kej6nhvYfG7GyMjkGXU3
 PmFL2fEBELNcAxk8S+xVHuho4A==
X-Google-Smtp-Source: AGHT+IEeVHfjDBLY5iEjxJwKst5gRDIxFyZXSKeyLLnOGRmcoXDsjzALxqZ+kAXLNG39/8GR3MH0yw==
X-Received: by 2002:a17:90a:d50d:b0:27c:f20d:841f with SMTP id
 t13-20020a17090ad50d00b0027cf20d841fmr18498756pju.8.1698333602446; 
 Thu, 26 Oct 2023 08:20:02 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:02 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 01/14] target/riscv: Add cfg property for Zvkt extension
Date: Thu, 26 Oct 2023 23:18:08 +0800
Message-Id: <20231026151828.754279-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52f.google.com
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

Vector crypto spec defines the Zvkt extension that included all of the
instructions of Zvbb & Zvbc extensions and some vector instructions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu_cfg.h     | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index e7ce977189c..d8d17dedeed 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -94,6 +94,7 @@ struct RISCVCPUConfig {
     bool ext_zvknhb;
     bool ext_zvksed;
     bool ext_zvksh;
+    bool ext_zvkt;
     bool ext_zmmul;
     bool ext_zvfbfmin;
     bool ext_zvfbfwma;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c5ff03efce9..b9eaecb699c 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -499,6 +499,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvkt) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
+    }
+
     /*
      * In principle Zve*x would also suffice here, were they supported
      * in qemu
-- 
2.34.1


