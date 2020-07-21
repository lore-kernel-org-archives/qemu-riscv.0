Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxraC-0002Fn-Vo
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 08:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxraB-0002Bi-Be
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 08:41:19 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxra9-0004xp-He
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 08:41:19 -0400
Received: by mail-pf1-x441.google.com with SMTP id 207so10679157pfu.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2020 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QaCAi9itYTAEWQbQQ1orCya0omL343c9jLTjKapu5Y=;
 b=SVZtvfX3jvaN6eJXoJzUnsQ9nVFQwPUh60I5jNsQebMG00bVdJynr3WIOnrSGLP+hN
 1dEPu5dPVeaNhfth5z4UB9FODdz4gKAns6e0WkX28Q2Z9kPccMrF+7OGaR1IdMyQJm72
 0SGryNTSMPQIxpRSyaI+PeZnxuGGFzT7C2G8jANEau+ELt7DaoX7SogXRYo04sIHjRX3
 sViuYOXgKKB5JfmbyGicheujxpLfz+cC6CwdFEUT8/Cxz3/nGzJFu/hrlU5wKWiNUFnQ
 DAWeIYq+StrcIi9foygjDFtzEbKkeu6v1xE5P9/iV1yALjHZa9VAzqA4CNwTene8Tu9l
 4GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QaCAi9itYTAEWQbQQ1orCya0omL343c9jLTjKapu5Y=;
 b=F6Yjg4FTu7J8EU/8nIJGHQvpk5z3BU59CLgrc/CzjWAhk1w4IQDAy2r9JlJJPk/eRu
 SfpqaGnnu0fnyqMEo5mHE2ldG/Yimtu8OiZahYEzs6muJa7caQzH0Xls9bND2xKR131a
 yOtGnU2ejVHtBFSKePyq+oE9uY71gLV6ZuhtlwGa3BIKICyKIOsPg/ijxh+wH16GiR7B
 UKMtaO4JGcWk2arrR9je+GMCM6I5Ye0g2WJ0c7fIx4/v8idRT69WpkcgGFUIugHRwOl7
 TvvZGfh8NsnGGIOoIFYINd0Gv/Mh2Q7XdrQudLHcsqgAqB9/703jFgFrRINmiaXtQ6D0
 u0lQ==
X-Gm-Message-State: AOAM531Gak5WqaKaZZwT91PpsvpDf9GcXjhX2WY44A3jJhdbNdzrsErY
 oe1AgA86jqsukb7+8NaebSS1yg==
X-Google-Smtp-Source: ABdhPJzkkFBl4IavGupQLBDQmfPn/8ZVEAbsH5JjdvQNsemZ7zs0g5DK3aSqeGH+CSiSg0Tyb+maiA==
X-Received: by 2002:a63:778c:: with SMTP id
 s134mr21658197pgc.273.1595335276271; 
 Tue, 21 Jul 2020 05:41:16 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y20sm19819991pfo.170.2020.07.21.05.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:41:15 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 3/3] target/riscv: Fix the translation of physical address
Date: Tue, 21 Jul 2020 20:40:52 +0800
Message-Id: <26ac4734d2079d5ec782adef3a5a40e82082b51f.1595335112.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595335112.git.zong.li@sifive.com>
References: <cover.1595335112.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x441.google.com
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
X-List-Received-Date: Tue, 21 Jul 2020 12:41:19 -0000

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


