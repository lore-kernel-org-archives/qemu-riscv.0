Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTlH-0003wF-0U
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlD-0003rm-KN
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:48 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlB-0003Cs-SP
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:47 -0500
Received: by mail-pf1-x430.google.com with SMTP id j12so5303206pfj.12
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p2Cv65iddYh9lUPOmu+RQhwDFSR8I38LzbJE2A/leCk=;
 b=KltcwfyYQv+H2VZj1YuYiweHb8GOzyOpNKEhaT/EM6CtIxhkmURRtT3oZqvQTpiExO
 8jVWAV4a/lDEcKb3mgUpkn/sDm52CNNb17LKfE+ShPqeOo6dTSa4qkr1IUaciYfWQr1g
 2o3laBhtCBH3AOP7sHNHpSoRzvozcKSfybO1VVParhE52L3DeThOPlQQuZubKVaURjUF
 Vali07PSIT8gu+QNfVA/WXw7IujqFB4+dT5KvtVzjsOhLKY160DAvtlhjLFVB7Aqld+H
 0tCAJzZiD2+ieJQT6ZBkNm5JjPVjtUikxOwtwwJrh0nBi69cddrsb/pTAT0osmCDFd+v
 Ixyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p2Cv65iddYh9lUPOmu+RQhwDFSR8I38LzbJE2A/leCk=;
 b=UrQmACm6GOqNZZf3oY+tNa7RzEPAE3DNV+03shwAt56aAhaRnUkoCxNZNzCxOkxllP
 ij8SGBtmEJYi4I9eR084o+P/TpnapgJ2rnpO9aET9PKNP+xjY/9hNc1e09/lWCnXKFvm
 0lw78M2CD46KHNj84Js0pU3es5Vd4ATmQkzXTY2bz+9fE/8+UgJfDwykomDC5OlXUGXD
 HTganUenowP4x8jQ5vddP9YM0Xsv63HIf2Zcez3GK4QocXoJ0UztxmQ5uSZyWFTniukc
 ys1w0zEfCwsCXTXcDzT+ctX/UzoIeOn99/C97euU/82C2SFPa4uxBnEL4+XhcJmEBljM
 iHYQ==
X-Gm-Message-State: AOAM5314/JQDQ9B70nUgBm8enCS1q4+hj4awaDJ6s9KOTVAhro16xGHR
 gsGTrJ5mWT62grJnsFYKxoB3kw==
X-Google-Smtp-Source: ABdhPJy0KxoyIRwrigzmVbzSydXFTbPfGEW6bz8SoNUAdpw9iGmxQaQ02XzKG8DKuKvckAYikMPEBQ==
X-Received: by 2002:a62:7797:0:b029:1ed:7b10:84c2 with SMTP id
 s145-20020a6277970000b02901ed7b1084c2mr953794pfc.47.1614309944404; 
 Thu, 25 Feb 2021 19:25:44 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 72/75] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 26 Feb 2021 11:18:56 +0800
Message-Id: <20210226031902.23656-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 916367703f1..6fb85c83278 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -77,7 +77,7 @@
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
 @r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -646,5 +646,5 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
-- 
2.17.1


