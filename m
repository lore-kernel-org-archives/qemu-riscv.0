Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E1AC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:09:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxTk-0007dg-9F; Mon, 06 Nov 2023 06:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTi-0007cp-4q
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:10 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxTg-0005Kt-9k
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:09:09 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507adc3381cso5489698e87.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268947; x=1699873747; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csVQGgR+Tak3/eKK57JrtNqjD/O4/1GmajzGwSgP8l0=;
 b=DYMW4RZy27l8e4reUPVYHN/4PADcJ/tuebYjcEw0YBCjycdVYGZk2Ty+3iUk2yyPY7
 kqmnvtshznWNT7JyuspG4jiW5V+kL0FL/WoB0xR8xM3AT6uCYxsOWPGArObqPA1+JHtX
 y3rD1Mb4QF/eZvRmaaxxE72B2nfOTTxog/Ge8zFOTbvBp88UPEKBnnGD+vbZIboVaECn
 XVNwNwOwLZsJT7ZEHyxrBm4mLHbo6LBB3K6kXJh9UEyINpyu42dAQMUX/YB9w4u/iTLn
 DBKJR8GXG8CeKq6OxUSMY7bWJgyCxbCcN7yuNF4eVwr9XATHS5q4LPAjC59UUGx5kjhq
 +PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268947; x=1699873747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csVQGgR+Tak3/eKK57JrtNqjD/O4/1GmajzGwSgP8l0=;
 b=J3HzneYKVDe2KWWE+99nCQqo/bqF9+c+fL2q9J77Ya2SaO7yktIW+eUoJkj5PTyAip
 D4NxSyaum6xn1kehVNQ1t2+ltDX6u+9eceXhQnCYsttLwvKx+jZarwxsL9dUFWBZUDp3
 HHoqrz+TJl5mCuoDm3FQlfphEblgiD5JSNZhL/DHPaGaTmx73li3IQhwuvXZ7Ycd/zsx
 TcO6JPjz7gi9fRJhQgjp6XtxNR/CPgJC+FAHUJiaO7EN1tonlpQCOOoEK9Sb1N8Z3tv5
 LfA65EISgsN0BKOW7Btc55HDR3xxW5N6U65HltebKVyHFW0WT3WXeb0t/v5R/49b/zMz
 JybA==
X-Gm-Message-State: AOJu0Yx1Vy9GVVg6MuH20GAakb9kAqazsM9OkMzgP9wGddlo3tHdCZcJ
 l9Co4yVPRRL53F03nERPk6Z6dw==
X-Google-Smtp-Source: AGHT+IF/NpB8HMHP7H/FI9jfuMU1i8ZqGUSvagHUJCDZQ+ivvnwriIb7n7tIOJDMRsdh2YcofDQnWA==
X-Received: by 2002:a05:6512:370b:b0:507:a6a5:a87b with SMTP id
 z11-20020a056512370b00b00507a6a5a87bmr20578908lfr.51.1699268946691; 
 Mon, 06 Nov 2023 03:09:06 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b004090ca6d785sm11949457wmq.2.2023.11.06.03.09.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:09:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Fiona Ebner <f.ebner@proxmox.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 48/60] tests/qtest: ahci-test: add test exposing reset issue
 with pending callback
Date: Mon,  6 Nov 2023 12:03:20 +0100
Message-ID: <20231106110336.358-49-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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

From: Fiona Ebner <f.ebner@proxmox.com>

Before commit "hw/ide: reset: cancel async DMA operation before
resetting state", this test would fail, because a reset with a
pending write operation would lead to an unsolicited write to the
first sector of the disk.

The test writes a pattern to the beginning of the disk and verifies
that it is still intact after a reset with a pending operation. It
also checks that the pending operation actually completes correctly.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Message-ID: <20230906130922.142845-2-f.ebner@proxmox.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/ahci-test.c | 86 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index eea8b5f77b..5a1923f721 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1424,6 +1424,89 @@ static void test_reset(void)
     ahci_shutdown(ahci);
 }
 
+static void test_reset_pending_callback(void)
+{
+    AHCIQState *ahci;
+    AHCICommand *cmd;
+    uint8_t port;
+    uint64_t ptr1;
+    uint64_t ptr2;
+
+    int bufsize = 4 * 1024;
+    int speed = bufsize + (bufsize / 2);
+    int offset1 = 0;
+    int offset2 = bufsize / AHCI_SECTOR_SIZE;
+
+    g_autofree unsigned char *tx1 = g_malloc(bufsize);
+    g_autofree unsigned char *tx2 = g_malloc(bufsize);
+    g_autofree unsigned char *rx1 = g_malloc0(bufsize);
+    g_autofree unsigned char *rx2 = g_malloc0(bufsize);
+
+    /* Uses throttling to make test independent of specific environment. */
+    ahci = ahci_boot_and_enable("-drive if=none,id=drive0,file=%s,"
+                                "cache=writeback,format=%s,"
+                                "throttling.bps-write=%d "
+                                "-M q35 "
+                                "-device ide-hd,drive=drive0 ",
+                                tmp_path, imgfmt, speed);
+
+    port = ahci_port_select(ahci);
+    ahci_port_clear(ahci, port);
+
+    ptr1 = ahci_alloc(ahci, bufsize);
+    ptr2 = ahci_alloc(ahci, bufsize);
+
+    g_assert(ptr1 && ptr2);
+
+    /* Need two different patterns. */
+    do {
+        generate_pattern(tx1, bufsize, AHCI_SECTOR_SIZE);
+        generate_pattern(tx2, bufsize, AHCI_SECTOR_SIZE);
+    } while (memcmp(tx1, tx2, bufsize) == 0);
+
+    qtest_bufwrite(ahci->parent->qts, ptr1, tx1, bufsize);
+    qtest_bufwrite(ahci->parent->qts, ptr2, tx2, bufsize);
+
+    /* Write to beginning of disk to check it wasn't overwritten later. */
+    ahci_guest_io(ahci, port, CMD_WRITE_DMA_EXT, ptr1, bufsize, offset1);
+
+    /* Issue asynchronously to get a pending callback during reset. */
+    cmd = ahci_command_create(CMD_WRITE_DMA_EXT);
+    ahci_command_adjust(cmd, offset2, ptr2, bufsize, 0);
+    ahci_command_commit(ahci, cmd, port);
+    ahci_command_issue_async(ahci, cmd);
+
+    ahci_set(ahci, AHCI_GHC, AHCI_GHC_HR);
+
+    ahci_command_free(cmd);
+
+    /* Wait for throttled write to finish. */
+    sleep(1);
+
+    /* Start again. */
+    ahci_clean_mem(ahci);
+    ahci_pci_enable(ahci);
+    ahci_hba_enable(ahci);
+    port = ahci_port_select(ahci);
+    ahci_port_clear(ahci, port);
+
+    /* Read and verify. */
+    ahci_guest_io(ahci, port, CMD_READ_DMA_EXT, ptr1, bufsize, offset1);
+    qtest_bufread(ahci->parent->qts, ptr1, rx1, bufsize);
+    g_assert_cmphex(memcmp(tx1, rx1, bufsize), ==, 0);
+
+    ahci_guest_io(ahci, port, CMD_READ_DMA_EXT, ptr2, bufsize, offset2);
+    qtest_bufread(ahci->parent->qts, ptr2, rx2, bufsize);
+    g_assert_cmphex(memcmp(tx2, rx2, bufsize), ==, 0);
+
+    ahci_free(ahci, ptr1);
+    ahci_free(ahci, ptr2);
+
+    ahci_clean_mem(ahci);
+
+    ahci_shutdown(ahci);
+}
+
 static void test_ncq_simple(void)
 {
     AHCIQState *ahci;
@@ -1945,7 +2028,8 @@ int main(int argc, char **argv)
     qtest_add_func("/ahci/migrate/dma/halted", test_migrate_halted_dma);
 
     qtest_add_func("/ahci/max", test_max);
-    qtest_add_func("/ahci/reset", test_reset);
+    qtest_add_func("/ahci/reset/simple", test_reset);
+    qtest_add_func("/ahci/reset/pending_callback", test_reset_pending_callback);
 
     qtest_add_func("/ahci/io/ncq/simple", test_ncq_simple);
     qtest_add_func("/ahci/migrate/ncq/simple", test_migrate_ncq);
-- 
2.41.0


