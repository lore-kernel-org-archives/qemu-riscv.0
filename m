Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUD43-0004Wl-Bk
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 15:42:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nUCla-0004NU-Pd; Tue, 15 Mar 2022 15:23:36 -0400
Received: from [2a00:1450:4864:20::32a] (port=54023
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nUClZ-0004Cw-4C; Tue, 15 Mar 2022 15:23:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 19so48399wmy.3;
 Tue, 15 Mar 2022 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US53GTadOYF+z0MvG4ovXxzGYSX8MDrLg+DdjZboxdU=;
 b=idPg629EoW55mBV1/GWazVFOQsjGFl2CrccJyLgm/DqpNZY9zSwIWMbsWu6degkzbL
 lPG+FIB1lDlVTo5Sh8SSV/+x20Ep50nKKSlnErqYf8f/nSDVh9suUhDR4X4ZARJGWHOJ
 zrrshzYULmAMqOkU4NPlSTDfJ+73uGqJLJ0ilMvR64+jjAk7vyUaolbDo7WQBHkbi9sk
 NzJy0Yws6ydQbZjTlH09yIn0lHmCDv6BjgzoDKrRkYy9E1wLNkkSk3LCnbjZThBzHHJt
 GCmCGoqMJrQaRWO649h1BMoMiH03UclJhEPlfGQrJsnx8w+LIFEgauRCJqiy1In3OrQg
 7NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US53GTadOYF+z0MvG4ovXxzGYSX8MDrLg+DdjZboxdU=;
 b=qv824txxk23ZTGg+BFK9Idpbkn1RswljzrQuael56ZlfmIlENKewTwaYRtcaq6qYjk
 2c9gr+0OAhWJOsX5O5hG/axkTLeQpl4nk/2LIYVoYtO9G/1p4w83FEb5m1uFNaWJ0Cxg
 qR/oYXlyCJDUPjsERyiBM+bYe8T+Y79gmlvnKJArIa1Zq/iEirNA8iTcIpe5nVOII4Ln
 sdQleO96HBvObOp01dVFG5WDNvw25H6xHoRfcfLmA+B5l+CT10XAQImfuNkM5B70ze02
 +di4Enmh5KpUq/LigRN8E+RdeNhKGSGy1uQvZCMnZcMcK6dCX9vJsif9DwAiXtCaM2Om
 8x2Q==
X-Gm-Message-State: AOAM531jW9LNCsFO6ExbESF2OtTVbIaCNfkRI4s0iQu35rWiiGorYBMi
 UmhLw3AQcbXr1X1IeuzWXkgqK9kprfkk9Q==
X-Google-Smtp-Source: ABdhPJzmmKXgiW+5pLMA+dvIpRkVmif0hr2NfWvI4BQzgQOKACZCYk44k5gg2gvn29L/3ZuWSi0VEA==
X-Received: by 2002:a05:600c:3552:b0:389:95b2:5f4a with SMTP id
 i18-20020a05600c355200b0038995b25f4amr4616678wmq.24.1647372206762; 
 Tue, 15 Mar 2022 12:23:26 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b00389f440512esm3266285wmq.32.2022.03.15.12.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 12:23:25 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH] target/riscv: Exit current TB after an sfence.vma
Date: Tue, 15 Mar 2022 21:23:00 +0200
Message-Id: <20220315192300.250310-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Mar 2022 15:42:38 -0400
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
X-List-Received-Date: Tue, 15 Mar 2022 19:23:36 -0000

If the pages which control the translation of the currently executing
instructions are changed, and then the TLB is flushed using sfence.vma
we have to exit the current TB early, to ensure we don't execute stale
instructions.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/riscv/insn_trans/trans_privileged.c.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 53613682e8..f265e8202d 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -114,6 +114,13 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
     gen_helper_tlb_flush(cpu_env);
+    /*
+     * The flush might have changed the backing physical memory of
+     * the instructions we're currently executing
+     */
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 #endif
     return false;
-- 
2.35.1


