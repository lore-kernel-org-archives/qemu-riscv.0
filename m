Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BF6E77198
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCqT-00077O-Ne; Tue, 07 Jan 2025 11:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCpb-0005D8-QJ
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCob-0005xT-HF
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso156688265e9.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268744; x=1736873544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOL1w6DXYhRHKCvs8ew1RtJiJh2Nk45cuCcCN9iEMs4=;
 b=bJVCpxmCRYrxELIH/R/TUy4UkND6KIfHczhvWalzoEiB6I1WEXLLvKIx8UbNfGf3vX
 d3kAcCiJlu7Z8P7zq4XThF8lAH8HRRNmH8mE6DM9dpafFSWL1KC4mMcGl4DJUVs5yfV2
 pZdjB/vLVS8FGTZbfCldMmSzVf514UWLzcUX3P9dmlVfKuaBwXauhYjKWQASbGlX98rQ
 m7Ki0qzuGf0EGW3+1xqwxcZOQwT92PnhcEVQkvGBJdUaMuDDNx/mOFTWtgQxMi6xA3m1
 WPSq5UMCvImCgOvT6k/WA5JebfboEiVHgNoeSs5TS9+s+5CzMml5rk4h7pqPBR6btWNT
 eLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268744; x=1736873544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOL1w6DXYhRHKCvs8ew1RtJiJh2Nk45cuCcCN9iEMs4=;
 b=oTQGShM1bCeyHfLB0GVwbmvjlt3HI8N7FPUSCYwb7JcZUCvFOq0wfqegYZ/zjy5qWI
 e7YZdRupmJ/vH/UO2Mo2aeRn8ivayBnn+iK5Q45UPMzggpERXFxX6sd5dl5hYj0G8J+P
 i65ajR99e4k2HIQXhLA0ewKrwV7x4Ingsh8hL8Ib48csG2jSxgkkE7T4h1Km8qURTGHZ
 0J6HXFnooMe5ubR/RtbrSpeeGAA6ErB0qmLwRErLkm92jBnBAntPmby9a4jfAkHmiOBU
 kaVihalJCYy53rTWiedqww24NKIu/Oi+gZSQEMqBlRA2mdTntXAmn7pCfHoUbgvGF0yY
 RxCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw60kpAWtwhYZsuSv1SAA6kluNjl6VQFy6dW1n8P9hIufvk0jUKSxn/bYweuQUjYZ0bXOUxaj3oAod@nongnu.org
X-Gm-Message-State: AOJu0YztFeIln6zDhugYT3kfh2aANhzJPZHis5fCX06lqvoIHciZpBBW
 RNynrpcUan/4lX7kq+H2lYhkvtput4J2jJ3QeaZVtX8h5coDOuOUKtNltPY7qek=
X-Gm-Gg: ASbGncvv+0Ga5lond502Fr6AuI6hC+B4zSDsBMs3gPIezavFcpmm5byvMzvUPW4EA29
 K6HFi1UQZjNfkEnx7u00TPJETEnJZrlyLXT3xrkalk88ctsM2x2gc1SpYsVj331w1/vM1wNEjzC
 7JtOe99Cye+rYD5Ldy7S/SY8E6c+x6ITn4j2KCqFO4ixAEc6g2nzu3f3BujfypUBjeYTGLsZHB+
 1tv5sl0MaystC+r4bQXnVk6JfV0/wz6LRBxZYqrtEr6DD7r8hlDvEw=
X-Google-Smtp-Source: AGHT+IFNDzjgNio99KjA4CNrZqt044tR+yPTj4ZI4LY/EjTtw+XPBEW4crdWNJqJULnvsKp3pZBJ4A==
X-Received: by 2002:a05:600c:1c1a:b0:434:a746:9c82 with SMTP id
 5b1f17b1804b1-4366854725cmr528081785e9.5.1736268744136; 
 Tue, 07 Jan 2025 08:52:24 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b1143dsm633698265e9.18.2025.01.07.08.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:17 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 384DD60132;
 Tue,  7 Jan 2025 16:52:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 24/29] tests/vm: fix build_path based path
Date: Tue,  7 Jan 2025 16:52:02 +0000
Message-Id: <20250107165208.743958-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We no longer need to go into the per-arch build directories to find
the build directories binary. Lets call it directly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/vm/basevm.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 4a1af04b9a..6f3f2e76df 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -520,8 +520,7 @@ def get_qemu_path(arch, build_path=None):
     if "QEMU" in os.environ:
         qemu_path = os.environ["QEMU"]
     elif build_path:
-        qemu_path = os.path.join(build_path, arch + "-softmmu")
-        qemu_path = os.path.join(qemu_path, "qemu-system-" + arch)
+        qemu_path = os.path.join(build_path, "qemu-system-" + arch)
     else:
         # Default is to use system path for qemu.
         qemu_path = "qemu-system-" + arch
-- 
2.39.5


