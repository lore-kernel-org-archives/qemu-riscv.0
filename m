Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyQe-0007nS-LS
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQc-0007kg-V5
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQb-0007is-GW
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:30 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jQyQb-0007i1-3R
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:29 -0400
Received: by mail-pg1-x529.google.com with SMTP id o15so6667577pgi.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=W51JHFyaTyJrjYrazYNfQIZabEagIWPjqp7ng1YyDdQ=;
 b=MCSqbfMaY9XlGDdHqDkV8cNh7RpJK3QZRrgH03UWu34P2RLJQSCsVsJGX5XmPVsHnz
 ui2J8RWFDnDnyTyuE+ni/dOMrTHh8lds78tddli9Dp7BCDlpDrR+mOrh+GVqqSyAPEIG
 kxE8iEk1LSjHGljsHqIwuhG+z1m+z5Wr/zuzDXdRsXkl4Zxe2gwXv8jsa3f5jfvx8oBz
 nrhz/zQJoRNgXGpPaEd8CQGuXOnbMJMFd4qCLhH7Lsq5mWYixKP2/lPOibmOF7VskBAf
 aM2j1Te4VtNJ8OsSQ9UFL+5bOYFKbnuiKOIGPUWZIwFAKtXVhnBgY9TbOTaKSZsYkEUd
 jyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=W51JHFyaTyJrjYrazYNfQIZabEagIWPjqp7ng1YyDdQ=;
 b=MC9MNGI1PNiy1GX41bMbVx/4wjz/kSYDTJq9EuO8wnC4Im0xbTUfdTuP+0H7IxUMrv
 +nRPU5ZUIJDQ27aBmZVQbXvdcIy+bF0szzjRvjPVSZ9Hy5ITVV0n3WIHjdP4YC+RFP2Z
 uQa36tA7TLd8GHKDxaKagt+/KrHDDbE6q+z/otnolFIPAvgpZpVUbbUndhT9kiOlSdWQ
 wDQvkteh8HmFMKqkF/iPl6P54DUG39twAM+6OguCzDdZpvck0hEJ41QBN8BAfe/w4sTz
 QzLu7qmGOj7Q3GU1UmA3fKIvKrvw+VMAxzVUr0lOu37KPv/wSFkgnkzSuxZBDz9T8K67
 X+KQ==
X-Gm-Message-State: AGi0PuZr4UfZkGCp23Mj639x18znerGXnB8uOzLG3geG4Hp3kmGvStGC
 Pi7apFqpFH3KPDPSreHIjZdxx8D+Ork=
X-Google-Smtp-Source: APiQypL7WwLurdTFoKDi63Ah0mmzCoqtZ3tek4cwlsAoV91RMq2KiD0VhEfDwSUGotJ6XDnElJYnFw==
X-Received: by 2002:a62:d458:: with SMTP id u24mr21771891pfl.275.1587496767342; 
 Tue, 21 Apr 2020 12:19:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t80sm3259016pfc.23.2020.04.21.12.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 12:19:26 -0700 (PDT)
Subject: [PULL 3/6] riscv: AND stage-1 and stage-2 protection flags
Date: Tue, 21 Apr 2020 12:09:58 -0700
Message-Id: <20200421191001.92644-4-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421191001.92644-1-palmerdabbelt@google.com>
References: <20200421191001.92644-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=palmerdabbelt@google.com; helo=mail-pg1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::529
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
X-List-Received-Date: Tue, 21 Apr 2020 19:19:31 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Take the result of stage-1 and stage-2 page table walks and AND the two
protection flags together. This way we require both to set permissions
instead of just stage-2.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 48e112808b..700ef052b0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -705,7 +705,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
-    int prot;
+    int prot, prot2;
     bool pmp_violation = false;
     bool m_mode_two_stage = false;
     bool hs_mode_two_stage = false;
@@ -755,13 +755,15 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             /* Second stage lookup */
             im_address = pa;
 
-            ret = get_physical_address(env, &pa, &prot, im_address,
+            ret = get_physical_address(env, &pa, &prot2, im_address,
                                        access_type, mmu_idx, false, true);
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
                     TARGET_FMT_plx " prot %d\n",
-                    __func__, im_address, ret, pa, prot);
+                    __func__, im_address, ret, pa, prot2);
+
+            prot &= prot2;
 
             if (riscv_feature(env, RISCV_FEATURE_PMP) &&
                 (ret == TRANSLATE_SUCCESS) &&
-- 
2.26.1.301.g55bc3eb7cb9-goog


