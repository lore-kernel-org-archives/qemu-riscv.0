Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F6C4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:21:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQmwM-0004mS-Bt; Fri, 19 Jan 2024 06:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmwL-0004li-CB
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:21:37 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rQmwH-0008Tk-7a
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:21:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e913e3f03so7435815e9.3
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705663291; x=1706268091;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=os6SNkDfoRzsgcum8FORSFTROsuAbS5w8iIkZXmOfv0=;
 b=1SjlH7sFwQtYO0EldwG1D7KB7INAv4kqUGUL+OuIuZBYNC1Na8/Bejs+Z6gDmbwTRy
 BclyB+NWJjT0o5vSfYf93g7m+t8+4aACEd+n842T7v4JpwENCdhssON8s9GcWwghCPA5
 w8o8wvNi/a0t4NTZ5LNY6G3c2+uJMwPv/gY29JFXCwZO23x3hf6fcm5pa0xyrJGOGlAb
 YoqJJakvdgaEKjKhC6EU4+yZTxJbNzXqQqboGJTLhOQ+GUffq1PGzbTkUJIvSAN1N+MH
 UL/ewLZKx4SN+iYSGdSYl1W/9KHgwOKSsgE/yIF71EV5qEBCXZk/hD/vzxXRhgz8ecYJ
 xb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705663291; x=1706268091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=os6SNkDfoRzsgcum8FORSFTROsuAbS5w8iIkZXmOfv0=;
 b=k8CBv2Ftx5xqUEBCVEhTKjO1/GVDuT98RRgfJZyp79HEoItigGkjsghCIqYVc+YM15
 uIlrAS/fzM86EshCCCg8cj1j+6E82flTt3ZveovuXqAaC/wQg9KI7CH3hx5aT1TYwvBB
 FjwlglLuGrHzSo9TOgiLePJp7O1Ylfh6vtaeMLRuaOWk5JPxmbysUxctoDauWFjbT2OP
 LloXTPjHt7SP9ApCIBZtYTs7tEwkH65TrESfYQRQudBm5hXqL4G0AmlezS4Kyq65Mz/L
 f4Noem+0eRWwI+nWDiqukYK+4DAZZmCDTo3gmKtNswRu4Zvw8wyrbkCAG6GnpKh1iHUL
 Bssw==
X-Gm-Message-State: AOJu0Yx2i3wCLUZzWYHQl2dCHUMZtT/cQ1x/Yb/0ShGet02wJAQvSZH5
 KwOOfXA4o+Q6/8pI4x8cXKEEVPczDK2rc91sSwn8hZg+rvrvc+Hk7Yn3juv0nm4=
X-Google-Smtp-Source: AGHT+IFXU9Y1bZ6JWfcPruWZJKhflvv6SmZ0xRmTcg6G+IbvXGAyE0tE200mDkjiF/k0dhmTKlw0cw==
X-Received: by 2002:a05:600c:6a1a:b0:40e:499a:6734 with SMTP id
 jj26-20020a05600c6a1a00b0040e499a6734mr1552098wmb.60.1705663291515; 
 Fri, 19 Jan 2024 03:21:31 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b0040d6b91efd9sm32428067wmq.44.2024.01.19.03.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 03:21:31 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 0/2] target/riscv: Add support for Zaamo & Zalrsc
Date: Fri, 19 Jan 2024 11:21:27 +0000
Message-ID: <20240119112129.20067-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x329.google.com
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

Introduce support for the proposed new (fast-track) Zaamo and Zalrsc
extensions [1] which represent the AMO and LR/SC subsets of the A
extension.  

The motivation for the subsets being available separately is that
certain classes of CPUs may choose to only implement a subset for
architectural convenience.

Since this extension is not frozen these are advertised by "x-zaamo" and
"x-zalrsc" options. Beyond adding the extension infrastructure the only
changes required are to allow the atomic instructions under either A or
the appropriate subset extension.  To ensure compatibility enabling the
A instruction does not enable these two extensions - future hardware may
choose to advertise support for A and both these extensions for maximum
software support.

This patch is based off riscv-to-apply.next due to conflicts with
existing patches.

Cheers,

Rob

[1] - https://github.com/riscv/riscv-zaamo-zalrsc

Changes since V1:
- Fix commit message that did not account for earlier fix (Daniel)

Rob Bradford (2):
  target/riscv: Add Zaamo and Zalrsc extensions
  target/riscv: Check 'A' and split extensions for atomic instructions

 target/riscv/cpu.c                      |  5 +++
 target/riscv/cpu_cfg.h                  |  2 +
 target/riscv/insn_trans/trans_rva.c.inc | 56 +++++++++++++++----------
 3 files changed, 41 insertions(+), 22 deletions(-)

-- 
2.43.0


