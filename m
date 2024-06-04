Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B47FC25B7E
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 06:23:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sENZQ-0007AH-T8; Tue, 04 Jun 2024 02:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sENZP-0007A4-M7
 for qemu-riscv@nongnu.org; Tue, 04 Jun 2024 02:22:55 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sENZO-0006gn-4z
 for qemu-riscv@nongnu.org; Tue, 04 Jun 2024 02:22:55 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-6c3b5c5e32cso2767136a12.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jun 2024 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717482172; x=1718086972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mVeGIiMOTpViZqT/i0mT5bp2ZCtBNFV+Qcrg20yga8=;
 b=QTlRQkKNWHmgXd6EMJuT84dmEK4NolcuZeFaM8Ct2UM7vNoYN5CknJwMVhSG6qRKDG
 MXIH+6zWfErvUzVAQyfXpm+BvfkAWSys9z1EYGiimhiPF8yNhsiudNOUzWyPkoNg3IAa
 j0Y6OEOKJ0HbMQL4W5sj/NgGTq3JidhawaL4rA7LmKP1QV3TCPRPgpyV7IBhAoL6dpQt
 6zkyWwqWr4FcibDixwAfRb/Y2Vk4WzqTAwoL8Ifx8q8inJFaLEhzrchiThi4NmZdXnkm
 orvhaLunnynQEkGhC9tN/I35DJAnPvgYjcab3hUGJwnZkd0ERBrFtu4inCKzJnb/7PN0
 e49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717482172; x=1718086972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mVeGIiMOTpViZqT/i0mT5bp2ZCtBNFV+Qcrg20yga8=;
 b=K8ae3cIE3H0+t+/epvL54O9Ul7oFs3ETWLIJefLKs9KC3aR1BqABf+KgW38QRnbYah
 zcnrsptyf7qRn4W++QQdhG1zJ1W5kA3Tke0i0MNaS2xXGjNKLGyRdZvSgbdcGaB31fFU
 gnjRMOIWiF8+rpifrl48gNTIkISX+o2IF7FaThSxqYPoF2ZVQVy+zuFUbU0fel7OKxaM
 ZxEcmbOXpoaRypcVXuZ3vDGiTstBy9akHjYSHrDhICXGIU8PEewemNXK1na5ZvMAJ18K
 nxZGSltXuhLMR3jVli7Eq7P2BRx+WnEb0qTs1XgQK7+AwbsCSuuo2tmBE9lIhEciG6Zk
 tJpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa7gfurugp41FKZ0tWIcSptieCfOmUQHTmiUNe2Sfr1kVYx1YwzLolfOvMwwVfQv53rgfUZD/K5OzM37ijKJyg0UGxOPc=
X-Gm-Message-State: AOJu0Yx9OQullcKtCs7+Xrz1WAiRMh73+zdOua/hhEAmtJNjNAfnloZk
 bUuQn0lPiqG3aoHZuM/y8pXlGPS2GQiD7VMATqiSOvA5kD6IOJ5SxrmEkt0cDf0=
X-Google-Smtp-Source: AGHT+IHmJQVRTWRwonwVjH66PT6OM0HAUviYRMBDy8jVXUmYQ1zD5KaUFC+XA1WSKYV5PFsPr/ZMqg==
X-Received: by 2002:a17:90b:245:b0:2c1:c648:14d2 with SMTP id
 98e67ed59e1d1-2c1dc55ff68mr10378867a91.1.1717482172624; 
 Mon, 03 Jun 2024 23:22:52 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1dcb56014sm7115617a91.25.2024.06.03.23.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 23:22:52 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 6/6] target/riscv: Reserve exception codes for sw-check and
 hw-err
Date: Tue,  4 Jun 2024 14:27:47 +0800
Message-Id: <20240604062747.9212-7-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604062747.9212-1-fea.wang@sifive.com>
References: <20240604062747.9212-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Based on the priv-1.13.0, add the exception codes for Software-check and
Hardware-error.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f888025c59..f037f727d9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -673,6 +673,8 @@ typedef enum RISCVException {
     RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
     RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
     RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SW_CHECK = 0x12, /* since: priv-1.13.0 */
+    RISCV_EXCP_HW_ERR = 0x13, /* since: priv-1.13.0 */
     RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
     RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
     RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
-- 
2.34.1


