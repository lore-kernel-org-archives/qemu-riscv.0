Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEA-00080m-Re
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyE9-0007xt-9k
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyE6-0005y3-D4
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7JNqGEjQzQh7OAwfD8mh/1OVsfJJeJzp5VYzdc52DQs=;
 b=ZiOswclJPp9CpCyRBKqiqaxEt4nCt8uqvXbN0BTRe8fVUMC5sJroNV9soEYsIBJjkcmiYg
 Fc/UKlqCcAm53Ur1OY+XZvI/k+ymygd9xfTtHkio3euTHJ6owOS05NUyEMtPFfz0QtRM2c
 lPmZLquZmRFQkheSgbrSO6SbrIDo4k8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-hco9XBGUMZmuKufBYMN3qQ-1; Sat, 15 May 2021 13:37:19 -0400
X-MC-Unique: hco9XBGUMZmuKufBYMN3qQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1648176wmn.9
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvGopyB6K56XtfZZaGA35lYiaZ9SoAOR2uPwQdOkn9g=;
 b=opHpykkxOnBamckxk0z273o/oA5/wlLcyBYOxKKBIzO/0TsrTNJU5WnXZWv8+LZNw/
 05KOnRXHNAsDNUPQN3UBx7HXnwKNekhjGnR6fWWAsa3FxiyQyGRqYuwaPoEWc5wioXeh
 xSXaD9JOA6ekYCF1CF5gRfwXMpG/ASRzlRjcoguBJJoJSuONgiuZmXEVt7lP/xMwwDui
 EaMTJVOvJlu6n7KHD8ClUnx+qUMaBFZgoq71BJnvp5rkB/0KHrpdpPKQCj1aZEB2hH6+
 9LxYHmT3Lkq2hDRdo2IZFjMtL1WiVLloMKqrfBT7tIwyX72Qm2p7axjEe0Fykp/sQMx2
 8T3w==
X-Gm-Message-State: AOAM531kQ5dLYavQyHf1bun551OGdGIgJIqRCJSGLL5hPCxR60JcPkP/
 uFjjYcmHIlRQdV59FqaerT6w0/mcxUO2YQgv51n7VOB3ffB3X1sjJ35O23ku7j8UIUiF/Rg/3Kw
 NgeBCPC848Tw+1IE=
X-Received: by 2002:a7b:c206:: with SMTP id x6mr15222797wmi.72.1621100238781; 
 Sat, 15 May 2021 10:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydm6CoStYZBfM1kSqoIWHoht4u3i907Pi+qQNSNZxrddpb4lKaHW9WeyVqR9qPburQXgD1LA==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr15222780wmi.72.1621100238606; 
 Sat, 15 May 2021 10:37:18 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h15sm8174283wmq.4.2021.05.15.10.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 00/12] hw: Various Kconfig fixes
Date: Sat, 15 May 2021 19:37:04 +0200
Message-Id: <20210515173716.358295-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
X-List-Received-Date: Sat, 15 May 2021 17:37:25 -0000

Various Kconfig fixes when building stand-alone machine binaries.=0D
=0D
Since v1:=0D
- Fixed Pegasos2 machine=0D
- Removed SEMIHOSTING related patches (will repost them later)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'=0D
  hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV=0D
  hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS=0D
  hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board=0D
  hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25=0D
  hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL=0D
  hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines=0D
  hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC=0D
  hw/pci-host/Kconfig: Add missing dependency MV64361 -> I8259=0D
  hw/isa/vt82c686: Add missing Kconfig dependencies (build error)=0D
  hw/isa/vt82c686: Add missing Kconfig dependency (runtime error)=0D
  hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA=0D
=0D
 default-configs/devices/ppc-softmmu.mak   | 1 -=0D
 default-configs/devices/ppc64-softmmu.mak | 1 -=0D
 hw/arm/Kconfig                            | 4 +++-=0D
 hw/char/Kconfig                           | 1 +=0D
 hw/i386/Kconfig                           | 1 +=0D
 hw/ide/Kconfig                            | 2 +-=0D
 hw/isa/Kconfig                            | 4 ++++=0D
 hw/mem/Kconfig                            | 2 --=0D
 hw/pci-host/Kconfig                       | 1 +=0D
 hw/ppc/Kconfig                            | 3 +++=0D
 hw/riscv/Kconfig                          | 5 +++++=0D
 hw/riscv/meson.build                      | 2 +-=0D
 12 files changed, 20 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


