Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBv-0004n7-W4
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBs-0004iK-10
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:16 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBp-0007mV-Rm
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:15 -0500
Received: by mail-pl1-x630.google.com with SMTP id r4so1096024pls.11
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AB1tvM8qt57zZmqlyA9Dh/OdO8KK6/wgzcjk6zXkxcg=;
 b=m3jqMLBi2SOXfTyXye6aR/V4xkTu7nhLilWyJarkPheJZbmJXvcLD4zInJ8KyWsGks
 5zktN60qmPUzl+TSJt4BNcEtno4nYWqpanVpQ4CTRe7e34mcNx9RqxXHDb12bYctpmlC
 SIFGi0o0gDTSO8yHcaEp86ezc+1KFx3WdGpLAcSLcNGuL9m64oTNu1tc2WSPcEDjPLW8
 3WLcSeI/5714DrYENdUpTeBfIGcC7XzqAFvSzTUpmLqYKoYrHADDnzMYIycRd+kNuuJu
 rbOEsFgAezsqUSdmNZEMeZ5aVtsNPlFRorZLKIr8Tnqb01estMnQTmME9peOM3UxDEzW
 8yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AB1tvM8qt57zZmqlyA9Dh/OdO8KK6/wgzcjk6zXkxcg=;
 b=kO5XS6lX3Oyn5hdUV4vjhIa7RgXVE7Lej2zL0yWH+ibK/DBGn6v+/1orUQMBvf40Kk
 sXpkkrbRwBH3Axl1wn3M6NX3ECDMeEzWu30SD0JeaIa95UiMLwSIkwyOGIy+BoClGKYF
 cL2s2r5iv5Z7zUVWLrQuJqj0DVJmnAPx+lTtbq9Ur+ALig6OnaSNeK73K+RBDQZZggg1
 mpBejWYQNa9BK/A1b29z9Ouytn70y7vZ19DNyQvVEOdh05C/+CsVaYDF75z87nSDl9RH
 TrGahph6nhvZCNR42o6Nu6mNkSF4Z2yL8PS/WhFztnAXr72/hMPxSK8ag7Lg22QPWnz1
 j4Og==
X-Gm-Message-State: AOAM531uWG+oHKKrf1NntAB7sYsXXGyaZH61aZ63DfzedCwF7XwxQNJN
 zfYc58YuY9FVQ9OEGCP7VacKohgObIQwciDG
X-Google-Smtp-Source: ABdhPJx7Odf7/aaK//qFhXKUZjDUKa81nIhtMzAGGwYLHiE0ArHEj/A7RSsZblrsOKGL+5Joamwifg==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr3664631pjd.147.1610444532686; 
 Tue, 12 Jan 2021 01:42:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 32/72] target/riscv: rvv-1.0: element index instruction
Date: Tue, 12 Jan 2021 17:39:06 +0800
Message-Id: <20210112093950.17530-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fae5ea3fa63..a593938e5c8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -608,7 +608,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.17.1


