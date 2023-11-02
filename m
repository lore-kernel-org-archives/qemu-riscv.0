Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A8BC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:37:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLfj-0004CI-Gi; Wed, 01 Nov 2023 20:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLfh-0003uc-KL; Wed, 01 Nov 2023 20:34:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLfc-00044A-9z; Wed, 01 Nov 2023 20:34:53 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6b5e6301a19so490780b3a.0; 
 Wed, 01 Nov 2023 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698885285; x=1699490085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTV7NcDk/hTWIHMNPWQ0O6MvWNLhredSstTSD9wYGNw=;
 b=bOJSFLNKk6w9BoyEpf4zuCtKzt2x4MfD9twt91xKRaRDF24wLKpmrPPmuelSS//gQs
 veDczrQYZKJ9vQ1xzqkUnYbseVd7fJwCr9vDxsKbmYgyV9ZN7H45Y9zu6M2cxxO0wRcN
 VzLmwZUPa+GMIT6fUVlMXxtpTDotDCluwpvBMp3llMe2dyyC/QjNOOYWqrpsD3GDCwdI
 laPy/5fjfAS3VFVroqzis4nE4RWgSmE9rHtGjnPKzfj5w6aM/PnyQ7KxbKHYJDR/x1cL
 inou5Ce5UW3HVyn465n0cxwDxtPRrOCr/8w88HRJUfCGhM7BsUHzrECt51kGPHk5yOzO
 CxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698885285; x=1699490085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTV7NcDk/hTWIHMNPWQ0O6MvWNLhredSstTSD9wYGNw=;
 b=HbVeteLU9kNTzpbXPn8l44HQS0PAimHfQ/67XzrIr4Avy/B9R2DIz7tksvSKUiYHl7
 DVYYUuWLNIToAF4o/xAWhtkbGy/IOJbqGjMR67JS8vDeLFeqzN1nK88IsADQMf7IvP+x
 +uiObbsb0VgqK/n+agZoqnluHiKTTk65Dfudjc+3CLoNzzZDIScfD1rXu7x8/AurNoCL
 tLVd8gpiPiwIWDrJEt5vqPH+6cXlEpk2ZuzcuJfjq2vE1K5YbN0ofcnuH2HKkyyn9yIE
 SRyghiWPQMxckcQKSayn/ZH2wZ1lLWqgEUz6az0DLZH/ZJMSN8efYYhRGtg9fC6/5+e6
 Neyg==
X-Gm-Message-State: AOJu0YwsvQ3pCdCD1GyDSMAomhrKdzURk324pJTOaEwcz5v4vn+sGhTX
 SjJjSYvtGBixhFkDX0Dm6uK6By0tcfj1OA==
X-Google-Smtp-Source: AGHT+IFXCA/xCcpDqIq7ITkQokcXOG51qsIS87l9PUrnuEC8ZrOJBcOYhaZyFPGrlASYamY4iif/cQ==
X-Received: by 2002:a05:6a00:3a96:b0:6c1:6695:a6e0 with SMTP id
 fk22-20020a056a003a9600b006c16695a6e0mr5950487pfb.23.1698885284931; 
 Wed, 01 Nov 2023 17:34:44 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a633dc4000000b0057c29fec795sm411783pga.37.2023.11.01.17.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 17:34:44 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, bmeng.cn@gmail.com
Subject: [PATCH 2/2] target/riscv: cpu: Set the OpenTitan priv to 1.12.0
Date: Thu,  2 Nov 2023 10:34:24 +1000
Message-ID: <20231102003424.2003428-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102003424.2003428-1-alistair.francis@wdc.com>
References: <20231102003424.2003428-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Set the Ibex CPU priv to 1.12.0 to ensure that smepmp/epmp is correctly
enabled.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac4a6c7eec..b37b9107cd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -595,7 +595,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     riscv_cpu_set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    env->priv_ver = PRIV_VERSION_1_11_0;
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
-- 
2.41.0


