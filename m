Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jytgr-00031n-FV
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jul 2020 05:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgp-0002yW-Kg
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:27 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jytgn-0003qr-Fj
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2020 05:08:27 -0400
Received: by mail-pg1-x542.google.com with SMTP id t6so4899893pgq.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2020 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=NEuAo0+FPdLDYXnqNg2JpoCkCtxOHsPVUUinDR/thsTlX5v2qoEUMqOPeTExwFGJxw
 XxfgSBGBvcWjjgA6P7U8MRkZIke9QHs+9+jNXUdC09WOe/MKOFgLJVCBaP5cz4OhNZsx
 9+dAlJ4BYtpMQajUFi7Ht5L1SHAxTyL6veI/gDb7FPSXrOuzCBI2sYWzPtMsWd6fsUo7
 Vl8curui8/4MBqDqtJTO4kFqnHZdUUR8P2Cuu+yp+Fv82tHzlYB5L6G3Z1VSrLOdehis
 loQ6+3iQgXSJjtcNvL15UodQyMrNrYVRxZPxVpsXYyAoLZYKFI1Z7aoQv11wDpoEjfM2
 FyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=C3SOavnYRn5ob8WZbOHKAKX2QYIyxbq1AbHZORWWol9KsRz1WhZcC29w+4SEzsdoTJ
 1+cNLr1Y0ksu3j/gnOLNUnT8chMzab0uK1FK8xiVG22lxO7HRLcDEvQjR1vOJOgwfIwp
 ifk+XDw40ZvVPVPciQnY3/JXYUf939UGMc+YcOLon8fQuP/ksr00n38R+iZDkHWqMpsj
 b8Tey8f91AJVBGOaHTmoBjqeJSQiIY2+6xfNc0VZwa0eER1UMZykEbA4fiMNH8FFRyBY
 UI37XsxKwKnVEGdb5Vcv2ijBtlm9ZsVPMRav1ms8tEi+jlQG/ii3gExl/U4ouTWUC6jD
 b/Vw==
X-Gm-Message-State: AOAM531Y2aLOz9v5L/guwTqAYt1U/AA32mk5UnWKssV26UtaHTbjVEHF
 Nvjy11bV4Ez4unFBa1XOxNj/Zg==
X-Google-Smtp-Source: ABdhPJyWoUlFygsaKpwg+z2Gkym6Ac9gM4lNkND+/hYhFE/ORlNbu9SXFBatzp1DJEA/YGI+AnICXQ==
X-Received: by 2002:a05:6a00:228e:: with SMTP id
 f14mr5789407pfe.122.1595581704218; 
 Fri, 24 Jul 2020 02:08:24 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id z10sm5751282pfr.90.2020.07.24.02.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:08:23 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 1/4] target/riscv: Fix the range of pmpcfg of CSR funcion
 table
Date: Fri, 24 Jul 2020 17:08:14 +0800
Message-Id: <eae49e9252c9596e4f3bdb471772f79235141a87.1595581140.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595581140.git.zong.li@sifive.com>
References: <cover.1595581140.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=zong.li@sifive.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jul 2020 09:08:27 -0000

The range of Physical Memory Protection should be from CSR_PMPCFG0
to CSR_PMPCFG3, not to CSR_PMPADDR9.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ac01c835e1..6a96a01b1c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1353,7 +1353,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST] =              { hmode,   read_mtinst,      write_mtinst     },
 
     /* Physical Memory Protection */
-    [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
+    [CSR_PMPCFG0  ... CSR_PMPCFG3]   = { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
 
     /* Performance Counters */
-- 
2.27.0


