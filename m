Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3IZH-0004my-EM
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 10:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p3IZF-0004mg-Qz
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 10:12:09 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p3IZD-0001EV-Ff
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 10:12:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id kw15so4742838ejc.10
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 07:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jhODE3C2yMutSLswzZ/L2Ho/OnXfz5BDeJuYMiTKS+o=;
 b=Rm6KemZ/MzGBBAHPG3eAup/Ix03v3ppiWFHtwaU75BhaNiOBfbyo9kK2jpF2gGORBi
 cmjKkXBICyrF8GoYOB9HJzhOk8N4S1YtuKVbuw68K0QVIv+VFtuwwPYysndwfWuRMdP0
 kEJB+5ivmvwkRJR1qTh1loly+ynLM/6aOAyaaId6wUvlWFLwRfQIDATSrrGSHTdw5vkA
 rCqzPzNPNObxtrm2omZ3aIg9aMPjjVhxMEB1nBQPXBKIbpDDGDUs9UsmGFbIh6D08PFq
 KFMoanYfc5znq1zbZo3oCUeWi+7UBWbZSFqP8jHM+D0h146jzL5zzzj9EyjyinSNMxsy
 SNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jhODE3C2yMutSLswzZ/L2Ho/OnXfz5BDeJuYMiTKS+o=;
 b=h/QuHuQ401BRDGxgekd1OWaAgI87sdNn5y+nECCAH5ez9eFdzqrwcKGX+6prFYG2nS
 ljdn5zxu3QAkl5sOcjYCpmVqkwncSlx17cFEW6jJFR17MsXXIiD1wgnqUjupNRWJxaWm
 i3NzDUEuZXMYN3VbMSyQwsXsSMr7ftxYnPBazLhOh7ZzWJV4yly45qP5Z+PkFIInufZ0
 0FvjxazFhjE8xAJR5Z+AleBAc43u6kCHf5c3t4chkausJEWWTdKiuNxKScunUvZkey3l
 FXJQpUXfvoyd7IBSFqGmCD1DanuW9+irCxWHMYBFF86Nt/8BZgX5NaEuNJQPEPfu+fUS
 uEvQ==
X-Gm-Message-State: ANoB5pk58RO8dhnavKHiMYr9qv3yPYos/ze1PtzRfgAIIvy2hkKsG+Ao
 2Tadu18ZwvYdXhJrc6hynm9Qgc3XIErWNIN4
X-Google-Smtp-Source: AA0mqf7byLaZGdBnhVHpLmyv4YNxWr/5HSh0aJtSCrLZpbBqxPdPA8m7SvUfUqqGxvB5J1JYzB9r+A==
X-Received: by 2002:a17:907:2c75:b0:7c0:bbab:a550 with SMTP id
 ib21-20020a1709072c7500b007c0bbaba550mr21358064ejc.168.1670512325313; 
 Thu, 08 Dec 2022 07:12:05 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 cx16-20020a05640222b000b0046b9c536fc5sm3458151edb.63.2022.12.08.07.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 07:12:04 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH] RISC-V: Save mmu_idx using FIELD_DP32 not OR
Date: Thu,  8 Dec 2022 16:11:59 +0100
Message-Id: <20221208151159.1155471-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 08 Dec 2022 15:12:10 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

Setting flags using OR might work, but is not optimal
for a couple of reasons:
* No way grep for stores to the field MEM_IDX.
* The return value of cpu_mmu_index() is not masked
  (not a real problem as long as cpu_mmu_index() returns only valid values).
* If the offset of MEM_IDX would get moved to non-0, then this code
  would not work anymore.

Let's use the FIELD_DP32() macro instead of the OR, which is already
used for most other flags.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..d68b6b351d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -80,7 +80,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     flags |= TB_FLAGS_MSTATUS_FS;
     flags |= TB_FLAGS_MSTATUS_VS;
 #else
-    flags |= cpu_mmu_index(env, 0);
+    flags = FIELD_DP32(flags, TB_FLAGS, MEM_IDX, cpu_mmu_index(env, 0));
+
     if (riscv_cpu_fp_enabled(env)) {
         flags |= env->mstatus & MSTATUS_FS;
     }
-- 
2.38.1


