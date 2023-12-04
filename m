Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D72C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 15:27:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAApz-0004Bb-Dx; Mon, 04 Dec 2023 10:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApt-00044j-QJ
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:21 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApr-0005UY-RJ
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c0a074e71so12518325e9.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Dec 2023 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701703574; x=1702308374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FOPF54Ts8pAoe2u+mRITxVWTs2rKpGlxkYcxd5nZGU=;
 b=unhO0vPOPsQV3moEqnMZVbwn65CO8XyEKgM1NzWHs7HilesFr6SPvFpUvCdDufLrNT
 /eaaiUedKax2jnR5Hk2IyZXTBQqXLGvtbIA85mM+ELvKVI0bFeurBZTHXkodpvDWQ1/S
 LCMSVM2Rh2gQNY4YY9UxnSeWggU1KTFWdKYuv23raIZ/ZT6W5udpQzfASrtakXvoma1v
 YrBJp+Bs6QcOZ6dG3Zf0Yc+rw+rlwJAZWd89CJXlF9buTBaZ6rm8EALCH5Z9aDzFwUHZ
 VvOdG9quBLkb3UglbFFBy2xaAaeHyySxhnxTy3mo50lOpEN8iMwZR420Ni+uwa60LdzN
 0XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701703574; x=1702308374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FOPF54Ts8pAoe2u+mRITxVWTs2rKpGlxkYcxd5nZGU=;
 b=N2COzSBqfVVPVr9Cq8lkQi2yo3mlq2GxrZ8RuyjjjWc2O1SOsFg8C6SUGwJWwvPfrj
 +99vDYf+BiZbU/9m9iVF7OgTzbDQMnyxfAUcTjg2tlbva/q4JaymfDDwVSM+P+HqFhv4
 yKtEE4iXOA6cayuJpBkE/CXLXk0QpfPfr1WOzeUjYiUrEA5zc66pOUxPEtWe/8F+DzA1
 KZa5Qh5VV4EtbyRv/wfdMsluv83FlSYL04SmMLagBwBJdiu7+CJOwZmzBS7NxFY2LBDW
 Kbx0FeTyA0CDfqgFxlSWctSuerGDJYvsHtexf017xbJaux2MQ4hywzYjwR7m4wcHMHEo
 HHTQ==
X-Gm-Message-State: AOJu0YxKLwFaIrmG7dJNoP3G456Bj72Iqmw7PCG8nf07wwRJT08M+KJq
 R/EU+peDgUzNEhMUSHuwmDggPw==
X-Google-Smtp-Source: AGHT+IHX+CPEIaEpuFbgoGNu1DuFkQK9sEDxOVnHsarn5RwVqTxFiaafONykOxKvWdzchz6EXCOIcg==
X-Received: by 2002:a5d:60cf:0:b0:333:3c99:7d28 with SMTP id
 x15-20020a5d60cf000000b003333c997d28mr2476076wrt.75.1701703574003; 
 Mon, 04 Dec 2023 07:26:14 -0800 (PST)
Received: from m1x-phil.lan ([176.176.140.35])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a5d6e53000000b00333423ffcd6sm4629412wrz.51.2023.12.04.07.26.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Dec 2023 07:26:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 3/4] tests/avocado: Update yamon-bin-02.22.zip URL
Date: Mon,  4 Dec 2023 16:25:23 +0100
Message-ID: <20231204152524.37803-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204152524.37803-1-philmd@linaro.org>
References: <20231204152524.37803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

http://www.imgtec.com/tools/mips-tools/downloads/ redirects
to https://mips.com/downloads/yamon-version-02-22/ then points
to an invalid path to a s3 bucket. Use the correct path. The
site will eventually be fixed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231201205630.10837-1-philmd@linaro.org>
---
 tests/avocado/machine_mips_malta.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index 99bee49e9a..8cf84bd805 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -128,8 +128,9 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
 class MaltaMachine(QemuSystemTest):
 
     def do_test_yamon(self):
-        rom_url = ('http://www.imgtec.com/tools/mips-tools/downloads/'
-                   'yamon/yamon-bin-02.22.zip')
+        rom_url = ('https://s3-eu-west-1.amazonaws.com/'
+                   'downloads-mips/mips-downloads/'
+                   'YAMON/yamon-bin-02.22.zip')
         rom_hash = '8da7ecddbc5312704b8b324341ee238189bde480'
         zip_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
 
-- 
2.41.0


