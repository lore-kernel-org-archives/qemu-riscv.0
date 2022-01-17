Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S88-00025t-2b
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5q-0001TF-QK
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:44 -0500
Received: from [2607:f8b0:4864:20::102e] (port=53798
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5a-000159-Vo
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:42 -0500
Received: by mail-pj1-x102e.google.com with SMTP id m13so20544209pji.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=20K4RdXoe3H4bZAsI9EGd1rCghLs9x2ucpo40UARMzM=;
 b=ghUAMdOA/0pE2NYnL2+8OzHTHJepEU3gTZe63Bj8CB/nR0/YRIjCHr1OqOcmVNlkMX
 Pr/fcSRn91nas7Ovys2gcsfxaJ0lOLNVZUMRJWZ3HAN7cZvvn3sIJWuP3WCfhYWHLfbt
 rvH6E5g/8myCrqIXQ+eAL/3JNMjXJPBtAwdnVmLiR/m3WgnnHAlxbFtRnGLUYTZaWm7l
 0Q+t41hjlpeFknqGNEo/JBpkZ001qX7uXk5YsW22eh0HyjDxXeypSej8mTuR2yFCLRz9
 Bbu9dwry6ZQFLo+9hMWsf3nwrcegQ86tlKkG+MNxqRtRjQYSNmyXbsP+VgYfVmyCM41L
 3ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=20K4RdXoe3H4bZAsI9EGd1rCghLs9x2ucpo40UARMzM=;
 b=5Cu7gNiAQfdY9xAYqZYDOQyZuLjTozTdjoi+HDMGaqci8atFaywR7DJcNzGSqugWN1
 W+HCLzRo8/OFJnd9N242JOQVTj3ZXmYfC6wt9D2Dbhqo66JmSNRlm7favUoKN36pCPG/
 Do+IXKYXYirFiv5xRdiZfMxdl92mH7XE6Sq2WLj9eb12kmKY2d9Rxzy+/y08grStOKme
 QJkQyF0/KQv8EVyY15jUgqtnvbMjvUREZ24ogfKISweoVcyNHFEcGR58DcJeDDAgXfr7
 ovC0chQn0a0s2LBLTcwc5eHqnz/fkpfHjmGihm6sjk1F2eFbh/Qx1aYU1onuhmCvxLME
 oXoA==
X-Gm-Message-State: AOAM533uDAZAi6/ysDY9rfzJoca78FF5P520v/tA7MzTFt40Var/cjHR
 Hk0YkIml5biuyNNxJZ5XmrVpdw==
X-Google-Smtp-Source: ABdhPJwz4kZe+SG1tT3NAjCuWhAiYov9H1tJqllduBKd8fGiNOcPNPoDFMAtAoz+clI35/WOTAWKvQ==
X-Received: by 2002:a17:90a:2e85:: with SMTP id
 r5mr18002613pjd.149.1642426224846; 
 Mon, 17 Jan 2022 05:30:24 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:23 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Mon, 17 Jan 2022 18:58:20 +0530
Message-Id: <20220117132826.426418-18-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:48 -0000

From: Anup Patel <anup.patel@wdc.com>

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 167d86eef7..26b2ced8a6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -488,6 +488,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -719,6 +723,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7b4cf19350..3df52cbc22 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -374,6 +374,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


