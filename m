Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3ACF34BE
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 18:37:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swQer-0007Vu-3k; Thu, 03 Oct 2024 14:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1swQeU-0007GY-Fu
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 14:34:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1swQeR-00055k-1U
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 14:34:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2e0894f1b14so1040920a91.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2024 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727980449; x=1728585249;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7nGUkC8AoqQkvdlZ/4VsRGMOV3aEFYCGC3UA04clbY=;
 b=rkOuzgaz2EXrPeTpXe7hj0mcTAtq/7DfHyltLZz/WgchsmWlgP2jqqJjJs9eDuRXXI
 86V2UQL6R2hkhP7hvjj3q/AcW8NLeERVce65M4D8uAewn8zcNLn9q/cB0xmv3oRg3foe
 vSmmxn42xhCD1EPxlNmCjPiMFn+hwaFFbM+Y7La3Kly7Z0fBIPucCkfwxPSfDGlNpSPr
 dXANu8eVg97SfnRfBoI3oBut/e7/sHqhjwvXIjqKLqvZOaff7y/tjhJbN3oNaK8IhOrS
 iMvx+HuditBjB46X9IlzjehuEOfl4xDT7A+DNhyN1ccOed0oLGUi7fB/20QS1wDfKk5g
 cUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727980449; x=1728585249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7nGUkC8AoqQkvdlZ/4VsRGMOV3aEFYCGC3UA04clbY=;
 b=ozwFAfi6tdCxC0llmdgLC4d9sv2N8YQNcb0a6WP0DXp0S4vhESxTByNyshDyXg2Rm2
 bH95HfgmRRzyGHliKtP8JtGFD+WyYkjgFZE9y+Hjfi5ZVupX5ks8nGNZ/Z3pkTNRCq+z
 9bJpr/+pBABCjSz3KymPZeTe/+pN3UoV5QpSUwaklrvHRAu4SjXD2rnjqdUl5ER0gOVE
 guRmaLvB2vOUxjkehTKsjwYYWKRSHG5mZL3VY2JSVaOzbGUq/+qG8O7PBPZRYN6gqdP2
 hfp/Rh37Z1CINNJIdVd29v0vMwM+f1lZIfKOfVNjtcZGLq3wy2/lcplUUi4ddyFsORWo
 L4Cw==
X-Gm-Message-State: AOJu0YwMwtQW5xpMBJtr/GMuSGej4MlCfXyhbGBYi4G7Pa2+wyjKCcsk
 zLm/viH2JFAAaGmGeoHSjxbfmEkfKwlM/RBFfwcet+qoD7cmDotQPpHytEKROOhweWwRXTtu1ma
 U
X-Google-Smtp-Source: AGHT+IFZN/dmZSWCYK3bw8T4rrMYRM0Duyt/jCwQ4wzOokdg20SMhUTXYOqT0gq4Wmj7V+cVmK/KEg==
X-Received: by 2002:a05:6a21:1192:b0:1cf:489a:52c1 with SMTP id
 adf61e73a8af0-1d6dfa3ba62mr286587637.18.1727980449581; 
 Thu, 03 Oct 2024 11:34:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20beefad16asm11796245ad.193.2024.10.03.11.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:34:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v15 18/21] target/riscv: compressed encodings for sspush and
 sspopchk
Date: Thu,  3 Oct 2024 11:33:39 -0700
Message-ID: <20241003183342.679249-19-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241003183342.679249-1-debug@rivosinc.com>
References: <20241003183342.679249-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
2.45.0


