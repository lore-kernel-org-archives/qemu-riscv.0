Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853F6D729E9
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 15:44:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tH39R-0005vY-RL; Fri, 29 Nov 2024 10:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tH39Q-0005uw-9G
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 10:43:24 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tH39O-0001UL-Ni
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 10:43:24 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso253491566b.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732895001; x=1733499801; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4770bBXPnBP2gTFUY4zpq0rPST/rXd6Oo6sAl27oUs=;
 b=eehNeRAYVe7KDgq1FMwWcT54lCg+MfNRqVbqn2VatPfBw+OZQcKEXNl+jSlumCS/3z
 DU1wWb828BLx0Zujtwmg3VHYhSY3a5xxjalw/b16BUnVinWvbTN+gZ9iU5bIcB5kTtpX
 rBCRCnaxlX75mISB0TKSvYX+2WObxbYMRB89yCbf2UQxvdXPuMsZIDorqyF4xN7Mt7bn
 u4s2u7kkgXldMd9IZ2WAjSelwFZDRU7JfRjYsJ58MSn4aVoajkTFu6E8tYUypjBPWZR3
 HX2OoK8L66fwL4sUparOue1NAFvQbWk+HTiVhfH8fhl0tzPETllJ3Tt23PccscmQ/Sv3
 NiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732895001; x=1733499801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4770bBXPnBP2gTFUY4zpq0rPST/rXd6Oo6sAl27oUs=;
 b=Wlb9K8r31/4nOtqjM8G3Sgz37kBWPwgqJmCAp5j5PoddWrb0vQmYjE5k9yq+RMp1Fo
 ucnCw4Y1OzTATq8t385tmZRsIXj/gmL6IPKgP+3ho3dN+MvmJThfNwLlm81Gw9HPwu/z
 ke7XdNdc+zSn9Aj6+AP2phATqbJeeYI0fMKRBsg9oS4HyyLqGW27GGYPzUwKdaFqMZgi
 T5DKgb6v1FZ+qqbQZT9/KT748+z3jP+x3Tg07COVuQ7R3do8sVx2TXK3Zol9cIu/3gav
 0WqPVl/4bgE1S+BhxZVrB0R9FrbPIx5H54vSpiNmp9Oz6FELkzQmdcm5XSje9tsVQzoY
 NfNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnq3/fcZGbnRflQEJyKAzHbpx4d3I8CwreBzG3ZhRqN6nGs3X5+Yhj/lZ/P0zlAyfH+xQDJABr+7Pm@nongnu.org
X-Gm-Message-State: AOJu0YxeQhTofLMcGjAwp/uienfqFP8bU3apsAHDgrFa2HxO/D5o9xf1
 aZbI4seUAYjSt7so06IBnUu1oWBngOAYeUM9Ncb1uq7dDXI82PmnU1FBTJM6TJM=
X-Gm-Gg: ASbGncvh1Om2TwrSpzj7n1hK8A4Y7UaYS6GAxt4Wtl47sITeTBvSU4SXfyUvgc9u7RF
 cEp5XO8daPErYHh6ag+5juo+uJFIr/WTXj58IcAM61oG61yLyTIdj861A1coUr/oDqKArUTlxFD
 Npeb/LitIBweradcNYiKcgoXYh1JO9b1Ngssyrnq22DjKas8A6VBc0HkhJRdmfgbskcNP8lVwyy
 UvzZM/myCUXDK4D+TSrZEGY1x+vp9i7bJuBbM4Fd6cZeZXsMi1lrE/+FL19
X-Google-Smtp-Source: AGHT+IHSBq5uPz4SLTPcAKlkkXT5AnHgCgKGfipswW9R8J+wh+Bo5muCoSq07sVc84HFWrgdfMX2Rw==
X-Received: by 2002:a17:906:1baa:b0:aa5:449e:1a20 with SMTP id
 a640c23a62f3a-aa580ef33acmr768487466b.12.1732895001217; 
 Fri, 29 Nov 2024 07:43:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599973565sm183685666b.202.2024.11.29.07.43.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:43:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 2/3] hw/char/riscv_htif: Explicit little-endian
 implementation
Date: Fri, 29 Nov 2024 16:43:03 +0100
Message-ID: <20241129154304.34946-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241129154304.34946-1-philmd@linaro.org>
References: <20241129154304.34946-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

Since our RISC-V system emulation is only built for little
endian, the HTIF device aims to interface with little endian
memory accesses, thus we can explicit htif_mm_ops:endianness
being DEVICE_LITTLE_ENDIAN.

In that case tswap64() is equivalent to le64_to_cpu(), as in
"convert this 64-bit little-endian value into host cpu order".
Replace to simplify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/riscv_htif.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 0345088e8b3..3f84d8d6738 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -29,7 +29,7 @@
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
-#include "exec/tswap.h"
+#include "qemu/bswap.h"
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 
@@ -212,11 +212,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
             } else {
                 uint64_t syscall[8];
                 cpu_physical_memory_read(payload, syscall, sizeof(syscall));
-                if (tswap64(syscall[0]) == PK_SYS_WRITE &&
-                    tswap64(syscall[1]) == HTIF_DEV_CONSOLE &&
-                    tswap64(syscall[3]) == HTIF_CONSOLE_CMD_PUTC) {
+                if (le64_to_cpu(syscall[0]) == PK_SYS_WRITE &&
+                    le64_to_cpu(syscall[1]) == HTIF_DEV_CONSOLE &&
+                    le64_to_cpu(syscall[3]) == HTIF_CONSOLE_CMD_PUTC) {
                     uint8_t ch;
-                    cpu_physical_memory_read(tswap64(syscall[2]), &ch, 1);
+                    cpu_physical_memory_read(le64_to_cpu(syscall[2]), &ch, 1);
                     /*
                      * XXX this blocks entire thread. Rewrite to use
                      * qemu_chr_fe_write and background I/O callbacks
@@ -324,6 +324,7 @@ static void htif_mm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps htif_mm_ops = {
     .read = htif_mm_read,
     .write = htif_mm_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
-- 
2.45.2


