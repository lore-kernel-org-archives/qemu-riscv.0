Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A76E7718F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Dec 2024 03:27:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tSSuU-0008HL-Be; Mon, 30 Dec 2024 22:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tSSuQ-00088t-Rs
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2024 22:27:06 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tSSuO-00069Q-R0
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2024 22:27:06 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2156e078563so111662425ad.2
 for <qemu-riscv@nongnu.org>; Mon, 30 Dec 2024 19:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1735615623; x=1736220423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XycXOUlR5AqK9PWMiMAeGwJJa3w2q3ZhmMiw5dMZjjI=;
 b=LOXKiouFEQSavQRAhdluiytExteEsCF/UryidCcQIfg0wbo/lL1zei/c4LGPs0pp6z
 0ta5m/XkGKc0TXO7FMV9n0ayvtufpF9zp5mqycX4CNAjgtsmYhzgp7jM8EYVKtoRqTI4
 L9CzdJ0nkvUVb/zeV3RXU8Ydi5WW0iIr4QC/fj9LsF8SxjIvHmzxLEKLYNBai+qTiaws
 MnnHl3DMv7KlMw0BaUpUyrlo0PHbFLA4fyKoRo8LOl9QPr78vmgDoKCHJCX2aAuRuxx/
 WyFRqrPXG4oQhfVJ5hsAi1Xm2nXbT0Pt0OmqtnEnBxiyS0aKO2j9t1gTUQBNXMZY5l/v
 H7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735615623; x=1736220423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XycXOUlR5AqK9PWMiMAeGwJJa3w2q3ZhmMiw5dMZjjI=;
 b=fFaV9+CVQ32C3/I7iZxyfo629srrOL1oNuQtsLhg6VB96dytF2wqMaAc8NP1GBpdyf
 QVEd2xe60PvwzPPqX5mYfIpyEtGBnz8BFlJxoFmTy8Vo5LLirXIqQkxpt9B2ySuWR2w4
 8S2vdxAGFC0r4TO+9r/flFIvcoGiMntksPkMrS9dFl5iHKscd+9lXF/fpszob/cW4/Fp
 61RZwnxuxuTajISiWngo13sLRcuMg1vc65GOA/adXvM6aDWt5yPP4f/Tg1bEjD+uK7V9
 gfI5m1qyG/MpWEW1OBWprTCcghWjXpIgsDI+5B7z8UZ3skFVMFxjUWCaT6EPnXF3+x0m
 A5Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv7rt9YExWQ/1+BVK5WoNif2Hdbf1g/uIaCLIJ7eFmG0esZGgUPyclpngbct3XV9LUMTIjSVOGVg0U@nongnu.org
X-Gm-Message-State: AOJu0YwWQu++4mW1pL2dR3Uze2fT2f5hx54ds1oczQUdAkhszWv+2yCN
 KaXV2SnV4nfd9LGLEWhr+66ftJk7FocUU+vqz/S8ZSMBIxbHh3KuskIHaY3V/V0=
X-Gm-Gg: ASbGncsaVGWnZpgbX/I7J1UvuFGOSE/LbCfrnADUTSwiATNAdljwmY0yUZjwuc3uFtv
 xK5lJ0H+Wo1x2rMAMxTmf1pl8fMMH+oeTltap1lCM2VgEns5snlZgxEM0VsEi1K09VPbqj/9e9u
 CJQFSIYRntmyFFD+ZSZXkZj/Uu81eeBuoSei6OPuEkU9MclUSye3kgCjAMEWNLO07uv/uQF7IXO
 aJFSxqLIO9bCnmIfSvP/gXfu/lDXp3sDcCrS2mfOIpkHcPsPo9Ieo/sWlNXjncHCPOMzeibC9Tc
 mSLb87zxK28zCiuIhiPw
X-Google-Smtp-Source: AGHT+IH6qt8v8URgknqXs1ME4rvJDbk/aozA6kKO3UMtM/Md7lm/MfNWHQ1l4yEOms4GRP3SeFY9ow==
X-Received: by 2002:a17:902:f54e:b0:216:6c88:efd9 with SMTP id
 d9443c01a7336-219e6e9a3a1mr471837565ad.15.1735615623221; 
 Mon, 30 Dec 2024 19:27:03 -0800 (PST)
Received: from fchang-1826.. (1-169-235-48.dynamic-ip.hinet.net.
 [1.169.235.48]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-92587c62eacsm291797a12.21.2024.12.30.19.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 19:27:02 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tommy Wu <tommy.wu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v11 1/6] target/riscv: Add 'ext_smrnmi' in the RISCVCPUConfig
Date: Tue, 31 Dec 2024 11:26:49 +0800
Message-Id: <20241231032654.133039-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241231032654.133039-1-frank.chang@sifive.com>
References: <20241231032654.133039-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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

From: Tommy Wu <tommy.wu@sifive.com>

The boolean variable 'ext_smrnmi' is used to determine whether the
Smrnmi extension exists.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index a1457ab4f4..eda7d141f2 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -129,6 +129,7 @@ struct RISCVCPUConfig {
     bool ext_ssaia;
     bool ext_sscofpmf;
     bool ext_smepmp;
+    bool ext_smrnmi;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
     bool rvv_vl_half_avl;
-- 
2.34.1


