Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0A4CA0EFD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 16:51:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sk4nf-00021h-0n; Fri, 30 Aug 2024 12:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sk4nc-0001r5-Bt
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 12:48:36 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sk4nU-00071B-D8
 for qemu-riscv@nongnu.org; Fri, 30 Aug 2024 12:48:36 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7cd9cfe4748so1610387a12.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Aug 2024 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725036507; x=1725641307;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6L8R5EzGx+7JXpVfhwTDrr1noPqKjdxDXuzeQGb0BU=;
 b=lQj7mZJBWehyT/LRRmTuaguK2ot4j4x/xniPwjTL1mGK6Cm5HyVuBpIt28z32CfqmA
 qY74u1G+7AKOz1A/PoJlABfwNo75TpnJgdr8mzemwBx7HZ+NyPYbalGb1CzN/eG0kZmI
 o76vmiVXByQeWYP0EOdnbcA6Im4cBoWEeS622gsnBYr0ENQiW/ehH1hemg1ZDS98SJbA
 odlLRE+cyNdbloYCWAeQNpXndnapY5jz0N4vhygO40Vk163NVGdPHhSwbwPYCpIhskcC
 iqifgPSYFlLqWG1rddccujfqYHhDi71XqLX6nbCd6yj49NviC9jfcJRomXV84L3EXpXV
 yc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725036507; x=1725641307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6L8R5EzGx+7JXpVfhwTDrr1noPqKjdxDXuzeQGb0BU=;
 b=O35Ve9L/QqOOEnWHhKsIihFGxqHXF0WKGQsb02nnNYxSPpUIUesTKaT8CQE29tcxLI
 Ec121XbeSADGSfFwB/5y3Zp60uIX7Euxm9pmH7d4xAsdPQKIG9j8ZcC77Fs69ic/Nk2v
 hOoZb89X0iuW1OvI6sA/SpfNSSrc0M2iIgamPF9uhl5uRCo2361Xj395VwVWfSajaSfe
 AvPPR/1PXyNKFqe4GLYi7EH4iLyKn1zgBA9ECydUZPMps8J0Tey/9JtMfomPA07lQkHc
 Dq9lSbudP7suDn/PdVzgMZlUIaMpCo/2Cr0M5AF82rBjfBRLHIfi0SwU4yVlHNwe3WYO
 dvdg==
X-Gm-Message-State: AOJu0YzHPqgWVU83pdzwAa2OS65ODk6+ePLD5JtOy7FE70ZDPxHllqqP
 P8FvmzJMn2NB3z5neI3nsswfKDphWLsZx+tL9PVO5rQBaRqSzcoSPFgV9qaEEdvbA7jdsQ48oJW
 r
X-Google-Smtp-Source: AGHT+IHbXne/Drbu7KEVs9pHCLzlHlMqtr+SsnuJpGMfCqTFxpauQxoi1L9LWx2nCU623LSXKIMSxA==
X-Received: by 2002:a17:90a:d350:b0:2d3:c0d4:2c33 with SMTP id
 98e67ed59e1d1-2d8561afa0dmr7089294a91.17.1725036506780; 
 Fri, 30 Aug 2024 09:48:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445e813dsm6591257a91.17.2024.08.30.09.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 09:48:26 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v13 17/20] target/riscv: compressed encodings for sspush and
 sspopchk
Date: Fri, 30 Aug 2024 09:47:53 -0700
Message-ID: <20240830164756.1154517-18-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240830164756.1154517-1-debug@rivosinc.com>
References: <20240830164756.1154517-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


