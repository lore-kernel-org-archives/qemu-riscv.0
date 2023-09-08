Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4687EEB562
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:28:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegC4-0003M2-ID; Fri, 08 Sep 2023 14:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC0-0003Je-Kh; Fri, 08 Sep 2023 14:26:56 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegBy-0006mw-IL; Fri, 08 Sep 2023 14:26:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso295872766b.0; 
 Fri, 08 Sep 2023 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197612; x=1694802412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1sPxs4JxAboRctucSIXoAK0VUiOMnkz7S5Bc5cS9VTU=;
 b=DDY6MlHW9BCe7eyH6M/dV3SEH7lGcZ70mdGgEE+FUEWQqG3tfWcygBBAx2rXyFpAHK
 AsCBbm35ukfxK4u1v8c3E9vAwQS5uktglzS93L0V6phSas0kVi1TJ/HAUQQU8HaM2gn4
 N81CHv/woE5GUF7bHnkxAblyvgij2FtCs8v1dveFdzhdnk/gsbdJs6j6R5yZ9T8VhxWc
 y02xXX4m4+7WhMoryyu4liL66+7U0bInm7St8+aMk46ofZni8jI7seb2BVjImwDP9lvq
 9SDCDEQ8KqSg9B+YesPlkJ3U4Nw4HHlPApqZzii/sRMiWK6iiz8QO0W4LoAhOikB+MuW
 f+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197612; x=1694802412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sPxs4JxAboRctucSIXoAK0VUiOMnkz7S5Bc5cS9VTU=;
 b=j8Cv9zj2R8UcJ/yubOrfJ5JlkV0AYJWnRWt4Lw1SCIO444HAKsIVYl5xGR4eintUpV
 oyMACErWwrNMrOtYy11ZHWilAcqkfpm7jEyUXBGApuKNL1VJVTyFcixn+EY+J0GN33KC
 WkU3RbSs0UdOab4h1ChjLr7phBhfDYJkc6JLlYafMaSjycJAYLAKc5oThfD8GEJv2F+B
 9j0T7x+/qomwUuEdc/7tpHRfyIa4hZjcuHCyScXzTnt41QWRSOWZzYhfhUyZoNgf7KqS
 w/5Xmg/HxCSjEkV1o0wR9Uto1640EUy0jzcQKLxeCaRM/hdm/GY2hvfVMdRF5wKUyHKY
 UmLQ==
X-Gm-Message-State: AOJu0YwtibJkwt0wCH+z5jHhgz/7+YtdA58FxCWH9/TzLbDMl8sKqR93
 W4paFVwIJPjm1AjxLDFMAZbfXAC9cm4q2Q==
X-Google-Smtp-Source: AGHT+IFp6dFRnzs986C1P6G5TjREeO5qH5J4uUb3kVQ7xouch2wCJej1jsiL0su2iwAhGbU0Oqp39w==
X-Received: by 2002:a17:906:18aa:b0:9a9:d5e0:5c57 with SMTP id
 c10-20020a17090618aa00b009a9d5e05c57mr2602713ejf.22.1694197612648; 
 Fri, 08 Sep 2023 11:26:52 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:51 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 4/8] Add enum with maximum ignored bits depending on
 privilege level for Zjpm v0.6.1
Date: Fri,  8 Sep 2023 18:26:36 +0000
Message-Id: <20230908182640.1102270-5-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 62dabfa207..25fe60476b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,6 +88,16 @@ typedef enum {
     EXT_STATUS_DIRTY,
 } RISCVExtStatus;
 
+/* Enum holds maximum for N bits to be ignored depending on privilege level */
+typedef enum {
+    PM_BARE_N_BITS = 16,
+    PM_SV32_N_BITS = 0,
+    PM_SV39_N_BITS = 25,
+    PM_SV48_N_BITS = 16,
+    PM_SV57_N_BITS = 7,
+    PM_SV64_N_BITS = 0,
+} RISCVZjpmMaxNBits;
+
 #define MMU_USER_IDX 3
 
 #define MAX_RISCV_PMPS (16)
-- 
2.34.1


