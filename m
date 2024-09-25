Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6771C369D8
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 11:59:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1stQfI-00065t-7G; Wed, 25 Sep 2024 07:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1stQex-0004nt-Bp
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 07:58:19 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1stQev-0000gS-R6
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2024 07:58:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so55289055e9.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2024 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727265496; x=1727870296;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxG1pTHM/NSuurPX9gvAD3cWu5ukbNMRWvWCXanTmwM=;
 b=LXs71Hw6ZQf52u6Z9GdJSUNP+9PjkSKyfF1ZJavxYK24HD1/1q442y+TngYOTh4bU4
 zi4e5B5aCRYwTxmYbPjZluXX9LWnqhM6zSYQbeQCTtscump3O6vwu75VBaVcp1TmgA7a
 X8228hGHra/nERThykdpKUobPbPwzJ5D3QKo1dMoJfWkawEc0vaGSZoKZri9DORVkUF1
 ZGCk7Q10Ycdwq6e1nIZ7+2hsyg5bYT7vOmGeKD//KNpZ3+Um/5wtQHf6jE3GYNE5sAG8
 4yvIF+8JwXCOduMdDDlhV0gxGwbGONmqbdS/A9mRhJm+jQQSGUQ69Mr1pCHFSygMaC2f
 w57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727265496; x=1727870296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxG1pTHM/NSuurPX9gvAD3cWu5ukbNMRWvWCXanTmwM=;
 b=NlMzhVUGfnmtj3mbitLSd4OULVa26y4ejS563gDQpK5m8JQH+a7dnzhXZh1oNozRpv
 2lZB4p4F1MSD8zx7sUZtLpr8jzmn3E4mONuyhiIWzEAqhNC7CP+0lYLCsjGmT8xvfb7S
 7bgWg50sAPnLbFGxDa8ObhXdrNCXPJjVUwumBpKmctwFG9lEHmISZIb0zrOC9P6Ckh1O
 k70PTD55puQ8JmXZyGKtAaM5Cp06P8odldXb3nOQ1v+8bcnFr+xUerEeQAsABQL1LrBc
 JSZ1gvpfC8J1HSFr9QKI2otfuotF/eYG/NV04PYoI/AWUzDzncaixEb0ErjjlZScAczg
 dMYQ==
X-Gm-Message-State: AOJu0YyS9WK+5Gkd2tM9qXV+OxiQ9ea8hRJszU4Q03Z8+We/8DFh8V2i
 8nzIzQcBvxYvUhJNCmNFHrvjuLoTunkvP169sKZYYqjYfzX7avi0P6MOxKRuyYgHZTOLC3q1nTg
 v
X-Google-Smtp-Source: AGHT+IE97YoSHJX+A7+uq6FwZlfZuHSSaPxK1bmJ48eTHbGz/WzWUdOOceesIdgZSOXVCFfe0f+cyw==
X-Received: by 2002:a05:600c:5127:b0:426:8884:2c58 with SMTP id
 5b1f17b1804b1-42e9610389amr14871455e9.4.1727265495927; 
 Wed, 25 Sep 2024 04:58:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2ab52fsm3770612f8f.13.2024.09.25.04.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:58:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] target/riscv: Add Ssdbltrp ISA extension enable switch
Date: Wed, 25 Sep 2024 13:58:02 +0200
Message-ID: <20240925115808.77874-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925115808.77874-1-cleger@rivosinc.com>
References: <20240925115808.77874-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add the switch to enable the Ssdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 65347ccd5a..4f52cf7ac0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -190,6 +190,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_12_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1492,6 +1493,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
+    MULTI_EXT_CFG_BOOL("ssdbltrp", ext_ssdbltrp, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
-- 
2.45.2


