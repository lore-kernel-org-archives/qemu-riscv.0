Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapp-0000m6-Cj
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapi-0000cL-2t
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:48 -0500
Received: from [2607:f8b0:4864:20::636] (port=42987
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapb-0007t2-R5
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:45 -0500
Received: by mail-pl1-x636.google.com with SMTP id u17so5734959plg.9
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzcKVi+Bv60cC1ahgvxWBHMOsNggOIgMKGBP4AAGucU=;
 b=bkXwVEtKL8U+k4gINoqJIV7sbC/dxh/XUtPPa9JJzw2WPkoLVF8ez5H4IhFHW78L6F
 CEpAd7vDrJLqL+rCtAzzbg1ZX5MDvWM+4DHrEFTCYo8g5ZJmyf9AEOMZQQSAewKOZCNK
 /zoKw2U1Ul5PxPN3jMo1lcZVHES2S0XVmey/vJ7VxwetGMOgXh+36ybeL9SUZFrFhShe
 i0SCcMG5WTX6SVzWs2DI0EKoa/CJPE7tpQqCIceIU7VqRkmZ5w/6ATrFIVjww9i0Cu1w
 uhCrleXdDn+ONwNUDmQ5/8WcgwP4Zko1ezw9W7cvv6AAwfefpZjwc/glyUpP4PSO2Y4E
 yr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzcKVi+Bv60cC1ahgvxWBHMOsNggOIgMKGBP4AAGucU=;
 b=7gWCQ7Vq7G+OPdyRdUaooEuOi+Bviykq2TZHAXWTKyDoHKTZrV8KuZb2qnwE2U+GHk
 aXz4pL7DM//P9rjyKr7p+VAHWZ7nNJ/NP4EAbq7s6D3ZeSekb3jLz3sYytdA75Y9QZod
 OVtbxzPQWmI/YWkghljpO6Gf6T5FGZmuvBWVHB5DOvhTFvcXPjpEhrATwTnanFvXx5D7
 vJQbwFpjo0ewaRwnp0PDWGsVw1vQl47oCD7IkHoKGdYDqJiJaswQlzdXKRW/A31YHrWk
 kufavBjdj4xG0NoMN0fgjBG2L7BG8fORp7zm2p4UGV2sobSO5zARw/cNupNWG3mpYg1j
 aEWA==
X-Gm-Message-State: AOAM531lBfrZTWjgEZKq9fT975sAWfjzAR595xjclr+lTy9wr8xMwtFM
 t4/w5dkzEYwFTKmzRYqhgQ9ACQ==
X-Google-Smtp-Source: ABdhPJwoNnRtC9Ilc+IDPWtrn8CgMSnsynzAPFkPeOm+jpoxdAX2bXxA4X/ERLMESVaxbPaqS7bK9w==
X-Received: by 2002:a17:90b:3509:: with SMTP id
 ls9mr21876697pjb.99.1639123238419; 
 Fri, 10 Dec 2021 00:00:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 71/77] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 10 Dec 2021 15:56:57 +0800
Message-Id: <20211210075704.23951-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 952768f8de..d7c6bc9af2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -78,7 +78,7 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -671,7 +671,7 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
-- 
2.31.1


