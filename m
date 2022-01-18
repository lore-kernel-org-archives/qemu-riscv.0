Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9db4-00012W-5C
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:47:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dal-0000uF-IW
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:47:23 -0500
Received: from [2607:f8b0:4864:20::62b] (port=42946
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9daO-0007eT-0m
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:47:14 -0500
Received: by mail-pl1-x62b.google.com with SMTP id t18so22952260plg.9
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuND1ULQJ+/TaSqlnYNx8EL683pCF87FYDnAtdJNACU=;
 b=cU7ElmE8svPbDLciy9g/5DfyZ1CwYCnRg4InNDX5gfmwTCwV3INa4GL7CAIuO1x3dl
 kexCSU0E7+wO4xv59jqT2GO9N36pt0puSrJ3sUphZH4WaFCWfFWv+pi//9wlknzUTkQW
 ZdfIp9YX27U9i9lLQxOTiYcuOan/Istxvf2KwJZrinK+iERcZeERDXc51d7ZX41exMo6
 LP/8kS6w1MMuFerbtwnq08xHOSFRU0sh+BWepebDVqQCMRtKLWTJnPTLfZPTjnng0XKA
 vPq5e/ySSKCoUpmu65QJRHd7wWxac891Dnru4CbekELQgjYViS3+q9dsojSICRWbuYhg
 Nhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuND1ULQJ+/TaSqlnYNx8EL683pCF87FYDnAtdJNACU=;
 b=CgQxSgN4SgWWNOrqPWRap/7mxTuMvzjCotPtZkLPzcsz02DlErIVfth3HvrSYAIway
 ItSooFvx2xe4AcBQM0oNydrDJpTUa5LZU0P4vnf7U+5fvFqxxmxlgkw1HvHXFjPYnawB
 0YIrqmkaxSkw1U0VOmrbFEKcqM3SXB0S7CaQfjcBvAuDA+ENxRuf04mWU6/N1gyPwbWm
 geuBIwRCDKfXcaoo3hnjHwmnn4PlYJBzQUmZNa9cmH7ZgtiECQiz6pbCs5SquDL5nRLC
 aFSAKgcAzRs/6w3bXeFg1etX53pbwKwl69Cj/EVjnU1pPaMfGoJRpV6YQ6ZYQcX/C/rl
 3wbA==
X-Gm-Message-State: AOAM532op4SDZdXIjpP7APQ4Fbm1YpbYepGA05QeY+HbaqTewL9yBHsZ
 SmwvGrV/YPHu11zewrvQ2f9o5g==
X-Google-Smtp-Source: ABdhPJxbhFkCA/4uEa4T4W+Hlta92zKRzYngFc5q8xieCmYxNFxWjJ9L/XsPMBK+C2THMLGzvTCWaw==
X-Received: by 2002:a17:90a:d3c8:: with SMTP id
 d8mr27902572pjw.189.1642470383916; 
 Mon, 17 Jan 2022 17:46:23 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 17/17] target/riscv: rvv-1.0: Allow Zve32f extension to be
 turned on
Date: Tue, 18 Jan 2022 09:45:20 +0800
Message-Id: <20220118014522.13613-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:47:24 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0898954c02..33c1df638b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -664,6 +664,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-- 
2.31.1


