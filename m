Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E511AE7AD41
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 13:22:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnfLg-0001fC-9r; Tue, 03 Oct 2023 09:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qnfLe-0001eR-MW
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 09:22:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qnfLb-0002do-KM
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 09:22:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c5cd27b1acso6595115ad.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696339318; x=1696944118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AehOG6GcucbJUsRSBJkdd1sV17cpGm9nmpjLlYi2tG0=;
 b=T8CYlJczPwxK0JiqQoD1P5aNKfaDhuDQwtlu9ZkwioZ4T6Y6ktq7QMyp7GfexiQIaE
 d1osyiqcKgukr/t1oHffXFFApSI4vQnq1I/N3XvpG4VTuEG138l1PVFw98bRhYuRXfU+
 s3Y8a//HRcofBTwUFCbNgBc0JCucf3IT2x6gIVaWGlLI9JPN1cjTvgvL9/wYgE1kB1Kk
 HLLDhFa/8KKL74Xh4dRsybAXQIelWUw1lmKulxz7R40ILfrW3UrWwz20mPU4TWe+XzFX
 geBJznveyVodZz5naK26nnzGHqH3Yx9VL1ytjkfGTUai3qVea0/hYG/0FJa4dcIa4Yyw
 /56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696339318; x=1696944118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AehOG6GcucbJUsRSBJkdd1sV17cpGm9nmpjLlYi2tG0=;
 b=a+bdUGnrUUbWZeuEvFalFB1YBMzXP5g8c2wOFgcASjsKpqjaQUWsx5x0p4wYwNynHY
 0FpZXoqlmJKdabXCJFS3vZ8VXQRghquDZRJtSSo0hALsjsbq/OmT4m6bKv7CsP5DnfYQ
 c56f/WfCLYBW5aGZl4kK05VTZm6DdP3vTvrJk+qrBUHouk6a89Binpxfam4f+R26Vt5B
 G2k/P7XnGLQzaxlnD/0i7G1kjzwbJx3OCeezzw4EGl7y3i+egPBJDSzCkNapr5uWv4mE
 eebSKdjff0X3rY8Z1/L6VpOgXMG4L9e+ml0SG1YUMAUWQ/gBql8n7lTQj8VoWF/S/oIt
 UNkQ==
X-Gm-Message-State: AOJu0Yxyy5BC0//9Y3ST+iM0XVsoSMCjGQQmurXqhAgQd3q2yvUyNV8n
 ZGgJj3qGh5PZEIrW440Wsa8YYA==
X-Google-Smtp-Source: AGHT+IGbtlulHcTvEXpgHVNaH0DD4S3Z7PniNaVOdmtWOwMZ431SYya9ST9BsJEF+0i6okiWkCKO5Q==
X-Received: by 2002:a17:902:e5c5:b0:1c4:56a7:b632 with SMTP id
 u5-20020a170902e5c500b001c456a7b632mr16669823plf.52.1696339317841; 
 Tue, 03 Oct 2023 06:21:57 -0700 (PDT)
Received: from grind.. ([177.94.15.124]) by smtp.gmail.com with ESMTPSA id
 u11-20020a17090282cb00b001bf11cf2e21sm1491777plz.210.2023.10.03.06.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 06:21:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/2] riscv, kvm: support KVM_GET_REG_LIST
Date: Tue,  3 Oct 2023 10:21:46 -0300
Message-ID: <20231003132148.797921-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

Hi,

In this new version all instances of "error_setg(&error_fatal, ..." were
replaced with error_report() and exit(1), as suggested by Phil in v1.

No other changes made.

Changes from v1:
- patches 1 and 2:
  - replace 'error_setg(&error_fatal" with error_report() and exit(1)
- v1 link: https://lore.kernel.org/qemu-riscv/20231003113259.771539-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (2):
  target/riscv/kvm: improve 'init_multiext_cfg' error msg
  target/riscv/kvm: support KVM_GET_REG_LIST

 target/riscv/kvm/kvm-cpu.c | 100 +++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 3 deletions(-)

-- 
2.41.0


