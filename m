Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaZo-0003GA-Ez
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:44:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZm-00038K-Ga
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:18 -0500
Received: from [2607:f8b0:4864:20::42a] (port=33386
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZe-0007tc-CT
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id x5so7823121pfr.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y+mqJ4xL6tI5ARhPPr8pHokzQAPeVkBysEFPtPP0KrM=;
 b=NmV8oSqGA1oZbSGp+WVuZ09bOe/m5yO+G/kseCOAreGsIO8zUm9s12f9oCooy35p7l
 a6jyZxRHrwAD+HbC0zBksvOwcYwV00dB0VRiHTyfjoBUGbiQBUBQNJdwvudgBu0jDfOA
 N82LBiqRBivMoXMn6nbMYuVfzHvfBji4eimxbV8Qdz/WxC1y4uBsHoeobEXx677CQXJo
 Hb8meQLYHmQVhr732g9YU9sy/WZBFbBGbb+01yOuYp43LgiedbkXMWaJ6LZZByDGEXWC
 +tQCM3Ao6c5OD+kWxhwqk8nLx1WrvQpys/jrnQnGD3X531TNgZN4AvHUStxaxflTaOM4
 dNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y+mqJ4xL6tI5ARhPPr8pHokzQAPeVkBysEFPtPP0KrM=;
 b=KgwZZCHMhRFHki+/39iO1TIMv5tPk/Z2eUNZq9f8ZMzZNGP3ngU2Jn62AaEZcs+zER
 7c5gY6TQYix/wFZhOwK7iM3v9esHYfrTLF8xGkDkLAeGBonjL09I98npvW443lNoWQsB
 GdEAJBDxrtfu3dIwx8GmwoxSoDRFiqvudzyol9CT8ifVUD8k+Y3BwcYZtYuvv7zyO6Ej
 uRBOtbOSkUrrzUG6O/C9gv6ucJhZ+Ynlzn1M6F3bBgye0sIse84X61tahNwu9uLT4bBj
 hwqUGTAMz6Adc1OpGyqvKwrBRAu0bwfUxrNF4bctlahQc3a/t54OMQhcv3vIHc6eG9XM
 0eZQ==
X-Gm-Message-State: AOAM532JnuRthfUwV0y2YNjTLKdar4LUFnOP4tbrbve0cGKhJ1lq4VB+
 3XCckLbz9FZCmtCZjt2U4W3P0g==
X-Google-Smtp-Source: ABdhPJyLNeu4i5CphhcfZ8aQsixzrX4z8e8QUhT54+mLhbe+YwI2VssNfsF3dScZZHcyfx4oif7wdQ==
X-Received: by 2002:a63:42c4:: with SMTP id
 p187mr38270711pga.585.1639122249154; 
 Thu, 09 Dec 2021 23:44:09 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:44:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 8/8] target/riscv: zfh: add Zfhmin cpu property
Date: Fri, 10 Dec 2021 15:43:27 +0800
Message-Id: <20211210074329.5775-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 07:44:18 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0f808a5bee..9835829588 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,6 +630,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.31.1


