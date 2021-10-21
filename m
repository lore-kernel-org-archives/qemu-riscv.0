Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxl-0001YK-Nb
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxf-0001Sv-Er
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:36 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxc-0007iK-Nd
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:35 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so775579pgl.10
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBfQIN6Ydfkt3PTgqXoo621RfqewfUyk3imuXZV2vN8=;
 b=ZtbQC5aPeSgYZ5+lqjRI2bKnmkUcBc7Rcabp1NgEGZxFZ/lZtRYqhNJppkvrW2AmD/
 ZcfPRUKhl50faOTCCK/FlJQMlHW96VrzeFWUKRf/X/qBeqEac4ziOgyRK10EdLNqII2c
 V4MHr9u8bLUNTH6trgxo77Z/1JkObSwc9BTuJvb0VqFd4yqSkd0ZZ4XqTJ1WanKT9LpE
 /sXiu8huY2xQptIvydeD0/5mfX/QBdifC3zMBJ6mTXmRDyAnXmwj3FKsmzweRX48hNWN
 ZvK2raTw2Gp6nnmZEojrjdv5KavM/XA60pKt2+Ka2D7Ps6Xvkh1R82kH0iJ/4UXsnw4G
 3JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBfQIN6Ydfkt3PTgqXoo621RfqewfUyk3imuXZV2vN8=;
 b=MWj2tX6hgg1oaf2ZSrMXVRegmnnVUSFDceIHf+aaHKHJPKzf5YwC4grhqZNtstIMni
 itDZEas24a1Ps8s90atnIe7zTzZXsSn+HihOtiIf33IlhkvlRlg21q3hTzloOkq+9xM1
 slJulS1k8YQFnKCkvGoad9raJQHenBb8Hsi9eGMAaRcicNVSO5+tPCOw+XinvW+GoCff
 TSACTr864wbFMH+NKRybHZuKq//WEvxyfKh58qH/POnOk0sw/8c7VPqB82gTJ/5NckLz
 YXhOjvSXs5R2zF9JA79Yz/bxrHe+4SQfvaWwF6y9YZhuG17hkakFj1aCeWUD0WMWGi/s
 yZjg==
X-Gm-Message-State: AOAM530NiIdqEfGMCfZgZENLcHy/hwztz3cOXpObIP2ro0R5JRBIUMyF
 hJkKsJtkO4RTRKcyGgePMV8hOXxa7CgThg==
X-Google-Smtp-Source: ABdhPJxbpFFpEAWlzzUveIeh8kLn8P+5pFFs5KdUl19TWJK142JhQLjQCwszzdkKmqJNcRhPiaUvYQ==
X-Received: by 2002:a05:6a00:1901:b0:44b:e041:f07f with SMTP id
 y1-20020a056a00190100b0044be041f07fmr6520700pfi.52.1634833830910; 
 Thu, 21 Oct 2021 09:30:30 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 8/8] target/riscv: zfh: add Zfhmin cpu property
Date: Fri, 22 Oct 2021 00:29:54 +0800
Message-Id: <20211021162956.2772656-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1b3a7784b06..e6e3ef183ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -618,6 +618,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.25.1


