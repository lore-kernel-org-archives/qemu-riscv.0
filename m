Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CD2C5321E
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 15:31:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sibgH-00021W-9S; Mon, 26 Aug 2024 11:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sibfy-0000mA-TH
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 11:30:39 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sibfq-0003gG-UZ
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 11:30:38 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7cd8803fe0aso3003052a12.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Aug 2024 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724686229; x=1725291029;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmHRx8s/W32kMwfWaFprt4Qicp4zWaDvYB7fNr0JPCQ=;
 b=QDcE22P6ZrhG3aLZMADRlECD5YxSfFnV1cu/xm4yquqygzTSH1zCG5GUr0Vcho3jR1
 O7ODshj2aespQY2Lc/59Hs+YJZSAWCSCCBtZ3rIMzkN5YvE7i48KYGctav4BEJZQP3Dc
 KGCxSw79bsusHGf1473w4Gas29Sj/Ya+EN7a9i14lMSHUiLPS87KaSc3HtEaTBuRgyXL
 9kcM6p9gP1LzhO64ahVVtZItFt1ikB22y4vwCq6Tld/FDItQPOrFWzeqEy/2FZNlrQfv
 Ww41VMI4nn0G400rd3/AyeOtR4ZWNUDKYp6Ir97y1XA+N+X8d2BtKGdRNqwXRWcSGsP+
 tieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724686229; x=1725291029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmHRx8s/W32kMwfWaFprt4Qicp4zWaDvYB7fNr0JPCQ=;
 b=Xekh4s9pOu8gRmbSUKF74eGrBpE7MVG4AnAwXCz9G6l6b4INHbej2rzKOthN9qUCGr
 QEyd0YLM6dDJv7/nBo7pGq49TNT8IU8eCmJO8eeIHiNx8OYcn1ZDZe2X8/oxCz1fcnON
 9580G6fCICcjCOP0d5mcAaz59VKATx10Zfj5+UqzwVP0HMhr2afbqaBerTAHjrWRoZwo
 6zv5EOAah2eGg04p3/Z+by4kSudadYZb1fLJt8Dw4wB6WyzorK+10cDnF9sjj/wuuPdA
 xYEIiZbg/sSp/lVzUgOdlfpd2uQvDtfkIu15+/VFWibOaNKyDVSABNgfFZabQzFzNEzX
 dLFQ==
X-Gm-Message-State: AOJu0YzirU+lH12GxQiUi4gYg2r8GbiNc4XUl3lO8FSyJ50LVa541/wA
 XIPfH3nGmrTM6nz7IU+KsLw0kbu6jFcpNLiBQeR7lco8sovVv+dvqsVU8nsFeDe/1sBx00FPzr6
 l
X-Google-Smtp-Source: AGHT+IHvS+jW3nPSNvl5yWY07+f8UFZBD+qNzPtfGzfVQ6lIKEqeYP7hpy4D/uY5Ak31I+PcF4Wy6w==
X-Received: by 2002:a05:6a20:c909:b0:1c6:ae03:670b with SMTP id
 adf61e73a8af0-1cc89d29dadmr13222715637.9.1724686229058; 
 Mon, 26 Aug 2024 08:30:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143422eaabsm7396525b3a.12.2024.08.26.08.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 08:30:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v9 15/17] target/riscv: compressed encodings for sspush and
 sspopchk
Date: Mon, 26 Aug 2024 08:29:47 -0700
Message-ID: <20240826152949.294506-16-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240826152949.294506-1-debug@rivosinc.com>
References: <20240826152949.294506-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

sspush/sspopchk have compressed encodings carved out of zcmops.
compressed sspush is designated as c.mop.1 while compressed sspopchk
is designated as c.mop.5.

Note that c.sspush x1 exists while c.sspush x5 doesn't. Similarly
c.sspopchk x5 exists while c.sspopchk x1 doesn't.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
---
 target/riscv/insn16.decode | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 3953bcf82d..bf893d1c2e 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -140,6 +140,10 @@ sw                110  ... ... .. ... 00 @cs_w
 addi              000 .  .....  ..... 01 @ci
 addi              010 .  .....  ..... 01 @c_li
 {
+  # c.sspush x1 carving out of zcmops
+  sspush          011 0  00001  00000 01 &r2_s rs2=1 rs1=0
+  # c.sspopchk x5 carving out of zcmops
+  sspopchk        011 0  00101  00000 01 &r2 rs1=5 rd=0
   c_mop_n         011 0 0 n:3 1 00000 01
   illegal         011 0  -----  00000 01 # c.addi16sp and c.lui, RES nzimm=0
   addi            011 .  00010  ..... 01 @c_addi16sp
-- 
2.44.0


