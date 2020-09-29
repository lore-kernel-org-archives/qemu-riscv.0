Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKyk-0006cK-HE
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyj-0006ZW-Am
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyh-0002Kd-Ks
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id q4so3178781pjh.5
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ixyI25Op3UHIzQVDkZuN65LzcuGaVJwh7enn2EMY8MY=;
 b=UJPgziaPA2ImJGp5jiwHyxecAiA3RNTInVrU1A4nWJavYiUbei3ESo7YfyZ14ZjlfK
 djXr+qsHtRMSk7ETbdDwuKMoyBEfhYoDj1+l2k4fz0fu/CymvIOvypW7LP1erHv96yma
 lqIjFS+7by1lWmVGRDz3whjvUWeKQUM05bGH1c2QTRjCrodlSOi40emBStVjbGEKo0qB
 bnq6w7AgkuQ6RgkHR0ye/expAuDz19gEvagoc0dg/xmrTV87N+qxBf8zCb7OzGCzAYz6
 mDzE+bx4gaL79ZN3vUH99zI3xxjTtgULfl8aJNM8NNKjZ2Ee0Qzl2DjGphkl9dPd/JIW
 j/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ixyI25Op3UHIzQVDkZuN65LzcuGaVJwh7enn2EMY8MY=;
 b=UIjtUB+wGieGbgr3K52+DOJBC3aiZBiOGwLJIoS7DIKOZLYTLokn6Nsmyp4OAxlFSz
 ZGNr7cGAUFFfvzCGRP4pBI/Ag9r8sKWPJPPkkLlfzOOw21Ed6KZeIjZ37WAk/lWjqHsB
 t1efy2KcyTT82S+8YpmbjYKfzhSwxomeB6jRkQ3fuosSxCkjP7t0I+6UqVK81Re+DpSH
 8BbW/HLaXeZQ1bmDdHkgaFhLy7oBCNbuS2jfoiysceUu98s6nt79nGcMlIScI0gvvU8x
 1VnZQdnL9186jr8Cwx5ZeyloTHrTH2aEhvB0PHbp8UrBDe8GM4CaA2qHhW3HdFb3kD6c
 1vrg==
X-Gm-Message-State: AOAM5312awTkrWmN1HUEzB8vRzDMM88eMaxQXPqHEoZyTHh8yMQvF/t0
 ZLDoXqjumNvPmBnjUqx0aHpTlg==
X-Google-Smtp-Source: ABdhPJy5njKl2XEwmYqGhbSE3b3X3KPrbycmmmUVrGmQ55+LiXpsqriQr5NoP3YM1edcWcHHyRblwA==
X-Received: by 2002:a17:90b:1050:: with SMTP id
 gq16mr5464581pjb.234.1601406474460; 
 Tue, 29 Sep 2020 12:07:54 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 44/68] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Wed, 30 Sep 2020 03:04:19 +0800
Message-Id: <20200929190448.31116-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4517f8ed54..c75d728fc5 100644
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


