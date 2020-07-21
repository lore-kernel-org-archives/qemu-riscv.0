Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxlNO-0001F7-Gg
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 02:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxlNM-0001Au-RI
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 02:03:40 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxlNK-00007O-K6
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 02:03:40 -0400
Received: by mail-pl1-x641.google.com with SMTP id o1so9798596plk.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2020 23:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyivCZnqzhrumKaf1cp2AkSGdgwxSM8kTqrAaI6ADt8=;
 b=RHuHE3Imopzm5mW2p7jbbHbavo9I6mlzfL0hBxmMQSPr9wkaMTkIsFct99x0WAA/tJ
 9sRlAMYu6W8Qst/POIVYj1fAfrSRk8hJYhl8LpVUonXRuWtPdekb7DSN6p5/fAgXDRiP
 l3k/uKYOzjvtDNbrh/vvfRM2TpKOMXALP/hSPu8HEzZitInHfVQBQYCwH2K2/bE+fNi9
 MD2nZSOuPCeNEIuWns70+nMxrYPkgWgkVlv8J+/+m1xmWzubiM40LiRXklIYM2Yu2wVS
 +LoKHJAP+vYHxyowRAdrHPAzBPMrjJ7AntJIJsCov9AhOK+kHxrpCJ62SbXaBn5vgSEH
 pTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyivCZnqzhrumKaf1cp2AkSGdgwxSM8kTqrAaI6ADt8=;
 b=QSbQZXxfAaXkKbrhwcgMs2xEKuY1TU5sBYBbkyiX7+xfFu+sA0mv2IJCwf+wjZFrLY
 ABSiSi4hqn2ZsPrU1wuV+auSlpWu24sQBiSuRV49hrn/8FOQA9+DRL/ojU4S9ExAZmbU
 NnyVfwQyrcdj/RUbKRvQOHl8wJwNfu4QURu2GVVBIl2j0hnVLHjxhKsH5Ju+UlSPNPVD
 f4WTUbGT+hVp0COSkpA3d9tN0jSHlFtvBrk0iUwieUIH92qFCZzSAsymdzv4kd0CDnwS
 y+G7Rk104QswHmvtT+CY942WfX2J+jBLDTecInZtG4ovQFk/jyR+wsgWuCXh4WUuWNL+
 eIFA==
X-Gm-Message-State: AOAM530ldGW+SXRjh3ufc1AJ8hcNUAsU8LpUNqJ5DmMMwHorH1Vmqx1a
 QH2KZbnZe/zOO4OH8/PUBlat8w==
X-Google-Smtp-Source: ABdhPJzq5axPOHtmLGWH8vv4GRgKNzWaqJGdgTRGtUq0mzmsYSG5StiqamC0Y6DqTa9a8ZdunaRv5w==
X-Received: by 2002:a17:902:988b:: with SMTP id
 s11mr20001668plp.229.1595311417279; 
 Mon, 20 Jul 2020 23:03:37 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 66sm19724068pfa.92.2020.07.20.23.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:03:36 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 2/2] target/riscv/pmp.c: Fix the index offset on RV64
Date: Tue, 21 Jul 2020 14:03:28 +0800
Message-Id: <f216144b553720ec33d1be8abd225a252ad79a29.1595311277.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595311277.git.zong.li@sifive.com>
References: <cover.1595311277.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=zong.li@sifive.com; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Tue, 21 Jul 2020 06:03:41 -0000

On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
implementation, the second parameter of pmp_write_cfg is
"reg_index * sizeof(target_ulong)", and we get the the result
which is started from 16 if reg_index is 2, but we expect that
it should be started from 8. Separate the implementation for
RV32 and RV64 respectively.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 target/riscv/pmp.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2a2b9f5363..3de6535fbd 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -309,6 +309,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 {
     int i;
     uint8_t cfg_val;
+    uint32_t pmp_entry_base;
 
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
@@ -318,10 +319,15 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
         return;
     }
 
+#if defined(TARGET_RISCV32)
+    pmp_entry_base = (reg_index * sizeof(target_ulong));
+#elif defined(TARGET_RISCV64)
+    pmp_entry_base = (reg_index >> 1) * sizeof(target_ulong);
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
         cfg_val = (val >> 8 * i)  & 0xff;
-        pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
-            cfg_val);
+        pmp_write_cfg(env, pmp_entry_base + i, cfg_val);
     }
 }
 
@@ -332,11 +338,18 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
 target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
 {
     int i;
+    uint32_t pmp_entry_base;
     target_ulong cfg_val = 0;
     target_ulong val = 0;
 
+#if defined(TARGET_RISCV32)
+    pmp_entry_base = (reg_index * sizeof(target_ulong));
+#elif defined(TARGET_RISCV64)
+    pmp_entry_base = (reg_index >> 1) * sizeof(target_ulong);
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
-        val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
+        val = pmp_read_cfg(env, pmp_entry_base + i);
         cfg_val |= (val << (i * 8));
     }
     trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
-- 
2.27.0


