Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A4EC61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cic-0001nN-RY; Fri, 24 Nov 2023 15:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cic-0001n7-1z
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:06 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cia-0004zN-CN
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:05 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5c19a328797so1633509a12.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857443; x=1701462243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zol07WndEtzA359SFbV4aOY0NN/F9L7ZSgrocBATYoI=;
 b=HXILFr3B0HLX3v98qkjQ8QFr8nnJ9TF4lHJdHOBSyK+XUi/ctSLd3ZwhOuZDAg6udF
 CMVokvcq+alLNKRzCxBLARHSDSZq02xk6MM1xi2hmSL8jmvqccpyuW+nIsqEFMxaXfd2
 zozz+i6tV5apUDrqUHzcA9zy0kOxF4rEasK46prS1tTGrGK2X+oYH/9Cra1gqwlH+KOu
 +7seMbb7gE5cg3zP48Iq03hjh2RhSqtGQ57AdiJNvpkkmHzKBLkkGFdggI+iqv1YqGZ6
 +18YCVp6ivQ8XOZ0lzw3eXuLqEyBbDLW7bwklf0KX5xyAWSDKAGu2aCxNYj/nAJQQWns
 t2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857443; x=1701462243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zol07WndEtzA359SFbV4aOY0NN/F9L7ZSgrocBATYoI=;
 b=cif51irpLMPUqskLMu4T0GIY62bjjfRjLGFpPyrPVSFSULRQVGzcrYVYw273or7oS+
 3WNTuRkLuxadF79JTRQ5ajNiSEKmjU9dtUZGfEJIPgkCKc2exrxI6NbTJX9wbFxLPDuT
 Gecewmq0htAV0OYFl84bCMIXOv23U0eFTd5np4a8wFwY57liYLwSe6MC9TC6b4ByaYwA
 iaVOGi3PP4ywIBkN7PC+3lmKwmD7PUVZ5M56eJdYT1VZ/PzUwQrYNq39qdkjdjRxgaBT
 OUw6HZOXgnCRbeOjkw4aRpZYRFeh2ALrZb0tZFH+wEhKfMgG6US0g9gHNNfz+ALUwWA6
 R5Rg==
X-Gm-Message-State: AOJu0Yy1pxTBCb5Nm7oHaXY07j0uMzRfknpPGSyK/DpaeGfgvWSo6Mft
 rPR0dYNcqpcT0F+9TcXvsE5oYw==
X-Google-Smtp-Source: AGHT+IGvKmSnCzHVzn0hyr6eY3b8N2SwT40+294DxW6DCX19i3TWyqsj4Rp5Ujp1uuWvijgAFzMIJQ==
X-Received: by 2002:a17:90b:3e86:b0:285:93f0:b2b1 with SMTP id
 rj6-20020a17090b3e8600b0028593f0b2b1mr2739488pjb.38.1700857442589; 
 Fri, 24 Nov 2023 12:24:02 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:01 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 00/18] riscv: rv64i/rva22u64 CPUs,
 RVA22U64 profile support
Date: Fri, 24 Nov 2023 17:23:35 -0300
Message-ID: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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

Hi,

This new version contains naming changes suggested by Drew in v11. We're
also eliminating riscv_cpu_validate_zic64b() and open-coding it inside
riscv_cpu_update_named_features() since it's not worth creating a helper
just to do a single assignment.

Patches based on master. 

All patches acked.

Changes from v11:
- patch 3:
  - rename cpu_validate_multi_ext_priv_ver() to cpu_bump_multi_ext_priv_ver()
- patch 6:
  - rename riscv_cpu_validate_named_features() to riscv_cpu_update_named_features()
  - remove riscv_cpu_validate_zic64b()
- v11 link: https://lore.kernel.org/qemu-riscv/20231123185122.1100436-1-dbarboza@ventanamicro.com/ 


Daniel Henrique Barboza (18):
  target/riscv: create TYPE_RISCV_VENDOR_CPU
  target/riscv/tcg: do not use "!generic" CPU checks
  target/riscv/tcg: update priv_ver on user_set extensions
  target/riscv: add rv64i CPU
  target/riscv: add zicbop extension flag
  target/riscv/tcg: add 'zic64b' support
  riscv-qmp-cmds.c: expose named features in cpu_model_expansion
  target/riscv: add rva22u64 profile definition
  target/riscv/kvm: add 'rva22u64' flag as unavailable
  target/riscv/tcg: add user flag for profile support
  target/riscv/tcg: add MISA user options hash
  target/riscv/tcg: add riscv_cpu_write_misa_bit()
  target/riscv/tcg: handle profile MISA bits
  target/riscv/tcg: add hash table insert helpers
  target/riscv/tcg: honor user choice for G MISA bits
  target/riscv/tcg: validate profiles during finalize
  riscv-qmp-cmds.c: add profile flags in cpu-model-expansion
  target/riscv: add 'rva22u64' CPU

 hw/riscv/virt.c               |   5 +
 target/riscv/cpu-qom.h        |   4 +
 target/riscv/cpu.c            | 134 ++++++++++++-
 target/riscv/cpu.h            |  13 ++
 target/riscv/cpu_cfg.h        |   3 +
 target/riscv/kvm/kvm-cpu.c    |   7 +-
 target/riscv/riscv-qmp-cmds.c |  44 ++++-
 target/riscv/tcg/tcg-cpu.c    | 362 ++++++++++++++++++++++++++++++----
 8 files changed, 519 insertions(+), 53 deletions(-)

-- 
2.41.0


