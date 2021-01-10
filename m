Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyfoE-0004q8-Eu
	for mharc-qemu-riscv@gnu.org; Sun, 10 Jan 2021 13:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoD-0004pv-FQ; Sun, 10 Jan 2021 13:51:25 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kyfoA-0006fg-6y; Sun, 10 Jan 2021 13:51:25 -0500
Received: by mail-lj1-x22f.google.com with SMTP id n8so1159372ljg.3;
 Sun, 10 Jan 2021 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLYCNaD1iAezRjF/bdaLD6qUBIumyCukv8S+0GP2ZGE=;
 b=iaRrQ4/AQG0F86VuYlIyuLNgHBAVP1XdIEZbHPOvT0kj4lB8ESt9x6W9l6VO0hhhyU
 Z7LjaBzSoQAAGPvlhtjXAOgi9XAINfhyN6c05clZSp/DChrtL8HXdL/Y41hWnDlYNDrm
 NdmqdV/io9iDGLzS2pa8ajv33Ye2CsWUBmt6iGCF7wOOz5+SZv+JXdcYUuwzAnLzOisE
 DQrn58fC02/MrfcaOzCLQqYjMh4A8KIPNNCz2980byNCeQvS59gVnVrO1//ddiGV5VGQ
 0nbiYBvM9Xp46pqUb1jdGER8jOlyCNZZSbpexP/9bwtYPSAX6ie9BuQU1QndtExKHiii
 Zfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLYCNaD1iAezRjF/bdaLD6qUBIumyCukv8S+0GP2ZGE=;
 b=tnw0Jg75lO/tJqs8aVrcpPMChwfs7mjQsPQJ5BSzZlqkAIwvPpWsn8BsqVIBVvLYRC
 TmFSY9otYAvjjq6p1D/Q7Hhc8FIXU/8A5AbprK4RBQk0M39m6dG2UTUw6SFrw/DhhJka
 qZq8F/42EP+wqz6IGtQaYhzAEBbz5o4q91oN3GWyWgJ2Xl4krTikhDFe2qEcTwoxLKHL
 i0W11LLFgRDXTnWzq9P8HXNibmhV476gyEIyjlQCU+3AJsFYPAZV3elyFnPsUPdO9YWs
 /KFW9VXy3/Td/TUt/fFAfr3Sah37WFBCUDrdNXJZrHcV1zrXR4LDf/MManE5jrX23/rt
 dwHg==
X-Gm-Message-State: AOAM530fnl8KxHu4kV1XEmZe2Cxax195HPOnF+DeYerh/ekLVNCdl10d
 73hj5dgUPEg6NKG/+tLVGcA=
X-Google-Smtp-Source: ABdhPJyRPvoqqzDldGlwd+DhUFTKCJTk16IVAnHX4pKV9UXjugxbDlI88++VbuRXVXeR6fyfkDiEzQ==
X-Received: by 2002:a2e:9988:: with SMTP id w8mr5565746lji.107.1610304679689; 
 Sun, 10 Jan 2021 10:51:19 -0800 (PST)
Received: from neptune.lab ([46.39.229.36])
 by smtp.googlemail.com with ESMTPSA id l1sm2795267lfk.201.2021.01.10.10.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 10:51:19 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 1/6] [RISCV_PM] Add J-extension into RISC-V
Date: Sun, 10 Jan 2021 21:51:04 +0300
Message-Id: <20210110185109.29841-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x22f.google.com
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
X-List-Received-Date: Sun, 10 Jan 2021 18:51:26 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6339e84819..d152842e37 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -285,6 +286,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


