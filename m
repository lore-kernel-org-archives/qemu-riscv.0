Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2ba-0000j6-9b
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2bU-0000d3-QN
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:02:37 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2bS-00041v-4J
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:02:36 -0400
Received: by mail-qv1-xf34.google.com with SMTP id q88so3306169qvq.13
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cy1xP5OQWUfnynTXfbvIKGvVE6egHD8uv4kncq6BSo=;
 b=mfbnT6MlQWrG+J38c1hDGrByDG0vYVPcAgLRdyKes0rMhUu1pZNWVOl4xnmBvO+oSK
 FRB0DOqavvu60JLuI5W9nqCZV8xAKkJQ7HcTbpoI4JlP2lwsmAb+kH1fWCAJrwtS3NzX
 Gss4ywBKM46Wc+OGDWWzRw8+564lTdlqPKt+IFAc+Q+oFSqjNHbHc0Ij+vmQtU6SfnTY
 RfTSAVKt3el3goJD7guAYWqks5TeSpNTMh7Keh5cH/OUOiV82HIL5hsDH6rUu+m3leKW
 blrSb0AhLbSOYipu6pWtjbPnQXjHRbiif1Mi9JW1TZpn4hZKyNiJ3qLr62LycDS4ddHA
 Zk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4cy1xP5OQWUfnynTXfbvIKGvVE6egHD8uv4kncq6BSo=;
 b=xNn+4YiT1WdqD4jlHNdjGQsx0SX38CUo4SvLPhVXzq1wBLhoBEKnNNHsOBcEVAwIdx
 pxK5lgQgEZ2VknysxOqSVsHzqc4RNiCKGdkvv+WBp0goKXiM9z2sy83UJh0NO+M0pT10
 8DxPhwCo/SVkLXSBrLgdXPC1NK3VDrQaEFYMjwkktdFBO7G7M/g1BfmTSN3PJp9Mr/B5
 bZ8drxPMWxoBPBXW9jJxQJlh8Lxy/b5rterk7hJdFSOGjQEz+t2ZZTyemCmlFLplPlDY
 WTrPCIW/s1N7qGQbjww+oWNXD+/t6TYw80KhKwxGRPM2j9x1r7QOKKK01cx5zkPLroMl
 /GsA==
X-Gm-Message-State: AAQBX9dPbVpL4UfzYU0Z8WcvGeT1Gox4R5KPTI+0TliFxpwFzoZ4qdYu
 hvUhX3kNkNvt7VQAxbkiPAbOcJ52lnrQzC/PZMQ=
X-Google-Smtp-Source: AKy350Y6Ddeh8S703GLVtfoqfnHWkMTPZPGIe6t6xnVAiBA/hiKgKznrbiU5WZAJXfgQA9LzEIKg/Q==
X-Received: by 2002:a17:90a:4fe5:b0:23d:48a9:3408 with SMTP id
 q92-20020a17090a4fe500b0023d48a93408mr5797910pjh.41.1679741678718; 
 Sat, 25 Mar 2023 03:54:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 09/25] target/riscv: Use cpu_ld*_code_mmu for HLVX
Date: Sat, 25 Mar 2023 03:54:13 -0700
Message-Id: <20230325105429.1142530-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
X-List-Received-Date: Sat, 25 Mar 2023 12:02:38 -0000

Use the new functions to properly check execute permission
for the read rather than read permission.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/op_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 962a061228..b2169a99ff 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -427,18 +427,27 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
     helper_hyp_tlb_flush(env);
 }
 
+/*
+ * TODO: These implementations are not quite correct.  They perform the
+ * access using execute permission just fine, but the final PMP check
+ * is supposed to have read permission as well.  Without replicating
+ * a fair fraction of cputlb.c, fixing this requires adding new mmu_idx
+ * which would imply that exact check in tlb_fill.
+ */
 target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUW, mmu_idx);
 
-    return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldw_code_mmu(env, address, oi, GETPC());
 }
 
 target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
 {
     int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
+    MemOpIdx oi = make_memop_idx(MO_TEUL, mmu_idx);
 
-    return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
+    return cpu_ldl_code_mmu(env, address, oi, GETPC());
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


