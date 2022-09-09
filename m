Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHB-0007Al-TV
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH7-00075T-Re; Fri, 09 Sep 2022 09:42:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:56123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH6-0003H0-6o; Fri, 09 Sep 2022 09:42:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id fs14so1548919pjb.5;
 Fri, 09 Sep 2022 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9uhLFc9EBhQiLoSlLlCsVfZ6rXSyTyRP0fIQqVxms9E=;
 b=Tu0AskexJFlPXcME+Jy9y69Y3TW78JSAwT6ZHy2WtytLI9TnfdN0rDf9OOYj0sJ1aW
 J4kcuSraPX7/M6/tKmODzZqsNfBxOvRpy2gEjXkoTXd6gyoB/Jex+AxbEir4FbsNNCRv
 bhW7scUjKmfHHOX7x8oGugCsBNq2D4RxFSBa64PTZOOFOfKgPvnLSRLIRIRZAU+ebQRN
 Qw84khe0BROF92KHYDzczEnxdcz67Bvgi0IYFBrqXLJMqsz8xRYki2ckKwFWA+O9K89j
 Dzp+d4JOPmLrRXWGXu5UL5Jmgar00dnbp7qu+F/w/8Au37GN8NlScTOqrggI3Tp/QaDa
 dpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9uhLFc9EBhQiLoSlLlCsVfZ6rXSyTyRP0fIQqVxms9E=;
 b=DH3M4JBKBL41HP94ZRl83HCklyv5tnGofI5FSWRZF4VfccAifruk2Xl76nCuOFD8vh
 n4ufyW8409QQMSSxVRhtv9LERBcClqIxAqN30XZtjNGzv7Z2Wf7xE5yqHnE4oQk+5drZ
 peRM1vAl/vUAVHxhjcIXzU68YqAwPkGIO5sDheRKzYsYVUQWJopOMf44wt5UJMEJnuDD
 tSwLnm2v5ViLG1+yUIYJeCvioIHo18I+ONOOEhTosFn0ME1ebwMXqBoIJ0nw+evngcFM
 TrM4nUsW0ux2ZBTLl38v7GPIfERPdVaRbEeEQZyP+DaDwrMlGziP4HU7YpTDI2qLnRLO
 rpOQ==
X-Gm-Message-State: ACgBeo1q3kxedj6tKkyo6MvYlGAyiDCQxREcz5Ul5OXS/EPJtOS2e003
 x+PPHv3fh4fvnevQf2TzmgiOTD17Shk=
X-Google-Smtp-Source: AA6agR7PCEExuqrPwCjXxxzqzOjgf8R65ed9tpJUsmLRoHLVEKqpe/LrryqbkQPtDNpkaXg0QsYv9A==
X-Received: by 2002:a17:90a:c70b:b0:200:4366:d047 with SMTP id
 o11-20020a17090ac70b00b002004366d047mr9974298pjt.240.1662730946228; 
 Fri, 09 Sep 2022 06:42:26 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 2/8] target/riscv: debug: Introduce build_tdata1() to build
 tdata1 register content
Date: Fri,  9 Sep 2022 21:42:09 +0800
Message-Id: <20220909134215.1843865-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Introduce build_tdata1() to build tdata1 register content, which can be
shared among all types of triggers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[bmeng: moved RV{32,64}_DATA_MASK definition to this patch]
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- moved RV{32,64}_DATA_MASK definition to this patch

 target/riscv/debug.h |  2 ++
 target/riscv/debug.c | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 72e4edcd8c..c422553c27 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -56,9 +56,11 @@ typedef struct {
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
 #define RV32_TYPE_MASK  (0xf << 28)
 #define RV32_DMODE      BIT(27)
+#define RV32_DATA_MASK  0x7ffffff
 #define RV64_TYPE(t)    ((uint64_t)(t) << 60)
 #define RV64_TYPE_MASK  (0xfULL << 60)
 #define RV64_DMODE      BIT_ULL(59)
+#define RV64_DATA_MASK  0x7ffffffffffffff
 
 /* mcontrol field masks */
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 9dd468753a..45aae87ec3 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -95,18 +95,23 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
     return extract_trigger_type(env, tdata1);
 }
 
-static inline target_ulong trigger_type(CPURISCVState *env,
-                                        trigger_type_t type)
+static inline target_ulong build_tdata1(CPURISCVState *env,
+                                        trigger_type_t type,
+                                        bool dmode, target_ulong data)
 {
     target_ulong tdata1;
 
     switch (riscv_cpu_mxl(env)) {
     case MXL_RV32:
-        tdata1 = RV32_TYPE(type);
+        tdata1 = RV32_TYPE(type) |
+                 (dmode ? RV32_DMODE : 0) |
+                 (data & RV32_DATA_MASK);
         break;
     case MXL_RV64:
     case MXL_RV128:
-        tdata1 = RV64_TYPE(type);
+        tdata1 = RV64_TYPE(type) |
+                 (dmode ? RV64_DMODE : 0) |
+                 (data & RV64_DATA_MASK);
         break;
     default:
         g_assert_not_reached();
@@ -495,7 +500,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
 void riscv_trigger_init(CPURISCVState *env)
 {
-    target_ulong tdata1 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
     int i;
 
     /* init to type 2 triggers */
-- 
2.34.1


