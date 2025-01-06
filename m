Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB089E77188
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 05:45:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tUfu1-0003hf-6Z; Mon, 06 Jan 2025 00:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tUftz-0003gl-Jk
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 00:43:47 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tUfty-0004HT-1K
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 00:43:47 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2f441904a42so20469139a91.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jan 2025 21:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736142224; x=1736747024; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/EMwbW9ao32OaXwASoWqvLNsXxITTvHnX2/S/pK7bk=;
 b=A5/drGGIWgPWyPDPlAyrjdsVKXbGvts+8f6KOc1Us3v2tAZI57rJX9MnU1a8yOhSbT
 FZzzhmer3eoJcZqWm28gAZSwt7hHZP/j5S6KxCYvz4ZIpqFBm9G4VgGtDm6hNi7qNA/o
 lAXftoH+JwVJdVudEsCtHet8ODr07Qbie1RfSfiNYaJ15PNe1UvXS6KKcc8/WGYa9M/0
 ch5spgfIVHazuaasbuVyqaia48THuYmISpaABqZkP3lr0XmwT2WxBUB6VpnpBgMOCBLC
 KBEGGqAFT5/PtRP4dlUDYDcq2XFg3BKrIksLIsTWflLs0z6pZjI7vCY6G5LHio9MYkPb
 odWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736142224; x=1736747024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/EMwbW9ao32OaXwASoWqvLNsXxITTvHnX2/S/pK7bk=;
 b=DleLOAIryy0ZN9rp2DyoL16648ej1qGR7tHFT40QzOFRH41xBBum67jWxmugPV05O6
 ikY0o7VNiPZxmoOgX+ICxjLrMoHC/7gCuZO/u+a2LHRmGY0mn2jh3ESdxa+fsrPUW3rr
 LzWdqltV4OnXr3jQzl2EVSndPipPGQI/Z43o3INEcOlI9OXqfpEPfptyQ2QU16nP48Wm
 bVNFSc44acwwnzQBR2JNNJ3ekaxupF2dsLGm66BmiKTlkQ0u5vP6KWVrpZtiIgzjDfq8
 lPEYU14Tcyq5GUpG95VWzPesa1u3PCwhHVfx26lKqjE0QcakpnN7pkhSdo7ApJfhP7bD
 RHZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzCWiQjkQS/kRed/ahBBFWivCviUJ13ZhzCdSOxI7c35MERAwVG3pKU6wdpAm3GH3w/Y/OUN70kBt4@nongnu.org
X-Gm-Message-State: AOJu0YwUpcJCeKLQmNodE3/3j7ZZPqzpWOp1hUWQicj/bY+AevWOlUWg
 T7BxIh0v3x1hPV2l6lcQkat4eP9aF4wLA7p/IUgf7NNH9/JeSP3bzkn/GhlKme8=
X-Gm-Gg: ASbGncs0Xm/S582gKWY4GnZQ4oEz+2eVGlIW+0i4DDA7RSUJYxeaVc3sTFvVHk+c8qd
 k8si5aVtuB1jDBaPBkooVLGUyVeKN7F4R+UnTdFZaulyBEGfLSUxxW6JZtSNNLk680Sm5klmxqf
 AAtc3+LwLrhuC85PO4PIKgc3vCPjB+/HdaPCII00MGtVXFC7a4/03x20jtjPXWjkyuQuisAPOH0
 rOvbQ1VRFS1bTN7rMSPvwPiVNHBJSGTnxWyH/RhDxNnf5DciRkP5NTfQQrHzEfbf8l5eTmOQ6Pd
 wf7w9DUUfj4=
X-Google-Smtp-Source: AGHT+IEtvkda5k/jHKPGaQepjhqIYd2Hl+ttgBCcPenIceaQwpNr3fumalfhX7c3zDEYdmYSaNHjRA==
X-Received: by 2002:a17:90b:1f92:b0:2f5:63a:44f9 with SMTP id
 98e67ed59e1d1-2f5063a47b8mr17635688a91.23.1736142224491; 
 Sun, 05 Jan 2025 21:43:44 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([210.176.154.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc96eac6sm285722215ad.80.2025.01.05.21.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 21:43:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tommy Wu <tommy.wu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v12 1/6] target/riscv: Add 'ext_smrnmi' in the RISCVCPUConfig
Date: Mon,  6 Jan 2025 13:43:31 +0800
Message-Id: <20250106054336.1878291-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106054336.1878291-1-frank.chang@sifive.com>
References: <20250106054336.1878291-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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
index fe0c4173d2..28b43932db 100644
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


