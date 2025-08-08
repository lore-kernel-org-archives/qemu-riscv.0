Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70891C87FD2
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 13:52:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukNVc-0003ag-OS; Fri, 08 Aug 2025 09:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukNVD-0003Vd-4J
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 09:51:23 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukNV9-0002Gh-EW
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 09:51:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so1100571f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754661077; x=1755265877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=biukNyNLYj2YKv6lz0uhsiGlEtJOutmbXn7faU4jjQg=;
 b=DFiS/MOvuUxOPGGOP/oGmNrXQkUhjjWq00r/LD/8d6KKC9L+mN+nebKfmXD0T0EzXX
 HQ22MNAtjleyvhjgUy/v7KQ7FsBwBhrTlDvTX60qrWDmZTIZyy5wKj9vBEK2gU7OD04H
 wP9bYdkWumJ+v7uorXWmZGf3CV6bg0Z8L19YDxrWkEfOmSVI5c7NPXxPulfF3lSD14EU
 51GD9gNDboeuJ9wUpXFkKbtSTXez5qYRuNCbVEtZwcMc37Q9dP+QIm6/SUDhTe9MPj97
 xJT09UvQz1lBfKKq2AB1HrSMZ+HFymZ5PpFQCBFZvCB4vbllSA1IM0vksxpLa94Jt24q
 MYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754661077; x=1755265877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=biukNyNLYj2YKv6lz0uhsiGlEtJOutmbXn7faU4jjQg=;
 b=FSOFC/c8OWvEGi/KbQYu9HJNnIE1frjUGgtY6T1ePhotilMDKb7qhVABUQw51EGk15
 h5ezBLGg1ap7KDgkDxs/R6fr9mgY51FK9jMJWjdVU3tzrtfBnAT9pwwCtKZC2TDZx4u+
 znN30rodlSulY3DXURb/MeYwTfTrU3hJQz7dvucDFV8+RfOXaSv8XbpG22H3/BeUm7/K
 HxxTRQjxDC9JN8lDdweYKqvrkcuiUuxkBQQp4MRum8YEYBhW7a9/DlJafhCDkrG9+CuI
 1xhno+Lb4T1vWyfBROD0I9hcwo5lDZ5CN8SrNv3S2cgNMohOj2KMSXrQoFVSXyv+geTt
 Yh9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNn5WWs9sllFJ92iJ6rE6gehkWNxfDdtuYN8vbSr1TchEMeLHE9bNMs5YZ/0WVe6YlEEhfAhYfgDG7@nongnu.org
X-Gm-Message-State: AOJu0Yyj755LmLoCpMd6AHgUFFtjsqe2hWn4aPWz7VMT7rNCPpNqs+X4
 gGoDobSi/luIgQJPpFdQELQUxqP2KAW911j1Txjn1MFbfnyb607HOaVevY4lgH72WtqiFkxYA+U
 ccZPO
X-Gm-Gg: ASbGncvz6leVMvq0bp4+BtYbZ45ZggpLLYwM8rOPbRw7VALceAumulnOqb6gNxyo/RI
 aZGbd7SJEaqOX+9XvzIjnub36em0MEs3MYCu1enrjGZmFVm1QlmpenQLHc/pdTUipWo05RKKFeA
 mDUUiwkgTrN1nCxHDZeGQhVhj9yJBMv64L0A6vgRZbqYxRWuKGvF4bSzielOyKa7P/aBUcQkCHu
 4RtkC3Fn9hJPY1DD03+wl86sv9cpxe+qiV9O3VhExGaQybVc+P+cNe4g2QUiSl7t6jMPZpBJkgy
 kqEwfvOvuov39hatp9z1EvyvjV6hMDhzuvx4NG6kTu0c/Fr7u6/AN8mBb9wZ/9y+WmXJkGvFa7i
 w9ghPQC7CnK8XLnfCLlJWKxsxHoJkhlIYeX4C008cyEjH+FYakRQEnXSO2k0QQVe8vf63whOr
X-Google-Smtp-Source: AGHT+IFAsuzEdFVn1Y1yktnXSP7JR1iU51QdI+ig3MK8CHl2toQKS98jJC2oZd5G22H3C37zyCHMuQ==
X-Received: by 2002:a05:6000:188f:b0:3b8:d3cc:8dc with SMTP id
 ffacd0b85a97d-3b900b5040amr2669729f8f.28.1754661077220; 
 Fri, 08 Aug 2025 06:51:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf956sm31134697f8f.24.2025.08.08.06.51.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Aug 2025 06:51:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-block@nongnu.org
Subject: [PATCH-for-10.1 0/2] hw/sd/ssi-sd: Return noise (dummy byte) when no
 card connected
Date: Fri,  8 Aug 2025 15:51:13 +0200
Message-ID: <20250808135115.77310-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Trivial fix for the issue reported by Guenter here:
https://lore.kernel.org/qemu-devel/5b2dc427-f0db-4332-a997-fe0c82415acd@roeck-us.net/

- Return dummy byte when no card is connected
- Add a test

Philippe Mathieu-Daudé (2):
  hw/sd/ssi-sd: Return noise (dummy byte) when no card connected
  tests/functional: Test SPI-SD adapter without SD card connected

 hw/sd/ssi-sd.c                            |  4 ++++
 tests/functional/test_riscv64_sifive_u.py | 22 +++++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.49.0


