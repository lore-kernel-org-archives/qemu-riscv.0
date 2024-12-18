Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A1E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 11:43:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNsQa-0007fk-9a; Wed, 18 Dec 2024 06:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQL-0007a4-5T
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:41:06 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tNsQH-0007vk-Qo
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 06:41:03 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2167141dfa1so5972535ad.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 03:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734522057; x=1735126857; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O//YerG7ZIihFW2lGVZjhXBesNDkTOryi2FknShtqrA=;
 b=DVBel1beqOULjwMV3hPzRB/hug7byTyN1j1I6U4I4Yfgp5MVxjh/TS5jOUOIfQEMmo
 10Pkmw+ypvyKQy3xyOawFDh0giqXeKbCWV663x8S6+Ur6iwTqjaCZqN3JtHN668wUKBu
 91E4QZU40YPWJ9Pwk7wyer9MG9yfy0GJ+AS0oxua5Xx6qnZ90jyrYHNV6kgAwDuvlx9m
 kZMxi2RCVcnzMwzKZyfyU+UGRe+btudcavHt0A1rUsdFxZ2b4KtIW6G/ML5Q+Fzk3Zue
 G93dC7h9ZBVaj99S2xxcWHy5i23QN180dWIcvjcTPw1cJK7rG46rWT0T01/fONCaq0Sz
 ri5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522057; x=1735126857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O//YerG7ZIihFW2lGVZjhXBesNDkTOryi2FknShtqrA=;
 b=sGzEmyA9nQ/qJZtXG/keg+Xz6ubuBiOU+CaTr5U3WtQig60x7BnIknCG/79dtQqf4o
 eeVSWYv6hzHCO0ZQ1puzR1AimENFzBBagOoNR7nMqstr+lepxij9Nq7JrvUKs1XABIii
 s23Xpcyr/Fb/3HOhchDBZutK3/6Dj+GWyXv9JGNvJ6/8+M+boSAqULAriPw3BpwvjmrJ
 PuSZqXx2M4GsLgkDZdjqtJaf6dUMAE0qnRBk5eWU27yWd7XSQ0n5hdQabGjZABLHwhZp
 5qmANaOzD26E9GcUNRkDWD5zULZnowJyfGy6WvoADgt0o58kJr7Td5b7I6ylwFB6eJpD
 9iMw==
X-Gm-Message-State: AOJu0YxXy9L74sspDhsV8uL0kwxDSUoL1mnLcyIzg33gZfCbmxsFPwpo
 tZUMgzoDws6j0/lf365xj961BS+vQJxKjnmBkhfEAp7VyzK8tyHNXcvc2TuyxeYOSKwKebJp1LS
 6RBQ=
X-Gm-Gg: ASbGncsCXrvExaoSLhzomv95pAWorToyJg4TxhQpBSV/t3ir8xsqQ5ZG4djqSv6FxOq
 x1Bs4pd4jNplzR+6k4XsYX82wvFrojNe1IAyELkkOcnx5Kj3akB18fK0ft+L95VaLXfysn+6woR
 KqicVxboQgB9QYyGCZ6b7jirXUgODZL4G6xQliCXKSD82yRfhgXUp3dcSit+GwonWFtos41QeSJ
 1L6jzaxcQirk1RClIcqPgJBnFhm+pTv7Su6KQw4Uk8b229ihQGytjm4DT3IipZvZt3RvgnOyTmG
 fw==
X-Google-Smtp-Source: AGHT+IFgI3wCgzOcWsy3RuqYgCXKX/lvGEoPoZrR8SIP96nwYfoTdmgSstBeLPzZGf1Hnp4H+koF5g==
X-Received: by 2002:a17:902:c402:b0:215:7e49:8202 with SMTP id
 d9443c01a7336-218d73b30f7mr37655845ad.13.1734522057522; 
 Wed, 18 Dec 2024 03:40:57 -0800 (PST)
Received: from localhost.localdomain ([2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1dcb447sm74462285ad.68.2024.12.18.03.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:40:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 5/9] target/riscv: add shtvala
Date: Wed, 18 Dec 2024 08:40:22 -0300
Message-ID: <20241218114026.1652352-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
References: <20241218114026.1652352-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

shtvala is described in RVA22 as:

"htval must be written with the faulting guest physical address
in all circumstances permitted by the ISA."

This is the case since commit 3067553993, so claim support for shtvala.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c                |   1 +
 tests/data/acpi/riscv64/virt/RHCT | Bin 356 -> 364 bytes
 2 files changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f4997f488e..70301def20 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -184,6 +184,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(shcounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(shtvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(shvstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index 15b82b5bb1cf24cf501e74cb82682742e0041ea6..065f894010272e7f27834b2c8d5d5fb0c21066a1 100644
GIT binary patch
delta 46
zcmaFD^oEHm$iq1#hmnDSF=ir{0UH-1BLgGjM2GFHC1r^@i4(tMa5ynCF!(SsFaQ7$
CAPVCE

delta 40
wcmaFE^n{5k$iq1#g^_`Q@%ltA12!f`MuwjZ6CJis{GZBU#mK<m!pOh?0OjfmAOHXW

-- 
2.47.1


