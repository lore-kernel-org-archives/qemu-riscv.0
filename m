Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1KKQ-0001aj-Fa
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 00:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1KKE-0001Yp-Lv; Wed, 15 Jun 2022 00:08:20 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1KKC-0006oo-HW; Wed, 15 Jun 2022 00:08:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso930720pjg.1; 
 Tue, 14 Jun 2022 21:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X2Fti+zxT8eMbb06kl2o5oaRsqmJqpLb0B8xrRpoe/U=;
 b=HmUqFXxdvlOwgxc8MOBJmEIrPEmQ7+eb9lpFuJV3ShNWfIlv+9hXJD9WVpe5O89RvJ
 qEyGg6PIuC83jgRagxLiddPJvLLf9tRVPdfJep21M21QFd3Ynd05GA89wxk9pfLhDpp3
 iNDwEGwR++3T8qV/STpiHelgiAHcp/OzF3GrCZX9Y8DFdhqSepsLrXwsjZDHXbh41vUP
 GvhKPjJGVvVrmQVq+Z3MbyYRyH9Zff2s/dltY9v6ybYkyCqodmkCT3SzueHjMuu1ttx6
 /h7MZ7jK5+0nmId6TZpP/L1o0FvmnW/NSZzvcy6kA8P+YNwmpSDfVbmothciwChK43R1
 fDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X2Fti+zxT8eMbb06kl2o5oaRsqmJqpLb0B8xrRpoe/U=;
 b=CsdTdxQmanBFylEWdho3vr8Eh+a/dmBelY66+gxxnPXAsaIsyxG/FM5YvB/Zp7qhW+
 RVDjaTkfEp6Mg9QiEj2xROxrKe9aBl7HaTpuo37fUsQrUl2DEXBLI8392w1mL98ETfyn
 ngA00zlpbHcc3qBqt1keNdXDW/7WGsOiPNHjO85vrp5wcs61FZsatxubvM3Z6hUW+pgQ
 lphju72RPpAd2WgVRBFHTqVBin4KzJVGISv/cgNG9DRc+3/e1iZeFXcjcmc2YV34Z9id
 QT6y+BJM9jsutbWX+P6KsCERZnEPSJx6CVIyuJy5eYHYdCRWQIv0qzpUBohksk0vXKuk
 gr9Q==
X-Gm-Message-State: AJIora/I9kBNv28Ej0Zn3xhH/b6RJzgctzY/EkSCeX1UgTGQHAxjXhFx
 X26YfpuMT/CEJKTNnpbaq0o=
X-Google-Smtp-Source: AGRyM1tHNasHMladPCcD17IkP/WPaegjN+c/GCIMI3eXUdbpjBv6vJ8a98qTRtI594pSpfPl37oI2w==
X-Received: by 2002:a17:90b:4b82:b0:1e6:7853:c004 with SMTP id
 lr2-20020a17090b4b8200b001e67853c004mr8066714pjb.136.1655266090204; 
 Tue, 14 Jun 2022 21:08:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j9-20020aa79289000000b0051c79bd5047sm8436945pfa.139.2022.06.14.21.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 21:08:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Update tval for hardware watchpoint
Date: Wed, 15 Jun 2022 12:08:06 +0800
Message-Id: <20220615040806.137678-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Wed, 15 Jun 2022 04:08:26 -0000

From: Bin Meng <bin.meng@windriver.com>

When watchpoint is hit, the breakpoint exception should update tval
to point to the faulting virtual address.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 6 ++++++
 target/riscv/debug.c      | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6397acdf..fdcba8978b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -289,6 +289,7 @@ struct CPUArchState {
 
     /* trigger module */
     target_ulong trigger_cur;
+    bool wp_hit;
     type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
 
     /* machine specific rdtime callback */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4a6700c890..f1564ce51e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1345,6 +1345,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
+    /* only update tval for watchpoint */
+    if (cause == RISCV_EXCP_BREAKPOINT && env->wp_hit) {
+        env->wp_hit = false;
+        tval = env->badaddr;
+    }
+
     if  (cause == RISCV_EXCP_SEMIHOST) {
         if (env->priv >= PRV_S) {
             env->gpr[xA0] = do_common_semihosting(cs);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index fc6e13222f..89b12c6bef 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -407,6 +407,8 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
         if ((wp->flags & flags) && (wp->vaddr == addr)) {
             /* check U/S/M bit against current privilege level */
             if ((ctrl >> 3) & BIT(env->priv)) {
+                env->wp_hit = true;
+                env->badaddr = addr;
                 return true;
             }
         }
-- 
2.34.1


