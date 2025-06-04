Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8ABC5B549
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:38:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uMs46-0000P2-BS; Wed, 04 Jun 2025 13:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs42-0000M7-Gt
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:38:10 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uMs40-00033Q-22
 for qemu-riscv@nongnu.org; Wed, 04 Jun 2025 13:38:09 -0400
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-23035b3edf1so1058025ad.3
 for <qemu-riscv@nongnu.org>; Wed, 04 Jun 2025 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1749058686; x=1749663486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I1II+3YQnG90HksUR5dl1/2JKfZzGM6a2Go/eJtjLcU=;
 b=fzQZ9pcJ/TyY2ENkK+nJzyTWjCEsZmRoee7/LGm2EhguYvLmybROn16TDddx0uM/De
 BeBWoP0pNdn3DYv2Qbbig6APxK9rvTXnWiNUZG/AScX31xCaXowHO08mbPyaVrp97W3S
 9Nec6VHLq94D6vAZ9NKLqEoD7Na1asLj+m47A3Brpag6JfhNt3fiHdsOiub0OV7BwC+b
 mZqnsJ4aGVRNdj0srzR9nInY8KG+e46wtmqCjsscfxvp1nbRIdKNx+aDMWb4MFdoIhMA
 +/l3NyypA9a4dTER7jjRC0ckEj4KQOesplAyLP0umlaYTfcMKk3VXtx0B9TNK9A0bLMt
 K74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058686; x=1749663486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I1II+3YQnG90HksUR5dl1/2JKfZzGM6a2Go/eJtjLcU=;
 b=XEliLhMLvFYCLWXF9DGBEF/9T2iEVLCovR9x9Cj59Q0JJAaDfx+UZgqQu3iExibW98
 +dU7Urfv+Dsd0Oj2QYA3P/gHAYyBzIb105lNps5HvoP/b2wpSAqoj2ebDzgTBYiRH/mB
 qFnm7OzZtf95yae71kC6xFMuhntgXd7QPWTqDs7ygp4PlHo1POHKbohcda+dD57kAOgY
 2ZUKNB8U+SGUp1NBfTkNkl5BYJbZTXwHY88uD2rqRBuR6ID4kvg5hGR0HxbUC2N0g8Sj
 kjbvmUMl09M1ScdAULY5sKRlEYm2T00hy8vMN0DBlXihfeEyJbVSCj+ETX2G7TPvvTrr
 0V4A==
X-Gm-Message-State: AOJu0YyA9YKLG8SYOMCVg4alSBFmP59fQmrvBaJc27uCAUappKqB+wEU
 4adPtb6qptCU7lGBlfjG6KgaRBtSf/GMnTdrFzbSSYE1XBy8Yp0X7obYvPUaGLVB17I=
X-Gm-Gg: ASbGncsz98VFdjBght4HMAvC1/BIOmYW3LjY+jT542A7cisq4Lb4VUfyAF7MLTMNWD6
 IF+pHgHzB+aCZa9vOd07U7jw88GeGqJFlkiTFqQtg1cO5b4l+QrZthCQJXuo1nEEPIMyQvye6fj
 L6ktM5dXYfX7C8dyuAmAqNW1t0Orl3W6KVTBn++NuYc0EEdXSLWj9Pl4khHckXyoxUV2ZGlQUUY
 bZNJCOOizUzMKWQzG5MjoCqokLQXcuxIAorVwExaYIN6iCND1BzdKScKQZHgOF+LBtvklo+FOSC
 qMdiYhcjIRydZnO3wpXTl4L3HHY4QVlMLQVYKqz0a4CXRfC0RYBTNXUUFDTkAwiJ6WXemJxAIKh
 elV3Xlggv/kDxJcw=
X-Google-Smtp-Source: AGHT+IHB22/IF/9lX/non3K2V4Yyxxe+IOmpKek42afG0wPqGvqX0FsqLmI/rPZ5dWT/7FPgi8reoQ==
X-Received: by 2002:a17:903:1b67:b0:234:c8f6:1b03 with SMTP id
 d9443c01a7336-235e1518a75mr48265395ad.47.1749058686564; 
 Wed, 04 Jun 2025 10:38:06 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.188.133.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cfcbb9sm106913215ad.208.2025.06.04.10.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:38:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/3] target/riscv: add missing named features
Date: Wed,  4 Jun 2025 14:37:54 -0300
Message-ID: <20250604173800.1147364-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x644.google.com
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

In this version I fixed the problems caused in bios-table-test qtest by
patches 1 and 2. 

A small change was also made in patch 1 to avoid spamming "Disabling
sdtrig due to priv spec version" warnings when running vendor CPUs
with priv spec < 1.12.

Patches based on alistair/riscv-to-apply.next. 


Changes from v1:
- patch 1:
  - skip the warning and disable of 'sdtrig' for CPUs that have priv
    version < 1.12
  - update bios-table-test
- patch 2:
  - update bios-table-test
- v1 link: https://lore.kernel.org/qemu-riscv/20250529202315.1684198-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (3):
  target/riscv/cpu.c: add 'sdtrig' in riscv,isa
  target/riscv/cpu.c: add 'ssstrict' to riscv,isa
  target/riscv/cpu.c: do better with 'named features' doc

 target/riscv/cpu.c                |  16 ++++++++++++++--
 target/riscv/tcg/tcg-cpu.c        |   9 +++++++++
 tests/data/acpi/riscv64/virt/RHCT | Bin 400 -> 416 bytes
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.49.0


