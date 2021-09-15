Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQQYg-0002ku-AD
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 04:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQQYa-0002kB-I6; Wed, 15 Sep 2021 04:46:16 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQQYV-00069U-4m; Wed, 15 Sep 2021 04:46:14 -0400
Received: by mail-pg1-x536.google.com with SMTP id w7so1962502pgk.13;
 Wed, 15 Sep 2021 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5ck1rtCN9MckXHSNpLUv9QcdDbnsE0E63EIXFwHXKo=;
 b=W94L9ve2NDe7j4TVJlLsj+n22/1p97d9a7ZWYdSAsj2rRHr0GDfCbl9t3NhGphEYWd
 RTUrqyMtRLeB3UbTXnerhX/Jn7ChWte4C6z5CPGgFLX1WxkRd6K+xlvKPDw6eh6e8DMc
 bjDoFKBP67hhITn1bXTK5hn2E5Xyr93qYRKHlXmLLmZFVbpseJ2frd9n8RYG7x+Ax8nH
 yAuyduwYzXgso04v+ef+lMVxKhSURoTvyC/GYM8Xx7VSbgvvDjqw5xHMkiVW9Hu12unc
 Bu516+Q9Dn3yd0Uo7jB5LkZGtIWahywGEtSgia1gwiPnPq+up+7+dN9lb9wsnaMVAIDD
 uRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5ck1rtCN9MckXHSNpLUv9QcdDbnsE0E63EIXFwHXKo=;
 b=a4wfJR1jqYdcy0QhvQhqO6/qKJK+5R1p5WK1Xd/DT0waMpN1wkXrrnKkgH9KPoeJas
 HIjaiRrrHRBetg+RYccgwLZ3gye1H0XJcAr7OFIcbUpqabGYciba58BMfIqrG3s7zh4W
 nuJO4U3H3WY8/Y6VAEbgp4CeQPnBjBmXOQwkphVASQLChpJOE+muGevuNaUEJriXvKOi
 i0UsXDUW23lVaS8Yr9LHkeGoxyWpSI0bTzblDuQAAwzm3Bl1127VY2Bnuf2pnP3Bb6dS
 2mLcxowEdImYBeO+c8IrvUfVLcFyb8cDSl8bDoV9pE1A1zqTBv2FFQLSkqXUE8C1m21V
 +g/A==
X-Gm-Message-State: AOAM530zKNHDwKLejQZZ/+dWmSO/lu10ZfWPwJJQF5CMf1BjCPQMjx1+
 aNDcEt0rlJwBeQ8hCXKh/EQ=
X-Google-Smtp-Source: ABdhPJyO2Zw4uicK4pP1V9vWTmnnJxfNYyDeA5lidj2SbO2OKB9IUleGnauCpQ160XSZNiIGYB3HqA==
X-Received: by 2002:a05:6a00:1147:b029:3e0:8c37:938e with SMTP id
 b7-20020a056a001147b02903e08c37938emr9195106pfm.65.1631695568527; 
 Wed, 15 Sep 2021 01:46:08 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i1sm1430902pja.26.2021.09.15.01.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 01:46:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: csr: Rename HCOUNTEREN_CY and friends
Date: Wed, 15 Sep 2021 16:46:01 +0800
Message-Id: <20210915084601.24304-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 08:46:20 -0000

The macro name HCOUNTEREN_CY suggests it is for CSR HCOUNTEREN, but
in fact it applies to M-mode and S-mode CSR too. Rename these macros
to have the COUNTEREN_ prefix.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/cpu_bits.h |  8 ++++----
 target/riscv/csr.c      | 24 ++++++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..34564d367c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -397,10 +397,10 @@
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
 
-#define HCOUNTEREN_CY        (1 << 0)
-#define HCOUNTEREN_TM        (1 << 1)
-#define HCOUNTEREN_IR        (1 << 2)
-#define HCOUNTEREN_HPM3      (1 << 3)
+#define COUNTEREN_CY         (1 << 0)
+#define COUNTEREN_TM         (1 << 1)
+#define COUNTEREN_IR         (1 << 2)
+#define COUNTEREN_HPM3       (1 << 3)
 
 /* Privilege modes */
 #define PRV_U 0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 50a2c3a3b4..1cd34a6453 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -71,20 +71,20 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                get_field(env->mcounteren, HCOUNTEREN_CY)) {
+            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
+                get_field(env->mcounteren, COUNTEREN_CY)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_TIME:
-            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                get_field(env->mcounteren, HCOUNTEREN_TM)) {
+            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
+                get_field(env->mcounteren, COUNTEREN_TM)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_INSTRET:
-            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                get_field(env->mcounteren, HCOUNTEREN_IR)) {
+            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
+                get_field(env->mcounteren, COUNTEREN_IR)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -98,20 +98,20 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         if (riscv_cpu_is_32bit(env)) {
             switch (csrno) {
             case CSR_CYCLEH:
-                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
+                    get_field(env->mcounteren, COUNTEREN_CY)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_TIMEH:
-                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
+                    get_field(env->mcounteren, COUNTEREN_TM)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_INSTRETH:
-                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
+                    get_field(env->mcounteren, COUNTEREN_IR)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.25.1


