Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797C5C77B7C
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:54:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uTkQt-0000qv-W2; Mon, 23 Jun 2025 12:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uTkQt-0000qk-C3
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 12:54:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uTkQr-0008BV-Os
 for qemu-riscv@nongnu.org; Mon, 23 Jun 2025 12:54:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4e575db1aso222578f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Jun 2025 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750697647; x=1751302447; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSMtoRfjtYjS0OHQ0IcsW9oDcdoXQSVzu3+TJhxMknk=;
 b=FPaHN6O5WZ0Rc02rAyBJQ+eh/pATjC1Ze73/PRNIkhpp0VXIDtNhe8tIgB4erluzXX
 RwNuOUdtynxevQWRHk/YhLjrfgnOpmtfKZtwpSbDSENpHpyzriGJXAN8aMlhmNVJyxrX
 Y9MnYBozIiq3JSeaO0yJ9l/mmjqKOxzAh2N6Wn6jmxZhluGtnprbpME6hPdLeUc17MKk
 +xwk7sZmvYhWgJfJu5aeHlpnbCA3RLuShL82vjqbUS2frKmoQ3KS9jO8HcudYVZYD4uE
 CHBS+asNYfN/gmo8Yyt6OHtqtVuIeQinNCglZaJt9lapQE5FZuTvAxGrlUbxsSgwVZyY
 zLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750697647; x=1751302447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSMtoRfjtYjS0OHQ0IcsW9oDcdoXQSVzu3+TJhxMknk=;
 b=sw0X/RRBR0rIxTyOAlO1OK6U9JusToDtq4b3C8+qFmawLSW6uutlg/Fe4fudmzHeo2
 cM4aKRyqyNsI29ksIB7BdpMbluTPhVk3qJTN5c6yEZi4IYP2g3uiEjuh9AKmx4eg4Kf8
 lTTE/o3t1jCyKBx8wtsnsLPvkSWAYSalT8v1K2zb8+WH6+axDUkPqGiymlnIFQBEAKM5
 txZfRZ3leRH2TEOheMlT+Diq2QlrewcI1YFFgTxEhHG6W4o9UCFDMRVVHZxsWQH5Pr6V
 7vumbRdw1YdtZCmH/jPCHcc4yg+c934R5yU5/eb7EsLgwhpUqqEygFh44PHf+cIUckUx
 fivQ==
X-Gm-Message-State: AOJu0YwFN5pnMcXtSyXYxX8H1v5Pe08ONFxLEQ2uQViQR9edcEnT7nWX
 QrWhjYaq1ZsxpkAECWBIr/c/pUt6a8Yn+RcSLG6R/yHkYwy4s3DU1UQPlJP0GRd3WKxOIZVvC/W
 xKIF8wUo=
X-Gm-Gg: ASbGncsO3hzLsnwoYJ6lUgjLDn1eBciNCF2uAlxT78NwVxO3QLzHGcXrOiCWP7gNfzY
 JyY+rqGcmyDjB6ydTgWWwLfQmmkz7juSAG8aLPeHOzjZoHjXnOyzuLqbTn1IkO8JTe8GsBPJ9S/
 dHvwDeK2SH2uL7rC2BEbYJjQcA+rN5jOe3V0QE8ooc2kIrAwPfDT+hlLohnwo0vcNkIdUEd/285
 5usB1k9d18UolYbZ7kE1+HYac9lsH+Wi3+SdkyCxs1EXGk4LpT8JhKEzA9Vsopm+ID/yYOIlla2
 UmQZUFxNL9py0QU2ewyf1lO2CGR6a39G7zisWdTONa0enOz5gQiDZkggewiWV9oYsx4=
X-Google-Smtp-Source: AGHT+IG9kEkLENdbXCj7NsjQqsyWARnc4v+e+OYyKdE4WMJ76TlhpAw8fg0ydAQYMFf0+FdYQhuimg==
X-Received: by 2002:a05:6000:230e:b0:3a4:f7d9:9617 with SMTP id
 ffacd0b85a97d-3a6d1185238mr3984855f8f.0.1750697647403; 
 Mon, 23 Jun 2025 09:54:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4536470826fsm114283435e9.36.2025.06.23.09.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 09:54:07 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/2] riscv: fix envcfg.STCE
Date: Mon, 23 Jun 2025 18:53:27 +0200
Message-ID: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=rkrcmar@ventanamicro.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello,

I reviewed a very unintuitive implementation of Sstc in Sail, and QEMU
seems to have a minor bug there, which is addressed [1/2].
[2/2] is just a sanitization.

I only compiled the code, and have no idea how to easily test it, so
feel free to drop the patches, and treat this as a bug report.

Thanks.

Radim Krčmář (2):
  target/riscv: disable *stimecmp interrupts without *envcfg.STCE
  target/riscv: disarm timer when writing past value

 target/riscv/csr.c         | 12 ++++++++++++
 target/riscv/time_helper.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.49.0


