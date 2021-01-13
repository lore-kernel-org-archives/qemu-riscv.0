Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaM8-0006nK-UK
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaM5-0006kd-0W
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:10 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaM2-0003m2-OF
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:08 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d4so565160plh.5
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BgZikz4sJLs+w0Gy/WgD2VLy+0WnxAYabQZ2ZyT4YKc=;
 b=aMywIBnSI83XT3/IkaO5F7ZSwOZ00BefYHJBDoTIbZ/DSNl63KizHkv34ZT/XQkKym
 LVR5ggMJ9xv0l2yvcpmsQ3g3bxya/k+qGktlO392gVzqCgQ4/Ln3HMkmvEK1JEkHGq67
 hQvn/8NrFzJecTgP6dcBLrI5OpCnd51/D/NgimbJ1UtBYum40LFlMGcVSsEcYPKk7ZA1
 g2uvK2yds1iNAq/L7tVvh8vcQtO6B9Db5XaVvp7gPTrmYb8TzCk51JJj6Ro9gDIUPPOa
 57S4eSuG9FW2qMbrxLmdbX4i0IOtOOWfXiILy6xLYjTsxmUKuL0/8luygfGntj72oDlv
 vwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BgZikz4sJLs+w0Gy/WgD2VLy+0WnxAYabQZ2ZyT4YKc=;
 b=G8Mj9oEQ2MKgAIPDLGEc/xzqLvSUnExv2qh/7E2aDmmssQSELr5chHdWt2OII9RkGm
 zeFIt9kcpm/L9OHq9FpmPBFMtIPHH654vCXIv00FwOltjHqETrT03DicjvwMTAOhJaP3
 MVaUHq7re+shb5ZI5cGoIfuNA8IjrmkYMmzDb9a8Yl2uToXh7/9hHplptlt9pPiiurrq
 IgmLpcPSiPUXrsQZJO/wa6OFK2/u14omI/LhKv1d182IXR0cz4EzrnYveXmRge+HPE/u
 m1trfa5/So10et5+tBPajNJMOKBY/Bkp6L77KmkpwbhADZsp3SB35DfxymeD4xLaOuwj
 chwQ==
X-Gm-Message-State: AOAM5331i+NmaynuFJc9uuKqsHzwEDct+hI+0bqORfXKG7Tsq243i8zq
 OhtRvwspqlC7y4Es5iRY3OQR3g==
X-Google-Smtp-Source: ABdhPJzFZeT9UTPg0iStY9LzqCNXY0l2cXUS3WDZHQBNLaqv/c0gdJeNWtmII4/rddXfcLRLBruy3g==
X-Received: by 2002:a17:90a:46c2:: with SMTP id x2mr832741pjg.15.1610522044052; 
 Tue, 12 Jan 2021 23:14:04 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 01/16] target/riscv: reformat @sh format encoding for
 B-extension
Date: Wed, 13 Jan 2021 15:13:33 +0800
Message-Id: <20210113071350.24852-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 07:14:10 -0000

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


