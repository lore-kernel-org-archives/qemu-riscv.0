Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiG4-0005FH-1u
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:01:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFy-0004ze-QD
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: from [2607:f8b0:4864:20::102a] (port=46615
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFw-0005U2-M0
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso1861704pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 17:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gDbHwKwxtrtA4jGmGdtT6CXmvVat9X7nhJ/2q8dc90=;
 b=ra6QVmkDop74yDuTBPgZ3Z5DV8A2FF7yump60mHtKvfF1ULzQlI9UEr6KGfAT9KfGy
 h+CezZA7rYEu3AmmIBMgZp3NuqbeuDJa46C6THtme/eAsSyOY/9TwrPPIaFjL1gi/QeF
 2exM4GSxRnR8gD5KtRIjmiyvxf1Mcie4sTrF28Bp8WyND/UHs099VT5URHsRQid0aM7i
 LzR+gzbBwlpKnRKQPQagNQOiSSbAYgz8TRAGJmPkQhADSllo13JhNXn727o8rU7onwTC
 vButcrxd4Y6oFayK35qjadnUwzlah3bvJo7MP6HMYl48KsfQAPa8trhP1ekM0Cvqyfpj
 jSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gDbHwKwxtrtA4jGmGdtT6CXmvVat9X7nhJ/2q8dc90=;
 b=vMkJ4ReRYzhnu5cCQlBwJrnDXO15nAgjOJYg42wFdjCZZgO/qeHi8s+O+QOngDhcEz
 DtOVYgJzIIEXqQG7yXirf1lgdh+arc7KayILh8HEpi+NescTOu1Jaw+0PILV2jZfl7XP
 d27wk46mN4ivHbJw4EGb7Dl4QoZAX7lp83Rowedv5OfPLibc79mAKXLJJoq47JLughvs
 xD5FEUQZiIo9j1UzSJmUW11JCFAttiw7l7IlL02hPOzbg7zqkMP+lvstpzbZOj91VCfN
 xM7wBTmYuwHXa2tPrNdbG3hBjMWbU0LwREtrUkZN4c18qdMFWgxM87wGZjAe3hkddMC+
 uqKA==
X-Gm-Message-State: AOAM531UEG2V+Cr8YRsypBZjb0TNeEyR0BChwl5/Re3cKnX4gA7FcNEh
 x9dFP72x1yXXUfTTgA9B2eQMCg==
X-Google-Smtp-Source: ABdhPJwYvSGrseg24S2jsPS6T4I5YxXp0TOdnLAGtudRpL0r3PeLNqICHSLig/ps0DhMgagFXPXXqA==
X-Received: by 2002:a17:90b:f82:b0:1c6:58b9:bd36 with SMTP id
 ft2-20020a17090b0f8200b001c658b9bd36mr2678172pjb.141.1648684899465; 
 Wed, 30 Mar 2022 17:01:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v7 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Wed, 30 Mar 2022 17:01:16 -0700
Message-Id: <20220331000127.2107823-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 00:01:43 -0000

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
index 254bab3715b7..914b3f96ef67 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -77,6 +77,57 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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


