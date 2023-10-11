Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89529CD6E77
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 14:52:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqaYH-0000Ky-Vw; Wed, 11 Oct 2023 10:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaYF-0000HZ-Ni
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaYE-0000X2-45
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so4849261f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697035864; x=1697640664;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwHF01c9nktEAEQ5rQOzWkKU72ZbKD1lV5cQuQm98cc=;
 b=BOaT4AU5HFE8be0MHebTdWyqZqv9PDuNopz78fgh8el9McGudEtVytnQ26006J/qwx
 tK+QZXRPCpJzIlPAnR+1LV5ebFFx7WTdMklpfOw6dWHTmoqDOA3Blo829Xf2B85cyIbp
 lF6mTvyZ8ZkOhkuL0jA7ht9znyc1Hm1bMeNxXNeT0Xud5e0Eg5JZEi1XimRdDM0H84CQ
 t0IZ2YwiGdzLcBSSEopEuDkLibfAwCF2hGrTg3tzoWRBluDKl5nCLogsMwaX3RsKHFbh
 hJF/70CAd6Q6yjZVONu9ybSp0RecykURftWgYwtwvFKtuj34TtPT+ZwRoDk+Ujz6z7JP
 T+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035864; x=1697640664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JwHF01c9nktEAEQ5rQOzWkKU72ZbKD1lV5cQuQm98cc=;
 b=GKC5hkPc+KWqgICWVYo8AEwWqGALFvRZoJ3t8jToRZhMsPvsY6X584TwwdcZywmP0Y
 +yBjvkc30U9uQ0G5DTdQoxCKGjrK+WHauUqBQmcbeQEIVzvFse2mOLy9GWkJcfQUSUKe
 u8GCmznz00DkZZNjvpVRSov5cSJYzrTgE1rJLCaIZVScQUaJGEKiOyHEKatr75n/p1kf
 KSx3wU/mYDhNXPpQcB2ILld9Y7FYFlSi2E6W6Q33y8JvGFBbvbpTlwiNDJVPk2D/6TMl
 j+fIM3x+/JziA3rEIzedKYh3CVCYUVhQ5B9POeCg4dmSEi4aWXEO3GbC3HeEh4sMyTHa
 gEug==
X-Gm-Message-State: AOJu0Yxp7QgYYHA0242gggRUudsYAVfyC88fm5j80pnXjk4JyHZPlpAj
 M1TLBEpgG+/xCrGnZlPVlqzWCQ==
X-Google-Smtp-Source: AGHT+IH3EF/G4tf4g/s3PJLc/3At3912ncXjjU9pDa1IEvaF8nRZyOY6/rFmPu2RCZqT4pNr7MwwJQ==
X-Received: by 2002:adf:e88f:0:b0:319:71be:9248 with SMTP id
 d15-20020adfe88f000000b0031971be9248mr18589292wrm.19.1697035864611; 
 Wed, 11 Oct 2023 07:51:04 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0040684abb623sm19709208wms.24.2023.10.11.07.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:51:04 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes)
Subject: [PATCH v2 6/6] docs/about/deprecated: Document RISC-V "pmu-num"
 deprecation
Date: Wed, 11 Oct 2023 15:45:54 +0100
Message-ID: <20231011145032.81509-7-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011145032.81509-1-rbradford@rivosinc.com>
References: <20231011145032.81509-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This has been replaced by a "pmu-mask" property that provides much more
flexibility.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 8b136320e2..37f3414ef8 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -361,6 +361,16 @@ Specifying the iSCSI password in plain text on the command line using the
 used instead, to refer to a ``--object secret...`` instance that provides
 a password via a file, or encrypted.
 
+CPU device properties
+'''''''''''''''''''''
+
+``pmu-num=x`` on RISC-V CPUs (since 8.2)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In order to support more flexible counter configurations this has been
+replaced by a ``pmu-mask`` property
+
+
 Backwards compatibility
 -----------------------
 
-- 
2.41.0


