Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B65C3ABCB
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 May 2025 04:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uF3T0-0001xY-4v; Wed, 14 May 2025 00:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uF3Sy-0001rg-QJ
 for qemu-riscv@nongnu.org; Wed, 14 May 2025 00:11:36 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1uF3Sw-0001j3-Q5
 for qemu-riscv@nongnu.org; Wed, 14 May 2025 00:11:36 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-af51596da56so5589107a12.0
 for <qemu-riscv@nongnu.org>; Tue, 13 May 2025 21:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747195892; x=1747800692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wN3YlUiAm/cXhzU0srk9qkT9z264xyyEyveTz+GbTJA=;
 b=CETmJwY2RgAGAbDjAKdepNgdhzbktvFBOGlxASfjL4uNDa+g52VFdbBh7uGTIMBoX6
 4OjTYpJ3E7l7AZPCzdevamSnePQWqI1MajEA+JqZQnjTBYh45Gxtq41xIgQzC69L6yEe
 jMubDMuvz8hs15DV+/hSI9xoOp3HWwspBjXpbq8U9v5KN/qCzrrecHeId6RuKfAy9Tv7
 QMQsBeF+inloCbR3+LMVH+lxUrMPKEPwmI34sZVc2ItrQrDmND++bdvtiSmad7wUpg55
 xSsxq4c/ocUYw5HAbORhtRKLQctsUCndR7v7J0LhrGRnEvIMr0ZPxi5Wy5vR9wZEANib
 gqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747195892; x=1747800692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wN3YlUiAm/cXhzU0srk9qkT9z264xyyEyveTz+GbTJA=;
 b=WTJxqzx/ax0OiozljnwQTKkwx26Vy+Kp8HTPMrnjxnlQTzulv/WDkGf1eMgXgDhBqb
 1xxZywHRFcOZvN68F2j0LCSIy5Tva0/4NjqDbvmeUcpPrtgFtat/kY0NYHbzHphdkEnh
 SG2dh2yl0V2KOHKB7Y4wOpuandePuOq9O1FXWzDIJMHKIs2W4urClD1QnIj7X7/YgQfD
 rKroO9qsi1Gb9BmUrBNs54r3d4aT5pulngs/yky8aiZwRLfBIgPBOvCWYRfOMt9VjPAH
 AXxFVQ/+QKw5+4/RmnsO/fvH2WohyiMrw7pwibel27frjJYaUxmh3/yKveBgdfSddQgr
 CvEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULV2Ck1CGVL/XOz1DbgfrJNTKYJy7v789cR7PnXnaomijbHYBr0aCAhXAPtOr/35yw6ltRwbBtdLSm@nongnu.org
X-Gm-Message-State: AOJu0YyqyE7GKVMLAFcQDzBZt3rRkrZDM11LZijjnJua4oCxVBYKdI2k
 PCKbdAKYJ6wTZZt/rQxtr0+i+pTqHDVBNnscSsP5Lo5DfzXxqpDV3QLTsZd/PDs=
X-Gm-Gg: ASbGnct3qkvzgKwpQ2X/hqP9RT0um4zh5BkGhuwEc8G4MEgImHHVx3YWBlgNpYT9xiz
 nYoKqVaYyuD1zA0HK3IzzsQ6Tr4K2XOUVMY3WvALTEsiZn0pJzoWC2l9tLq6jOurZ0XLz3aN2F3
 8ZRvLm3U9ILl24YlX0rZJYjkzXMxLKucHBi2noj2pNQMAc3qll/w2reWAkYf4bA2KA/0QIoLCE4
 Q3HMY1sQfc8rOJLWmdFAWLBJwNGk4fzX5RWmZ1yRKVLdcUy4KbB2iIthV1ABHpSrJ3xWdCG7lp4
 6CjYbz/2XeZvokrGo2ljQ+y3Dsxnszqx3tzUWvqlQlYXJHid7BXiSm3YUKa26cEXd1JBkpJzmxV
 fsqF5zvf1YVv4tw==
X-Google-Smtp-Source: AGHT+IEp8KcgB4TqXNlmrxHCZxS+26fan2NPyOUD68baPR7U3/AybFUsRdgXVTVVh4DEn98r4MtJHQ==
X-Received: by 2002:a17:90b:5148:b0:2fe:b937:2a51 with SMTP id
 98e67ed59e1d1-30e2e643b39mr3881160a91.33.1747195892562; 
 Tue, 13 May 2025 21:11:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e3354b633sm533552a91.49.2025.05.13.21.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 21:11:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Jim Shu <jim.shu@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 1/2] target/riscv: Add the implied rule for G extension
Date: Wed, 14 May 2025 12:11:17 +0800
Message-ID: <20250514041118.1614-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Jim Shu <jim.shu@sifive.com>

Add the missing implied rule from G to imafd_zicsr_zifencei.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d92874baa0..27edd5af62 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2520,6 +2520,18 @@ static RISCVCPUImpliedExtsRule RVV_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule RVG_IMPLIED = {
+    .is_misa = true,
+    .ext = RVG,
+    .implied_misa_exts = RVI | RVM | RVA | RVF | RVD,
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zicsr),
+        CPU_CFG_OFFSET(ext_zifencei),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZCB_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zcb),
     .implied_multi_exts = {
@@ -2898,7 +2910,7 @@ static RISCVCPUImpliedExtsRule SSCTR_IMPLIED = {
 
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
-    &RVM_IMPLIED, &RVV_IMPLIED, NULL
+    &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED, NULL
 };
 
 RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
-- 
2.49.0


