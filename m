Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHzr-0005QN-Te
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzp-0005Ju-HD
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:17 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzl-0005eu-LN
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id 75so7883014pga.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjyYcsniSCp0BkuCNDks3Qx0Q6WotnnL36LWygdTzRg=;
 b=CMsLPcD/xmddBLmhSQTMWPIYVBlgmoEZZwQrsqlE4QtK2o9azo15ZEjOUbiozy2kSZ
 Ystqfpyu83hK/Zszi6EA+/Inu54fwWen1rj9ai/EMo5YzoXL9uwjT5TX9C42zuJPwLY6
 cFfl/lnpBi9PnAkJV7bwV4UDqmq//RI3KM+2Y5pGVTOEvMJwRY4FmLOdNgC901gBtFhX
 wlM4S9iwb2qijIjkQiYrm+X2rMd/JvinMG1CVKglCkCfnR5YlcBdXAo5FHaCPtROWXvI
 BQtETJVvqDFrBTug7Y9CYGH/cGmrW0/awCCAJ1Df/+mkR+qZduTbz7fSgb6RpJn9N4qc
 9s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjyYcsniSCp0BkuCNDks3Qx0Q6WotnnL36LWygdTzRg=;
 b=bn/1eLxJUgSNufCBTbN+8NjtCZVcyGOJ5buBVzsWJTo+wRkqVbZ/1l9llyvZIsjLwb
 2xWSmrd+F6SCcs+suxGkZVXdlJ0GrhebXsCplH51lsBYpakGMWiVzOvLLIcU/jHkdA/i
 V1zB52pt45WEifvDZeaNxO4Yy9XeFHY4Gv/CS2ruRKkm0sfSPMPdWPAoIDq9jSAXRLgj
 XnItK0h8B0VRseJkwvHde+I49LIe8z7OY4RwY/9sotYkxaioxcaqZ57JBxAIg22Y1uUk
 qjltW9aSVps9lev2Hbxmg0TYlMWPghV0vUL1Vqwkh2G+EOM8+/xYEHyIFDN9jZu1+0cX
 DRSA==
X-Gm-Message-State: AOAM530K4fXkItCZ2TuANeZtv+jg6RuKasDa+1JTQkoCCEz5PaUgziaQ
 ZgJAoxb94WKmTVW7KwYVINaVkw==
X-Google-Smtp-Source: ABdhPJwKBWqT40c1fdaDzclGqExNiBH2q0NMUHVqmOYQLai/W4z5I2YbZ8fdmPSBi5YjH+LSemRanQ==
X-Received: by 2002:a05:6a00:1791:b0:44c:d660:d8f with SMTP id
 s17-20020a056a00179100b0044cd6600d8fmr10272261pfg.9.1634284271599; 
 Fri, 15 Oct 2021 00:51:11 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 73/78] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 15 Oct 2021 15:46:21 +0800
Message-Id: <20211015074627.3957162-81-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:51:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 952768f8ded..d7c6bc9af26 100644
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
2.25.1


