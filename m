Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8p-0008Fg-2l
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8c-0007wT-Br; Fri, 22 Oct 2021 14:19:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8a-0004qx-L5; Fri, 22 Oct 2021 14:19:30 -0400
Received: by mail-ed1-x533.google.com with SMTP id g8so4386377edb.12;
 Fri, 22 Oct 2021 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmdFiYK0DkTfBOXHFFLupMEByC42b7l7VOV72X85buU=;
 b=hVv0R/wSZBr91rovIxESMU2yEhPGF6sSSEp/g5fcPSz8VJ7vrwZ9+q/Q4VRXncm+4F
 r2lnNqEZmu2BV5OFenkryGPa1uNdmKyrTWr+wUHQMN0K/DijESZpc61dd4hKAZj0N3Ys
 bE6sKzQqr+GPurqshNDb4DywBw64U5ZAuj2Mb/X/IlzYJPyvs45T7SrZMpIYrw2XtZG6
 Oo2eIpcURNtHVBHhzkNnQEMCBt7YHSOTb4XkgHOZdh9qWbghfK8Xf40Ucppa3Nfx27uD
 kn8hZUoxsQJ8nAh2n3hT1l4Y01H4UIwRxUqqvpYBExuVwmMfaSFkE1eFX6Q9W8/3V4Zq
 hFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmdFiYK0DkTfBOXHFFLupMEByC42b7l7VOV72X85buU=;
 b=SL6byhs61lUI210kTUxwX2UlNv9HMP8ftd/zl3/Uuj6wEQBrZ4f/Z7drBJlTIoMfhx
 Rjpi1nTH48z3pBbwkjln1f7ZNT/dW1wAxsw9Csv3rWfEMYoXQNKZEmKjwUCYYufbz4DP
 wH0zRFz9PK9VUFeg3DmYjrl+CFGQFlOzBx2umLw7sf4y+leFYMI95KmMGb6WxlsaVW6l
 ugOEZMgcfEjAr203g5iJa2VXj4wI4EVhioshXEeL87FwEDRE1WnkypprLJSKfnpIZZoq
 sB/4BBp78xXvx1h5gckBfgfBFtG6yMV7SytjqmmEvy5Veb7aF8Tgj7yn8v9mBoZSqaNX
 2HWw==
X-Gm-Message-State: AOAM533ZDVs2jUGjtHXqXgiPwd0m4DxrJt4ozOzjPUtACk3LVbAQDDNk
 Qp2A+HC2pjCjKvgoz3peSi8=
X-Google-Smtp-Source: ABdhPJzc5g8xXFnKDS/kZLXOAZYZ81GgyY0xhvY6T9p855riuO2DJyUUXiQUlQI3NcuCwpaDQWYe3A==
X-Received: by 2002:a17:907:2d28:: with SMTP id
 gs40mr1378182ejc.203.1634926766014; 
 Fri, 22 Oct 2021 11:19:26 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:25 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v16 5/8] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Fri, 22 Oct 2021 21:19:07 +0300
Message-Id: <20211022181910.1999197-6-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:32 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b767a4a0b..16fac64806 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -271,6 +271,13 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             CSR_MSCRATCH,
             CSR_SSCRATCH,
             CSR_SATP,
+            CSR_MMTE,
+            CSR_UPMBASE,
+            CSR_UPMMASK,
+            CSR_SPMBASE,
+            CSR_SPMMASK,
+            CSR_MPMBASE,
+            CSR_MPMMASK,
         };
 
         for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
-- 
2.30.2


