Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C242E7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 14:01:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLNGN-0002MG-H7; Wed, 11 Dec 2024 09:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman.artemev.92@gmail.com>)
 id 1tLLGR-00071O-Bu; Wed, 11 Dec 2024 06:52:23 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman.artemev.92@gmail.com>)
 id 1tLLGP-0002Ox-Tt; Wed, 11 Dec 2024 06:52:23 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so7679406e87.0; 
 Wed, 11 Dec 2024 03:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733917939; x=1734522739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3W8anVnzCvGr/wiDjhCflF0Q58pWbfW1fNMjI+jMCwM=;
 b=kt0gwf1YlvdGW9VydxXEx2OJObhQVSxcdqijWdY5d1WFhc4wUhqbVDNWP4MYEVM7L8
 fuRG6WrWBReFRYk1t3f/h0WSesB6ltTWCamBOIU0kOar5R5UBrVw9BvPKtBUwg4WmiJi
 nFLKVcxFYgwG3kzfGgh4DVtjUMZD8AVnvZ5CMjFROck5HNvUXCUAUYrPXMQuXoz8/jJO
 Vuxk6o/Jc8IIVYlQMP7XqQZ+XccbzzNpZLqdS1OY4nl4i/iw/Pkta6EO4bbGYcLdTd9x
 OSlnpy/ZPse53bSKQalpAv2G1RpUkguzdkJoA+2jxiqln9rZ2Awg5OBq0kNPa/rqGkI5
 VbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733917939; x=1734522739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3W8anVnzCvGr/wiDjhCflF0Q58pWbfW1fNMjI+jMCwM=;
 b=aN6narujwkSi/hXhJFtuXVnfz5dV6O9fehBM7uElgJoanEeftfdT6thHZtV6Tj3TgG
 8EA/MvuYhfDkBAZU+F66w9dSYrrDfBFC60Mism2Mjq8GWBj6guELHeIUfyCXltkh9e8u
 UoNVGIPfbm2TQu8/xjE/cnlQGgvjU6yb5o98TpqdskyRVbqm/v74Civ+k3uqYtwOFfCv
 M4qWHKK9NaniUQfyZ9tbqaFm/PeaAYBKnBWqWWXdEeRzUcKAyvBqhwXJKxQCguHz6A/k
 ODWZ7KVbwsxFkFn5Sp+dpwiJjKnEKoz1nmXgdnoPaRd89n0mi+3S7iLv1xGwSYxSps3c
 wMNw==
X-Gm-Message-State: AOJu0YzmiVgalpOAgLiyEo2i6rbfJq+UjV/9cOid1r59kw0CDVtQotkG
 ZZck7zDpFICAu4vBkHrr+kyD69D9z4mg7QEYGEfXCoQ66j39e21SdZxZWcdY
X-Gm-Gg: ASbGncvOfCpnGeKOXVO8mX5R71DiLUvLXeMK7B1I8zjXyCNhiZPQRbqpgxK7Ak6TJu2
 3PpojVCWA1BdrQdkLQbV1gKisKxVc/eKEeaJ2KTG6Obw2Hcnvw/QJ6ZsU/aSuPIqVT7+FmQBpWW
 od0LH2EuCs2/kdsjF4ZmmLRC40OXgH6K0fJFSU/XXPIdwqu9qsGqbunkdIprJXnqkilKZmPCz+6
 0Yr6Myc7x4LNgOj7biJi/3VySAHyByliCHtLkwAdpztqa7h/OhfVxtOXN/ytZZ+WWCvHkOTUT45
 Kg==
X-Google-Smtp-Source: AGHT+IH56ygjg84mAc/anp6IU72DQCAKMvGpXfkyLVWPCBCObAeGpnPTqKndiwCzXQ6/QtvsMnOSBg==
X-Received: by 2002:a05:6512:3096:b0:53e:3a01:cf4d with SMTP id
 2adb3069b0e04-5402a5eb68amr722551e87.31.1733917938408; 
 Wed, 11 Dec 2024 03:52:18 -0800 (PST)
Received: from debian.corp.yadro.com ([89.105.198.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22975264sm1997896e87.92.2024.12.11.03.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:52:17 -0800 (PST)
From: Roman Artemev <roman.artemev.92@gmail.com>
X-Google-Original-From: Roman Artemev <roman.artemev@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 richard.henderson@linaro.org, roman.artemev.92@gmail.com,
 Roman Artemev <roman.artemev@syntacore.com>,
 Denis Tomashev <denis.tomashev@syntacore.com>
Subject: [PATCH] tcg/riscv: Fix StoreStore barrier generation
Date: Wed, 11 Dec 2024 14:52:12 +0300
Message-Id: <20241211115212.2803407-1-roman.artemev@syntacore.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=roman.artemev.92@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Dec 2024 09:00:26 -0500
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

On RISC-V to StoreStore barrier corresponds
`fence w, w` not `fence r, r`

Signed-off-by: Denis Tomashev <denis.tomashev@syntacore.com>
Signed-off-by: Roman Artemev <roman.artemev@syntacore.com>
---
 tcg/riscv/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index f8331e4688..96f9a7e348 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1624,7 +1624,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
         insn |= 0x02100000;
     }
     if (a0 & TCG_MO_ST_ST) {
-        insn |= 0x02200000;
+        insn |= 0x01100000;
     }
     tcg_out32(s, insn);
 }
-- 
2.39.2


