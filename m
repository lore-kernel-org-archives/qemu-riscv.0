Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474CEEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:32:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE9kQ-00042G-Bu; Tue, 27 Jun 2023 10:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9kP-00041r-1u
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:32:49 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9kN-0003cC-Ew
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:32:48 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9922d6f003cso83289066b.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687876366; x=1690468366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y72Cvu7+GGKH51wZ4ZTPnItUIyTNc7r63P3IdRE4o+o=;
 b=MztS8j7tLpzm56SqQpg7rc7fo6nwwsdVX1hBIumipRYBDODwklz1pxxzzxrOTaXGuq
 OJ6WS4isrkZ2jTgrLZ45tuQqE4N/vPiJNlLHRinRgaRRdZ4qMVKCKdrB9+3jHXOmUwXx
 b5SQSsJZmqNgrSpf6FhzL9lxxpvh4VrqzT84TPxrxKCJk/YdaZKVItCzC8jMf/8LrAca
 nEzLUfg1ho0ZYrLLWJBLJAk3jzMAmi5F74HF1VWb2viL4OxZjE28dpEnB9OiU+jnP42+
 EsxZ0hErStDpZjiX3AywyQqkK0P4TdHvAoPi1wlZKS3r8W6kn1aSymOCC6JDjinBhVdJ
 aXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876366; x=1690468366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y72Cvu7+GGKH51wZ4ZTPnItUIyTNc7r63P3IdRE4o+o=;
 b=PJPjdIcyzz8pwFediDdo0PjOi2nSz+rN5XqTbuEZnwhEQN4BpIcq26uNzWObr7AGit
 P+otdC/Mw3C+LMTouvknlttk1X1qMzUd2zYMMlVaOBw8d3s9Zgn+s5whAiy8vbpuzsxc
 xcVW/BKvDqp94VL/ZfSEi4Zt+TorxHkXLsxhqNTr9anSvX54nsUcvKpUbT4AuuwPaLTp
 f+SNS87o5Y1qILZvy20rT6nMS6PWNFm0WL+0LuY9JMWOT6/uSp1U2EYlrDBYgMwfJL8Y
 qrUVC8yNFeWxJva/PFZQ49gvcVcnNja/6SVGRZd9jy3V3YWBTqJlPPLWpyr0YbVdNgse
 gt2A==
X-Gm-Message-State: AC+VfDypqHCFpmJ4ykH68NYiMdcURnWoLmQHccoJZNOoK9v2kQi9zZD/
 OUdJf27lOdQK1cAUL6F5QrBa5Q==
X-Google-Smtp-Source: ACHHUZ6i9BHvtFNXhZ3RkKuYWusx/WasaAnWMdOPkSkWknXDKSepYWk+KXa6CY215zaQOMuiOfOiAA==
X-Received: by 2002:a17:907:724a:b0:987:16f5:692f with SMTP id
 ds10-20020a170907724a00b0098716f5692fmr25811436ejc.44.1687876365924; 
 Tue, 27 Jun 2023 07:32:45 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 r24-20020a1709067fd800b009890f2c4cf9sm4627699ejs.79.2023.06.27.07.32.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Jun 2023 07:32:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/2] target/riscv: Only unify 'riscv32/64' -> 'riscv' for host
 cpu in meson
Date: Tue, 27 Jun 2023 16:32:34 +0200
Message-Id: <20230627143235.29947-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230627143235.29947-1-philmd@linaro.org>
References: <20230627143235.29947-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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

We want to keep the ability to distinct between 32/64-bit host.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index fc3c14a810..649de244c6 100644
--- a/meson.build
+++ b/meson.build
@@ -55,16 +55,11 @@ qapi_trace_events = []
 
 bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
   'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64']
 
 cpu = host_machine.cpu_family()
 
-# Unify riscv* to a single family.
-if cpu in ['riscv32', 'riscv64']
-  cpu = 'riscv'
-endif
-
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
 have_bsd_user = false
@@ -99,6 +94,8 @@ elif cpu == 'x86'
   host_arch = 'i386'
 elif cpu == 'mips64'
   host_arch = 'mips'
+elif cpu in ['riscv32', 'riscv64']
+  host_arch = 'riscv'
 else
   host_arch = cpu
 endif
@@ -113,7 +110,7 @@ elif cpu in ['ppc', 'ppc64']
   kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
 elif cpu in ['mips', 'mips64']
   kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
-elif cpu in ['riscv']
+elif cpu in ['riscv32', 'riscv64']
   kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
 else
   kvm_targets = []
-- 
2.38.1


