Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF14ECAC5B0
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 15:00:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4KlP-0007N1-Gz; Thu, 02 Oct 2025 10:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Kl9-0007KH-Vs
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:20 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Kkw-0000HQ-U7
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e4473d7f6so7222595e9.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759417078; x=1760021878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omJMsKofR3cX17dOR4xS+OkjOyOP0xrNLE6+JrjUrJA=;
 b=Pa1f675BhOCF6ZPHgwzvpYvjOYpBhj6Qv7DTDX9YnA1rmlpVya7aRy3EXuunRoiBtu
 +b8S4qgPkQwwCYFZOKjtTCGv2T7gMJIn4BbPUXqm3IEsOa08aS6PIoCrbo8hMneo8pRb
 3IenvyxLc5uCa5wGiTD5GfGo+xg8B9iNYwXIE/kh+Tpgfn/33/8cu3X6MRDnjbxaB5PO
 Gp8b0IsZ7fAR2W595axDDRooFHebmhzrBK3fEPicqeCKQGeHtQZ2rxZ/lxpnzW6RRjW4
 8eQa0zA5bnJFyZUGv00SfB6zvnL7hzNH1gWV9jpLfoI4i6IZmz+60yxC+Ndb8B5c+qRD
 Hi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759417078; x=1760021878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omJMsKofR3cX17dOR4xS+OkjOyOP0xrNLE6+JrjUrJA=;
 b=iYCuBIA6CaBEg3ttAftdLUmyMjl9IIiF2f4UiOnQrpgEFfZMYQrLzl7Fa6WZ0nhq9Z
 m1sk/Y+CXgqTdD74b4ta5xVJKDtIZGI+AhdHfoYSmxz2QsPX7dh8BWSn4gl4DWSekrzh
 JtxJIm3aO+8hCbL3ViALAsa4kut18Zh+AZNRtCu3Zm8BBpChnEwVscjMBNZlnMiZ9vsW
 uw9upS74I8EMI0vNoXyThv/hOI8uuHAdV7rOc2pTsVXhAvqS4DvXmaYmMvwxLYbg/nsp
 rKGOF9vnogMCu6+Ee4kRxlCr0MYZlHXW7aZHnDTCmCzjQ4TO6NUsd6u3QZ57hVQicVqq
 uSJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxcUfikLPBXuJhbNrQeITqaV+shGJvahS4gL1/5Xji0woldQf/PDK67HshxZC75ddG9cHq6/3dmh0h@nongnu.org
X-Gm-Message-State: AOJu0YzKqp4TElpC1FAWD+yBcl14IS4XRUt0+TG5WF6oYpC6PGmAwjv9
 mk7nD2rdhPW33BDJmHQK37TNtdIZv1WXhwXKK6hzFt/u07cF3jJbbKey3jEGewxuyIQ=
X-Gm-Gg: ASbGnctSDhZFEOTGhRwI7q0LUNSFKc7e7JFEFV+t0/g0A8c0udWaJVTX5Hjdj8uuL6n
 2iN/LmXlwCIulVje1gfWRl0xNGhn2gOyXc4FpwONEDxBfVZDjOe52M9VZeNrHG1ZZR6631XT9Cu
 6ByfgnR0BXgSE7MS4Gj6eU+B+2yfyh64oTLLrk5f7Wt4KOhSaCpXAlo17tDuRtgvyhl9T2eP2N3
 3nPrdYVGKF7wjB+dGJrMQ7cD4kEZUcPhlmgddAbtd4EJCeDks4l2dkpJvkCNPjN5zFeoAoFc9Rf
 3A7VR8C8oU3QL0ZSseGyVbpKkBZN88X2OFlncnlEjV26GPxWQxbQd6kGJMKtDofnfM8skJwz4VM
 OGp4/1gE09f/yYOwe9LbNbrVTpRIgSY7fKlPi//zQbp9wMR8x8AKR0M9gXy56cxlJN1rtrjGTfy
 YR6/kfko7zFQL1rY8/X5arcWYOzirhQcm14ZQ=
X-Google-Smtp-Source: AGHT+IFZiGRObtfhcWfQ0V8vmwO0GuUgfaStXYQlBt4i/xBMuMEPLtjoeAOI9B8CLJidy3afz5IKSw==
X-Received: by 2002:a05:600d:41d0:b0:46e:394b:4991 with SMTP id
 5b1f17b1804b1-46e6127a4f2mr57556625e9.11.1759417078609; 
 Thu, 02 Oct 2025 07:57:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6111c1f4sm47718395e9.0.2025.10.02.07.57.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 07:57:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] target/riscv/kvm: Replace legacy
 cpu_physical_memory_read/write() calls
Date: Thu,  2 Oct 2025 16:57:38 +0200
Message-ID: <20251002145742.75624-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002145742.75624-1-philmd@linaro.org>
References: <20251002145742.75624-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Commit b7ecba0f6f6 ("docs/devel/loads-stores.rst: Document our
various load and store APIs") mentioned cpu_physical_memory_*()
methods are legacy, the replacement being address_space_*().

Since the SBI DBCN is handled within a vCPU context, use its
default address space. Replace using the address space API.
As with the previous implementation, ignore whether the memory
accesses succeeded or failed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/kvm/kvm-cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5c19062c19b..0c2f21fd1a1 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -36,6 +36,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
+#include "system/memory.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "hw/intc/riscv_imsic.h"
@@ -1564,6 +1565,7 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
 
 static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     g_autofree uint8_t *buf = NULL;
     RISCVCPU *cpu = RISCV_CPU(cs);
     target_ulong num_bytes;
@@ -1602,9 +1604,9 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
                 exit(1);
             }
 
-            cpu_physical_memory_write(addr, buf, ret);
+            address_space_write(cs->as, addr, attrs, buf, ret);
         } else {
-            cpu_physical_memory_read(addr, buf, num_bytes);
+            address_space_read(cs->as, addr, attrs, buf, num_bytes);
 
             ret = qemu_chr_fe_write_all(serial_hd(0)->be, buf, num_bytes);
             if (ret < 0) {
-- 
2.51.0


