Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZbqM-0003R3-GU
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 13:10:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1nZbiC-0005bx-C3
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 13:02:24 -0400
Received: from [2607:f8b0:4864:20::52c] (port=40922
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1nZbiA-0002kh-Er
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 13:02:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id w21so18051911pgm.7
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=0Lj6cv5490PzePa2wH9rHUmkVO8SXtfGLpyW7WmAJ3s=;
 b=K6KXDztg+FtVc/D+WtwUq+Uq5sUydOiZhlUQOlwtVx/a1+zV59i/AYnk+fk2NlmeGu
 7GnRlpIATakHJ1HXdKsEugd22tW4xVLrev2Gw5MFX7THGZIAt+4+LasVKqLfDvWsMmqr
 aaIJKnEpVBFPLitMasrA+JTFO79uH8xOKO4xw6MT3lMsG+GsZngzV7lg1iQTwL79tevP
 4BVtTzMzUxp8Ox8zVIRDM4k7fXuq20cpCAWfQNZq/VkxWWAQTcEmeCzp85SGwAih+fMz
 dlzZ+Abp/nnCZZl5VWZlYB2AD0rUNt+s2v/e77lQupzdOxiSrooC0CuFz/CRK0p6fDbR
 WwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=0Lj6cv5490PzePa2wH9rHUmkVO8SXtfGLpyW7WmAJ3s=;
 b=xMldwQFPgSgml1F/dJKLmOAPupRzZ8GwRrVfmCxvt0EbBqYiFbOEyupv2JRKWHuH6W
 A/iZLOJxgxdL5ykZaI6JvP7SPyfLeIYCEjTgqDMpLKQ5fxSXFiy3Uzj6uKNOS7hlfxex
 tkTDEJmg7+CHCZVXcibpAjd6LGdnGJL4MBoB6ZUd8l1Sa1dPy42X4InyjaX/3iP50TXr
 Tjpm1NjAWu00KpbW0uJhc0udTlZbX13Hh5jO003XqltugNlhDZS+x3JR9efEQY3eUKYC
 oHPNFSxzcmK3OUqwv/dnzgPI4QwAWsSwfHH/eGpibnudHH5oXCjyMMhS2/JF3V4rAdEE
 RJdQ==
X-Gm-Message-State: AOAM53370/E3MPoJMrgkXnvVbYxSffNaMo4ll+WcgMNmAbeGYegtC60b
 PUE0vFZ3IgL28AzpV3ZOlgOTcnMH8GoO/w==
X-Google-Smtp-Source: ABdhPJw7A6FIqW3eObN7K/xu6XXpA8NEWEnpBBnN9ZO5uefwp0uvxctKR58hsQlyjWGjDt5umXOAEw==
X-Received: by 2002:a63:e811:0:b0:380:f449:2c94 with SMTP id
 s17-20020a63e811000000b00380f4492c94mr6987302pgh.52.1648659737499; 
 Wed, 30 Mar 2022 10:02:17 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm24773002pfu.120.2022.03.30.10.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:02:17 -0700 (PDT)
Subject: [PATCH] target/riscv: Avoid leaking "no translation" TLB entries
Date: Wed, 30 Mar 2022 09:59:13 -0700
Message-Id: <20220330165913.8836-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 13:10:49 -0400
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
X-List-Received-Date: Wed, 30 Mar 2022 17:02:25 -0000

The ISA doesn't allow bare mappings to be cached, as the caches are
translations and bare mppings are not translated.  We cache these
translations in QEMU in order to utilize the TLB code, but that leaks
out to the guest.

Suggested-by: phantom@zju.edu.cn # no name in the From field
Fixes: 1e0d985fa9 ("target/riscv: Only flush TLB if SATP.ASID changes")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

Another way to fix this would be to utilize a MMU index that cooresponds
to no ASID to hold these direct mappings, but given that we're not
currently taking advantage of ASIDs for translation performance that
would be a larger chunk of work.  This causes a Linux boot regression,
so the band-aid seems appropriate.

I think the original version of this was also more broadly broken, in
that changing to ASID 0 would allow old mappings, but I might be missing
something there.  I seem to remember ASID 0 as having been special at
some point, but it's not in the ISA as it stands so maybe I'm just
crazy.

This, when applied on top of Alistair's riscv-to-apply.next, boots my
for-next (which is very close to Linus' master).
---
 target/riscv/csr.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0606cd0ea8..cabef5a20b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1844,7 +1844,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong vm, mask, asid;
+    target_ulong vm, mask;
 
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
@@ -1853,20 +1853,22 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         vm = validate_vm(env, get_field(val, SATP32_MODE));
         mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
-        asid = (val ^ env->satp) & SATP32_ASID;
     } else {
         vm = validate_vm(env, get_field(val, SATP64_MODE));
         mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
-        asid = (val ^ env->satp) & SATP64_ASID;
     }
 
     if (vm && mask) {
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
-            if (asid) {
-                tlb_flush(env_cpu(env));
-            }
+	    /*
+	     * The ISA defines SATP.MODE=Bare as "no translation", but we still
+	     * pass these through QEMU's TLB emulation as it improves
+	     * performance.  Flushing the TLB on SATP writes with paging
+	     * enabled avoids leaking those invalid cached mappings.
+	     */
+            tlb_flush(env_cpu(env));
             env->satp = val;
         }
     }
-- 
2.34.1


