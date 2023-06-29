Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B2EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqUR-0005oj-6r; Thu, 29 Jun 2023 08:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqUQ-0005oR-6i
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:11:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqUO-00009g-NB
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:11:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbc0981743so2550475e9.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 05:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688040667; x=1690632667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=crVt0PUYaWefUp4ycq3idc+nQ4l4Rcdpxjf5x3ai73Q=;
 b=sC+6e+eLn4lpngTFneI7nXuDTHPgCw2uYH4qwwSbunP5JybT0ZLKUKcONsePMfd+qH
 sbCBTX1IUce/wUXfmxHRXv9H9bHj4y5JwOUrD4pDEosmmpDm/+YLNKN0FU3jIiAGx8fb
 32fsHJUjTUCgMG2hLlwe+lISsreEXCPKE7BrxU4SVNsarwTA6ZSeNFCbeMX8dEbYWvfo
 tMfhQpzpajbG1VSKWuRdY/u7SRkNpRWIGvFQNAHyrcS+dWD2n+7tpeDZMox+J95XdCAf
 RMFwapf8GHDw8Rzqcw15pOHLtLs5me9YMvRtosSVaZsDqj70Adhc3tkzhajh2NkbTl7/
 ibiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688040667; x=1690632667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=crVt0PUYaWefUp4ycq3idc+nQ4l4Rcdpxjf5x3ai73Q=;
 b=MFNsmUMSZrYI3XwdNEK3qFhX5eYL+5UhHD7tlV8cty3DBH02C92+FtCj+uJgvVxJn3
 aDIHXQ5f5ghEjRT8nBNYE4aw51+mprwNIQLrVlLmmdufS7S8nSD6euW+RciZyE6/osCC
 ga7BIJ2VK1oI6/Ezcrke4m0id9sl6zGobS49vwuhDEIcAv+oqefG4/uK79XPn9NG7PYN
 +/DgE3GZd1wiIeaiWHEVYmDOuKaKQBCsOiv52m0nAVz1XsQXpefCEIf4rsrmih0aiGgg
 ku+pQJ48Edf3uqsYrO+KaDnYS/2lOx59v9KKjKLVB4cV55mk8H1DGh9oLD0LgfWsrESD
 xxqA==
X-Gm-Message-State: AC+VfDxxW+vq0tENrps7VeMsCx90ZWuDefYWU30q9H8FpbYPRTKrzwAf
 qDcxVEzpeuGTtYFZOq6+YK6Ulg==
X-Google-Smtp-Source: ACHHUZ54OJ006myM+UTc9PK+F53fyO8rEC2DUGalkNGm+/29rqP+dsyzycaE72XW3yrXBzr9iDK9+w==
X-Received: by 2002:a7b:ce94:0:b0:3fa:99d6:4798 with SMTP id
 q20-20020a7bce94000000b003fa99d64798mr8601752wmj.37.1688040666824; 
 Thu, 29 Jun 2023 05:11:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a7bcc84000000b003f9c8c6bf53sm16308043wma.13.2023.06.29.05.11.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jun 2023 05:11:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/riscv/virt: Restrict ACLINT to TCG
Date: Thu, 29 Jun 2023 14:11:01 +0200
Message-Id: <20230629121103.87733-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Do not assume !KVM == TCG, restrict ACLINT to TCG.

Philippe Mathieu-Daudé (2):
  hw/riscv/virt: Fix 'controller' typo
  hw/riscv/virt: Restrict ACLINT to TCG

 docs/system/riscv/virt.rst |  1 +
 hw/riscv/virt.c            | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.38.1


