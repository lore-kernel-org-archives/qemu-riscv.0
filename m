Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb712-000807-3d
	for mharc-qemu-riscv@gnu.org; Mon, 26 Apr 2021 15:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb710-0007xY-6w
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb70w-0008Ky-GE
 for qemu-riscv@nongnu.org; Mon, 26 Apr 2021 15:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rGYmFGSpmD7SNs4Dd7dBqyBwJ1kX06sUPV1mfcAm/hs=;
 b=fsQH2rk90rmH3TDtLE0hU8fe3CijGlopGY2XrWZICzU4nxu7qFbwsFgSGNLlpiuXLu6V3A
 eEhVVQJSNm4atEk6SM+3aW6whLw4u1X2eUDP4sVnSjzGTHGKKSk13ApogdbqM/WZBWQMwF
 w0gle9WcBAkVQwSHNpD9+X9cEam/0aM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-Adaim74uMRSXAnrnpvOIHg-1; Mon, 26 Apr 2021 15:35:23 -0400
X-MC-Unique: Adaim74uMRSXAnrnpvOIHg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a12-20020a5d6cac0000b0290109c3c8d66fso3541499wra.15
 for <qemu-riscv@nongnu.org>; Mon, 26 Apr 2021 12:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4tlfJuIet0+fqLYBCB2+24GYS/bGOp7U/9QFRE9R4U=;
 b=hTOlfeIrMUD8HHCgqkDsL/WP1STuxKp/DWHSWaG1JKUApS8/eO/cWfp7uqaYNwWF7Y
 0EJbLeJC06iuTk+HzoHAprpv6Slzl5aIGeOvt3Hb1+UmkxdPLahJz0mb89iS5tUN30Ht
 zLa4B5mZbkVC4YzqnEv4/EnyVPnmd8HR8EjqXsgY+hdycbcVnAvPM6Zp0FhCU1schKT9
 b9k5pxPzC6k/XfJ6Q676XtqznWH2IQ6M42xa3ywP1MervZAf0hhZkRMfPIGCZLH3ojtg
 4VgKl12rwnCJVsB2j+gMY5YKtBFP6433SgVhdVmPEkTaghh3XVrlwgUWzkJw/ihEn07c
 gwyg==
X-Gm-Message-State: AOAM531+uZms6j/cWq7aVItaM4j8pC3AfP7pqzV3Df9Q+EYPhkw1XCeA
 4jmIE+XK6u/RsRraCsH8wtOw8MB29x4lIDj0R4Nrn4ejvEfDCeJPBxStcSo9+EafRrV3Y88c56N
 XMNjPCLFUBBB+4U8=
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21355719wmc.150.1619465722408; 
 Mon, 26 Apr 2021 12:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo5S3dDxCKwaOJHvF2bXR/eQGdqtQq0frw85cImHFP8gJhPk+sY7LT6H2xmLNB23Z9pH+rrg==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21355704wmc.150.1619465722130; 
 Mon, 26 Apr 2021 12:35:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm1324888wri.41.2021.04.26.12.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Laszlo Ersek <lersek@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/7] hw/nvram/fw_cfg: Do not build device if not needed
 (Spring cleanup)
Date: Mon, 26 Apr 2021 21:35:13 +0200
Message-Id: <20210426193520.4115528-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Apr 2021 19:35:30 -0000

Hi,=0D
=0D
Quite a trivial series around fw_cfg:=0D
- enforce the FW_CFG Kconfig symbol,=0D
- add missing Kconfig dependencies,=0D
- explicit machines using the fw_cfg device,=0D
- allow targets not using the device to build without it.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  stubs: Restrict fw_cfg stubs to sysemu=0D
  hw/nvram: Rename FW_CFG_MIPS as generic FW_CFG Kconfig symbol=0D
  hw/nvram: Declare FW_CFG_DMA Kconfig symbol in hw/nvram/=0D
  hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG Kconfig=0D
  hw: Have machines Kconfig-select FW_CFG=0D
  hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub=0D
  hw/nvram: Do not build FW_CFG if not required=0D
=0D
 hw/arm/fw_cfg.c      | 19 +++++++++++++++++=0D
 hw/hppa/fw_cfg.c     | 19 +++++++++++++++++=0D
 hw/riscv/fw_cfg.c    | 19 +++++++++++++++++=0D
 stubs/fw_cfg.c       | 49 ++++++++++++++++++++++++++++++++++++++++++--=0D
 MAINTAINERS          |  2 +-=0D
 hw/acpi/Kconfig      |  1 +=0D
 hw/arm/Kconfig       |  2 ++=0D
 hw/arm/meson.build   |  1 +=0D
 hw/display/Kconfig   |  3 ---=0D
 hw/hppa/Kconfig      |  1 +=0D
 hw/hppa/meson.build  |  1 +=0D
 hw/i386/Kconfig      |  2 ++=0D
 hw/mips/Kconfig      |  5 +----=0D
 hw/mips/meson.build  |  2 +-=0D
 hw/nvram/Kconfig     |  7 +++++++=0D
 hw/nvram/meson.build |  2 +-=0D
 hw/ppc/Kconfig       |  1 +=0D
 hw/riscv/meson.build |  1 +=0D
 hw/sparc/Kconfig     |  1 +=0D
 hw/sparc64/Kconfig   |  1 +=0D
 stubs/meson.build    |  2 +-=0D
 21 files changed, 128 insertions(+), 13 deletions(-)=0D
 create mode 100644 hw/arm/fw_cfg.c=0D
 create mode 100644 hw/hppa/fw_cfg.c=0D
 create mode 100644 hw/riscv/fw_cfg.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


