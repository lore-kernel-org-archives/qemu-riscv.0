Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntHpk-00046o-Rp
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 19:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpj-00043C-9U
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHph-0000Mr-Jn
 for qemu-riscv@nongnu.org; Mon, 23 May 2022 19:51:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id w3so7813737plp.13
 for <qemu-riscv@nongnu.org>; Mon, 23 May 2022 16:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AhCdNNL1uDdWvnH8n7UysRuRPz3w0BpqFn1GxNQ6wo=;
 b=1Bbfnz2CEe3CP9LuZgH+Yi1fosFu5sP9Wokpgm4F8+Wl9npqToJoqlWYHB2GNrs2qx
 rlppxfa2xd3Qd9AjvKs+mgZpfPqlNuXBfcrTuvxBRJHcZgOgCi7W88DYelz9vIsKQ8ly
 FnRw1ZnbOobOuwdNsFSuy3GDQgEot5lnQqU81hduACOaAnFAR4bJ+iLBiyoaqUWX8PDd
 tl2Npwks1KsQ3V/+E82XsiXfKk32h0LPfXIQ5d/fwTftR/XFPQHhbavNHKxnWeAco6OW
 l6OQARpN/P0NJ3DBXgyUR6b40b30+NDHtST9M7jU2eloJxdPLbIebTHeen03ZC2PD9SJ
 PzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AhCdNNL1uDdWvnH8n7UysRuRPz3w0BpqFn1GxNQ6wo=;
 b=k3ou9+YVbkxD9IKYuhChGfmAgtuSVHjsBaLnp8BGmxFBEGpFZhaq94xjLFa7haHowo
 7kSZLJi4A8RNfamifMYH7XQqjH7LqQhl8xs+eNLch5pa3pV67QWNUN14t8lT2X/b+HlO
 4fpow7HXTTKC7OcL9TzutIX2pMNdIBgmcgd5QVxgnxfJL3rQOFgxNRRJ13lffAHmDGIc
 ptxuAbb9dN6B55w4PdEtCawWyYhI6IEQPqNf9jYCEzYykw6P1ubNNiFekciTM0uJhc5R
 69naIGCC94JC16GfJ21i7lpCmoXQhGxxpofmzpjQWw/GlFkmu6Afn+2FbI9xZnPAUR/l
 RoNA==
X-Gm-Message-State: AOAM5334WzJa5nt1mYJ/+MdFAnf9lk+APxw6mv4oZj+kqc0FhPzF30Yl
 kyBInMJHPM3BxjN+P+5wUv51Iw==
X-Google-Smtp-Source: ABdhPJxJlgUqBGNmdxfujP8NZXoTi+2Q6koOMV5QKAyTVb2KSJ7aj12JxlVz6k5/PPpb8rvo4xhCeA==
X-Received: by 2002:a17:90b:391:b0:1df:42e2:ae17 with SMTP id
 ga17-20020a17090b039100b001df42e2ae17mr1543973pjb.198.1653349888392; 
 Mon, 23 May 2022 16:51:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Mon, 23 May 2022 16:50:47 -0700
Message-Id: <20220523235057.123882-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 23:51:31 -0000

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ee3a35afa256..d175fe3f1af3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -79,6 +79,57 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.25.1


