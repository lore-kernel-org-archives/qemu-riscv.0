Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEA5C4707B
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 04:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNPnK-0003x2-2N; Tue, 09 Jan 2024 23:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rNPnH-0003w9-Kh
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 23:02:19 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1rNPnF-0007w6-Kx
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 23:02:19 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so273579a12.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 20:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704859329; x=1705464129; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=B9VYd6p2cowcyrY5xrLrsUO88JEYC9+34V/ihqnKpyM=;
 b=H4QxcRNK7OA3Yo1DCaia09aE043FPAArnW0J8d2K93GFd9rYL4zJXjjLd8l+bPJ6uk
 sxRo3UnQrARbvN1ApVH+kuitalrlxF5aQkn+BBqKRK0P/Byzofnq5GvRdq1SpZO3S3v9
 37lJ9YWBRGjuQV+ZkTdsPFtFEP99tdFrc9oyXhEHE9ujELSvFH0qrwMNfnC8nGq+MvH8
 0dFoAthWk2hUTJv+tsjBOmqtO9N6t+SiW6f3CGZ0BEL7k3sUgtWJDpz9b4ToaM4etMOt
 zjjim4iqhV1QRWE+PcKONy+jFeeAY5n7tc6i0HZf9wMKy2FdVlNYXHYwJGv7sRGQeLVW
 eS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704859329; x=1705464129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B9VYd6p2cowcyrY5xrLrsUO88JEYC9+34V/ihqnKpyM=;
 b=bhhrSluDplp/VkISJjVZyMo+HmXeZTcb19l0EsnlRjIrXCeMIOsY+0wEaN2Fyzf02p
 msjsdJKLyE98RTueytzIUVraN1C7A1M0wOwYIKmBGdvJ1nWQ627JTxQHZC80B2DaXg37
 9eqkxutk1uc0367gsl91LTinbxVsUFfOAWL5RcfrNISAaaD7gN+pN86YrwUf/B9DpUWW
 1jWwRIpi9KOtx3KgYX9fFM+uXeZSxQTF2QtR3E84grWVt+SC7WXrLh2i+eq2X5UGZD8w
 afaKnICSnTds113v0d8ctehgopeLJe3rM+WQOcbaJEfcARMg3+CZfR+B5EVMGCdNA8kp
 fFfw==
X-Gm-Message-State: AOJu0YyQdmhBap0hQBxk7BkpttdbNrww+A8BLM5tBX/TXkkWYo3eNu0P
 fIBonpTRWkt4P9gst6bxE52r7SkWNXcTPL3QjYUdQO2LpEs=
X-Google-Smtp-Source: AGHT+IGw05qTTf15AGfRf3LPFAVuajEMrOsVuh5gmrfzDNnSeWkqC4lZNC8WZc9sKVX/PWgg2q5xnw==
X-Received: by 2002:a17:90a:fd03:b0:28c:fe8c:aa93 with SMTP id
 cv3-20020a17090afd0300b0028cfe8caa93mr615257pjb.1.1704859329142; 
 Tue, 09 Jan 2024 20:02:09 -0800 (PST)
Received: from brahaspati.localdomain ([152.58.210.84])
 by smtp.gmail.com with ESMTPSA id
 ca8-20020a17090af30800b0028cf4cb2c85sm313893pjb.40.2024.01.09.20.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:02:08 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Export debug triggers as an extension
Date: Wed, 10 Jan 2024 09:32:01 +0530
Message-Id: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pg1-x52a.google.com
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

All the CPUs may or may not implement the debug trigger (sdtrig)
extension. The presence of it should be dynamically detectable.
This patch exports the debug triggers as an extension which
can be turned on or off by sdtrig=<true/false> option. It is
turned on by default.

"sdtrig" is concatenated to ISA string when it is enabled.
Like so:
rv64imafdch_zicbom_*_sdtrig_*_sstc_svadu


Himanshu Chauhan (2):
  target/riscv: Export sdtrig as an extension and ISA string
  target/riscv: Raise an exception when sdtrig is turned off

 target/riscv/cpu.c     |  2 ++
 target/riscv/cpu_cfg.h |  1 +
 target/riscv/csr.c     | 20 ++++++++++++++++++++
 3 files changed, 23 insertions(+)

-- 
2.34.1


