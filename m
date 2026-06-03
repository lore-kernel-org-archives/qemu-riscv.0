Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3F0CD6E55
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUfZv-00048S-Pz; Wed, 03 Jun 2026 02:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZt-00044f-Mt
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:49 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZs-0006Jt-AE
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:49 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c85ba774551so1135738a12.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 23:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780469987; x=1781074787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3M3o7iu8Yqs3fbpTwLGXiXAr+OPP7yogr14zhg80Z4Q=;
 b=b93Zbmi3IbTsvdb0tzgMVmJyU14P2kPP/GcmXLdj526wyC/2vizCcfxTZfSGe91LDx
 sOMfA+jBUQlsWvDlGgdgAK/1WegKJM3xsF04W2Wk7PHpgGzS8xxJ4srPFZeIWvY5gv+P
 ooechJ7df/f5tZ3nrIfCrkLXLp2zmbti6MW9p8aHKW/9h1tg6HKN0ID9R0f+gahry/Jr
 lDYBni83Rk63sX6sBY3LSlTGsw/Ku1IpCxcfde6/KMKUr/Mz6VJMiWeIhfJvfqLfde0m
 cSlLdenfqpCYuqb9J5tZ9VohP+12yzgbgTuTFnen3t4WzS/pOfvDoTmZISK8ZkUROB6T
 3AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780469987; x=1781074787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3M3o7iu8Yqs3fbpTwLGXiXAr+OPP7yogr14zhg80Z4Q=;
 b=PjVTxUyoojfVbFaoYytRRXzLU6InoNITN64sUIaJoduQipW53zPZ5kLSGzo4VR8dMK
 BKH/nbN8oWL1ai/D4+hNr5DxPRh+ylM4DoUVv132Q+CbqOOS+pWdKif4v62uhRLIf1NL
 17BA6R4w44HZfYCJgiGPCM3nAYGRMLSTxb3PZX5pHB3ViqYe1RgGUX4p+Nxth9LgneCy
 4KV2G9avxgvF3npe5QLF8zoFVmWcAs5Os9dvD458c2b0mMaIltJzA8O/TUdT+GRVyOw4
 LlWNwAxM1HokfapaFRIA9Lx4u9JNBr3O47Ko6PN6jO2htmzEd1N3CwOC5adRB3nrvm7a
 XNrQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8wlRtXPb04Ma1RPZxo/SnTrC//na0pftEI04FyZrHDaa4+4Bm7KuNuQny0jkjcQYK5UDc+mmrqk9Q5@nongnu.org
X-Gm-Message-State: AOJu0YysbU0lLGMYAY5Yi4DpBLX5dMT2cxQTeJ5jXfGZB+LKtFaz8Ya/
 Hh9Yh8OORDG1TflfUWp3A3+VbcG98uG+ZBB0lR7BpVg1ahM6OqF6yubr
X-Gm-Gg: Acq92OGOsDc9T343Hn1LfBAcYwdgohzRF0O5b58mSJiB/+4ZMDvUDPB+QvMCvUzzeaX
 FzwSuSLENEaCywAbvYo9dbblYS7Loa4nqUAEJaAiH/5//xpcPnVHdAkSy3Xu0taJN98UTlZ1iw+
 XxfXukK4yGifGCrh5eEl0bunesYnsPjWvBsGX4i1ac/CzopDMfbdQsPTCbBA89YAj+yuaECWPon
 4R9ANEpzHD52nxdJaQox3mZmKtsxDVzSgkeDashfiEIjeZszbpOVQkFVjfkUL1aC1YaznUtwnH9
 kiS2aB5ZYgRANkyC3NM7F15xB0Hnh2ygqV1v8udlzlxaZVYpcGIULTBb10WP8Ws7e3e//GuptF0
 LfWqG2KMv7vPxYVdMYSnDiSAS0Z+ZxyqcrjJ7WILp0ccLZSYMEt7ugYk5U+OI/+DpbIzXaXE2lF
 81WL8hDUQ2CkCVFTEDOhR+FwByAdk26ktaCYWxxPTsTHz7KZCMSs2AZD2OKsBNRL4jlGAyzKMM1
 xApkwICypPSLGVWxPcuco6nnjDzgFhLbkl5QE1PfR+Nq3xtdV9KlIocNEzx6N8b
X-Received: by 2002:a05:6a21:3989:b0:3b3:1c7b:ff7 with SMTP id
 adf61e73a8af0-3b4977b34e6mr2683504637.46.1780469986897; 
 Tue, 02 Jun 2026 23:59:46 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df033887sm1283261a12.2.2026.06.02.23.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 23:59:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v8 06/12] target/riscv: tt-ascalon: Enable Zkr extension
Date: Wed,  3 Jun 2026 16:28:50 +0930
Message-ID: <20260603065859.592063-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603065859.592063-1-joel@jms.id.au>
References: <20260603065859.592063-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

Ascalon supports Zkr and the SEED CSR.

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 862834b48097..6bf93188d24b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -3090,6 +3090,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_zba = true,
         .cfg.ext_zbb = true,
         .cfg.ext_zbs = true,
+        .cfg.ext_zkr = true,
         .cfg.ext_zkt = true,
         .cfg.ext_zvbb = true,
         .cfg.ext_zvbc = true,
-- 
2.47.3


