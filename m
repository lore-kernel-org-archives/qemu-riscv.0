Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9IJ-0000Th-36
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IF-0000Qf-I2
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:23 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9IB-0001xY-FT
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:23 -0500
Received: by mail-pg1-x535.google.com with SMTP id g15so409278pgu.9
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BgZikz4sJLs+w0Gy/WgD2VLy+0WnxAYabQZ2ZyT4YKc=;
 b=TRRlmN+LPde9lczbR1pRzyQNo8Ybs8E4HljzJKLtPA5Y+9yVhN+tZAmZT++4XYTIxM
 GsUEuFyef/1r6JnQeFwXGEb5U6wRCyQwTuRPlcFlhzd4RJyw2ymrrj8kh7PEhyWSIHgu
 DdoCv1FIWeQBVn23mEiLCnQAFL2tMm74er4YcPcs0X6FW9+jkSb0hN3ewsX9QM+64XLY
 SZABzet3sQk85V6zsGwE8cqOnlps7Eni9XGLXEqStgBrLF3404FSd5w+E8+HwaeehyCw
 FZkXSPfX4ekWkvVOwgRNneIa1vT7wLkWLsAyQaymOh6BGf1gnMy6QdlKP7iPJ/usm4hM
 3Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BgZikz4sJLs+w0Gy/WgD2VLy+0WnxAYabQZ2ZyT4YKc=;
 b=T5+xfeasrRdtHDuyNSIv4col7+hFZy1WbuPQOc/lRMyoV6R+TFJ4tQkhWhAtijuYHL
 2YSt1qC/BEgZQ0NjJqc2eJL0c/Rpv9avN/Fa0E1zZtfMmWg28RFzLxE8gdkZ3aHKbwTG
 9C8M6WS5Gs6NDOCzyBGcPTe3ltyrQQIOfp0J9Eg2nHv0Iwb6AuVT/YxWJOJ5/V0y6f0w
 X+rkX3bLcc3fn4LCpSw2bADJnzhef4j2yz0ZyWUNMum2ZqzewLWrwYJGYe7P8n32F/ry
 LtICITjnadR4EEh05Im4mAKQd44ccwHSNbixm+WVVfia6lBeQGUt4zUlyzLhEW4mXAep
 c0WQ==
X-Gm-Message-State: AOAM5311O74zwlLvk+OGJ4PC2wtuzpM48SzydGLEobzLR4ARYwpWazvj
 YrdEO54wKYzMoTFXR84EXYcMpw==
X-Google-Smtp-Source: ABdhPJwTF/OLj3ZIUPocFw06r6Cgfk2G1VV1jPq9LHtgaOn3MN6hKG0UoU3XQgnUm80GlQdyZVnxSw==
X-Received: by 2002:a63:c441:: with SMTP id m1mr2288694pgg.353.1610418017981; 
 Mon, 11 Jan 2021 18:20:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 01/16] target/riscv: reformat @sh format encoding for
 B-extension
Date: Tue, 12 Jan 2021 10:19:42 +0800
Message-Id: <20210112022001.20521-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 02:20:23 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18ca..3823b3ea800 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,7 +22,7 @@
 %rs1       15:5
 %rd        7:5
 
-%sh10    20:10
+%sh7    20:7
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -58,7 +58,7 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -122,9 +122,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
-slli     00.... ......    ..... 001 ..... 0010011 @sh
-srli     00.... ......    ..... 101 ..... 0010011 @sh
-srai     01.... ......    ..... 101 ..... 0010011 @sh
+slli     00000. ......    ..... 001 ..... 0010011 @sh
+srli     00000. ......    ..... 101 ..... 0010011 @sh
+srai     01000. ......    ..... 101 ..... 0010011 @sh
 add      0000000 .....    ..... 000 ..... 0110011 @r
 sub      0100000 .....    ..... 000 ..... 0110011 @r
 sll      0000000 .....    ..... 001 ..... 0110011 @r
-- 
2.17.1


