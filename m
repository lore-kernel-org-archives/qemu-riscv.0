Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jytgv-00039R-L1
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 05:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgu-00036j-5K
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgr-0003sF-6q
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so4909718pgf.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2020 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QaCAi9itYTAEWQbQQ1orCya0omL343c9jLTjKapu5Y=;
 b=eA4tkyEBCbQQuS+oqF1SxXFy+0RTxdJMDioXy0vYLE27UgnFMzbobCwc6IpJROm2VP
 AU8pN/RSysIQG1hajcsx0yxB4MxVpdYi60IgG1wXoKabBnnCsU/5LPxkXfYCb43V3lex
 ZZqZ4xlByEWwtBPq1aF9giXcGlp6WibmtgezP3Jx/AYCYo4/Sj8FhUoxqJSVwwse4B4H
 SIliwF4Pxw+AS2MMjrnXkQhWmg9KGGXJQ+s//BSOAzV7juVdafNhb9oX14mA6vZ0PJcG
 2kAVb8D5BtQ5pn3lmK/tVomUA7StyhJ1mPrDaX3LNjhilKdNXlONXtBmDLrEDfrJHOuD
 JLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QaCAi9itYTAEWQbQQ1orCya0omL343c9jLTjKapu5Y=;
 b=CUehIUSzqHA33Nz7bwkeYWnQHSAuMG76T/HQl8pMEMwlIeMHtJ1m/kok4OyTAeb+rV
 c7+9DVQQo3uWLdYCR/+8vzk+0K4SagiMg03yEAlqxxz13AsziD5x2osGJ2An4oyyHVDd
 w04G54jkDv9K/oa0j9V/YOrACXw2BH04ZP/kQd2A5oFeY3dwkDRzzX8AUcOwpDAe0NNd
 KY64CRKQsvSfLn6PdfwnPGcZbVXjKOVC4uXEvfR5oUZKrrkTZ/WwQKQK/J6tRMT/SmnM
 MdjzLovTFkv4SE5IrX7vsNAQg4yLmgs+cdDp2vl5RTV5b3nZJnUq6Oh0RrBuU8v31wO8
 IhhQ==
X-Gm-Message-State: AOAM533X9CYVwnknMDmpfXFl1CKy4cWGjsmD59EGrBlnT2LaEO/zJpkO
 qoYZ/5p3UcgVZvBJatwSwj3dxw==
X-Google-Smtp-Source: ABdhPJzm3Z2+Z3Mx0Im4J7zoNuXbRnryFhcJQ8Tv6/+a/HEKWtTFogn8wumdprZtnQFfnos6uualTw==
X-Received: by 2002:aa7:91cd:: with SMTP id z13mr8309698pfa.133.1595581708000; 
 Fri, 24 Jul 2020 02:08:28 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id z10sm5751282pfr.90.2020.07.24.02.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:08:27 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 3/4] target/riscv: Fix the translation of physical address
Date: Fri, 24 Jul 2020 17:08:16 +0800
Message-Id: <afaa7722419a59f42a7eb804f2902e2313a615ed.1595581140.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595581140.git.zong.li@sifive.com>
References: <cover.1595581140.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=zong.li@sifive.com; helo=mail-pg1-x542.google.com
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
X-List-Received-Date: Fri, 24 Jul 2020 09:08:32 -0000

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


