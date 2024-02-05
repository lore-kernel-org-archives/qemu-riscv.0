Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E039EC4828D
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 07:01:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rWsyI-0001VJ-No; Mon, 05 Feb 2024 02:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1rWsyF-0001UL-NO
 for qemu-riscv@nongnu.org; Mon, 05 Feb 2024 02:00:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1rWsyD-0005Nx-J7
 for qemu-riscv@nongnu.org; Mon, 05 Feb 2024 02:00:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40f033c2e30so36909765e9.0
 for <qemu-riscv@nongnu.org>; Sun, 04 Feb 2024 23:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707116443; x=1707721243;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q/4D/FdB2mSaR1CGvDPInqituRwVvUKq/RJUPOWouXk=;
 b=AOO2ZKpzbi1SHAJzgORhlviimV6ELyb58+9E1fXrVJWJO+5w7B8hH20L43zIpL8g7k
 LJn7X+cLg5Zw/JHsUXhb8+qSKfDyw573gTPRurGeyTSlhztjFqozTZBHbp+5I6Ai+gtw
 VsmnYS1vVIViqvTD8V7kouWi1WZMSDmq/xfeLS3lrM2LKEVF9FJeGB+iAo2sod+jEmK5
 vyBRYrQxMlCFQj63WArmq2iI5/yrh3LRNeQS6berCyKtJEnWLv31DBQPd7brQUjfS372
 jeW5HRRcr6dpmwu8k6Ez8AcBmrtzyGiZBZ4v0VscEpL3jEW89bP2nYJvAKgoQyx2OqIR
 ucDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707116443; x=1707721243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q/4D/FdB2mSaR1CGvDPInqituRwVvUKq/RJUPOWouXk=;
 b=Qr9sx9V+03FOzcw2+rWBtio/PjOiv0g1nnIDaZrLDgw8RwGY2NM+LN/YGz8EWR8oIo
 U2eg5IQnOCKEIgqRMugj8vXSxkKMYpdUAyGOy6f6ckqUubtVvY7n4VMn/2CcOiuo4+UT
 LpZQC70UpBISDZ2EN/VO4ltSWx6uT0iC+psWhKarwYzYPNbfwQztXd1i58vbUFvzSpjB
 FRtFLGBRun5Pd6iEIADx5Ne60ftQsEor6wAsM8Z+lmyPms8N/V745xNhAEFVzIIBFOAu
 l9a+B+dkn55r6v0U8v0p8DMnMjF6WBZOru+8Dj3ftcNeZ6JqScFnRZUCkQeF45ucr4ZI
 DxPg==
X-Gm-Message-State: AOJu0Yxces0KmWF9pBGR9wH2fy1qGJ1Nv27NUZkvG/tSQ/8qZSg7tQf4
 zKLVYe66jJB52fUaivq3p8E7QbUsXLDmdchezE7/+lSiNdF9qL5ye+U5FQMh8dE=
X-Google-Smtp-Source: AGHT+IE7VKUJtJUkitPQGQgg18Oa9/e8kiVQx3raoc8+wZhyr5fm0Y6sC4wILhKv8UY+uuJSPDXfhg==
X-Received: by 2002:a05:600c:314c:b0:40f:dde7:b882 with SMTP id
 h12-20020a05600c314c00b0040fdde7b882mr212946wmo.31.1707116442907; 
 Sun, 04 Feb 2024 23:00:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVFHnmYUkxhu3pH20NtKaxzO94R1zr8ClBGRflc+qkVH3iNywwMICJOCf6NnXmUOra5V0G5fuK2SknYpu88H2RV8VJCN2WxjEFogf78tugn0ezLCbrp/KyzE3lSc1uROPAjTfY0tETrugrw0+ack23SoR3vujRMZIOHlZRE6bDwC4IMgI/TrcXVgJqw9mtTISKx1RxYE9tur3NRDb2A0QNO//p7Ez+CO4026SFu5/smx3lEP+Vi7i9Bxyl67R6c1t7mFUMnq+TsEHwIL/Yo0yw5zvWWt4CSDMJV8lVW
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d58cb000000b00337d5cd0d8asm7342111wrf.90.2024.02.04.23.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 23:00:42 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] hw: riscv: Allow large kernels to boot by moving the initrd
 further way in RAM
Date: Mon,  5 Feb 2024 08:00:40 +0100
Message-Id: <20240205070040.367541-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently, the initrd is placed at 128MB, which overlaps with the kernel
when it is large (for example syzbot kernels are). From the kernel side,
there is no reason we could not push the initrd further away in memory
to accomodate large kernels, so move the initrd at 512MB when possible.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 hw/riscv/boot.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0ffca05189..9a367af2fa 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -188,13 +188,13 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
      * kernel is uncompressed it will not clobber the initrd. However
      * on boards without much RAM we must ensure that we still leave
      * enough room for a decent sized initrd, and on boards with large
-     * amounts of RAM we must avoid the initrd being so far up in RAM
-     * that it is outside lowmem and inaccessible to the kernel.
-     * So for boards with less  than 256MB of RAM we put the initrd
-     * halfway into RAM, and for boards with 256MB of RAM or more we put
-     * the initrd at 128MB.
+     * amounts of RAM, we put the initrd at 512MB to allow large kernels
+     * to boot.
+     * So for boards with less than 1GB of RAM we put the initrd
+     * halfway into RAM, and for boards with 1GB of RAM or more we put
+     * the initrd at 512MB.
      */
-    start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    start = kernel_entry + MIN(mem_size / 2, 512 * MiB);
 
     size = load_ramdisk(filename, start, mem_size - start);
     if (size == -1) {
-- 
2.39.2


