Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEj-0000ro-Bu
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEd-0000o8-1v
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEa-0006Ip-Aw
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oapXbLTqf6jmlB2c8yI8R/Rxrd0PQpmzXNP57+j3KT8=;
 b=ITcj2bCyUGfY4eYGjipXPuqGGNFn76QiRjHeJske33vNmdUAjkoz1I2Szq+nzc2CaD4Idf
 oMl3FAs8Y8yVYEC9Qw31svf/bhW35KYnQ7++lpGN7KLMOecKe54DYxI+xUDvlZQkX72C/7
 F++i+S3PPYpx2sxr0/glTYOkgY0s4cg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-HWzTtwDCOLiBlyqrh0uS4A-1; Sat, 15 May 2021 13:37:48 -0400
X-MC-Unique: HWzTtwDCOLiBlyqrh0uS4A-1
Received: by mail-wm1-f69.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so1668019wmy.1
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oapXbLTqf6jmlB2c8yI8R/Rxrd0PQpmzXNP57+j3KT8=;
 b=gQuCcZlrbhyNkUTs87jU9xrd7qE2GRO6r/1YiyXJ74fALx/Qn7o+iC/4EvlKAnESyH
 YHHguZQZ+/fJ8bL8eZqY5txvv85xAdS1qAIWxi1XwcNmcq68vqHL70Jk7KuSz9O6qxPd
 H35oB6MbObmt4Tv9dog9yFc/AEPp4tpfKwKEdXLDi8C1YafU5Wgtb07t20ncSmT9xQpb
 qf8NMrYJWpBPxTEZ/WmhatonaEFeg4tn438jTpIZMLCZB9XY+VsCtsyq85FmhHQUv79m
 6kaIK5WyTlecrDRJtAKVXwls2k02RlO4dTXbU30SZfcO774gu+KoF9sxY0bXVx+40MEI
 7/UQ==
X-Gm-Message-State: AOAM530ZhhkKI4yrbyPQ3uYs/DjOQ6wXgUcSHVh7vlYLfJQHFnroaNgt
 fC6tWjfGaY9XHl5kSKizIrUVQ9nKWJVE24xLedmQsxHqsaMFs9Njiejg8PpWhSBY1OurIHcBR4H
 R+KI4Q+orOWW0qMs=
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr23733763wrs.185.1621100267675; 
 Sat, 15 May 2021 10:37:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF4bawh4kel9iuIamVbm1PNlABSKwFlGKejs+jqDOchip+fxGFi0iYCbS25sCIV5UINTj1Hg==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr23733747wrs.185.1621100267514; 
 Sat, 15 May 2021 10:37:47 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d9sm10234096wrp.47.2021.05.15.10.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 06/12] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
Date: Sat, 15 May 2021 19:37:10 +0200
Message-Id: <20210515173716.358295-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
X-List-Received-Date: Sat, 15 May 2021 17:37:57 -0000

Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
emulation") added a dependency on the SERIAL model, but forgot to
add the Kconfig selector.
Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
building the MICROCHIP_PFSOC machine stand-alone:

  /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function `mchp_pfsoc_mmuart_create':
  hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'

Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulation")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 4cf36ac637b..2e4f620b13e 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -61,6 +61,7 @@ config AVR_USART
 
 config MCHP_PFSOC_MMUART
     bool
+    select SERIAL
 
 config SIFIVE_UART
     bool
-- 
2.26.3


