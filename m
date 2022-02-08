Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHXu9-0001qF-Lu
	for mharc-qemu-riscv@gnu.org; Tue, 08 Feb 2022 16:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1nHXu6-0001nG-T8
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 16:20:02 -0500
Received: from [2607:f8b0:4864:20::42a] (port=36635
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1nHXts-0000qu-KQ
 for qemu-riscv@nongnu.org; Tue, 08 Feb 2022 16:20:02 -0500
Received: by mail-pf1-x42a.google.com with SMTP id z13so702427pfa.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Feb 2022 13:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYQvzdw2QQgJC1nJhwjIQSezzdwKJlo1A0L7drDeFJ4=;
 b=3aa6FythWTTL+A098K6QSybYu9ip38RVKff7Tygz4Qa1Lq43YzapSkLD1iBux/kfFp
 Xpt6IKDMdh5ziDL9MiRfSWmXJubgKJj5cbdJkmaewuxDQBo9OnLSphfeUeSpggXHHnsD
 C9RY99ImoOOJxh3zOUU2+2q2CPMxVcCc1k1egt4xWGqRfvvMer2SZQ3KM4gLA0hNx2WN
 1Uvx2oJCjVg9kUOMZSTKLAwUOZfsZkujahxzN3lw5vbyp5SZLhBSQSmVuyw9yCCQbNNH
 0IfTSYiFU311M+XzRu756w2AuxNN33nqjDzr7VMi/HCUFLzxYfE/f6JwVdXpahGgnSl3
 LbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vYQvzdw2QQgJC1nJhwjIQSezzdwKJlo1A0L7drDeFJ4=;
 b=jY9g+v2vVvccPKruN56yE7tHEgL7YCBdxYtVgPuF1+f2el4/f/FroD5ZIHaDdPDtr5
 +NJmDdzGX5jc8BBAUQfYlnEU7sNJiBYRzZneyk+PJkYZVmmg2/fTvcRvOPqDjD+9Cmv5
 VbSisZ1Cpxnv5oAnCnbDJDynOEff8u9rd0orPpzXoMzhLolDvQnVX1PECmJH0cnu1wem
 yGZaCP4wpySsvsFV2b5DVWWLwAX5H/9VWqToOykGmhf+D2OGuHfis7AdnAnmG/w4uBPw
 bYEGjDZMya4bq/N7uNcJZxmrDWN6L9NFyzDKMTLbjKP6xykrJGcYWOSv6BBWihrnbjuX
 YAtw==
X-Gm-Message-State: AOAM530AdsXOInDYysV0hFXeSe4M842mY4uY14hNbyBPT+fQunAeMa2y
 CitY271rx6K4k7rOVsUHMhQ+IA==
X-Google-Smtp-Source: ABdhPJzKtx3wJ9+bbS0vNvt7JL9hDhG+wlsLl8isY0s+Ei4ZFmMTixPEohsz7wCpsOgfWbqrSN7lkA==
X-Received: by 2002:a62:e409:: with SMTP id r9mr6267343pfh.44.1644355181799;
 Tue, 08 Feb 2022 13:19:41 -0800 (PST)
Received: from vineetg-framework.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id a38sm4929403pfx.121.2022.02.08.13.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:19:41 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 gnu-toolchain@rivosinc.com, Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH] build: fix build failure with gcc 11.2 by disabling
 -fcf-protection
Date: Tue,  8 Feb 2022 13:19:37 -0800
Message-Id: <20220208211937.79580-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=vineetg@rivosinc.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 08 Feb 2022 21:20:03 -0000

When doing RV qemu builds with host gcc 11.2, ran into following build failure

| cc -MMD -MP -MT linuxboot_dma.o -MF ./linuxboot_dma.d -O2 -g -march=i486 -Wall \
|   -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes \
|   -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security \
|   -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs \
|   -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs \
|   -Wno-shift-negative-value -Wno-psabi -fno-pie -ffreestanding -IQEMU/include \
|   -fno-stack-protector   -m16   -Wa,-32 \
|   -c QEMU/pc-bios/optionrom/linuxboot_dma.c -o linuxboot_dma.o
|cc1: error: ‘-fcf-protection’ is not compatible with this target

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
This might be a crude fix to the problem
---
 pc-bios/optionrom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 5d55d25acca2..8f843ee803c1 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -22,6 +22,9 @@ override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
 
+# issue with gcc 11.2
+override CFLAGS += $(call cc-option, -fcf-protection=none)
+
 ifeq ($(filter -m16, $(CFLAGS)),)
 # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
 # On GCC we add -fno-toplevel-reorder to keep the order of asm blocks with
-- 
2.32.0


