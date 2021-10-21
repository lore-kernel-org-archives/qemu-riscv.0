Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxl-0001XE-CE
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxd-0001Rn-Kt
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxX-0007ck-F2
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id w17so780963plg.9
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFIu9ksmqGjnPtSH1nFVEeQDT90cCsP0i9b8ZOKBwe0=;
 b=D5vH8/uAoEvOs7mQ5kQSMF9z1zlp4BNca08E4FNrh/vswhS9jAA3W9ghzLWwn+VsAv
 BY1j7McdBKEfNn6x19bFwbUsFFW+fAOdrljhyxPn3EuNOh8n1zUJw7v9ewF2N/VhqXHy
 q2BmP6afjVgpif0SD2+5WqlK9bwHOBJFIIr1OkckSuE4pmC+fMdpZ6jK/7XCGbdlr95w
 ff4vpQ5nJu5duFaz4MQiBxYcMcZp/99HGUaxoAnk1tR/SBZM/KpcMJoPD4ATSnC6KMtd
 2zvmB0Lu1HwccKaccmJPWuCFa88XY5AjfbYD0Uf1AzksWfkrLBivH0jDtsAuZSCw72CE
 K9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFIu9ksmqGjnPtSH1nFVEeQDT90cCsP0i9b8ZOKBwe0=;
 b=uIoTcaYSpffgrvKu34ivEEd3fPOeWWLIy0u+bC8Ccdg5j8la3/pg7ABZgJNS2rYaZl
 4q/Dz2K7tWITTEVfj+eMMaE/xM3SxENIG7Pu2mpSqATTwDeMZUyAiq+tS+GZpGFzbMmt
 3Wtb1hTV132AeYUjxm1wxMLojoSiaFvfnexhWLl9hqioRPIiRLzTrtCcIsrN7HlW1PtR
 HI6Jp6WI+8eXHF0ka8axM3QILIIZpjVAoZlCOD/YS57rSsuk1rGHtCVLdjpinbCc/KSC
 XRuQb3FkaVdIVxpuuWd1V7+zOID8Dt4flr+wZJBA76mOj4kkL4zepTrmxNSR1Vc8sNJI
 XEcg==
X-Gm-Message-State: AOAM531gDVppYDv6cUnVYRkjyEyYW3pG/zGM3j4EQw8Pwk/lggKioyaq
 on/FFOhmSAhvmCIZJNRe7oxGD/ZxzTUnvw==
X-Google-Smtp-Source: ABdhPJxGG4OM/rvC4Zk1tnrmKXYs04cQeol4JLv0HXgcSQNUezneFEajZUPgCQwKgmugtACoDs/FZg==
X-Received: by 2002:a17:90b:4f90:: with SMTP id
 qe16mr7991573pjb.137.1634833824064; 
 Thu, 21 Oct 2021 09:30:24 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 6/8] target/riscv: zfh: add Zfh cpu property
Date: Fri, 22 Oct 2021 00:29:52 +0800
Message-Id: <20211021162956.2772656-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 788fa0b11c0..1b3a7784b06 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -617,6 +617,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.25.1


