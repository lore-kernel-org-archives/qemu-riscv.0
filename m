Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B005D206BA
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:42:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t1ApD-0004B9-4a; Wed, 16 Oct 2024 16:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t1ApB-0004AD-Ic
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 16:40:53 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t1Ap8-0004c3-35
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 16:40:51 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e31af47681so172671a91.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 13:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1729111248; x=1729716048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=Vu94YK1cwhi1DqiKBfmTKYIfAyrOC3YJhkaYBP9eE+YCgWJzxPbZS3GhdXGaRb44xH
 Pv/ZVjZCOTzEsUGTvGSUItDZ71Du4b1GIFCejcPPF45sKZigMiaC0HMKRlgP1u/p68g2
 D1vz7OHcTWqf4OINLNgomDDZs6jjv4SKR+dMNz36vZJiXFcctzN7CzZNBG5os1h8iHBx
 t7HX/Ng8zV+VRIxU4Jxaf93YF6gAsf4BzcB2OcUr/0HLGhD4Y3OTTIcOyxESuVf7jFtX
 jOAA6iUzMhTL/QrcLNJob8CbkXF349YAHcot2xfEzwIg8lnpaLeyYVTEvj8FK6b2rWCI
 gMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729111248; x=1729716048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmgSaVL8dhq5nP6b5OzdsZKAt0sQ4+L9Gnx6E+G/OOg=;
 b=YYSV3HTCiGLm3RZtch9IYFyxc1DYAcfiqzLm8ytZf5XNWd0ANehR/9dh9PuzOHG2lu
 PLVanB7YBPx3YWE8psPIerLLPdpPOWVnNa57evGYVrvLS/BaqXnqCBAnmgJeB0cZkk2a
 D0mmcNUTgWyMbaK50zDAf381NhSOOWdcV5Uek9P32EL43ArYntB07KtlC/BYdiIeWAG8
 3EOnF+UDFAABQoDaZeMWu+f8X+m0xE0Gzo5G7vjm2Gg8MYDIZgmipKFSPw925W6s3ZDN
 Z92yKBWAadN3fNWzfsLM3DSpEhhmRiCB2wzUL4zjJq6V+6c4ikdattHBhHZePahiuXUI
 7Sag==
X-Gm-Message-State: AOJu0Ywihc6KyidlC62/2pEMQGVYjCurEZGErcn+3odGQOmoggc94+aF
 5FdbIPsZquaEUfrygwYhQmDh+NiC5DM3Ly0cTQJI4Eqv6JDh1C+Ym4l9eej74ts=
X-Google-Smtp-Source: AGHT+IFe+kw2Yym/2ncV16yQ9GmhKEmVJssfPHcGNdu25gfCRYIN2N8Mkp4MANLRIAjOw6WiBZWByQ==
X-Received: by 2002:a17:90b:193:b0:2e2:b2ce:e41e with SMTP id
 98e67ed59e1d1-2e2f0add938mr23893033a91.13.1729111248663; 
 Wed, 16 Oct 2024 13:40:48 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e3e09085cfsm242158a91.54.2024.10.16.13.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 13:40:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Frank Chang <frank.chang@sifive.com>, Jason Chien <jason.chien@sifive.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 01/12] exec/memtxattr: add process identifier to the
 transaction attributes
Date: Wed, 16 Oct 2024 17:40:25 -0300
Message-ID: <20241016204038.649340-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016204038.649340-1-dbarboza@ventanamicro.com>
References: <20241016204038.649340-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Extend memory transaction attributes with process identifier to allow
per-request address translation logic to use requester_id / process_id
to identify memory mapping (e.g. enabling IOMMU w/ PASID translations).

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 include/exec/memattrs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 14cdd8d582..e27c18f3dc 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,6 +52,11 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
+
+    /*
+     * PID (PCI PASID) support: Limited to 8 bits process identifier.
+     */
+    unsigned int pid:8;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.45.2


