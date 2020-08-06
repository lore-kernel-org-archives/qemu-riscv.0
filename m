Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dS4-000347-Th
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dS4-000329-0j
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:48 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dS2-0007uK-BA
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:47 -0400
Received: by mail-pg1-x534.google.com with SMTP id t6so26493887pgq.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5gJQpQuBdx5+IRqoLCBuH1Sdjx31gU5U1EvDuXvWhTM=;
 b=QOucNCXwwKUzLCXKpxaitn4EBvdRjp2gLHEooPPMC7hg8Zuo3bp5JpHHxpweFfLMXt
 9S1kmGltJFpF2+WtC384QkbptRAoAdEbQPK0+FNXZK1GA5puK4gFZRy3v0U9/NskpIfC
 NPI26C7EWLM/1FxeOPtUIfyoZeyjyw5XABT9HfhDrdwirwo76VYoBXdqeA8nnCCRsNfi
 KJ4xwKRirAnzviI9jIwAHLoBJQDwNbRA6Wu7x6toVB3zTBk2r2Rk8kqAYH1z0r9iiJDd
 r/LIlMBD525BiV/oKEsi+bKz1oQWSzsQsslSwMq4tUeIX5R32Uxg7rpzIbt68GQhCvwQ
 ENGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5gJQpQuBdx5+IRqoLCBuH1Sdjx31gU5U1EvDuXvWhTM=;
 b=fXbj3nJ0yuqTI71/+6AK4YsuRKwY4cc/s/S5ZN6+dUiHHQRCqd4ayutxgUlf8GCBtl
 5dcKd1+HrU6bcVA0Jc6vPGrXh7rRXjBrpi6X7qJ8EWRsMTIob/N431fq4oOqlkXLr0mS
 GzYF/t1TmTGQQm2dLYgJJH36Hj8Hap3j70YeSviCh5pEqifr7GZTG5z2YHr6sNTk45dH
 ZxRq8C5O9rhQqFM+BKRiCQG8kJ35nhSmoWALdZlc0WtdlzU6yXCGVf0kh8MhdoYWhyYu
 pJm3tdXscB5G/a8NkBCEOLEt1yUjY1qLb5fj4tuGWy/pUOlM/rvT2q//KCILYgWOCDoD
 dlBA==
X-Gm-Message-State: AOAM5325zwA1Nzig/7VWvausc+MZiasp1a3bvl5AUk7+BlzLVbqAVw3b
 i5DyBgUP8wLXuYwqN1TSNmpI3w==
X-Google-Smtp-Source: ABdhPJyCo91lh0lVCmuZ/W0oq7q30sll9g0wg8XduOEGKVsHj4xGDVtu5cLMlledjM/rJsQGLwunHg==
X-Received: by 2002:aa7:80d6:: with SMTP id a22mr4094761pfn.275.1596710925062; 
 Thu, 06 Aug 2020 03:48:45 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:44 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 34/71] target/riscv: rvv-1.0: element index instruction
Date: Thu,  6 Aug 2020 18:46:31 +0800
Message-Id: <20200806104709.13235-35-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:48 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7a10fc27c5f..15afc469cb0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -597,7 +597,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
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


