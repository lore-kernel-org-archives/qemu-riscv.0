Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liNlj-000554-Hx
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 16:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNlg-00054U-Gb; Sun, 16 May 2021 16:53:44 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNlf-0002RU-3q; Sun, 16 May 2021 16:53:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z17so4336871wrq.7;
 Sun, 16 May 2021 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CcgMbjFJSFPVhvSIhhYUtYHJ8K4LvFQPTieH0KVpcWs=;
 b=DUeg1pXir4GU95uADMPIrteJxRx3lvrpEBaUmQ9STwKodH4PasOL8Hj5HgMpLThrqf
 WdOBkZbnXhC5islHzUTs1t3Rr/phLS+tFfoNnzbqFetD9PTIXEMh3/NcnHpptCCmGYqU
 TSpitLnaPpZT7a4qEmDq5Y9KHsB71A1MsdGp/jDZT1RvAJBs2xBnvdTht5x8ccm5pf30
 r3JhOb1Ts/F8citEqdAt0Qk+I7gmyE+HY7rhdfJ3UvnWfsD+GuGqJtdBjOhw6vBBQOwp
 GAwnkBNtvcAV0yosjn/IRftacVQH557BSIt4qJ9YA67fXfvA9w6MfJEeH8jHAOe47nj7
 oUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CcgMbjFJSFPVhvSIhhYUtYHJ8K4LvFQPTieH0KVpcWs=;
 b=lieqACVK+05b+Qqep1H47sCB8x1IXwie9onT1qXpgM07baIpHC4X11ujrbyj1ouw7g
 NKtbw4qLWMdvwLygubCgtDnL82X3bQzVAq06TZDop5Nco7DcHe+4j1Og0U2yPITKkZ58
 CXpFrFuIEKP6G8gZ4J4r4YtCUVlr+yrcJI4GVKR1IRDCgRnx45cb0yuSXZKm9GR9SIHk
 HUD+qx2bmlId9zz4yxLmtNf8HxRUM/dl7SuVrXZrLZNIWlJDjXcBvJTxNOUNZOIKknYN
 t7lYejhyxVKedMZeixPaWcZl4fVBkVOz66yiDFdc8dY3TxariajVxC66BEo6cukBAPS2
 HbYA==
X-Gm-Message-State: AOAM531HIDirhn85PrHPIZYa8h/GYRxSPJg8j9Eevfo5geFBXg/IhK64
 Ai+H7dL0S1skBffARK/kuemehxzRL3q4TQ==
X-Google-Smtp-Source: ABdhPJydZuRsYCWRl9FKSbjFICgevFr3V9R/XryZ0UNR8ogEnRdcraRzvx5NNVqbX7B88DH9237rqw==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr37804728wrs.360.1621198416177; 
 Sun, 16 May 2021 13:53:36 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v21sm18014666wml.5.2021.05.16.13.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 13:53:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 qemu-trivial@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] target/riscv: Do not include 'pmp.h' in user emulation
Date: Sun, 16 May 2021 22:53:33 +0200
Message-Id: <20210516205333.696094-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 16 May 2021 20:53:45 -0000

Physical Memory Protection is a system feature.
Avoid polluting the user-mode emulation by its definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7e879fb9ca5..0619b491a42 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -97,7 +97,9 @@ enum {
 
 typedef struct CPURISCVState CPURISCVState;
 
+#if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
+#endif
 
 #define RV_VLEN_MAX 256
 
-- 
2.26.3


