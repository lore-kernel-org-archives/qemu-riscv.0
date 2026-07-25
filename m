Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366DDC531D0
	for <qemu-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 12:03:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnb5f-000632-Be; Sat, 25 Jul 2026 08:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wnTQq-0004qh-2n
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2026 23:52:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wnTQo-0005xS-Fk
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2026 23:52:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cfbbdfa60bso10906645ad.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2026 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784951529; x=1785556329; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=6dFRLJCIuK8K51JYGTHe5j8n8fDntlIRsDnj9x+IWW4=;
 b=dpGLs6efZGgD57A/1rWuZtqWZ1eNBMeu6Ckcix8FMEwInEkbmsNm4QQZLsZwm6YciU
 RnCTt62tRVQ27LxKWKhInhGVs4WlKB1YhxH2GHFfOW+8vF7H73bEqhtCXPA0x8uaSH7a
 7VH2d7oLjgBF17Tb7WiIS5zEtq1q5ypCq77wKf+WflGfbb007nlSWKgoJ0vAS9Q7dnL6
 4oVGfB11sf1b1KXhMjbpRrZ+/fTMaotwohPYMLi9SCE3058SZKP7Uk58EgTCghuTb21M
 ez1oDXDK8ZQ5SrwqC1bihYw176liXm3JeY3+fhS3Mzh74NQNsr0r+ZqC7MrQZxI7CL18
 rK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784951529; x=1785556329;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6dFRLJCIuK8K51JYGTHe5j8n8fDntlIRsDnj9x+IWW4=;
 b=gZAOIuh51vpJItX+GxwwhB9zu1e+MFLAu2CDfVvnKbPCvwfxRK8ygXJwAT7QnzbEU3
 XFQu0aSf/99nGN+NhBmYiCdm7jn1dBkFAsXBYLjGDuTLMg6Vd/z//IVEZxoi3lqXNZM6
 514skR5UOEYPFDuxSF+/qwDjesS8OSf1HP0qzNoklrF6t9zJlKhFOtEnXTV6zxz/3EN6
 h4ja5ia9iU3X8XG6UyUKQI9MXNVmCt9qh7qqGOjZj0Nr3aMJNohGsfPvFRa22Kx4QXI4
 cH8E7VdTOKlb7RkSD0IgD2e1RxDZ3CG+i7TbASsJ5oA32fToKalSFDDOj7BcQUpBmhsZ
 bkGg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrr94/xy22Cf4GoemG9VwrihaE6ly0x6uyRjh841XeuJA1lNZooWLIxYHPCHZYOLxMuBq493Q8D/SQF@nongnu.org
X-Gm-Message-State: AOJu0Yzz2qfjhQAt/JCUuEvUQHfH3/4GAiK9zQfBeGkxzEUOn3Rr+LW6
 sLZg6jFITzlDw3B2/3JP0TE1E/IhWna9BrmxJPu3bUyvrs9u4WQxTQlx
X-Gm-Gg: AR+sD11u/o4kPjcvimYUxm89ezqgKNuSdapA5M1Hro2p5Eps9Q5OgtuiDhQ+98rYBmX
 hb9cN1TswhAQvRNMJ/7tXK6ml/ffsQDRw7Hj0KdrUQcPfXpCVadQ166HzZK0okhBm8X/zgloxDu
 vViOnzsXuHXyUSZvnHmL8a82P5KBJkrtXJ7SYek6MWbtDamo8ji9Qk3URkgLiLJMDzOnonC2PVb
 xy48lByEiAZcOxa4dBErciDn/gBlZJ2Ow05R5DefxyhlIf8ifuqGdZcCiZFxX9XNsm0wUD4jFOd
 uRHwHS5scNlicGwu0X+ujNjhFHRH5SS1A+jyf5+w5Ssb8FQz1B9igCs3EH/JiBpy0NRuKUc8sRQ
 8gTAuduKk7o7Nr9XNnX21eVfqqoNPUUdCZ0+008Xed7TTyxx29JqaygKVfEL2MV35CxHSK/7hdZ
 qU
X-Received: by 2002:a17:903:2446:b0:2c9:97a8:afef with SMTP id
 d9443c01a7336-2cfde8673a4mr9628515ad.40.1784951528612; 
 Fri, 24 Jul 2026 20:52:08 -0700 (PDT)
Received: from [127.0.1.1] ([183.6.125.102]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde5c8337sm4109975ad.20.2026.07.24.20.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 20:52:08 -0700 (PDT)
From: WX Chen <wxchen0913@gmail.com>
Subject: [PATCH RESEND v2 0/3] riscv: Add K230 DW 8250-compatible UART
Date: Sat, 25 Jul 2026 11:52:02 +0800
Message-Id: <20260725-feat-k230-uart-v2-v2-0-d5fe82c47c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOIyZGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNT3bTUxBLdbCNjA93SxKIS3TIjXcO0pMRUAzPLtCQzMyWgvoKi1LT
 MCrCZ0UpBrsGufi5KsbW1AFi9RG9rAAAA
X-Change-ID: 20260725-feat-k230-uart-v2-1fbae069fb66
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784951524; l=1598;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=t3s0n52K6syGOckb8m4qMRqobLTZd+klY3EaiVPmOnc=;
 b=cj4xcfgGow95m/qHLDIBs0UiJOxdl7PSB8VeXAlVMJke9mbivPiyLbP9cysJml+SXfbKffC4p
 LEpxOUYXqp4DUI7HrlCvcPoTJTAXH7QGwiYtUWVPpuYl6elC5n0K98t
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=wxchen0913@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jul 2026 08:02:50 -0400
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

This series adds a QEMU model for the K230 SoC DesignWare 8250-compatible
UART controller, wires it into the K230 SoC, and adds qtest coverage.

The implementation supports the registers and features required by the
Linux 8250_dw driver, providing an interactive shell over the serial port.

Changes since v1 [1]:
  - Split into a 3-patch series.
  - Fixed indentation of preprocessing macros.

Resend with a new sender address due to unexpected issues with the
previous email setup.

Testing: 8 qtest cases pass.  With the k230-boot-assets image from
https://github.com/zevorn/k230-boot-assets, the driver probes
successfully and the shell works bidirectionally over pty.

[1] https://lore.kernel.org/qemu-devel/tencent_FE5823EA5F7A9EDE163FEDCB3DBFBE1FD905@qq.com/

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
WX Chen (3):
      hw/char: add K230 DW 8250-compatible UART
      hw/riscv: k230: connect DW 8250 UART
      tests/qtest: add K230 UART test

 hw/char/Kconfig              |   3 +
 hw/char/k230_uart.c          | 840 +++++++++++++++++++++++++++++++++++++++++++
 hw/char/meson.build          |   1 +
 hw/riscv/k230.c              |  33 +-
 include/hw/char/k230_uart.h  | 180 ++++++++++
 include/hw/riscv/k230.h      |   6 +-
 tests/qtest/k230-uart-test.c | 514 ++++++++++++++++++++++++++
 tests/qtest/meson.build      |   2 +-
 8 files changed, 1565 insertions(+), 14 deletions(-)
---
base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0
change-id: 20260725-feat-k230-uart-v2-1fbae069fb66

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


