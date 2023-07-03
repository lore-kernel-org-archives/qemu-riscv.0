Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D8C001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:32:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLE-0007bT-F1; Mon, 03 Jul 2023 14:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLD-0007bG-El
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLB-00008x-Rm
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31434226a2eso2495448f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409120; x=1691001120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N55U4NP3yl4GvH3dWyOKO0l2DdmIx/ff1ghfMtMlOlU=;
 b=WitXZlHOET0XeyI0S46Q/K7yteKUZtSFQ+dEETzxJvjTxIoDbA2RxizG6FhquwjEZO
 5Z1WWj07NMCsg1VdZbUMSjVm1NB9ZPNTZyWr/KIdl8cUe1zW+cqUeuVntMvGLPcko1dO
 B9bdTnuKqyJB6EorK//ZFtAClhBMwIQGps2XyWMto/r7nyJ7wDsJ8dIxY9KbQHqoGHVp
 /wYVnzqUX0hbj72jYRkWySsgUpWcN/t3UIvvuYFRvqHEvW2I2KcSWdZcmZB0kPjuLsK+
 ZN2xmc3AikkIlyngLtFxwG+M2IkeAp0XGEhOL3WW1Y+ftO0dYz132IfCNalodo+8OpPL
 QItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409120; x=1691001120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N55U4NP3yl4GvH3dWyOKO0l2DdmIx/ff1ghfMtMlOlU=;
 b=GSquy8VxT5qstwX3tCFvMvVXuYpsbn/vnRFSJ/Jq0eDJgJYHq39dSV/DzOm0kiZHT2
 xksbcSWeV0qh0rJeyMN8n97ymcidQlXmesBv4otYdetFiS8zbn4R7YLbzJQHIXBDSl9g
 R3o3/biMGxhlPBrECikesW/GjyerA+v9LdrP41mkeDMPnj4zhsrXgrVKKzwuVP8m1xNj
 FsGUXeSCp2bG7lTd6z5LXGtz6y9538XBZjKmwrszUr6Ewi4rtDcqA59G2yEfN6IZuN7u
 oILKtC44FdUsUQiScw1HJuKzvy3hgkvYe37Qfb7xw/f5gz/H4Fpc49brW/hAs62J7VOy
 Pvew==
X-Gm-Message-State: ABy/qLZ4fZ0C8j1RBEIs1Nfih8DJgXHXWg+XKqazvagSKR1R/RjikLVs
 P3JBes+mgR6FF+f3bXljNZUEKB6ewedMYSBQzA4KpQ==
X-Google-Smtp-Source: APBJJlF6W9TcJobh0g4C5n7RXR5qR3/Fcvv3ZJUkmNWMCWjsCFbrGHQQGW/5pKhjSaVIUc5gsRCnTw==
X-Received: by 2002:adf:f209:0:b0:314:2bd2:9611 with SMTP id
 p9-20020adff209000000b003142bd29611mr9405839wro.34.1688409120602; 
 Mon, 03 Jul 2023 11:32:00 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020adfd0c5000000b003143aa0ca8asm1949291wrh.13.2023.07.03.11.31.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:00 -0700 (PDT)
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
Subject: [PATCH v2 02/16] target/riscv: Remove unused 'instmap.h' header in
 translate.c
Date: Mon,  3 Jul 2023 20:31:31 +0200
Message-Id: <20230703183145.24779-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 621dd99241..e3a6697cd8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -30,7 +30,6 @@
 #include "exec/log.h"
 #include "semihosting/semihost.h"
 
-#include "instmap.h"
 #include "internals.h"
 
 #define HELPER_H "helper.h"
-- 
2.38.1


