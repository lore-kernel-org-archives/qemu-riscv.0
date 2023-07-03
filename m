Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33870C30654
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:36:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOMt-0002cv-VA; Mon, 03 Jul 2023 14:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOMl-00026k-EM
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:33:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOMj-0000Zf-RL
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:33:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso70133825e9.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409216; x=1691001216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ckg/85qiN6gI5pyiRTX4xzKyUkymMYXNoWwRj2IvYvQ=;
 b=rZq4AVOmPly186wO8fVY9rb7E+75gT1CaBAZ5pLcZ9zFVP9+r7eKj929w0iJRYl1nh
 mK+ZeU4SVogjL/yaq7XXtuTiMTML1e0XLQhEyTSWBtFnzAXK1/7cmsfX4VUomBGzWTz5
 eACMkTC8miiWXovkzrpq9irqj8VqnUF8MxUU+wp/sg39MVfM/Z/nWF8EAyiUW/SNDS1X
 RlBMojFJG2HjwKINFjZUAaNdTLKbuaoKAsQBTVHVbPwzy8Bop8LD5vUf27I39RCaFRnh
 HHvppzM5q17r5amEmiTAQfMNMRV1sOKgXgBp6zM5AptZSygF5lemQENWqzQUSXPkrU4/
 8LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409216; x=1691001216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ckg/85qiN6gI5pyiRTX4xzKyUkymMYXNoWwRj2IvYvQ=;
 b=ZBux3JFVjfVyAUcLwTFMtS/V3TUgvJmdZuWlECM4KjjI8i4rfK1OsjJerAXxd0179K
 xLh6WfvIO/b4OpP2+BGs+jJ6Z7sF/xqJr/179F4B0qvFNfZn0AoOYRRh7rf0XTxZPlZK
 8BWVXGBZqlqKHMCNWQiT8UjpnFr/51dGxbsqs94rAA3zmyePogN12Rbhp4v48Z4hHIc4
 rs5bUeUPpnmxXuiUcyNJEtMll9gOkV2RDD7x1ostEjf09rj+Zctnw5vAL//3H2cv+YSc
 qaKyxTz1GOElQfccn2ZxM+L7AYM97Ll6NNEnyrz86HWNxgObvqkrCr3RKBE9FyB/LrqI
 DbvA==
X-Gm-Message-State: AC+VfDwE8ATeBmOub0bfDUD+mMdiGnLA1sjDTNZg+z0J+SSm4+ljrvWd
 uxPy1Ph92W0XgzIX+CYrk47DWg==
X-Google-Smtp-Source: ACHHUZ73wihO7mepuWylWzji6mQoWD6CbwMkFLZ/C/6C43GThLV/R0+WGKdMwtw9c1hR1bVu3kVc8w==
X-Received: by 2002:a05:600c:22d4:b0:3fa:fe34:f80 with SMTP id
 20-20020a05600c22d400b003fafe340f80mr13892838wmg.39.1688409216342; 
 Mon, 03 Jul 2023 11:33:36 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003fbdd9c72aasm1201327wmc.21.2023.07.03.11.33.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:33:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 16/16] gitlab-ci.d/crossbuilds: Add KVM riscv64 cross-build
 jobs
Date: Mon,  3 Jul 2023 20:31:45 +0200
Message-Id: <20230703183145.24779-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a new job to cross-build the riscv64 target without
the TCG accelerator (IOW: only KVM accelerator enabled).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index b6ec99ecd1..588ef4ebcb 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -129,6 +129,14 @@ cross-riscv64-user:
   variables:
     IMAGE: debian-riscv64-cross
 
+cross-riscv64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
+
 cross-s390x-system:
   extends: .cross_system_build_job
   needs:
-- 
2.38.1


