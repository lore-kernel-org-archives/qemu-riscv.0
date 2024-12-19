Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515C2E7718A
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 17:47:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOKcC-0007VG-Gt; Thu, 19 Dec 2024 12:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tOKc9-0007Nr-KA
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2024 12:47:09 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tOKc7-0003Hd-JU
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2024 12:47:09 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2156e078563so10078855ad.2
 for <qemu-riscv@nongnu.org>; Thu, 19 Dec 2024 09:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734630424; x=1735235224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=22kRF8HdXYOmdtlNEd3I3IH68t3XkiVPSwqysQLAxG8=;
 b=dp841ASpDVRTr55aWACfV4o1gdXPcedUWGb03kLXPgp3ZZkKZnwoCpsmDTKglanReE
 1zdy2V2koqb3aTqPidUzxBgRnajj2BnjohkjCHda8MQc6HmlT03ietTufKz7w4Uchztr
 Chsri4JkmstZU2xiPJ5UJee3ovyHkYAqOUVO76LLce2pr+QOC6af8K9Mzpb9vtpUJl24
 c714NkSQe5ueIDcTgnVQ+JAUYF4NOwnDYm0bmEfZZbVkHSKekOifNP0EfR/SYV/lDRkO
 BCkAYFUPXEacqs8RznzMBcaEIzhlNc0r/fBVTzsN8mD5i4zVWae70EE8VmfWKQ/Zi6mf
 5IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734630424; x=1735235224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=22kRF8HdXYOmdtlNEd3I3IH68t3XkiVPSwqysQLAxG8=;
 b=qDFL4r7aqqNXWP0dGcjOr4lGzUqh75iB46vbdJ8dhINDc1uZ+o2byaxVHGyCBD0K4A
 LvQiJEOGz+DiGeMafYMt4Qn2zV1FVJCN2HH3MZWeGTFlLnvvAfFP92/itDZ1GpQm5Tex
 FkswYI1ckIK9aR2BINkVxSLjvAwU5IlEJf5aenAl+MTgnQvnqq2wBj3JLXWyJxC78rXA
 9NTIB19fYNmbkAe/+JEfGT95cgYkXO3oYzBCsz4qCAE+PRH54OzA8ae83fkTM/Rv39Yx
 k+vxjr9LSHYieoLGnGlP/4olvflMlGPkqT4Ueumg/IfIJ5FvaHcXggnF70Wj7AYoXrBp
 jmZg==
X-Gm-Message-State: AOJu0YyskA/xhc6u/foZRPIgSX+sta64B1omASg4L+dZ33ZovweNp2zA
 JFefNC2Y0xJpSfSvdnastdj6qdxnkLnj4agZxay830Ah7pgokT1b51efadwutrlUKrayGWYBfC0
 RaNLt5g==
X-Gm-Gg: ASbGnctaVvo2edMEu/ZZN5zhGbZiDgZXXtk7q5zqEoVDhLQ/xi89r8IMjS+R0MFkYqB
 9UELLtNHqhLkzHZ5tLLK9Gm2Xr5hcwn3ZyVCPWZFEDVU74FSOnMdZQwcMMfMcYrAl+YqxQMpBUG
 Vo3U/n4Nzx9VEGHPMZkAF3FGWEdzWubj+xO1IrQCTu/R69z9QKJ5n+ao4DqaKWjU9EbJz+g6zmr
 3W9boQwBNTlEdOPRrCVhsnVelSJO2ulZZUkfNYvAVotEe+QaFmo0X9Y0FL3s7ooBsTDf+mypxy+
 seRo9Ao=
X-Google-Smtp-Source: AGHT+IEjQ4BfJdNclFHSY36LWqwYqva6qotQNTWUkR37XLQcttPKJVSM6b5bVuVuoi0pcn+BcJ3Lvg==
X-Received: by 2002:a17:903:2287:b0:215:72a7:f39f with SMTP id
 d9443c01a7336-219e55d7debmr5077685ad.36.1734630424018; 
 Thu, 19 Dec 2024 09:47:04 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f7307sm15099505ad.195.2024.12.19.09.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 09:47:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv: add traces for exceptions
Date: Thu, 19 Dec 2024 14:46:55 -0300
Message-ID: <20241219174657.1988767-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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

Hi,

Let's add trace capabilities in riscv_raise_exception() to allow users
of qemu-riscv(32/64) to have a little more information when a SIGILL
occurs. This is done in patch 2.

Patch 1 is a "look and feel" patch that I figured was worth doing.

Daniel Henrique Barboza (2):
  target/riscv: use RISCVException enum in exception helpers
  target/riscv: add trace in riscv_raise_exception()

 target/riscv/cpu.h        | 3 ++-
 target/riscv/op_helper.c  | 9 ++++++++-
 target/riscv/trace-events | 3 +++
 target/riscv/translate.c  | 2 +-
 4 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.47.1


