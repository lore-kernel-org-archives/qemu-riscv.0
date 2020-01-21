Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu39K-0001is-E3
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 18:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39H-0001ds-97
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iu39F-0004ql-OC
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:31 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iu39E-0004pb-0Q
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 18:41:29 -0500
Received: by mail-pl1-x643.google.com with SMTP id ay11so2057899plb.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2020 15:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to:in-reply-to:references;
 bh=UcbAsElOHsZ2fudjqh0fovhZKSCABUkGsAOTf1+yuLM=;
 b=KBhPjM/L6CReskcfc+Pldb+g2v31FCSgZk060EoYc+7tS+zUUn5qWSfO+Olrelu3/l
 321yNSPWRi4jm2/GNd1/rfLLPJszDIhgejtk4k3M2di9us9/9OiRUo/8DLVpwc2OS2+n
 Mk3bZIVSWli0x1gVPxFyVMfXhnQk5l4Fk0cddgjsWcZxLG/K+DYz1kiS/V4HTJG6QACJ
 ceWBwkD8upOMqlEQZJz1SeSBPRQ37pMnOMOQH1CFeOCWtOUN78Wnov0yXX2Wit5x6DPi
 USRFOQBeqIr5i+/hf+JxfZzFp5xwvqk+so2ZKiR714/eo/KR+Cwh4JzdLc5L0lO33GKG
 lppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to:in-reply-to:references;
 bh=UcbAsElOHsZ2fudjqh0fovhZKSCABUkGsAOTf1+yuLM=;
 b=RD7ayn+XsPUZfUMCiBIuPHiYpkYLyzUl9H16HFawVXma6nYdUQUW+3Dqakw+zTnSPe
 2Ebdd+ra2DQbVaBTiHc/YZp7FKjyQBfYDJrT9qEuTrzZ96sakrmRyexTB4Y6NISQGlVM
 0gPFL9gBopYPp1P5XrkHUkPpvw7LsXKcKo/7VGMQUX9p19M9AWrm3c69Ws+daVcSEoU4
 aHfKYbbw9jV5Yb5gYBGzmsm35H4heyWHHYCGmZbGpG7yTvikWg8I1LHf+oV/BRxK3Uey
 iYRx6fM08h2O8a+OQqDg56fpHpJL5rybXRtIzq28Sfc28gIMqSpss8pbjyHbufo5WhCf
 HKSg==
X-Gm-Message-State: APjAAAWjox1OwKlh4uMESzf5b1Ml4HHTcB0X/7vB0ZNT1Eh1liNFfMQU
 XjS9NObj8kPpbBOZ3CJh6tpf7g==
X-Google-Smtp-Source: APXvYqwOUrQFTqzU94rWmMk7cbz6wahj/b9tmTxm5sncjQk1WPLfB7H4Xh//vRUC/9cUFF420oq7CQ==
X-Received: by 2002:a17:902:34a:: with SMTP id
 68mr7665022pld.250.1579650086876; 
 Tue, 21 Jan 2020 15:41:26 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id x21sm44075185pfn.164.2020.01.21.15.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:41:26 -0800 (PST)
Subject: [PULL 3/5] target/riscv: Fix tb->flags FS status
Date: Tue, 21 Jan 2020 14:57:00 -0800
Message-Id: <20200121225703.148465-4-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 ShihPo Hung <shihpo.hung@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20200121225703.148465-1-palmerdabbelt@google.com>
References: <20200121225703.148465-1-palmerdabbelt@google.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Tue, 21 Jan 2020 23:41:32 -0000

From: ShihPo Hung <shihpo.hung@sifive.com>

It was found that running libquantum on riscv-linux qemu produced an
incorrect result. After investigation, FP registers are not saved
during context switch due to incorrect mstatus.FS.

In current implementation tb->flags merges all non-disabled state to
dirty. This means the code in mark_fs_dirty in translate.c that
handles initial and clean states is unreachable.

This patch fixes it and is successfully tested with:
  libquantum

Thanks to Richard for pointing out the actual bug.

v3: remove the redundant condition
v2: root cause FS problem

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e59343e13c..de0a8d893a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,10 +293,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #ifdef CONFIG_USER_ONLY
     *flags = TB_FLAGS_MSTATUS_FS;
 #else
-    *flags = cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        *flags |= TB_FLAGS_MSTATUS_FS;
-    }
+    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
 #endif
 }
 
-- 
2.25.0.341.g760bfbb309-goog


