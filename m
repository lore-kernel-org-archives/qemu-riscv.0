Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024B8C54E58
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 08:34:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rofmj-0004HZ-3i; Mon, 25 Mar 2024 04:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rofmh-0004Gn-K9
 for qemu-riscv@nongnu.org; Mon, 25 Mar 2024 04:34:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rofmg-0004Ky-9E
 for qemu-riscv@nongnu.org; Mon, 25 Mar 2024 04:34:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1e00d1e13a2so23434855ad.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2024 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711355661; x=1711960461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q026NYb4ZHzOUxF7VvpJFc4wjD5B0PSeAlVXt5PkoW8=;
 b=X2DB3X3bbuwb9N5YjPDbkxjjseJLOhpbr/4IeqGpC4eVu22UEAVKxsnmh0Xty7pPoE
 uPjonJB+Q37/bt/qscxrRtn6HIXN+0HqmLPtcIkIomP0jyqItspBm9oONTsMe9nEry/Q
 yB9gWjaFMwjeX6NaLAOCA13Na4cc//UOyzNDkRch/retriVAIxASj1YBHE7VtB8tl5nc
 0WzLxuJt9GRQEFd/JavvGBIidxNDBp7WjAzT0k6SYMVCPcN21vtdK8SbrBir29jbGjNF
 B1+EbafqzSKwdY6Lhfrq1tbxQkIgr/Vxyrk/dwm+ThLdKjlXcnKREzvqRJRhoCwnMBQh
 xdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711355661; x=1711960461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q026NYb4ZHzOUxF7VvpJFc4wjD5B0PSeAlVXt5PkoW8=;
 b=jfvC7+wn+KsgcsQ74Wh+J6FdcRKScTxk6S/xrW/R+z8f1yc/H+JIgVnMO5hSr+D3vj
 jTzRqjKl+x8IhngixDZhwRYnVLHciW79knMRKdHbdcCRyWwNKz38/k43gtChi1LlqkfA
 nHGPU20xa51/0SWb+u+VFVqn6PhNLyEvOqCcTdvSOT6EyHRgPPlF2QZCzWp2Ah5vxJj/
 W1TUsJHsLicXEJVLhbsb3bkUcaBKdQ5Y0kmggAiWhcK7Jke2iYoaznDnyqdUqBNORdzZ
 kZWG01c/cmRBmqAIRimy4E/QvRawiSHz/KYx+XgC7bi+e4To0ibcCuIZNvZVDZwcIc0M
 d8iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8i/6oGB11rLbGoJDYVnJk3NAa4Q9Ujw7llAmQni9heeiVLKPLooLiAcjNbLcMMs5vZck1fUSsDjuqJP3K3ha/5/xaD6c=
X-Gm-Message-State: AOJu0YxTWly0hXOYPH9l2tX8i17Olinw7K2pTjaEbCsxo4ZJDFnDkNdE
 QpGrIgmo9RPTVh2yIUEbMfGtsIXYyNDv7VBJYpeJ7cK/w9lT2JVXleOJF9zyzUo=
X-Google-Smtp-Source: AGHT+IHOHkd313euodSo67nOiJWihHvwiJUZ8aPvua5C/dG3tQkCO9Jg3AAQ+oAd4l9OX2OOpOmlNQ==
X-Received: by 2002:a17:902:f78b:b0:1dd:861b:3666 with SMTP id
 q11-20020a170902f78b00b001dd861b3666mr5601695pln.55.1711355660957; 
 Mon, 25 Mar 2024 01:34:20 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902684700b001e0287592c4sm4311269pln.267.2024.03.25.01.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 01:34:20 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 5/5] target/riscv: Relax vector register check in RISCV
 gdbstub
Date: Mon, 25 Mar 2024 16:33:39 +0800
Message-ID: <20240325083346.16656-6-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240325083346.16656-1-jason.chien@sifive.com>
References: <20240325083346.16656-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x636.google.com
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

In current implementation, the gdbstub allows reading vector registers
only if V extension is supported. However, all vector extensions and
vector crypto extensions have the vector registers and they all depend
on Zve32x. The gdbstub should check for Zve32x instead.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index be7a02cd90..d0cc5762c2 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -338,7 +338,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  gdb_find_static_feature("riscv-32bit-fpu.xml"),
                                  0);
     }
-    if (env->misa_ext & RVV) {
+    if (cpu->cfg.ext_zve32x) {
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
                                  ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs),
-- 
2.43.2


