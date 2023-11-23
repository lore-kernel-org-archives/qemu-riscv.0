Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B2C5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:02:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6E1I-0001Vu-D3; Thu, 23 Nov 2023 13:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6E1H-0001V3-7R
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:01:43 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1r6E1F-00050Y-KF
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:01:42 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-548d1f8b388so1665739a12.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1700762499; x=1701367299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9r1LYM7znRQbkiucsbsE5oOCfK6L2pC5SpIekpnlOHo=;
 b=sLR8oF+TAd5mF30KvaZXy9Yh8NjXfttCsXHZXsGN9hXpypIibYnsiyzLn8PKQtEJdv
 VLqOuzLWVX3qd0K07+gzZYoMZbngoBF9gxoZflQoaMKuoQgF8d1o7P8hDo9hH4FzW5lC
 OYdVHghDhVJHEprzXHXcoYyflq6hMMXvin5/hFGrLz/5kT99Q7nO82YLWAlonD382el9
 ahbHnmYW+JzdrGcOGlxT9amj96GJzxhrEAuyp9F9iRzWhkvn3s61dgj9Md+UfAXqHvBS
 oX4LYcaBNqlfu5f9ys4puk1xkGxXVmW9IjRVW3QQFdUpu+nUKvmnQfX8rk/aTp6psEyR
 THvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700762499; x=1701367299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9r1LYM7znRQbkiucsbsE5oOCfK6L2pC5SpIekpnlOHo=;
 b=TvB5GijKkqgvweACfZiamBjzN6t/1eYEue0sb46If6ETEOKrHDdH8gJGK66aoWmv7a
 N/o7HoFlIE3lfDSxAhTQHDtsIsIY4umB8upI/JvrpK+0TS/YJpO35gTWkb9vrHhvtO4N
 GnxCYayvXxxeMmoIy2VgJpkl2QNjpgmDXVlJQqt0V4PCsREReljitBduokE4a9FskIRv
 6tggsYBdgk0a5PPoMEV4MuVIFWqAGR1qI/+g0Oh4QSno/r+9mCo/omem81cyAnPdXOcP
 DBDIg0xX2jU1eL0G7YXq1u30u04wZ/O5BpOvhe5FlYhJZlDjMso7CNSIFRaSO7cpa2L1
 cNGw==
X-Gm-Message-State: AOJu0YyfoFMGq01DiVfCLdpcxoAabxz7MOPQV4JGjOnwZESGVD6qDBbB
 53NtRrXTu6sQGiS2/tWsYFxsvrlv52GgcIIEd/YoUQ==
X-Google-Smtp-Source: AGHT+IEKcG30N7I9gzhBcTY/ggCn9DxY3FKRfvpzBPmQCQvPX06FzEIj5qUD8gf6HAdQW8aMElmvfw==
X-Received: by 2002:a17:907:a0d6:b0:9fe:324b:f70a with SMTP id
 hw22-20020a170907a0d600b009fe324bf70amr62694ejc.63.1700762498818; 
 Thu, 23 Nov 2023 10:01:38 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p18-20020a1709061b5200b009b9a1714524sm1074027ejg.12.2023.11.23.10.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:01:38 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/riscv: Add Zicboz extensions to hwprobe
Date: Thu, 23 Nov 2023 19:01:35 +0100
Message-ID: <20231123180135.2116194-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52b.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
This patch introduces this for QEMU's user space emulator.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 65ac3ac796..22e947d752 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
 #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
 #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
+#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
 
 #define RISCV_HWPROBE_KEY_CPUPERF_0     5
 #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
@@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *env,
                      RISCV_HWPROBE_EXT_ZBB : 0;
             value |= cfg->ext_zbs ?
                      RISCV_HWPROBE_EXT_ZBS : 0;
+            value |= cfg->ext_zicboz ?
+                     RISCV_HWPROBE_EXT_ZBS : 0;
             __put_user(value, &pair->value);
             break;
         case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.41.0


