Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29546CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 12:51:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwgF-0004uO-Fw; Fri, 29 May 2026 08:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwgE-0004tZ-2k
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwgC-0006Kk-HF
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2bd2c147abaso85801985ad.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780059071; x=1780663871; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7uuhAv5qALLyILQ8blZPaC3DwBK244s0aGHr49256w=;
 b=LSYnZnQ4Ut2qpjjeOB9QcqsAeEzcw2gLFt0OrRcudgjtnuHlxS45Lr+G3cIUtV86zL
 +y3MMAtyKv1lsqJBxKaLCaigP+ZWjIFuJgIp8j/jYdF1MSTScijo9Yg9M+R5NyuiOmtZ
 CyD6eYKRQWwNLZNCXnjyB8IZmBDFDl3nklgQuicrnOJ1B9Y4lUlB2Opnzg9D7kagwROk
 WQvK/iy38PrHyC2222M1aN89udhJLhz4E/Jaz6ckrczg43uvZ6ZI9HLVzOyJCWW7k/yk
 VQyFm5YYreGIrJcskmcwswtQRosTdyKp2MyCS+KoGGtI4rwEJ9G22julxcs/pzyEiQmc
 vHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059071; x=1780663871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l7uuhAv5qALLyILQ8blZPaC3DwBK244s0aGHr49256w=;
 b=EZrkLNHOKrKhIHGAP49O7qb4Qie1Mq6Y+1AE1a7BhdC3WtcWxb0Y9jbXXKm/Uk8iKe
 1PGDpv0lEK5+RAlS9Oir3g42D1/PK9mz9PHJl5mIOosWJUXaQ4jK6JLaPeahqK/ZAOQz
 M5NHQXVIDsSAN4kyagHbM4bwQt8UbPk5hNau30m/V4P9zIN2pFujVtSt2KqTv97/EBCw
 dXregl8AvUvYc1K5JUYdiXjDIFpgdYQJ6OiYJ9Bk5P6QE13DmuVslru3VwV24tVJx886
 dXrpaCnkwacaFb45/020gP0cxmaAAKKYMSO2ts7Z84JX1FIK/XNLyJJoBBCUMJAdjdtp
 nLwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nnAKbbtyBCUFSZGXDrPAxiPY8ILnwn7UwnXIuohyYklkxT3q4h7sT1+sYI9qVColcEDXPMk4BXVwv@nongnu.org
X-Gm-Message-State: AOJu0YyxsxfNSJMCEhndPiSOEwUZ/6fz+o15CHM6S9NGRCIXrdxtswLH
 92/RilKbdg2xyUFZ+E8yxZdRNRgkI7YtqDIOksEt0BTx52LIfUjj1072
X-Gm-Gg: Acq92OGZEDsxtKoK1nBhqIaDuKOz8cUhUYPSzGWs7qIz2BUTz5sr/v8D2FbvLGJfrzI
 T5YMq6bvD10zRb4k9RcR38RcTZnOguhRB+nv/MVAyXAS3mwFCMAQD1AvwsTVvRRvPOwauaSNagK
 Zinm7zOwlKGNVm3NMcRAhNESqVjeolNyw70DW2mHKmNk0WTCx5fHfpdpXpdeIsQfEgQcSgJXIcz
 rdBBBrv/CL5zsXcIoZzB557EiIaAT0ozJ6I2WxM+AByRp3n2817cnnb+uH+lozNqaUYl8/UEJxD
 zNMpi8+1FwMR9cWlDflwY9DOXLF0y41Mrr4Q54y1C40ujLW+h/zeqHbd8ImzcHrpnZyULP7rWLi
 zU1R45wgJ46DNUnXRDf0rqwIUnlYLA+dk7EmpxGypg4jttfBEq0CSlP0rcPF2XN4+DqNPRn9KdD
 w9qOu5iCIqlosGgpw0Z2X32GYRTo+r4BDO9ky91vAq9JwwHW0R4e8L9DbQsFXJpqF/+MYYmlcrA
 VdvFuUn
X-Received: by 2002:a17:902:cf0d:b0:2be:956f:144c with SMTP id
 d9443c01a7336-2bf2052a76dmr39465265ad.2.1780059070902; 
 Fri, 29 May 2026 05:51:10 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c26b3bsm19707965ad.64.2026.05.29.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 05:51:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 06/10] hw/riscv/atlantis: Provide a simple halting payload
Date: Fri, 29 May 2026 05:50:31 -0700
Message-ID: <20260529125036.728206-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529125036.728206-1-npiggin@gmail.com>
References: <20260529125036.728206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

OpenSBI hangs before any console output if the domain init code sees the
next stage is not in an executable region.

If no kernel payload is provided to QEMU, the next stage address is
NULL, and the riscv virt machine memory map ends up covering the 0
address with the catch all S-mode RWX region and so OpenSBI prints
console messages and does not hang until the next stage boot.

The Tenstorrent Atlantis machine address map has RAM starting at 0 and
it loads OpenSBI there, so it is M-mode and not accessible by S-mode,
tripping the early check and hang.

Add a helper to set up a simple payload that gets OpenSBI messages to
console, until OpenSBI can be fixed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/tt_atlantis.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 6f8b882fca..20db26f982 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -385,6 +385,30 @@ static void create_fdt(TTAtlantisState *s)
     create_fdt_pmu(s);
 }
 
+/*
+ * This works around a problem with OpenSBI hanging with no console output if
+ * no payload is provided. By chance, machines with memory at 0x80000000 do get
+ * output, but Atlantis memory begins at 0x0 which takes a different OpenSBI
+ * error path.
+ *
+ * This can be removed when OpenSBI is fixed in QEMU.
+ */
+static void tt_atlantis_setup_halting_payload_opensbi_fixup(
+                                        RISCVBootInfo *info, hwaddr addr)
+{
+    /* Store the payload vector in little_endian byte order */
+    static const uint32_t payload_vec[] = {
+        const_le32(0x10500073),         /* 1: wfi           */
+        const_le32(0xffdff06f),         /* j       1b       */
+    };
+    rom_add_blob_fixed_as("mrom.payload", payload_vec, sizeof(payload_vec),
+                          addr, &address_space_memory);
+
+    info->kernel_size = sizeof(payload_vec);
+    info->image_low_addr = addr;
+    info->image_high_addr = info->image_low_addr + info->kernel_size;
+}
+
 static void tt_atlantis_machine_done(Notifier *notifier, void *data)
 {
     TTAtlantisState *s = container_of(notifier, TTAtlantisState, machine_done);
@@ -422,6 +446,9 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &boot_info, kernel_start_addr,
                           true, NULL);
+    } else {
+        tt_atlantis_setup_halting_payload_opensbi_fixup(&boot_info,
+                                                        kernel_start_addr);
     }
     kernel_entry = boot_info.image_low_addr;
 
-- 
2.53.0


