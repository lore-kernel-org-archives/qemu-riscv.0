Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8f-0007zJ-8V
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8Z-0007vZ-Gu; Fri, 22 Oct 2021 14:19:27 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8W-0004om-0d; Fri, 22 Oct 2021 14:19:27 -0400
Received: by mail-ed1-x536.google.com with SMTP id w19so4655356edd.2;
 Fri, 22 Oct 2021 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KIrYmD/+jqYxwxjugzy8laRQMng9maelmFxSGDOYKDM=;
 b=W/ivcNo0Ed6+Okf4sOeZIqeMCWrNiOvdpHhtH4V2Yv0+qWB8kNU9PPeY+7TOKtPpZd
 jNI6xTgZBldoZwpKYmMjY8YuHETaImis5u+oWgbWbvZOpoy6zgxXq3LSr9w+X3YwF4Wm
 fa8kc1buWQaK1iaPQiyX57H++GXb83/iH7hc6qO7YJXWHw5G5HQWBLBVCZIttXajV8dj
 1yQx/K2AEs+vZ0RLhqqBUfUoSAGM3QVZTd75+czQXg7OV+auNNzyqMVhrYKmvQ9jSLJv
 FmuEKvUF0SuUv7RrWDXhxMD6mXCgsTa0GCoSIKt2uXcriGXPNZQvn1aQ5MZBzLz8Zpth
 Ndgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KIrYmD/+jqYxwxjugzy8laRQMng9maelmFxSGDOYKDM=;
 b=qeSkdpfRVLrZc4AApNcugmVs8nR+TdsxdsuLXHEAS3A2sDdFncsfSEblRzQ4l3tviC
 zFKBEc9bVY64cD37eEA2Is4XF9S17hfvXWeS9qb7HWJWOWsZ7GJmytSWvSFnzEPxNyJp
 SydlRTRRDSA1XSVMxzLUFnYfFbLu2hTt03duZysk5zb4rWhpF5RbaI8UTsnqAyYZ5h5j
 uate3H+gVLv/V2LWZIUxPTkWc/CuclqdGQWLuGaCuH6vXTKAiJyGcZTMnthYpmEQLmue
 dsauIXyEDoUIlIwqM0YHWNQFeBw/ZLEMIeVkU/MsorS+2habDh/DYP5AoY7VrYzILUp7
 hzbg==
X-Gm-Message-State: AOAM532Ri8CMLi/8VsURqUWneva1q8gJ0NmB5JWxSuxehCdf7dPVSTxR
 beEi8joJLsS5VQNM8bDyRXQ=
X-Google-Smtp-Source: ABdhPJwAbIBvHr+vqgLP+oeJZpDGyZm8sUynj4SwZoUPTXUY+RnuOqx3RlrtCPhF0br0a4sweEHmAQ==
X-Received: by 2002:aa7:d792:: with SMTP id s18mr2057765edq.145.1634926761697; 
 Fri, 22 Oct 2021 11:19:21 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:21 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v16 1/8] [RISCV_PM] Add J-extension into RISC-V
Date: Fri, 22 Oct 2021 21:19:03 +0300
Message-Id: <20211022181910.1999197-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x536.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be8..1cfc6a53a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -65,6 +65,7 @@
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
         bool ext_zba;
         bool ext_zbb;
-- 
2.30.2


