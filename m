Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfq-0007Yh-CY
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfm-0007Rw-49; Tue, 04 Jan 2022 22:09:10 -0500
Received: from [2607:f8b0:4864:20::102d] (port=36702
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfj-0001yc-Dg; Tue, 04 Jan 2022 22:09:08 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so1991297pjd.1; 
 Tue, 04 Jan 2022 19:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/ygyRMNJMWmW6pplUlmSEGaxLR4xXddaaBSAJ8IHoQ=;
 b=lAlXrvI6IMGsuuar9+ayPkm93nIyR8UwEPNO1yzVI+vbkB6iOi11phCjdJHt7x63w5
 p659oRvusXA3SJ702M2Q75zbPRHjGgOj7Fd43qbQSO/jtCmaa1HdfrrKMZUAZ+Rz5ksg
 uv33Z8guToVNhJTyXKu3PBqSQ7qZ4o9fxJmMuFuKlgN1kuyml9a5YtVx9Ige92Iaxa0b
 0oLsEWT6kZwRv40Nr33VbeZfflKcCRPnMwobJsHYEtBT4tGYogXRYPnkVrGTN5LV696V
 WB+m3Rz44icY0qbTN9J+iU1m8vNr5wYZNBHruU46j3hCWIt17/4p1CFX6gZSCsTtYOQj
 zoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/ygyRMNJMWmW6pplUlmSEGaxLR4xXddaaBSAJ8IHoQ=;
 b=J/5GHtGLBjU3oWfxcwFdCkK5KgEr/znYA2Lerbw92XqQ5VUxee2s7EMqKMQLwkKGz5
 rBm+JYZE28GLKIpWV+YS/D+ygcy8vg39soODgrNeHhmMAuUL3RGIUegYpfHYTcJihx7i
 xHtITmPbGyG6q6RhUOW9l+eDs8AOAdKI+UeB9dVR/bWla2nqE+K4jmGyalfj953Y41yT
 0ybAJF0ORpWHwg/YD73WVhGlEtYVRxdQe+TOmN+Uf2zkEgyBUOWZ1e1UAXpZm9G9LIGT
 39OuS+Zf1oE+bbVGqBWBGrovBniE1DtXvFUomkVu8Z4Rz+rm40a2RGzjrBofli4jNSBD
 Xo8w==
X-Gm-Message-State: AOAM532BL5bHG0hLXgI26M9RzwQclL0MOSrjXal/wFPhn5jf0y1//Rgz
 ULbZKrORk+rRwMKits0u/iHm+BLhbtyU3A==
X-Google-Smtp-Source: ABdhPJxsWh1si0Dkg+eUY2pwgGi9coKiwYuWSOzU2OC51ut1K9SniCRH8tCILGAx6iZvYdhpKcGQ2Q==
X-Received: by 2002:a17:90b:194b:: with SMTP id
 nk11mr1785896pjb.20.1641352145702; 
 Tue, 04 Jan 2022 19:09:05 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:09:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [RESEND PATCH v3 6/7] target/riscv: cpu: Enable native debug feature
Date: Wed,  5 Jan 2022 11:08:43 +0800
Message-Id: <20220105030844.780642-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030844.780642-1-bmeng.cn@gmail.com>
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 05 Jan 2022 03:09:12 -0000

From: Bin Meng <bin.meng@windriver.com>

Turn on native debug feature by default for all CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- enable debug feature by default for all CPUs

 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 17dcc3c14f..17444b458f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,7 +644,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


