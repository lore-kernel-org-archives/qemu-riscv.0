Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxlNN-0001C5-BU
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 02:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxlNL-000189-Ap
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 02:03:39 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:53792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxlNI-000072-Ll
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 02:03:39 -0400
Received: by mail-pj1-x1041.google.com with SMTP id a9so1042370pjd.3
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2020 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=ZveiFXnGGfwuMEqze683QWrrihD7hap5N9cQArXmZnu5RKnzCPKDYEM1qoJBRO03qh
 sCBJ8bYCl+Gc+nD3FG4pU865eWThsCQMNI+GcFasCxy/UWraGn1l2wp/N0zALvfaDGqp
 lGxDAUZQFs7O9B+tIPaJiEPNeTyB+Hgz9POjt7gHwPZMMgRlnuRoBEdKnu83lR8bUWbN
 LKQcjRiPsZpmxfxScAsbRM/uZvgD4YR5VsIH8qjUL+82WBnpZSCklmI7dxuKxPsk/3hq
 xZoU0knI+a4AaNNloxBfeUxUkClGoaWT+QXz93PKmTG0P9b0xmXX+FwJjXsLZgTprMQc
 9jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=B1eiHgAzr7FdHliYg46D26/QFBvjUfmszuMcYyyWwHGvMh4eazKNi3v+6De98hiUWj
 rGG22yJjlSlWM5NYOAVtOreKRwuwcYJVlhAbtuOfIo0bMogbxgSdDXO9lINq73VnZZtD
 v5qDM00uW/TfUgC1FAwGZs35mJfUkuOi/kicGfYLUnFszKdV7uvM7JDUTw6NVXWLAkoA
 +9TbI+uADMOCS4/lRDXIzL8yplkWCFyqqOqhcuIt6Pb4MMZ2LBjd2pNTD3lhuPhjcksm
 +3uxaovc5c/oFTiqCRyMOiGZKsUbhMFmTTZu1U+tmSJjHae5PY7/rzpBkBX9YXBQarci
 eY9Q==
X-Gm-Message-State: AOAM531GqV2Rmb6BdCsUOQICL/YnSpuI0fF1veBfo1nVV502S9Ryhzua
 VfWM20Efr5K/ES+HCmgLCfwDNA==
X-Google-Smtp-Source: ABdhPJw5b8KePeOgoztRJSbqNf7UTTR4gFONFHE23ja3RIQgIEiu1nwzZHMEDrpNdmCzXbXtRITchA==
X-Received: by 2002:a17:902:eb52:: with SMTP id
 i18mr19900852pli.298.1595311415401; 
 Mon, 20 Jul 2020 23:03:35 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 66sm19724068pfa.92.2020.07.20.23.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:03:35 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 1/2] target/riscv: Fix the range of pmpcfg of CSR funcion
 table
Date: Tue, 21 Jul 2020 14:03:27 +0800
Message-Id: <eae49e9252c9596e4f3bdb471772f79235141a87.1595311277.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595311277.git.zong.li@sifive.com>
References: <cover.1595311277.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=zong.li@sifive.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 21 Jul 2020 06:03:39 -0000

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


