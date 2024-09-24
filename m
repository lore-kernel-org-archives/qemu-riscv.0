Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FACF9C6B
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 12:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1st4u0-0003Qz-LE; Tue, 24 Sep 2024 08:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1st4ty-0003Hu-5v
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2024 08:44:22 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1st4ts-0005sK-0x
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2024 08:44:21 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-5011af33774so1881673e0c.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2024 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1727181854; x=1727786654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bD/viDo6JM7IXonR+1a6W+9s+7PzvfpmT4iPCS6+01I=;
 b=MS+Jsvw/mu8dpIJMIxpdzxsidNRZOSpIs8E2vSC5E2J2MHClVKnfhldi0bCUWPvVX1
 2AmD4TNPjorIo1mfUr8InFJuXLSV5HEQ59lhInuP+QGkZ1KDSaW0BjS6wJnRHF8UTBzF
 Yxdo2BGQzaSNf46IClYN2t1MVMu336rKOw6gNyvPrMpYQl0tHjvGYewPMQx6QwLOIbLT
 4h0GoDIyiijbP8b52YLDwy73DVXLUQ5wVgjS7LxYetsRfx+qKQDJxqIiV7bv/Reys8Ms
 eOFSaalHW0HSbPbZK8XTJiu2ew0T2pg7uyZDjKVD9UXgVsk2tj15fnG1dhGN74tWWX/W
 ZB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727181854; x=1727786654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bD/viDo6JM7IXonR+1a6W+9s+7PzvfpmT4iPCS6+01I=;
 b=RQQmAVwNnOocsfSPWQ+9Rfgl2uPLdJSFwv9Tipz3BphW2bM5/GWx70P46huMsAdPXs
 ric2hfT7UyBvePuHBOgcqtkVQUBVZ8OO08W+73bl8F8JaZvnVoccp7uE4wv3z2d/BHcW
 tk/GK5AreTvXBBPeq/DPkEPUNq90+6+18RIMBEdWtk4fK6AgFap9wZUJiI3BYoKmY5jC
 0rstFtoMPGZet7GCwPIoafg486fuJyiD5XogfNtg7ikkxdpEms4uEO1dH9RCXoXh9b+3
 PL2kIBw0zoP0PfbJyeWrF8g1j5hU5W49NhQwik9JZenXTKS1QRRz/Jtzs0pLcpwiTWWu
 PgUg==
X-Gm-Message-State: AOJu0YwEB3xi8pIdxkDnr93b0v3kAQSY5KLPWFrUT5vhp5R0Jg309IZa
 uEgPucIRC0f+6ie/aL1yGLskIzIpohJWZcEG76h4Yt6JXP+GlplilF/e5bXVXAE=
X-Google-Smtp-Source: AGHT+IHNgBeO7uOrUElIpEnwXxnx9ZDS0+hJMUpY153CezwkxunBtrpzZxGSkePiSPwIuWIvxvMSLQ==
X-Received: by 2002:a05:6122:a1c:b0:4f5:1787:18aa with SMTP id
 71dfb90a1353d-503e3bbd764mr8746689e0c.0.1727181854350; 
 Tue, 24 Sep 2024 05:44:14 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([187.101.184.93])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-505aa10a8fbsm767830e0c.49.2024.09.24.05.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 05:44:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/4] target/riscv/kvm: add riscv-aia bool props
Date: Tue, 24 Sep 2024 09:44:03 -0300
Message-ID: <20240924124407.766495-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2b.google.com
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

Boolean properties are easier to deal with in the protocol side (e.g.
QMP) since they don't require string parsing. We should always use them
when applicable.

This series adds 3 new riscv-aia bool options for the KVM accel driver,
each one representing the possible values (emul, hwaccel and auto).
We're also deprecating the existing 'riscv-aia' string option. 

The idea is to use the new properties to enable AIA support in libvirt.

Patches based on riscv-to-apply.next.

Daniel Henrique Barboza (4):
  target/riscv/kvm: set 'aia_mode' to default in error path
  target/riscv/kvm: clarify how 'riscv-aia' default works
  target/riscv/kvm: add kvm-aia bools props
  target/riscv/kvm: deprecate riscv-aia string prop

 docs/about/deprecated.rst  |   8 +++
 target/riscv/kvm/kvm-cpu.c | 100 +++++++++++++++++++++++++++++++++----
 2 files changed, 98 insertions(+), 10 deletions(-)

-- 
2.45.2


