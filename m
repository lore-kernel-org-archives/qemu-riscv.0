Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB8EB64D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 14:38:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJayJ-0000lA-I1; Wed, 12 Jul 2023 10:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJayI-0000kl-Pt
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 10:37:38 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJayF-0005qX-V7
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 10:37:38 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b8decf09e1so6160901a34.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689172654; x=1691764654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XvA/EW8bgL9rBEB5uuntP1wRIt5rz95dfXHcblCouLk=;
 b=HOyvcmOn0PvoikoQYkhLmnnyOjEm2NdTRFFCj9EkZUEjxCKVYXf3sDyuOuqDMsABQf
 /BR3lmFvAKlBH9spBzcI+g+IM/84AXMXicpvA8Igmm9cCx5bBAORVKWLfZj+50GhAegt
 48v1+4wJ/S9GR9p6Q6JnmyrB/NucHaa4HngBiumbof1Cz2JmPR2dX6qkjTz4CaAC5jF+
 WbWGRk1T0E5hrli8MW6Mu5R0yAfSpWFW80fETO3vEewSlUFds7v06dU7OfRynZEuWzKM
 u67IPy8SDdGLSZhAI6DRL/Wsnt2/W1AYZ6KyiZCcbwdeMsPFIBdI4DBvLHEUjo4FUo3r
 8lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689172654; x=1691764654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvA/EW8bgL9rBEB5uuntP1wRIt5rz95dfXHcblCouLk=;
 b=cVZcETFgUkTvDUSZxn356vExaCdYCZ7X7GU7eXIflVYtYWYxZshOH9g37bQvjNMup2
 uyHFvdoW8UDD97VtEXNj9SQG6cWqF3YkJgOryEiZj5vRG+CkWCGFc1n1P1rTBoR2YdTY
 4oSvIHDwcy6X8KHBQeeVH/ZDVLFINNjjo60dNLahYja6Eh4G+2p4GodVS2qTRSg5edwn
 oH9prbIFy7valscg2hjTEAd87irhwxUXbSF300ITN+jVW3QTNc6oUNUWQF+XqbPnBbcE
 kMuuMf329LG0N4dzOwMlrY/ODpg/pioRXrEk7jwSXfN/R4qEMRvCCF/k4Voo2nKudGzM
 n+tg==
X-Gm-Message-State: ABy/qLbtYgNw4FQXkoXeKcIjKgaUNJloVvcG815PtO52B+b/yfFZ+BCY
 ooa2TcYWZRvViTs/eM5z5UZU0g==
X-Google-Smtp-Source: APBJJlHMU/S80yWZsdYvRzBj9tKDMKxDb8D8kg/I8Lr7/ELbM5QZu6wD1UzcY84a6Wr9PK8RPvowsA==
X-Received: by 2002:a05:6830:328e:b0:6b8:7e53:e7c3 with SMTP id
 m14-20020a056830328e00b006b87e53e7c3mr17519659ott.31.1689172654308; 
 Wed, 12 Jul 2023 07:37:34 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a9d7585000000b006b29947160csm1953388otk.30.2023.07.12.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 07:37:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] docs/system/target-riscv.rst: tidy CPU firmware section
Date: Wed, 12 Jul 2023 11:37:28 -0300
Message-ID: <20230712143728.383528-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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

This is how the content of the "RISC-V CPU firmware" section is
displayed after the html is generated:

"When using the sifive_u or virt machine there are three different
firmware boot options: 1. -bios default - This is the default behaviour
if no -bios option is included. (...) 3. -bios <file> - Tells QEMU to
load the specified file as the firmware."

It's all in the same paragraph, in a numbered list, and no special
formatting for the options.

Tidy it a bit by adding line breaks between items and its description.
Remove the numbered list. And apply formatting for the options cited in
the middle of the text.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/system/target-riscv.rst | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 89a866e4f4..ba195f1518 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -76,11 +76,19 @@ RISC-V CPU firmware
 
 When using the ``sifive_u`` or ``virt`` machine there are three different
 firmware boot options:
-1. ``-bios default`` - This is the default behaviour if no -bios option
-is included. This option will load the default OpenSBI firmware automatically.
-The firmware is included with the QEMU release and no user interaction is
-required. All a user needs to do is specify the kernel they want to boot
-with the -kernel option
-2. ``-bios none`` - QEMU will not automatically load any firmware. It is up
-to the user to load all the images they need.
-3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmware.
+
+* ``-bios default``
+
+This is the default behaviour if no ``-bios`` option is included. This option
+will load the default OpenSBI firmware automatically. The firmware is included
+with the QEMU release and no user interaction is required. All a user needs to
+do is specify the kernel they want to boot with the ``-kernel`` option
+
+* ``-bios none``
+
+QEMU will not automatically load any firmware. It is up to the user to load all
+the images they need.
+
+* ``-bios <file>``
+
+Tells QEMU to load the specified file as the firmware.
-- 
2.41.0


