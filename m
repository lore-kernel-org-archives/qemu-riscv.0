Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6771EC3DA4B
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 10:58:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU2Lj-00024d-0r; Wed, 17 Jul 2024 06:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2Lh-0001yy-KI
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:57:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2Lf-0005bZ-P1
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:57:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso43653575e9.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721213846; x=1721818646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ypRi42JthdMqqbguYBq+FqsBl60eengyhwuwMJG+k/k=;
 b=VFe9jOQwQlCN/okYobm5B9OjyL7l3IKytphcCCmgQbCqqK7hG1KX1ioyEbi5UOw0wI
 2KBheTg0EKJGSycY5IjZP35d8pdaId8IViQbQHBudJSL4ZPDogIqs6bLlSD2fZ4DnMaI
 XWvXCliBX+wCCxfJL5bQ4ThsTqDs+ArY6wjJ/DVBg01rLEd1kZZq+BPK1QhnLZLY3yHl
 kWwRZOW9XTeDUdpcM/pd0r0eraLyjDSP3lA3k66r5zZcckFRr4Wrm8n93/BH5hQ92Gb0
 Xw8tC5D5/kqU0f5hTNhb0FVfKJ190T4F8bpCcNQj0K+bwujc0RaWRa22z95FtcomGsdL
 ZxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721213846; x=1721818646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ypRi42JthdMqqbguYBq+FqsBl60eengyhwuwMJG+k/k=;
 b=m52Ybv88bLRsgDuEsymNsx7raKJAyfNTStrHYzgMCW/LxqyvjEIK0RCp7lUeE3/EqO
 mVplhU0vdUNqtYck4hI2Jxc/lkCRFSpTdnK6/Oqjr2xsuqvs2jmT5C61RPNJnU/kbu4z
 OOrxdWd+YDXtRB0krAQ8fWheP2qsH7ohmIA5ZXqPmxy3aisCxwH0+iBfUForOoGBabMI
 EhEE2glhW5uOGZB08tWWysPNCBMCUnFyHZi+oku2csth9IlruxbnhDDqSsjgpKZUxxHV
 vOSYhnvgYkNG3dyuQSVOU1rI04XShen3yZyUEVyBneZETALYiFZq0h2TzwZi81/eptPU
 MwgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDJkKQKEirci2h+3/MzkNuBa9IJ4HaAIzteqDt4O5Fk69tP8smQu0IDpM9+tqtKBygAo4Y5+5FbPJP297bBEze3njcRhQ=
X-Gm-Message-State: AOJu0Yz/NQaOPu9K/9sdqxFlvyNki1x+U7FuCbJbejUhu4xrINHNAU+M
 H2kG3u4vz3vYugQbJgW4O9Lg9uJ+BHAkbN1vsaROtQLPx6Vyx8Q0LIGIzq8ITrY=
X-Google-Smtp-Source: AGHT+IHllkEcnfuxCt0lRl8T8xwYlAJAxi4GK67VjhbkrdBZwlr0JKIC4X3UYvL5DfMNFCRw/EVztg==
X-Received: by 2002:a05:600c:3d8e:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-427c2cb560bmr8811765e9.18.1721213845859; 
 Wed, 17 Jul 2024 03:57:25 -0700 (PDT)
Received: from localhost.localdomain ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e81f0dsm165081785e9.12.2024.07.17.03.57.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jul 2024 03:57:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 0/8] semihosting: Restrict to TCG
Date: Wed, 17 Jul 2024 12:57:15 +0200
Message-ID: <20240717105723.58965-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

v4: Address Paolo's comment
v3: Address Anton's comment
v2: Address Paolo's comment

Semihosting currently uses the TCG probe_access API,
so it is pointless to have it in the binary when TCG
isn't.

It could be implemented for other accelerators, but
work need to be done. Meanwhile, do not enable it
unless TCG is available.

Philippe Mathieu-Daudé (8):
  semihosting: Include missing 'gdbstub/syscalls.h' header
  target/m68k: Add semihosting stub
  target/mips: Add semihosting stub
  target/m68k: Restrict semihosting to TCG
  target/mips: Restrict semihosting to TCG
  target/riscv: Restrict semihosting to TCG
  target/xtensa: Restrict semihosting to TCG
  semihosting: Restrict to TCG

 include/semihosting/syscalls.h            |  2 ++
 target/m68k/semihosting-stub.c            | 15 +++++++++++++++
 target/mips/tcg/sysemu/semihosting-stub.c | 15 +++++++++++++++
 semihosting/Kconfig                       |  1 +
 target/m68k/Kconfig                       |  2 +-
 target/m68k/meson.build                   |  5 ++++-
 target/mips/Kconfig                       |  2 +-
 target/mips/tcg/sysemu/meson.build        |  6 ++++--
 target/riscv/Kconfig                      |  4 ++--
 target/xtensa/Kconfig                     |  2 +-
 10 files changed, 46 insertions(+), 8 deletions(-)
 create mode 100644 target/m68k/semihosting-stub.c
 create mode 100644 target/mips/tcg/sysemu/semihosting-stub.c

-- 
2.41.0


