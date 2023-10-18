Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8229DCDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 15:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt8j3-0001av-OV; Wed, 18 Oct 2023 11:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qt8j3-0001Zp-1Z
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 11:44:49 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qt8j1-0004xI-Ds
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 11:44:48 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507a98517f3so5005941e87.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697643886; x=1698248686;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRqVDcHMqARANKEFhhC2+XL6EbYrppRzGje9U4Xk56c=;
 b=g/P+GmzWu13jEhwy093JSd4bw5RSv189WKDQbx/8dQFoXzJVxlOLgKOD88LXRToyi0
 OMdfEB2IeMIPVouNkE6E6bvAHYfTDVdrAEFmnMe7no08nW4dZviWhLFY4cxgWcbZ6moh
 ZiXR4FsL5tffxcvORwLDQ/P1ynOHM4aC8f1EWzs2YAi02newxah3jEpVrYAPrEyzni33
 4AAU6H0+Bt1Ld2RK49dPX6JV269yooZctYvLsJDoKrAGz4yP9dsUdUcNMbg8wqBB4m8c
 drRHNT0gUV07IN7gveqx084rDCiF+ov4e/bf3dySM4X3xBju9yd5OYXXc68n5uuju05E
 QyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697643886; x=1698248686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRqVDcHMqARANKEFhhC2+XL6EbYrppRzGje9U4Xk56c=;
 b=GlgtE6a4q1zsZN4wASXcdaZiUZ5ryXK0Lohn2VJWLHVYL4Wn6G1G4arVvq30LzDUOr
 uQ3ic7tUSNRb0lHizSSY8K3F7PS/KMnU+wl0NNsTnTTjN6ItkNvlHxgoi7qLuRKdY99s
 gS8IJu4v2ApowBTBnK9pSwtLLFQyBdkv0j6QRw9CVE85oE4a1TonMq2ukaPLih3Xh+9d
 Uj5eIWFC3/X7cWwgaMFPJfQ0dP0849QgdnRWGbcLfmbWcWw1SFJTQTtpoasqwxyrKZ7f
 2LF6be/qobTa3vVJD+ETzJz9oSepmI6Lc5UxyrnuE+ZfOBUPPiAUA2vMjaNvRHohaNep
 loWQ==
X-Gm-Message-State: AOJu0YzFiXnrYyAdMiGV5m/1UrU2nGjXogo2KNWXHe+7LD9XhMVzA250
 ujA4jITvmZcwbM8zv61KytdtgA==
X-Google-Smtp-Source: AGHT+IE7UL5s+pZKTFVXYiEQO8p5f5uiQfM1vEfJj2/7uNU94Vxu0bFd5GytrYU7dbIAC8LyvuUuJw==
X-Received: by 2002:ac2:5939:0:b0:500:9dd4:2969 with SMTP id
 v25-20020ac25939000000b005009dd42969mr4176937lfi.59.1697643885813; 
 Wed, 18 Oct 2023 08:44:45 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b0040607da271asm1963580wmq.31.2023.10.18.08.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 08:44:45 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes)
Subject: [PATCH v4 5/6] docs/about/deprecated: Document RISC-V "pmu-num"
 deprecation
Date: Wed, 18 Oct 2023 16:39:13 +0100
Message-ID: <20231018154434.17367-6-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018154434.17367-1-rbradford@rivosinc.com>
References: <20231018154434.17367-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=rbradford@rivosinc.com; helo=mail-lf1-x12b.google.com
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
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2febd2d12f..857b5d4fc4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -405,6 +405,18 @@ Specifying the iSCSI password in plain text on the command line using the
 used instead, to refer to a ``--object secret...`` instance that provides
 a password via a file, or encrypted.
 
+CPU device properties
+'''''''''''''''''''''
+
+``pmu-num=n`` on RISC-V CPUs (since 8.2)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In order to support more flexible counter configurations this has been replaced
+by a ``pmu-mask`` property. If set of counters is continuous then the mask can
+be calculated with ``((2 ^ n) - 1) << 3``. The least significant three bits
+must be left clear.
+
+
 Backwards compatibility
 -----------------------
 
-- 
2.41.0


