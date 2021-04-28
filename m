Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbbf7-00014h-3s
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 00:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf5-00012q-V5; Wed, 28 Apr 2021 00:18:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbbf3-00062h-Sg; Wed, 28 Apr 2021 00:18:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id z5so36022883edr.11;
 Tue, 27 Apr 2021 21:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5NCSBeXLLnQxRcsQBmTOFrJe1uMeKwEpgQvj+fl82v4=;
 b=O2lKWLCtJpACgzkwTo3B1c2o2Lesu5eQdecF3hX263asy9PeIXm/UGKWE5sqLQsV3h
 UZMjA79B8g57OYaXQz8NkVmCsvQW4VfrN9wPonfDT4XxjuSq3JzJcazZ/WUPlBf5ao+J
 FBfsuSZKdFM7+c1HxwgGXDyn7YjAarh/y9YeJq++Znv5TQSnxfpip2bQ2YlW31lejaa/
 310fVGf4OrpG2d19LoH7DKrdLm0FizEwxv2iFuwkjhuHD5zkIAC2ZGUlQiWF2YrM6CF2
 XTWTroLHS9s71oWtlAzLxEp+2LwXaOZLm8nrSOrPlN4YuWlCmKRfkbSEcPUEU/HVBwuJ
 vYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5NCSBeXLLnQxRcsQBmTOFrJe1uMeKwEpgQvj+fl82v4=;
 b=Pxcdp5Cfv3FkpuM5dmkL27gmtavna3L7sTFq1mb8rghVSDTWwHxXOGZx0iehUmBUDO
 zdIyMpIjDujHDGiRq2JyJYjKw7bWyu18jBhH+ibWQtfwWgl4CidZ/Ag3ZifXUxeLBhuU
 kzuC1Yx6S0Oq/nDP6pJFDxf371LFLFA375fR8ov0aO7bhPnYtORjW9SXZVKeq3Yej5on
 jJ6U0B50FKxQN04XRSbd5Q6jHIdpqgwCud38gpHNqShDPiaAKr5k0hQ6jrGXRNeH8s4v
 lmJamUhMTGE8cqny/8fTSSvn5XEAMWkeL+lpZg4yZY4d+KtTHzNoB694rpEh1ESI7EgV
 r+2w==
X-Gm-Message-State: AOAM531Qg3H+PcjwtWlzxHXzTeVjCrsS5M0Q8YpHgSauSV8hmAzE09pe
 3D37MAhREEPqdVtKCiEe+bw=
X-Google-Smtp-Source: ABdhPJx9bR1kT6t9B6JdPX36pjkxDLjUMpoH+dv60KaKPTe4Qs24bQfEkJ2VnASCvKsqpMIfdDfuNQ==
X-Received: by 2002:aa7:d14a:: with SMTP id r10mr8382283edo.385.1619583532087; 
 Tue, 27 Apr 2021 21:18:52 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id s20sm3759565edu.93.2021.04.27.21.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:18:51 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 1/6] [RISCV_PM] Add J-extension into RISC-V
Date: Wed, 28 Apr 2021 07:18:43 +0300
Message-Id: <20210428041848.12982-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
References: <20210428041848.12982-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x531.google.com
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
X-List-Received-Date: Wed, 28 Apr 2021 04:18:56 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..0ea9fc65c8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -291,6 +292,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


