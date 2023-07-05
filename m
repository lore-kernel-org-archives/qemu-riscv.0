Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F6EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 13:32:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qH2by-0006JR-Aa; Wed, 05 Jul 2023 09:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2bv-0006H9-Sn
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:01 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2bt-0001yA-To
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:31:59 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e285ac32eso633245a12.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563916; x=1691155916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8csFKMjZVuRSRwCfVd0lvLcd2iu1cnTH6S6ysLgFoCk=;
 b=ZXp2zRjMqjof1A1zhHwk12O8UlT/rgkwakAG5D17jnA3VGSTNHp77qajrPAWOGSG67
 BBHlTwv1PBu2s7/g0k+SD3Phu4uyKuFkn8JobnQOMGvem2tV1KMLGfblFoD93vnl6TkK
 z4+JdiFXENKoxdXcFl/WterrOKiA0SECPqlFAyJ33SuiugbE/QE6M55ENQx5zxcVMpBc
 ZhTyxtxCtlHEj1HxdfXV1EI6Va3nj1AmIQcEc+sqHrkjwdO0zllbpqtvS9zZppXlho0+
 fxFx5+j44EQvuBhDsHCngtw0CRFmi8mQpQ+PknpMb4dkLUyq/sZP2MlKIe4AGHDjgKbT
 IhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563916; x=1691155916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8csFKMjZVuRSRwCfVd0lvLcd2iu1cnTH6S6ysLgFoCk=;
 b=dggQINyW6ngG40776UOrMuisSbcFTxzayhbHhGfvCf/ffVne7VNSc8F2oqCjTTZ8Sn
 3IcVAXPKSXFlJA+4kPOR9uC8b/PAcOBOqcEKYMl4M4gk81aIMkSGupGkYfiR2wMX+Caa
 2KstV4cpW/W7fwQs3zNw3cVxX4w7I2VZ682+YkYT6ilpdYyQEMfPOnHRIdFx/1pBzCTS
 WiNWvh3AN0C4wFWigYePAoufz36KQUQ0hHc5YGmb6CoKE4/a7GT4RQN3sWSarmmSm6e6
 0K1Ry91hATsrHzb6nU1o7x6CRUrfvtqxyPNvnHWHmPzE3lucLl95ffG52HFNGOF0rRiG
 05ZA==
X-Gm-Message-State: ABy/qLYED00iOq2EUGUbXZmWP/Jssfc3PNN2WjKbOYhCxTNlxh+7bmcC
 iZfhAPagiAAssh0OIjkUgjroTQ==
X-Google-Smtp-Source: APBJJlGDOh7LgVrmb2lvIuj7R0kmOi9bQcgjYdZ7LNPiwn7BmSDgYl762UqVj1hHz9c14Yoij6G91g==
X-Received: by 2002:aa7:d68f:0:b0:516:af22:bcc6 with SMTP id
 d15-20020aa7d68f000000b00516af22bcc6mr9477842edr.21.1688563916383; 
 Wed, 05 Jul 2023 06:31:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a056402028b00b0051e0272ad00sm5794845edv.75.2023.07.05.06.31.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:31:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] chardev/char-fe: Document FEWatchFunc and use
 G_SOURCE_CONTINUE/REMOVE
Date: Wed,  5 Jul 2023 15:31:35 +0200
Message-Id: <20230705133139.54419-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

Improve qio and chardev frontend documentation,
have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE.

Philippe Mathieu-Daudé (4):
  io/channel: Explicit QIOChannel doc is based on GLib's IOChannel
  chardev/char-fe: Clarify qemu_chr_fe_add_watch 'condition' arg is a
    mask
  chardev/char-fe: Document FEWatchFunc typedef
  hw/char: Have FEWatchFunc handlers return G_SOURCE_CONTINUE/REMOVE

 include/chardev/char-fe.h | 18 ++++++++++++++++--
 include/io/channel.h      |  2 +-
 hw/char/cadence_uart.c    |  8 ++++----
 hw/char/cmsdk-apb-uart.c  |  6 +++---
 hw/char/ibex_uart.c       |  8 ++++----
 hw/char/nrf51_uart.c      |  4 ++--
 hw/char/serial.c          |  2 +-
 hw/char/virtio-console.c  |  2 +-
 hw/usb/redirect.c         |  2 +-
 monitor/monitor.c         |  2 +-
 net/vhost-user.c          |  2 +-
 11 files changed, 35 insertions(+), 21 deletions(-)

-- 
2.38.1


