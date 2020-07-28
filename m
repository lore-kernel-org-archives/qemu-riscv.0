Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0KwT-0003tk-Sj
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jul 2020 04:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwS-0003pz-7k
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:32 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwQ-0000pg-Jj
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:31 -0400
Received: by mail-pj1-x1041.google.com with SMTP id c6so4525649pje.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Jul 2020 01:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PMPZNC54WFXLzT2HiWdjfPndP8TkMz19Jn6EwJG2AFc=;
 b=gSGX97x+US9ilo8NDO3o9WZrYxXIJBLGGLMkAAULkK0jMmzqf7CAgTxLxm9DJbge1P
 QBSnKlY3R5N6NzbacQskOT3hRLuI0zE53t4hKWXWo7ZX6V1f2Wc5789ol+msOw+WYX+I
 V+cZSfvy1pccsBLhNZYFyXUfIDnOoI0y3wNIXg9QqJdxFojnUMsZD1mOIsfJt4USUpT5
 CMwp0NmjlX0yKWl83bzUXbRTn6HtxFUAl42333s63X7yEGMuSQBMui/fKkNNhADovPjI
 q7ZA38wZxI3R4LnxlwU6x/+vALD3PapPYq/KC83Kd28e6Jjbr4Vk2EZZMGzgFrgNCDE8
 6BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PMPZNC54WFXLzT2HiWdjfPndP8TkMz19Jn6EwJG2AFc=;
 b=iLvCLuQjzINOj+KyLwyZFtFUiJpdPhShJXP3OhSx3NycEGUtxwKfyh4w6ZUVGFOV4T
 Wxk6YkB35ViYR5CKScREX+yzitu8m5tCFNosxc+M4kIgo6Xt7WfCOiRnLG8UV2t0rxLA
 IkonHO7xuRsPHVQjwl8YF+6jC7TQ8dX3i3JwZkdWYjiTpPvuu95fnDWhqCfmsfD0R2xL
 SgG3wpqWReVRAMtjryOOBoWW8wW620PXedSzVHjRvwAUIyRd4qgBU+VqiGMFX0fyat+f
 4cEJUpLubHfyU0zpgztjzfwbIGDDdK/rJ7Iwe8KFI/8j9q4ViSrpgGaMV5mmM8ttr0jc
 AQog==
X-Gm-Message-State: AOAM530cUpYNcWS/H4c3hWHtxtC66QHRiModhLjukM5OZzio8QxtelnM
 LDDcgxMmL4C/DKQaWj8YeSDlUA==
X-Google-Smtp-Source: ABdhPJze6gyBY7ObJJbFhPylgZ8Z6i79vFvUiKZVgggDq+RZInxVraUNYrreGND5o0A17nc7SB4AGw==
X-Received: by 2002:a17:90a:d42:: with SMTP id 2mr3328011pju.15.1595924789289; 
 Tue, 28 Jul 2020 01:26:29 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h2sm17599747pfk.93.2020.07.28.01.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 01:26:28 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v6 3/4] target/riscv: Fix the translation of physical address
Date: Tue, 28 Jul 2020 16:26:16 +0800
Message-Id: <370a983d0f9e8a9a927b9bb8af5e7bc84b1bf9b1.1595924470.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595924470.git.zong.li@sifive.com>
References: <cover.1595924470.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=zong.li@sifive.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jul 2020 08:26:32 -0000

The real physical address should add the 12 bits page offset. It also
causes the PMP wrong checking due to the minimum granularity of PMP is
4 byte, but we always get the physical address which is 4KB alignment,
that means, we always use the start address of the page to check PMP for
all addresses which in the same page.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 target/riscv/cpu_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 75d2ae3434..2f337e418c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -543,7 +543,8 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
-            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
+            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
+                        (addr & ~TARGET_PAGE_MASK);
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
@@ -630,7 +631,7 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
         }
     }
 
-    return phys_addr;
+    return phys_addr & TARGET_PAGE_MASK;
 }
 
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-- 
2.27.0


