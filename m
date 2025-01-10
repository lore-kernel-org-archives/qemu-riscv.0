Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECAEE7719C
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 13:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWEu0-0004jp-7K; Fri, 10 Jan 2025 08:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tWEtp-0004eA-88
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 08:18:05 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tWEtn-0004ik-4O
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 08:18:04 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso1780612f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 05:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736515081; x=1737119881; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nww2x/16ova9wOscWNN7dGV8zOcHjOMR1T1dgwUW7Zs=;
 b=xX6J+WQK/2iBiRfxhIhlrSEEp4eBZf4oysuxP/NpidFIFYKJuCMTd9PjC9xIrYAdwb
 tb8d/OU4k1H9PzBtXlIgNo5iPZ4vGTEHkMuCqam+xv0xs4xnORBRBq4g0EIjAsQBwHP7
 Lc6D0/ivn5IBmituflTQ07mN3PnUtTHCZfyAcwGdJ4Jpa5KhOxefy9jdmZMz4yNjzIYc
 FwisgXG+KoGhtKbTnnu3fHkwnpFvWn5OnSX7Um64NovRIReBhu1qzrIdvtjXwQVlC0X6
 tMilgAlIFNUJJtW3qkTzD758DJF06j6WIvFpeddPhYVomLS6RAWTcBI4zasqW1XFWFrd
 ihRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736515081; x=1737119881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nww2x/16ova9wOscWNN7dGV8zOcHjOMR1T1dgwUW7Zs=;
 b=QzXEajNRjUy6qR+9mRV78N0GiXHTUtEQFB49VFHuwKpn+Z+dVpMUAYuQbFinCKAj2H
 Tk5F4VWJjM6KjT0N0F8rSSEk+sd+kE93X90rJ5+t/aNwv1oyrtQBpusuFrhz6EtU6qbC
 bO6vWiflWJI94sHfBpMO6G78OLw4vp7go/JkKWctBBWbJ+8mUgKQPqni3SK7aR5yZWfI
 sMcO5y+l1X/w6AGsIlSwh+MBu88MEM81ZHcTssyY7ucvENNpaYxx9juz5VIpLH0iTK80
 19Yy4QT1fXbMV8yGqEmaSupuMSsw4yOu35dWFvtqrNqWEjZEm+2AWAWtXeaZ31oCdoKN
 kjpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhwkZi5V+jLKfV0EP8xi/Qe8APBKSYeN2MeI0TqtyQ6zzCx39L1+SboJTg6PV3f2WNhsG5ckmRgQBD@nongnu.org
X-Gm-Message-State: AOJu0Yw2TsATQmdQw2e0rC4uysCmUcfm/UJro8DVO9ScyLwLgkLbFHIf
 r3XLA1PDH7qxR4n3SbvxHF+QNLiWwMEOm2aXrdC5ilcEphezYmdZNX9pbm7mWZFMQfZMZWzg2wJ
 DSj4=
X-Gm-Gg: ASbGnct+zXsqBbXhi0Sa6V4E8qOa7XCFWv7dPEMWjfOJrrV2rfb9qlRkyov8bAtzcMU
 MWm5Vye/bjNJip4mrlYjr8zQZ8Fr92VLOLQyoblNgSD680dCf3rGXLp4zzM7w49+qU82Yr0KP4x
 NTWzzJNzkJg9cM9BcV/hI56MXfUWuyqeIojQ5K/BrzF2pp25HdCnMt2fSTjJFjWfK2XGDB1Pp0e
 8zhb1skVhoKMsR65BVRGxpxata4723+5p1IGzmM73n4PV+oUr3qfXo=
X-Google-Smtp-Source: AGHT+IGZkTjA4JjmqTdD0RlZhXtylIocfA2IuJiQ2ENMx3k3u0LnbwBrBcuOOf0sjH6p0hnOsqm35w==
X-Received: by 2002:a5d:5847:0:b0:386:407c:40b9 with SMTP id
 ffacd0b85a97d-38a872eb4b9mr9990738f8f.28.1736515081414; 
 Fri, 10 Jan 2025 05:18:01 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dd1cc3sm51648125e9.14.2025.01.10.05.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:17:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 08DFE5FEF9;
 Fri, 10 Jan 2025 13:17:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 10/32] tests/functional: update the riscv32 tuxrun tests
Date: Fri, 10 Jan 2025 13:17:32 +0000
Message-Id: <20250110131754.2769814-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110131754.2769814-1-alex.bennee@linaro.org>
References: <20250110131754.2769814-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250108121054.1126164-11-alex.bennee@linaro.org>

diff --git a/tests/functional/test_riscv32_tuxrun.py b/tests/functional/test_riscv32_tuxrun.py
index 49b57cd428..3c570208d0 100755
--- a/tests/functional/test_riscv32_tuxrun.py
+++ b/tests/functional/test_riscv32_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunRiscV32Test(TuxRunBaselineTest):
 
     ASSET_RISCV32_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/riscv32/Image',
-        '89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv32/Image',
+        '872bc8f8e0d4661825d5f47f7bec64988e9d0a8bd5db8917d57e16f66d83b329')
     ASSET_RISCV32_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/riscv32/rootfs.ext4.zst',
-        '7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba')
+        'https://storage.tuxboot.com/buildroot/20241119/riscv32/rootfs.ext4.zst',
+        '511ad34e63222db08d6c1da16fad224970de36517a784110956ba6a24a0ee5f6')
 
     def test_riscv32(self):
         self.set_machine('virt')
-- 
2.39.5


