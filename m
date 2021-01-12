Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCk-0005pB-0y
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCf-0005n3-Mj
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:05 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCc-00083r-U9
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:05 -0500
Received: by mail-pg1-x536.google.com with SMTP id n25so1099156pgb.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CelpfpPjyrLTQlU7ri4/gFD6IDah3h0oYiOyuEn8YG0=;
 b=S58OitlHV6OEspfrhP2ysHWRgrOp7NlF73aCIPr72PqKLmeLnacyS5JwWhvXiUrBm1
 0AVWOVczIZTPEAF3owU8wikbCM0Wt/T1NDl7UubSmflzyzIec7QLyrUQtfsIt0who61j
 IkxbD1SM5IVme6ySMfO1ptq2bulwz1+Z+GWEFmN5+SLPCZheCvsE3LOYPKp3Lq6oye7l
 AMqxxX6PctVQwtDY4htkIe+oOskgWd+aOHqhuUZTvhtiQkFZsAqjXvLPSrJpR3KQgq03
 q56+DbWa/8xp50NifOEwnbzSEnjFM4gDNk2+CbEfPQaOKEfxE+urVWPv0ZngattsywUC
 mBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CelpfpPjyrLTQlU7ri4/gFD6IDah3h0oYiOyuEn8YG0=;
 b=bu5F/kTAOSQfSwlAJFx3XCfukI/ZB76xS/rp1AVbPtiJiMPYue0sATFCGJU+v2MLmu
 JUJ0HwZ3JtdRfzdbOQfQlVAsgeu8wpmCDNqQ2D4HJ/bJNNbzXlZXLoCuhg1Y7CbW/uVK
 LEMzl8cb/2TewiFJLKMIJBdtYQ51WeABhordzBglGJpjJPK5mUEl80PYui72O6ajuqi1
 ITx4hnM98AkjVOEBVvv6V8kaYRrsuXy/fzDNdM+SbO19tUAggWUc+pTBbJg81m5IxCbE
 SmKYcO4r3KOBaTAMhpBirkPRJfMnTeJJP9InP0RCt2Ksxnluyz/Gdd0CYh+Ruk9QSIBS
 vOGA==
X-Gm-Message-State: AOAM530GFLQELhKX3S31Ay5qbuqIPYgK3/0m5LtTg2xcDWfXYNKgobPS
 JrYSVLuP7oNYNzFsYCMS+axfQw==
X-Google-Smtp-Source: ABdhPJyrWUOjTmhfsR39fMjWddjA2a6fpB7/e4Zni3e8jCI17G9d8eKuAQvYSnv5gb+y1wOuUONkuw==
X-Received: by 2002:a63:405:: with SMTP id 5mr3947983pge.44.1610444581534;
 Tue, 12 Jan 2021 01:43:01 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 44/72] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Tue, 12 Jan 2021 17:39:18 +0800
Message-Id: <20210112093950.17530-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 022530697ec..8467dfc84b1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -449,9 +449,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
-- 
2.17.1


