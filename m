Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44254E7719B
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:55:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCqM-0006bI-S2; Tue, 07 Jan 2025 11:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCpW-00056A-CJ
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoZ-0005vl-8y
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so8632687f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268742; x=1736873542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bkcZ+UQ0l/G8BdjL46Ekgb6aiXVq9O7cYmGEkCbVeY=;
 b=EtP2JYyofY27C6qg5Flc37aCdv7HrJZ5etsiFXU3bFNNm9aCsmF7nRx9tw2UYwDGH3
 ASf4amad5vvIblAiy2rVl3dT1KL0k1q2FR7jzyh2ritrQNvkg+RWeofDqN3Nn6ejvSaj
 wTk5adon3duCAIQN05BW+k/PjM4EP0XfZHKrT2Yf9oCbR8xQWaWKnRMw9XIeG8X876xR
 DW9XZqsi/kvhJpOLOppGqHNlJUoTM8xdtMYD5/s4jls4IbWxrZOwy4kk7isMEUysAiwr
 uirY+xEv0Kce3Q0GwDjcJA5/liQajBSQmOas7ExKhk6sp5Inta2w2IJXgi1R/UL+1+r1
 O1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268742; x=1736873542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bkcZ+UQ0l/G8BdjL46Ekgb6aiXVq9O7cYmGEkCbVeY=;
 b=aV54T6bMftFZLIT3g93Rs+mwxaO0fcLzA64osIbJ1DBwF2jS2Kh17DpxJm0UZKKUNS
 m4g8lCwffCGxekZ9ABK4r3VynZFeOeQYqnmFbQ/qTZ1FW58z4Lsaf2qUXTas6r9C5guK
 ftcTwzB+kvyA3/cls/nzlt110UfTZdSte0hU2hp5r1hdEki+W0zgSToNEyNAMsFinVQp
 4H8HyRkmkBgst3t0e3KWkt16lEZBVeWuR3RdiUX8NfCRv6dGk1hRjmc9u44Ro4RowXCO
 sNAiuiwzrpG8wzapG8+5EgnRc+6rlOQr/m0pVSoDVua1/a3UaoR+kKSq7m9GorC+sMrA
 061Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2RHnD42uUeHq1j1+Hp+F2pguni2pPrDqxBC99d136rfLEnJgyxzO3MvwDH63so73yQMknwD6YHfGQ@nongnu.org
X-Gm-Message-State: AOJu0YzJt/GF7v2LYCvj8C607n/bcLi/gjChgDdCXJXHQds1GI+OYfJO
 +nPr/7GnfA1L/e/SZs08vV+czyCn/BrC5FeMn1XZg6SX8PC8IUKlrSILTsX6NHE=
X-Gm-Gg: ASbGncs/u1wyE/Q3WkM+y9wTdGRM7Q5YZIqup8kF+0nawgSSMsDKkO1Kl8qrFZOcvQM
 PMjYWPI+CtxKPvUpZ4CNe9RgwMKj9V1FuzG6BGskTqz2G6uYo0RII40AeGpmPLIVyj8X+4+RFya
 7anRaUJxZ4u4b9f/WVOnPF/nAhNul8IvxmAiAjzLJH4ar1EKNUY3RmoY08RoVKvmuTZx7aVHFRv
 a0Z67y+u4l311jFmcYwHMWhmO36xn/FpJfJTEz1UvwoKEy1mQ5pbrw=
X-Google-Smtp-Source: AGHT+IGefZKDySJlS4CrSeYUwxLMByi32RabbTOWrXYjfIFalO0HsUJ1KBm/dHAmxfMbCI9mOH8XbA==
X-Received: by 2002:a05:6000:1fa9:b0:385:f38e:c0c3 with SMTP id
 ffacd0b85a97d-38a221f1391mr47094494f8f.6.1736268741670; 
 Tue, 07 Jan 2025 08:52:21 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a457584bcsm33619886f8f.89.2025.01.07.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4C6925F8FC;
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
Subject: [PATCH v3 25/29] tests/vm: partially un-tabify help output
Date: Tue,  7 Jan 2025 16:52:03 +0000
Message-Id: <20250107165208.743958-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

While the make syntax itself uses tabs having a mixture of tabs and
spaces in the vm-help output make no sense and confuses things lining
up between terminal and editor. Fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 13ed80f72d..d80ca79a28 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -64,23 +64,23 @@ endif
 	@echo "  vm-boot-ssh-<guest>             - Boot guest and login via ssh"
 	@echo
 	@echo "Special variables:"
-	@echo "    BUILD_TARGET=foo		 - Override the build target"
-	@echo "    DEBUG=1              	 - Enable verbose output on host and interactive debugging"
-	@echo '    EXTRA_CONFIGURE_OPTS="..."   - Pass to configure step'
-	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
-	@echo "    LOG_CONSOLE=1        	 - Log console to file in: ~/.cache/qemu-vm "
-	@echo "    USE_TCG=1        	         - Use TCG for cross-arch images"
-	@echo "    QEMU=/path/to/qemu		 - Change path to QEMU binary"
+	@echo "    BUILD_TARGET=foo              - Override the build target"
+	@echo "    DEBUG=1                       - Enable verbose output on host and interactive debugging"
+	@echo '    EXTRA_CONFIGURE_OPTS="..."    - Pass to configure step'
+	@echo "    J=[0..9]*                     - Override the -jN parameter for make commands"
+	@echo "    LOG_CONSOLE=1                 - Log console to file in: ~/.cache/qemu-vm "
+	@echo "    USE_TCG=1                     - Use TCG for cross-arch images"
+	@echo "    QEMU=/path/to/qemu            - Change path to QEMU binary"
 ifeq ($(HAVE_PYTHON_YAML),yes)
-	@echo "    QEMU_CONFIG=/path/conf.yml   - Change path to VM configuration .yml file."
+	@echo "    QEMU_CONFIG=/path/conf.yml    - Change path to VM configuration .yml file."
 else
 	@echo "    (install python3-yaml to enable support for yaml file to configure a VM.)"
 endif
-	@echo "                                   See conf_example_*.yml for file format details."
-	@echo "    QEMU_IMG=/path/to/qemu-img	 - Change path to qemu-img tool"
-	@echo "    QEMU_LOCAL=1                 - Use QEMU binary local to this build."
-	@echo "    TARGET_LIST=a,b,c    	 - Override target list in builds"
-	@echo "    V=1				 - Enable verbose output on host and guest commands"
+	@echo "                                    See conf_example_*.yml for file format details."
+	@echo "    QEMU_IMG=/path/to/qemu-img    - Change path to qemu-img tool"
+	@echo "    QEMU_LOCAL=1                  - Use QEMU binary local to this build."
+	@echo "    TARGET_LIST=a,b,c             - Override target list in builds"
+	@echo "    V=1                           - Enable verbose output on host and guest commands"
 
 vm-build-all: $(addprefix vm-build-, $(IMAGES))
 
-- 
2.39.5


