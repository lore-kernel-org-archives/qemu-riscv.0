Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2Onj-0005X6-Il
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Oni-0005RU-AI
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:50 -0500
Received: from [2607:f8b0:4864:20::436] (port=40843
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Ong-0004hz-KK
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:49 -0500
Received: by mail-pf1-x436.google.com with SMTP id q3so13258730pfs.7
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/1SK78VzpiOsgr0EBerUPE1kdvcozJbIunlylc+UAk=;
 b=bCs+CeJbVHGEho0BUU7WG63NFsmGGn00dX3t9gtlAhXHE4Fa780nRISC3ahAYXQ54r
 Y2yoGCN4XOSXsgyd9wBOOJC6SCiOCD8sNhD3t3qH4uo/ft5LpPxHz3m7Qg+jWPaRWKgF
 zjvICLC1KA3btAzxffGJMSFELh5/sH5+bCYh6yPkHUiDsoYm3+lB6atGZ8B3DlEtBJXV
 dN8e59+cBzb3JoajbDD6EXjnPDi7fFtNMvXdlcXTVal1Fb5f94RBAyw+R30PbuMYYYW/
 AZqKWUu0E8STmKe++x0r5P8uraPxxhL9xi9bydvZBTjaeFqS7ip63+AvpUdicFXFlLHi
 gEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/1SK78VzpiOsgr0EBerUPE1kdvcozJbIunlylc+UAk=;
 b=WAQ6vUJ/+W9Kdd77Ry28GLLnLEylmT7T4mM9+f4wH2jYqXldJBKFZx8lYX6Sh0u6SO
 opyP54CyX8upL6WsHqJcODxEnz5ijU1U4pmxE0JEynzIc+7baurhn8dUrG8FMMhxqEQC
 7+CBOk7y4JUkE8PhLo+ex91Bx1J4oMGpVpAnvNRSLM5WuBAlEJD3LTWoJgV5c05o3Owf
 IPcg/M7wzdTNqmbkD4nmdDlcJ9NmziPU5T2TIu2qPWanf47vkKER/9QlTY5nauJtISeI
 LCS+9ABce1IXmdbcGpOANE0Dr0u9oVEdtVWW4Pt/d8i8Y1CVPyMALolh2pS+/PcUTcXk
 y37Q==
X-Gm-Message-State: AOAM531RCTt1DNt/3efp3V+PYGn38TgbLAI1VMB/OV3bSeesAuZ5111F
 M+KifmyxstGvW1C9L4M5smt38g==
X-Google-Smtp-Source: ABdhPJxE0ll9A/q8pfh+diU7JBk/vtbtZPvydJwfrY4yS5rUHb2uIZggWOI/uphw2ljKmjVoUWWmeA==
X-Received: by 2002:a65:6716:: with SMTP id u22mr21557056pgf.414.1640745287585; 
 Tue, 28 Dec 2021 18:34:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 17/17] target/riscv: rvv-1.0: Allow Zve32f extension to be
 turned on
Date: Wed, 29 Dec 2021 10:33:44 +0800
Message-Id: <20211229023348.12606-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:50 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5e98860a09..2b54c64f56 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,6 +636,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-- 
2.31.1


