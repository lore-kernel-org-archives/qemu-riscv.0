Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkSeF-0005Fi-7y
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 11:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSeD-0005DV-K0
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 11:35:09 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSeB-00083K-KA
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 11:35:09 -0400
Received: by mail-pl1-x62a.google.com with SMTP id l6so1076340pls.10
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5WjOMo0TMUU1OTQL/m4WBjGf/+/CuZs36+TMUyQ5xTU=;
 b=P/QndRt6B7RJTdmM3YkWThIndiBR9zqHTSUO9chlPqQOYrLTL1PO+DaenUaMjUhlVX
 ziTLFh2wD62hGnyfTCYXxfIdjEk4tt3ZX/UiNoD/pdcW6IG+X386dHfpjTyeuBVoPU1v
 kf6z1EpDdv3vMRWIgmXytLppTAQik9LJ9ilye1k5MplDhiPfTw+Cj9I3G5RJUunMXPLY
 mW3s7fHa+y5Bm4DMbFwmNTwnxogSjzVLA+Pf1Ge2ADLR0PoB3GL2/hfzRGyp1VxtLBCC
 mDlxQiC6fzXo+4nXFqi40EcCLvlxikR1RmiAaT0ToHQgOnULBDlyS++LX5c38bcbwMDF
 lu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WjOMo0TMUU1OTQL/m4WBjGf/+/CuZs36+TMUyQ5xTU=;
 b=Lzcv+Wdo06cRMr/uhbFS8ZKfJEDBGLn0uRAUe8/iUL6Uu5DXpijMXv/pechh3wQArN
 lLuECkicLZVYXy+zV42gvOs883j7JlGdHaNoAHSGBWIjL3RnTiTquwG0zYjeVerW8PrS
 TvhffjxxWVvD9+BToHr0Sf+pgnzmoMq86j5wDyJr2PqQe/45GRzA6JUr6gWY+XzfHMDV
 0xc8aKPnNpKhPGMS60gvlGmstbLQzwoT1aBc2UwEAcF/mpTa0tbZ/tPbdZufRpiUMn3l
 UvOl2YT+OD7ktjckVOTC4qaMtcYe5DfAmV96L9jwJ540ibBm1lir2C2yEmISyNqdAPCl
 CMqw==
X-Gm-Message-State: AOAM531K7buFyp09L5LSFjbC8edP1iuPqoEuWITUFpEaFdgjf8HhnZro
 AdQUAuZv1RiwpzEaoS4oGF52ww==
X-Google-Smtp-Source: ABdhPJz7QiDqL9f49LjxROWn+igG/3zXVZDek/3DwtFlWBrpM6669mn/+pxULBAzU5mZONhrrGD84w==
X-Received: by 2002:a17:902:e94e:b0:158:91e6:501 with SMTP id
 b14-20020a170902e94e00b0015891e60501mr39165683pll.29.1651246506346; 
 Fri, 29 Apr 2022 08:35:06 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a65608d000000b003c14af50606sm6439380pgu.30.2022.04.29.08.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:35:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/3] target/riscv: Add dummy mcountinhibit CSR for priv spec
 v1.11 or higher
Date: Fri, 29 Apr 2022 21:04:30 +0530
Message-Id: <20220429153431.308829-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429153431.308829-1-apatel@ventanamicro.com>
References: <20220429153431.308829-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Apr 2022 15:35:09 -0000

The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
implementation that don't want to implement can simply have a dummy
mcountinhibit which always zero.

Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
the CSR ops.")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_bits.h | 3 +++
 target/riscv/csr.c      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4d04b20d06..4a55c6a709 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,6 +159,9 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
+/* Machine Counter Setup */
+#define CSR_MCOUNTINHIBIT   0x320
+
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2bf0a97196..e144ce7135 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
+    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
+                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


