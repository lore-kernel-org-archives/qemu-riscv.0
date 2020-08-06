Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dR7-0001GM-MF
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dR6-0001Dw-NR
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:48 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dR5-0007jI-16
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:48 -0400
Received: by mail-pf1-x430.google.com with SMTP id s26so24713653pfm.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Be0XpRst97t7RY4cXW3Qtzy3ziEgiOCF9bgG3gg0AY8=;
 b=Y20454jTIM3t7f+NPhPV+bD7LNvtnvYwiJlU/PCpzDrmgavozlhtpqGlGlI4evY688
 P5b35nYivlj832hLmFTYNQZJySxIc4tey5m2aR8aYRjDRsLGRbELAYlNo/gUv1Wwe7Vt
 kJeBP4SAe3hiJiQpCIGiujsqldNyifL46J0k6vloXrPkR8p3jb+AXzWIgfjmET8YO5ZQ
 eh7BaBd25lce8QHbKCkXrUgRfNYxrvGeG6Gy/mk/LU+8RPB31AANBGQafJgOxUeoPBCU
 YW5bHs6B7hTWTwKmcSOf6J9I9DBh+QvB5+1XuUfn8vHl0pcTQCbX8bidpra1lnUKElwT
 TF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Be0XpRst97t7RY4cXW3Qtzy3ziEgiOCF9bgG3gg0AY8=;
 b=YJMkTmdWhpl2kK9C3g2hmxn8OdJ5UZ6vSXd3+x3KYLZNsalAlCZx/g0riuLkAiMTck
 5MrjgB0umGW32i6YVFskc4lctciXqWj8Upwrvt0yAsH+RMt++73VKTmqVApoU4SiMmlX
 potkT2ELoPBV/X87EbiYqg0dGIjVSMAj5PgyiJ5vsMbpeo4LFhXXH3TgD46yuXgnNLIN
 P9pGdlUgCoXTxkodl3plaafZ2OxFbRM4Mdy2zKeKcGtFlQQoksbB2uXKbjM6WTL/hq6/
 o/UPtj2RiiXwAiFxS3LL1M6N0vgQ1rTlQDXoFu7U2+h3aRm/A9y8rPDuXNQMaWdv7xzN
 1mwg==
X-Gm-Message-State: AOAM5303IQ2BST3LFRhG9jVEbQpsflYxVnqmHOf8fpUM0KmUU1ZxAZU6
 MFMV8dAfgfiR3ZgYFs0icZwkyA==
X-Google-Smtp-Source: ABdhPJwOST8C6etrkmtD6y496t3clFRgQ+lPWLU+9wEfLz24+DXLlNZnqrwVh1X+d82rIlSsgUddLw==
X-Received: by 2002:a63:450d:: with SMTP id s13mr2642071pga.246.1596710865774; 
 Thu, 06 Aug 2020 03:47:45 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 10/71] target/riscv: rvv-1.0: check MSTATUS_VS when accessing
 vector csr registers
Date: Thu,  6 Aug 2020 18:46:07 +0800
Message-Id: <20200806104709.13235-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:49 -0000

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 11ce6d4576a..50a178a60d0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -60,6 +60,11 @@ static int fs(CPURISCVState *env, int csrno)
 static int vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return -1;
+        }
+#endif
         return 0;
     }
     return -1;
-- 
2.17.1


