Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AE5C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 05:49:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxL99-0002dd-C5; Mon, 30 Oct 2023 01:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qxL8y-0002at-SI
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 01:48:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qxL8x-0006wF-F4
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 01:48:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-280260db156so1425165a91.2
 for <qemu-riscv@nongnu.org>; Sun, 29 Oct 2023 22:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698644932; x=1699249732;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0hRCeRwfxj5e4fBp30kQZNEm7sQqD61LbWIJSIn+lc=;
 b=hdNfGkjtQJ4t7McWaFwA646QENZfcqdzsTUy9zG3Bf/1l/PGSNcz+gAZoGqPpB9ngA
 JksYH9sYKfkja+4YEj5+BTWsjk4eIR17O7qhG4vP4n1FT8cYaH1Uo5a7+0ODxi6F5KuU
 iqO2OcZfUmaeHb73Jh15I+46naIQkblYq1eN9bPN+R7Qa7vxsk3nIqmImWoJInAplbFE
 oxFzvMA8079SvilXl0c67RL1k2KBYaSvTnOeQLe27l6WwY1bQA2yAbZkJj+wrkecDS5V
 t+fwZQy+BJgJBehZAlPtUSFsxpJsZKZXxhCtFRmsXP3gC7jP9GW0KqXB7AYM/9uJyMkO
 ivxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698644932; x=1699249732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0hRCeRwfxj5e4fBp30kQZNEm7sQqD61LbWIJSIn+lc=;
 b=HoBBm85ut3KFm6o8pl1Mzm+nPzn0MKItP2YHbCG5yhpHEtPiEh6b38XzbKo9YQOF9S
 6xFcsVc6tBifS+UP6ta1tBfU6/E1aIt6qy/wv/fDz3cMBwy0C38uGreOT3IVd3RY6W8S
 qhp9hEV6bndddnE9F6ESZ+xnehdfrIWMZ1OjoOp3Pgz+kBl8tdwwRtqmKrLDw9nUf/t/
 QtiZIpO1TDC9Wb4E12oBgKVdl/7qkip1R3JJ8LhOcOOb/JVOAxQOqqFfLNb1gLdeKUKa
 xADgq5ZWoXmyDY4w8Ovl8QAy5thVsPt28obut9cXCAQCUxIAZmQpufsvubggRmSgipNU
 MkRA==
X-Gm-Message-State: AOJu0YwPmbteXMUo4cJwF1g9ztg9oux+zOmqGovHe3gn/ZljLMJgkyBB
 ETQBOwU4u2bTM+J7n9ApzO28IRwrhYtbP94XA4vmHQ==
X-Google-Smtp-Source: AGHT+IHNrs0CtMoCLei9eFcb7mVQvlxHgupfzhSpRtshG1fuMg+GE2VCsUKOwsHgv0sgWDUfmGdYxQ==
X-Received: by 2002:a17:90a:7786:b0:27d:7ebe:2e8 with SMTP id
 v6-20020a17090a778600b0027d7ebe02e8mr8119912pjk.9.1698644932690; 
 Sun, 29 Oct 2023 22:48:52 -0700 (PDT)
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with UTF8SMTPSA id
 ga5-20020a17090b038500b002801f183787sm3498464pjb.27.2023.10.29.22.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 22:48:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6 1/5] hw/riscv: Use misa_mxl instead of misa_mxl_max
Date: Mon, 30 Oct 2023 14:46:35 +0900
Message-ID: <20231030054834.39145-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030054834.39145-1-akihiko.odaki@daynix.com>
References: <20231030054834.39145-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

The effective MXL value matters when booting.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/riscv/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 52bf8e67de..dad3f6e7b1 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -36,7 +36,7 @@
 
 bool riscv_is_32bit(RISCVHartArrayState *harts)
 {
-    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
+    return harts->harts[0].env.misa_mxl == MXL_RV32;
 }
 
 /*
-- 
2.42.0


