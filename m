Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A2ACFA471
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 05:05:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vMJK6-0006DR-1v; Fri, 21 Nov 2025 00:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJo-00065x-NR
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:28 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJm-0006mD-6r
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:24 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-29516a36affso23057175ad.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 21:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763701461; x=1764306261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFjzAt3V16vj8pMOvPT4tfpSGw4vX8nwSrhUGNpwdlI=;
 b=Jfx78jdIoulaAcEqM76EmAp5xQLiGbyGQ8CXqBr1HYBjfdo0uw72uUyV8lgA68c6nS
 XdkDDiXSrgJD1skOBgsA7NE4WAnai5T8KsBhbBEf2Fd8qFTVPfZdxLEXwlLtWaGERi98
 6LuC9qVCum36x5qMXNvNqSMUzrD685f6PJGuCtfjkXjIaBHZAnKkAa0c3XACtxFdeVHs
 87tHB+kZn3MyfzsUnCq8MCWbf/N37eDrWwjrJ3yNX2NYFqaE/efFqDIxO5BgJgj4izSW
 9Yi1xvBDVS4NtpZ2LjvEfC1o1CT1bK3zlkWhi4knEdWiN36CzCdsCRhHF2l6cXbdnkqK
 dWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763701461; x=1764306261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pFjzAt3V16vj8pMOvPT4tfpSGw4vX8nwSrhUGNpwdlI=;
 b=DxOyA8KdbGkvssw8YZZ+qlDYyJvUzdFqnLR98CxGkF7tE1jN1ct18uqanTcmVIOZ21
 S1N5BYExqqB7yCLtDJ3xnKosPQdliC3XsqeCIl5xRxD9mXtJfEQGT9abePh3N/ByuyHW
 2S92ZwLC2ADeg6NbvDrD7Kddexf8pCT0V9obXnGkMZ0vZPXPpgIn/kdVdNILfYLCa6/8
 v74rlEBXCePUgw0vCn3SBQBJ9+DISLpLD90XiGqHlq/pniEp8TIei8B0zRzFkqimiIMz
 rwf4sLvA9N/1GNWSMw6ZVnYYV8uKDPtOA+KbOQsxtSHTIqE45cM1E3Lh9HwXPe0bjdBB
 j25A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw/CQsPmtIGaFcSlr4j2GQNER2jlmfM7t14JB3iOPmbIoXgMobZCzGe8culbHW1juGJz8aG07kZ/tP@nongnu.org
X-Gm-Message-State: AOJu0YwvhC0PIawWXmyk3iDp1oynNeHcW8IDxq7tcT2TZZbDiaXKr3Ci
 9Uoz/xNqdqNvsuZdV5xiFdUU9TAOPFVzt0eQRXD8ccB353EykVS7uaIoB1cfUAQywuI=
X-Gm-Gg: ASbGncsQGq8q8t0o9uJUMc2wAjvTGhX+HfUPZOZ6aHluJAMHDnQaWJz7Uc55ZyaAqVJ
 n6/XnUx8+iJtKIAZLlQxWRDP6665de3uCIp1jlQ1Pa6DYAB9728GOWqc9kRxbPb3WgDTwkPpvbc
 ogk9QKdxpbI2otj1Muj8RaivNpGHEQ39r7owL0nUd5+fB4ibzwKGgzemklOwB4T/VS1S+TnsT8q
 qHJYWd3BNEUvYAIHpiUcrFKc7bERRSLrkERffQBHKa7Cpk1p84hU5w000+uaEMR6oTLi29iBBNW
 BgZ4GMVqy7DQVBqrkz+xLRKrRWDcCORL49BrWepeAaqwGMNFnS3ug7ePPWEgpn8MoTjsosf6Y9u
 1sm0FkTGqFsXcJ7+rpfWz6ewwb4JQbPiaYfflu+TFzoSWEHrsb/fVXy40LSBv86kC8wY+IwgHA/
 r9Owroi57R7/QSJW2jh5EF2dqg13Uz6iwFh8l1IA==
X-Google-Smtp-Source: AGHT+IEU64lQHCK3R/6lKyXLvSyJmQakO6mbjALNH6iha0QBrJ8WxMbexpFdzDDpEMo5EmXhKDO3BA==
X-Received: by 2002:a17:903:2ec4:b0:27e:f018:d2fb with SMTP id
 d9443c01a7336-29b6c3c766emr14437205ad.6.1763701460825; 
 Thu, 20 Nov 2025 21:04:20 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b26fed2sm43384525ad.69.2025.11.20.21.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 21:04:20 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 1/6] target/riscv: fix address masking
Date: Fri, 21 Nov 2025 13:04:08 +0800
Message-ID: <20251121050413.3718427-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121050413.3718427-1-frank.chang@sifive.com>
References: <20251121050413.3718427-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
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

From: Yong-Xuan Wang <yongxuan.wang@sifive.com>

The pmlen should get the corresponding value before shifting address.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 172296f12e2..9b3f01144d2 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -203,8 +203,8 @@ static inline target_ulong adjust_addr_body(CPURISCVState *env,
     if (!is_virt_addr) {
         signext = riscv_cpu_virt_mem_enabled(env);
     }
-    addr = addr << pmlen;
     pmlen = riscv_pm_get_pmlen(pmm);
+    addr = addr << pmlen;
 
     /* sign/zero extend masked address by N-1 bit */
     if (signext) {
-- 
2.43.0


