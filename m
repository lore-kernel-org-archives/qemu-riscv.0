Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX0Jd-0001nM-SL
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 08:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Io-0001Gj-D9; Tue, 28 Feb 2023 08:45:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pX0Im-00034g-Nu; Tue, 28 Feb 2023 08:45:58 -0500
Received: by mail-pl1-x62a.google.com with SMTP id z2so10433046plf.12;
 Tue, 28 Feb 2023 05:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krM7XBys7hcjFwcAcxMxurvd7OZFSrf8ZIXZkVpxAuw=;
 b=bXaWnBgrh+zIstiMmNggvFK2s2T6LbBoqWlPcvX4T1nqDZxqFgDeMrlZpzTIrFQQW/
 JZiKAqJf0b8NLHhEoxy/PC19QC9iYJ6vr8NAZkUnOB283DtFA2Zwf9RY7RkZqQcsDWQn
 JJ9CJ+TxDPwaiCUmt+84Xxgo/JdlKSUU6cM6Rt5kzwKjHB/AVNKFq7FTmDC2upEaXcdS
 Lca0CBNuPy1UsVd79tBULomt+kfpnIKw8aaoJ+8DGPO8ESR8dYxyMIQrmEVHlwf5k3B2
 +3xuBZmu0vfTUIYxItZEpnaSP/HQO7Z+AFUnqbKNa9sPSFQmjkxpPNCDMbg9caZrRXpD
 GciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krM7XBys7hcjFwcAcxMxurvd7OZFSrf8ZIXZkVpxAuw=;
 b=0/n/azXEBPo51CbkbwzM7AlsIl2X6j9nelwztQLTLCKat416ZSnwB4YK6yMT82RwVU
 Su0xEq5oF7WVlqC/shZGclKzBaC2Ftx/DUUZNze1W3b+gbE+jNgFCE403ncI36VdN4O7
 MMhGuqyGtAwN16HCPUGAfigLQpi+jwaCV2z1sLpzF/t1a3tCJXfHs6t0IEJsuj6sPW0a
 jEsqhyS866uIYcrBYuDPH+rBn4mLUSBPb7gf16A8SZ57/VA0t3uW6NZ1CMMg/XzRh8Jx
 kWLKid/BQUyQ3R+oH0WequQXDhHK/chuUu9j2EAZaNN4uNc03klq/aWYf7rPLPz35CEM
 CmoA==
X-Gm-Message-State: AO0yUKWvNtVxDbMp499r8F+tgfnSkJQQ4ZFgVBU2kabWjvo9ZqNO9Pkw
 bES64xTE4sKLiChmZD1tEaCmKMmlVbg=
X-Google-Smtp-Source: AK7set/9MQCq8zjWXDEatl9qTdTi3C1kcUeIIUXhh8gPqt80Io9QrmP5+lsvOamJC6FtQLsragzwLw==
X-Received: by 2002:a17:902:e84a:b0:19e:4173:38b3 with SMTP id
 t10-20020a170902e84a00b0019e417338b3mr729490plg.46.1677591954628; 
 Tue, 28 Feb 2023 05:45:54 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0019b06263bcasm1556896pll.247.2023.02.28.05.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:45:54 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v2 16/18] target/riscv: Allow debugger to access sstc CSRs
Date: Tue, 28 Feb 2023 21:45:33 +0800
Message-Id: <20230228104035.1879882-17-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228104035.1879882-1-bmeng@tinylab.org>
References: <20230228104035.1879882-13-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 13:46:00 -0000
X-List-Received-Date: Tue, 28 Feb 2023 13:46:00 -0000

From: Bin Meng <bmeng@tinylab.org>

At present with a debugger attached sstc CSRs can only be accssed
when CPU is in M-mode, or configured correctly.

Fix it by adjusting their predicate() routine logic so that the
static config check comes before the run-time check, as well as
adding a debugger check.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---

(no changes since v1)

 target/riscv/csr.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a0e70f5ba0..020c3f524f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -952,6 +952,19 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
+        hmode_check = true;
+    }
+
+    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv == PRV_M) {
         return RISCV_EXCP_NONE;
     }
@@ -972,11 +985,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
         }
     }
 
-    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
-        hmode_check = true;
-    }
-
-    return hmode_check ? hmode(env, csrno) : smode(env, csrno);
+    return RISCV_EXCP_NONE;
 }
 
 static RISCVException sstc_32(CPURISCVState *env, int csrno)
-- 
2.25.1


