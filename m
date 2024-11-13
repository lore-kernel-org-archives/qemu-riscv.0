Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A304D637A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 17:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBH0Y-0000Bt-T0; Wed, 13 Nov 2024 12:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0V-0000Ax-0O
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:19 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tBH0T-0003lO-HK
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 12:18:18 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-71e953f4e7cso5538969b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 09:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731518296; x=1732123096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRsWqGprKpXr4X4s9nrV4tM7SW7VHpVfdMt6ILf4bJ4=;
 b=NLnEPwThBgKpTtaewnZd0nXqZkBjweLnRX7ruGjHs2HAEvfQiWBDtYgPvWFDsAeRbI
 pMFiKKVFkdYNLAavLvdAeN55olDQvq0uE3sC84AcHcmwCUgHkaQGkknQOXhm9SmvnZvI
 PutqE6spFNqxFGiDAkPj3yPJd6q1w4tSxbiCFEQxVnMv6JPJJsYQakap64L9IfOkKbz/
 S9rblCDRMQVMIN845eJM8G+qBWygyrPu08EAEzkT8itQ+LY6R8lFtwmFrS5YG8qqFcMJ
 Qlkuzf3M6AyBfUJkzEUmMiBWvjW8hIwzut9FdHAOtJlgz3unbrudxiQcKg3HCXl2zfA6
 sfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731518296; x=1732123096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRsWqGprKpXr4X4s9nrV4tM7SW7VHpVfdMt6ILf4bJ4=;
 b=KFUcts/uexFajY42wxZDpwbz+UUZEJ/1Un7RJAbfb71HoLuCKyxpL6DIbdf7hntCjl
 c+a3Vu8SEEgr71vuEUwHXRlexpJa5epyrMn6oS8PBZ6RjBAd56AnKj1KoORi+p8BrEuT
 2UfPWM58rvbt2bDy/aiiGB526VRpDQD0qKJOTr7gELPH0GLJXVwO/RFssD2MX0lVFai6
 VEWA12xXwWx4H1tww9aCt6nlZPmyvhkJMCm1M3W0D6QyfFyW9dYikk7jgtkjzHE4Zvlp
 gmr4rEiYvI+mxkZ+xWtbmzA64qur0nW+cLolQ6Ls+M9cvMPpm6WcbuesQsNA7z26VVZo
 f4hA==
X-Gm-Message-State: AOJu0YwVC+fFw+mcLKNwJEKWVBzGez87PUSwJD2G3QAy9yt7U2eZ7SN5
 SI/4nTLBs6gcALTIunoCpd3aAdXu7jARFJ/8mCW8I2dZ7Ugry9pQ/9HCOnqomt0=
X-Google-Smtp-Source: AGHT+IG+UPYIm2taWxPvh5O2pEptxs1c4ZKZwoeGuqTCFBlL7V08SLnldrT8ykOqQOrqnbOTA41AyQ==
X-Received: by 2002:aa7:88d2:0:b0:71e:e3:608 with SMTP id
 d2e1a72fcca58-724133a03b9mr23823495b3a.26.1731518296092; 
 Wed, 13 Nov 2024 09:18:16 -0800 (PST)
Received: from grind.. ([187.101.65.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078a9063sm13392889b3a.75.2024.11.13.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 09:18:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 4/9] target/riscv: add shvstvala
Date: Wed, 13 Nov 2024 14:17:50 -0300
Message-ID: <20241113171755.978109-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113171755.978109-1-dbarboza@ventanamicro.com>
References: <20241113171755.978109-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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

shvstvala is defined in RVA22 as:

"vstval must be written in all cases described above for stval."

By "cases describe above" the doc refer to the description of sstvala:

"stval must be written with the faulting virtual address for load,
store, and instruction page-fault, access-fault, and misaligned
exceptions, and for breakpoint exceptions other than those caused by
execution of the EBREAK or C.EBREAK instructions. For
virtual-instruction and illegal-instruction exceptions, stval must be
written with the faulting instruction."

We already have sstvala, and our vstval follows the same rules as stval,
so we can claim to support shvstvala too.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6bfb1b1530..11a0d2d04a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -184,6 +184,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(shvstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
-- 
2.47.0


