Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BDBC47DD9
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 13:08:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRu2Q-0000NZ-2E; Mon, 22 Jan 2024 08:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRu2N-0000NC-Rj
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:08:27 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRu2K-000127-N9
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:08:27 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B557D40C67
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1705928901;
 bh=Y4OKcKP7jlXBrFHkiLNfJJDWcrIJkeVaYwGrZWkItS0=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=lqyBn0l2VygWVLf2uf7ySYXTWWVd8cV9IPqh2X/6WHdKHy+yQ2nssn8YhCRcGva/2
 X6gWjvU8JyuuH3LqhYqlFZ6CqGGhzuiQB6+rW8rSfosapKv3ijQ7epEmrnbmjvmIat
 1G+8+lW5Tdo027rz/nWqggjlc4GHIPmNArCvQ8xG+0PEDWfJeQl7/fhQl1sWKJGGQ8
 tqX/HW9me+Accy9nKoo+Xx7Snm4cuwDTbz46u39RXXZexe451vRncoeJ/tXyB1tu5r
 5gjX3NuooHEJG66h0KnRGgquf55+nEKsN+YdONGJ+el330aeEOwFukqFgOa8ASmYii
 3FSZEDAmDo5IA==
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e439092a0so11093565e9.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 05:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705928901; x=1706533701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4OKcKP7jlXBrFHkiLNfJJDWcrIJkeVaYwGrZWkItS0=;
 b=gFOXTFsMFUbZ6qkrmqYgMa0OLeliZYaVpJ/dtyExw/3bY1zROqR/kG8LpQt17n82O+
 TUGV7Qrhn6yz2nm/J0xAucHNd5uDFQslubFMWH5spneJMcKxskW9BLe3bZ93U4XC+/6T
 GWKsPxAYRrWxXacWqduMHrb/cLbLKIgu35AEoS28htZIlSCUG4Z9dmS/C5LLLKqVE8u5
 ++jOfQb8WBbvehetJh5ia9z/1GbWXt0Y5IwpF6V0gaz/kjCOa/w+sfWlF1oDupHHMyFr
 UfjbpHdRaZtdQzbCB3EFAueytdFQQzx5bUTyMxp0iK5bfWZDWoerr5DijinaOFIrtwNU
 PLqQ==
X-Gm-Message-State: AOJu0YxFsDVU2NSk1EEAGR3yIFBJXQa9yx9CHd3fZ3hQvYDRFcxxOD/O
 CNM5La1uL+jHkvb2nYrAaFtWkNbVzleLZY2b2cQRyu0JWdF48HyRK+uFbCuT9LgeSoyZdctPQT4
 Nc6mRkxKEvWb9BYZ3m/e1rBWwDIDcmi3+jPA1MKXUITcdAG+9Ssf9hIi0p+PjcA7VJTfd
X-Received: by 2002:a05:600c:4d82:b0:40e:8550:4240 with SMTP id
 v2-20020a05600c4d8200b0040e85504240mr2193909wmp.138.1705928901270; 
 Mon, 22 Jan 2024 05:08:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKzk9riBbmoodjo8EiiNTIbYimuCnbmdUmn1JSPYm43Ve/mTooiUhTilMY8nMxM4+BlG2AgA==
X-Received: by 2002:a05:600c:4d82:b0:40e:8550:4240 with SMTP id
 v2-20020a05600c4d8200b0040e85504240mr2193901wmp.138.1705928900918; 
 Mon, 22 Jan 2024 05:08:20 -0800 (PST)
Received: from workstation5.fritz.box
 (ip-178-202-040-247.um47.pools.vodafone-ip.de. [178.202.40.247])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c445500b0040d62f89381sm39214456wmn.35.2024.01.22.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 05:08:20 -0800 (PST)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v3 0/4] target/riscv: SMBIOS support for RISC-V virt machine
Date: Mon, 22 Jan 2024 14:07:54 +0100
Message-ID: <20240122130758.74051-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Generate SMBIOS tables for the RISC-V mach-virt.
Add CONFIG_SMBIOS=y to the RISC-V default config.

With the series the following firmware tables are provided:

    etc/smbios/smbios-anchor
    etc/smbios/smbios-tables

Add processor-family to the '-smbios type=4' command line options.

v3:
	use misa_mxl_max to determine bitness
v2:
	set processor family

Heinrich Schuchardt (4):
  smbios: add processor-family option
  smbios: function to set default processor family
  target/riscv: SMBIOS support for RISC-V virt machine
  qemu-options: enable -smbios option on RISC-V

 hw/riscv/Kconfig             |  1 +
 hw/riscv/virt.c              | 44 ++++++++++++++++++++++++++++++++++++
 hw/smbios/smbios.c           | 20 ++++++++++++++--
 include/hw/firmware/smbios.h |  1 +
 qemu-options.hx              |  6 ++---
 5 files changed, 67 insertions(+), 5 deletions(-)

-- 
2.43.0


