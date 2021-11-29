Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX3e-0006fe-12
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:10:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3c-0006dG-VQ
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:21 -0500
Received: from [2607:f8b0:4864:20::102b] (port=44858
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3R-0000ya-BL
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:10:20 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso12827930pjo.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNKLb1QcQ6ASiCSf4LOijmdkFNA5PCo15wSKt6nPlVw=;
 b=PzVFS2bFQr6HA0SH6uHvIkuHYkpeHtgEfwPqa87WRzRFVFLTo2cU5a8KCcQnuNQJum
 I5sydKyXykkkA+hY/6tBF7MhuAq2/fl4lN0JGBvcabKr5d7H9l+MkFHw7hHAP38zDRVn
 NYC3PQ7C+gLYxFG66ZNkySNUgYCKqUupsjcJWd8KTYbrZ/iMSvIfpCSrE56JwoEj67XP
 LMuByCeARoCqJFCni015zvDmFlv8Ulup4yhQL0ltM8g8uRk6qYYxFN1Yp5dnU+kLHPo+
 jfUDuQ5aEAa4IkEEHvgGuv4vmHKNhtG+vDlb+jm/hu6q6Gl8eFn6B63kXeN/fMuIsCyj
 BLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNKLb1QcQ6ASiCSf4LOijmdkFNA5PCo15wSKt6nPlVw=;
 b=5NzWep+fdcyEo8Xc3dz0SHfC++urjFxKHG1mVojtUVrdBDB0WsziwMCknbRr+/kfOQ
 43cSXNEnHJLqg58ldbpyX5XBYdWzRMDq9st927fkfs49wbBFFYR5yMQlqew+tGtPJzZc
 R4iG9VCArFs6OpIXaT8X8i4aY3WRY8E0BIXg1HdOdw3mVDYWqw8dHVbgWj1o16K8tNIp
 X+FouB8U5wL9gNGe875FIET/GO9kCE7GfOMrseLu5Z07ZOBny7dQHs1/m5Os0bLrZOQM
 aMNDrS10sM5SpHApYroJqKgy43B7op3SZCdKBMdNCdS6dCXUVwcSp3ju/ACkG5JtDhPw
 Ewww==
X-Gm-Message-State: AOAM533L2SXoWLzhF9v7O5o75sgjkxthOHnn8hNbQZpF7wvh9xpI3wFB
 CY54993GioVVdU0rWiJ7sYZxFhZGoXmDrbLt
X-Google-Smtp-Source: ABdhPJw5TjmwZ3w4OF1xblX311os/XweY8CCCdnt3muebgVmQ1nIhp5LVdaxJb6oYZPrA8VdHTcFdQ==
X-Received: by 2002:a17:90a:7e10:: with SMTP id
 i16mr34588788pjl.185.1638155408118; 
 Sun, 28 Nov 2021 19:10:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:10:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 71/77] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Mon, 29 Nov 2021 11:03:31 +0800
Message-Id: <20211129030340.429689-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 29 Nov 2021 03:10:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


