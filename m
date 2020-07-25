Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jzLiC-0002se-Lb
	for mharc-qemu-riscv@gnu.org; Sat, 25 Jul 2020 11:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLiA-0002oT-RZ
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:03:42 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLi9-00088p-1X
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:03:42 -0400
Received: by mail-pf1-x443.google.com with SMTP id f185so1883482pfg.10
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2020 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QaCAi9itYTAEWQbQQ1orCya0omL343c9jLTjKapu5Y=;
 b=Tox6xcq+2y9PgheBWJL4mk9bIPp0g3H4V8lbWcjKyx2MIZL/wZrii5uCeeCVFlruyb
 WkI+YJzHdYMqihv+24SBRv+mhD7vYlWW2LuM1tyaXbmc+dNF8/M4gPamHz58bwNnZncS
 xF3hlzrx0/wGBFIj3y3T82kUXbxZf81dUSE24c28wtI3ihrIljsuj7etH0YKS2JVVH0x
 19dzmvGZSKDqLHV6lkoL9tBRC4eO/FLK9fYR5op5ZMQjGitky2yq0OEiwEISU2jnp0ve
 5dGh0c0bXcqZitWn92AGyfGqp2iqEfL8oBMtXweDmH+dEvck81ntfSsdUYOOCTZhtYJq
 zFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QaCAi9itYTAEWQbQQ1orCya0omL343c9jLTjKapu5Y=;
 b=Uw0S9ar1NQ7Rq/M6dsmDODSjg61wZ8Rjo1GNjJVCU959/jKU74EEKzNDcWk4KKBKOZ
 cLxEA8hTqbSSSlhxF5/E8b0LE3OEpUxTCaRMdOR0pW7KLJFDfPpq6L+7o8nycjBuUbfd
 K/c4q3bNTYYhAsNdiMRzpZRhqOZxMXXRjZPXbw2SzSKB8oVA8DbJJAii2+pB1iZ1jptk
 oETCpsjf4jgFWjmmIo8cxKj4hl6epLUhDOhcbOLu8VhpEI7ce9bxP6/zwkSoo380Q4a/
 b83Sr5/OhbA2thnQRPMWVP8X8tsmYMpFc0pWS4QKNxnEmLh5kSdjWrfqhZQmMTyB85fj
 nPyQ==
X-Gm-Message-State: AOAM533Cd9p0nZkxBfKEL+gprGooSWIfEFBxaVg2hXfU2/f8Pn2nMGys
 DR3Iq8mJ4nFGlVZpMk/YCLdeIg==
X-Google-Smtp-Source: ABdhPJzWdntjR9EXFrAPIk5gI98/3q6RKbuRJo+C6AHM7ZRK/b3+1o7JR467NxFxikngnhgGRjFADA==
X-Received: by 2002:a65:4549:: with SMTP id x9mr12417643pgr.415.1595689419741; 
 Sat, 25 Jul 2020 08:03:39 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id g22sm9059783pgb.82.2020.07.25.08.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 08:03:39 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 3/4] target/riscv: Fix the translation of physical address
Date: Sat, 25 Jul 2020 23:03:26 +0800
Message-Id: <a3b3b05f429a50b5ea061f4e8385d4f8d6d77d58.1595689201.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595689201.git.zong.li@sifive.com>
References: <cover.1595689201.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Jul 2020 15:03:43 -0000

The real physical address should add the 12 bits page offset. It also
causes the PMP wrong checking due to the minimum granularity of PMP is
4 byte, but we always get the physical address which is 4KB alignment,
that means, we always use the start address of the page to check PMP for
all addresses which in the same page.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 75d2ae3434..08b069f0c9 100644
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
-- 
2.27.0


