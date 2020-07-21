Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxraC-0002FM-Pe
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 08:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxraA-0002AG-QB
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 08:41:18 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxra7-0004wf-Jz
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 08:41:18 -0400
Received: by mail-pg1-x542.google.com with SMTP id t6so11897726pgq.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2020 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIdF0vquCIpG/n6QZnNAQHeg090wZ/lgTGaZg/NW1wI=;
 b=cepgz+8yilbhFmGj40xKqjKM7OXxFQAT2rTNEB/C4L7fvb8wLRjR2igwQe6hrSosa2
 9syw88KsK9V0nwuZhHY8Wy/uuljKHXH6sHZEdjn4UChYQCLxluVxtB8mAriKHsP7RTeF
 n2edkCP7FQaX01o+MWD8z8NwUU+1MRY7KxY/wZfwRqEAoXUdcUHyB6BI74pUUdqYKZp/
 1lhYdmjva3+Zt+f1SqlLSlhuBWESLFc8Hnfwo/KAb4x3pAK50dQreykdQrjaGSPI+nTm
 jP4LgJ2TAlOh6QRvEnTzODgVdDalKVN9vKAEgK+nLQg9FQB8RRRpntC74cfYKuJC8c/7
 ld2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIdF0vquCIpG/n6QZnNAQHeg090wZ/lgTGaZg/NW1wI=;
 b=KZ1c/Gxl+LZTaWfqbO9pjM3O4svN4nHOl4R7aPV+KTEFFay87JYnpgoYHh4klr7RoA
 iaYvaFdYfEqTpjx4yfzekFQJSVMeF4OANDtXKPb+NIrxKtXI5sIcHRnqHcp4rhwqgQ+B
 oiRTzGok0GgH3ra80I2opWTSol5jDapH8TbK1C/OVJzmKcuS+BuqDhq0imRGkCVF+ao0
 uozWTQCo4PXW/EBy5N05jNaBjC3X8qA/55QB2l0YDUFub0Woj5AZBNlxHVnaSijzGNk1
 GpuPIl2Ts6dlWxmXec6G2jG+DUK+Y/Aq7P1hZTEwm6tZIRzybowywsCBedTOz0MFXdVv
 mOlQ==
X-Gm-Message-State: AOAM5326wYzge66KCgDoJDktqp458ofu+dnDOrvuwH5O9pAVzwj5Lnx4
 606NSuAQtKXcRnErNh70rQofvw==
X-Google-Smtp-Source: ABdhPJwdm57aCXGpHJ1e2KvyR7NwtS3trU/bzlpXiAOztSYCiNUe77WDclTrpA0MYVnzTjMKAQ0KAA==
X-Received: by 2002:a63:6cd:: with SMTP id 196mr22427506pgg.169.1595335274346; 
 Tue, 21 Jul 2020 05:41:14 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y20sm19819991pfo.170.2020.07.21.05.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:41:14 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 2/3] target/riscv/pmp.c: Fix the index offset on RV64
Date: Tue, 21 Jul 2020 20:40:51 +0800
Message-Id: <80450819119ba8493f18c825517f1b4f37eeb600.1595335112.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595335112.git.zong.li@sifive.com>
References: <cover.1595335112.git.zong.li@sifive.com>
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
X-List-Received-Date: Tue, 21 Jul 2020 12:41:19 -0000

On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
implementation, the second parameter of pmp_write_cfg is
"reg_index * sizeof(target_ulong)", and we get the the result
which is started from 16 if reg_index is 2, but we expect that
it should be started from 8. Separate the implementation for
RV32 and RV64 respectively.

Signed-off-by: Zong Li <zong.li@sifive.com>

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.
---
 target/riscv/pmp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2a2b9f5363..f2d50bace5 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -318,6 +318,10 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
         return;
     }
 
+#if defined(TARGET_RISCV64)
+    reg_index >>= 1;
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
         cfg_val = (val >> 8 * i)  & 0xff;
         pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
@@ -335,6 +339,10 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
     target_ulong cfg_val = 0;
     target_ulong val = 0;
 
+#if defined(TARGET_RISCV64)
+    reg_index >>= 1;
+#endif
+
     for (i = 0; i < sizeof(target_ulong); i++) {
         val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
         cfg_val |= (val << (i * 8));
-- 
2.27.0


