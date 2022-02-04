Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2i6-00079Y-A6
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:49:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2i1-00072d-Sy
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:49:21 -0500
Received: from [2a00:1450:4864:20::429] (port=43842
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hx-0004Ct-G9
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:49:21 -0500
Received: by mail-wr1-x429.google.com with SMTP id r19so1937189wrg.10
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=NTPiogaiwpNiS/2m8oSA5CBLSFEQLDunFyuHEkbjEvwU2iHb0gbVol80kzO+7NR9a1
 oSSrp0QLkhBfIqlGCRrl9zM+3w2PHiAtjAesjVZCRywKxt2DF6pvTBHLQ2yTY3XI5DLL
 POfsD8p/QG6axinZBKvY4IjVP8LaG9roV+zcRuybnTt9VFSvaBsYcwKlohsd9baWlILo
 Xp0WybuIggeZZ2FZLz47zrEMqy8U4bR072FEf1Q7gjX24uuHi41WQMUnCHlhxWk3e1dW
 0aq5aQv3cdJHAoqbIM14UIhJpHRj+Btrv8NF26lOE1PgcNf069QgdXI2zRC2TZHq1BqQ
 UkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEJf89SevVQot2Hj3ZJkC4AKQIDCORDOul1GSl8azAo=;
 b=LDCpbFcgIyS4Vso4XGptmdH61QEIc15A5IQVpZ37x3n/hQ2X6Np20M8vgqXMNl0V+G
 rsX1CPsgV37J2hRUf5BAATL9antClPD0R0doz9vgePBE0tHnAVUdxizjPdsHPtAJJqg5
 AFEDlsPqi4BSYcPt030LTmd/OE4Fckbu6ZZAYfNMWjW6f64MC1y5S4B1oIGLwwb1W6j1
 enqRVh2kROcg3c6ZyJxY5KI80HiO3kw5qHW7uU1r3YlXEYluae/YO5kcE9Xt8DrkV1kK
 x0a7G3JTewHTCSLci5+/KWx0PXPHIGc4eOtESFL8t2v8wad4egvsecRxuqxui5zTlJJZ
 spuw==
X-Gm-Message-State: AOAM530neLjDBGkTxmzz9JEBJ/mnWmpc/7I4hooMqBkhS533ZvdvUtci
 8nmjCeCXhxPaRQAHomxjhJfYbg==
X-Google-Smtp-Source: ABdhPJyLayT6ba46SreIchBkTYWlJnqu+oz15I43g3AKINe0DNAfVa7lnGecvv4+RV+KFt7ww9ZDRA==
X-Received: by 2002:a5d:4943:: with SMTP id r3mr31848wrs.130.1643996956171;
 Fri, 04 Feb 2022 09:49:16 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:49:15 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v9 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Fri,  4 Feb 2022 23:16:58 +0530
Message-Id: <20220204174700.534953-23-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:49:22 -0000

From: Anup Patel <anup.patel@wdc.com>

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1


