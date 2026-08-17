Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3204C5DF66
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 15:07:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvyvk-00047d-6a; Mon, 17 Aug 2026 11:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wvyvi-00047M-Gz
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 11:07:14 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vvisaev@gmail.com>) id 1wvyvg-0007Bu-R0
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 11:07:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-cc11a905ba5so1696748a12.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786979231; x=1787584031; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jtD8y+oQJMTO5l25pUgh2yZ5hsiIXFvmFgX0Y8ILNUg=;
 b=FDoZZr6BceIUVORmqqCFjw58xdx1IlKfYvf7sJkRw1EK4dFE/zLOOotjrPBHmRDhvN
 Yo/AHCF2GdPw2jFzdru2m+VQnk/p8IOziydmBwTRC2qitDfXNaYrKKuCI/jcXMpaGhZr
 jIAukINyIe77j2olwFt3jRfQDvc+rUW6XsWRg6UWRmkntqfq+PcGFKvqhH3HNtEOGDZk
 2uMR3PRJyLn3IhwWVIArHCtx1bh1ewhjm0YiwEVcR5em+iWFap5ZuugSfnumRYaslMBZ
 iK/nB5KukfpMPDwb5TOHT9AYcbnMWDSYjB8wIurOFK0tbpn5PrREvIwuBsd5jLxiUbu0
 5Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786979231; x=1787584031;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jtD8y+oQJMTO5l25pUgh2yZ5hsiIXFvmFgX0Y8ILNUg=;
 b=h6y5k3iDuus/Fd38aiPltcSgSg6Cjx1nzySlrQDIhaW6nDm8w9N+/5d3sHCVYelFxg
 bZVo1gv5gcVVJLZi+9COPQ9MvF+nCvMTuKvY7cVZHQ6huwLGQet228GxiNs6sAoeoEyM
 Rc+EO9Yh5Q3DBxuD8HQQNYsvbAvUJ+N1pXyKNs0W0tbWH2RDt7SeXJ5A/MKUPOdJfE5e
 1ceyNZui0yljGg4fIBeIeXX5gqFRSGbXVFx/QOO5G2TRawWQ47WM1VkTi3cuHAeuM43D
 mCk1fQz4IMdcKizkOvACNkC0pK/7iuoj+BOFRVCtj0QGjLa8Hxnzh3jANBW8I08xSL15
 x/zw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoN7M5gnU3bjtWF4tJiixnKLY/Z5I8Nn8BzhZr8OCBLnoX8adLXUSCgxn+1fDDoTdl2RdP4zGMTSpae@nongnu.org
X-Gm-Message-State: AOJu0YxGPXJ4EbQbXyrpqDQUOF1n4dy+ztfEJ3VnoDoqlwwKYooNENze
 1EJJtuBEdU/A5u3ERqyoBw44q7lwwBbaGA+61qqTR7gKUYtkXPl7CTWz
X-Gm-Gg: AR+sD11F62DMMcQpduTb7vCSSDrsGcFEmEoV2y3li6QSmtFmtQVmylgzLmgVqCRNjv0
 5GBvE0Bf6k7Ds9mUaLtCP9EbUbwHOFzBlKBioeQ3kAEPIAxjVRa7XfpF5pjpFYGhxhquyEQHlQZ
 b4FK4e5gEIz4x13LbNVOxIRKhynRKxS6uDch8DUih8Ncv1AwI21hg3K4mcGO1VBlgoTt/1G1Cil
 2/j5lo+lVHVKWomgfatC6lXKB+53bvMm2HtEpbtL2x4nr/DTjb21egGMPvCIno++p4sWvUudUi2
 6/NV23gsy7j8KyYhClwNosTu0MClJZRAIJCfd7adgyeSCXfjbbHCR7+yv3q0EN4FHps4JJ3SPqc
 4KYIhcytJWr+nC0llHo/USZVcYCun89aqepzQ9EP+43jynk9dhMH9CGrk3YQg/raldhYnffsm3e
 buTCX+xPoCOJVSC92SyB6DJU3n+xFLa4CgnFi/ejx5SUU=
X-Received: by 2002:a05:6a21:998c:b0:3c3:6cfb:4ed7 with SMTP id
 adf61e73a8af0-3cc71d3bd15mr25784308637.30.1786979230683; 
 Mon, 17 Aug 2026 08:07:10 -0700 (PDT)
Received: from X1 ([178.66.48.90]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc13bf05584sm900775a12.4.2026.08.17.08.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 08:07:09 -0700 (PDT)
From: Vladimir Isaev <vvisaev@gmail.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org, joel@jms.id.au,
 npiggin@gmail.com, Vladimir Isaev <vvisaev@gmail.com>
Subject: [PATCH v2 0/2] Fix alignment check for misa write
Date: Mon, 17 Aug 2026 18:06:36 +0300
Message-ID: <20260817150653.40357-1-vvisaev@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=vvisaev@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Current version disable misa.C on misa write when next instruciton is
not aligned, fix it and add test.

Changes from v1:
  - Use the test from https://lore.kernel.org/r/20260321144554.606417-2-npiggin@gmail.com,
    since it is much more comprehensive than mine.
  - Add GUEST_ERROR_LOG on a bad write attempt.

Vladimir Isaev (2):
  riscv: csr: do not drop C bit on misa write
  tests/tcg/riscv64: add misa write test

 target/riscv/tcg/csr.c                    | 10 ++-
 tests/tcg/riscv64/Makefile.softmmu-target |  4 ++
 tests/tcg/riscv64/test-misa-w.S           | 88 +++++++++++++++++++++++
 3 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-misa-w.S

-- 
2.55.0


