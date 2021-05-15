Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEw-0001Wn-BS
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEu-0001Th-O6
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEs-0006UZ-4b
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1x0uvyxiT8wyEBGvclqUmai2RCxtpbNXg1x32V8Mlyo=;
 b=c8vy183nwAqY8Jc5TTcynXIben/a5AnJDPirOEQyjDgkrDk49eMctIM7atX7v97UvmM/cT
 VCN25qJXHX9x8N71IrCclPZ5HUCbAyxpNMgmFPavtX6RLUslhdTndKv2EUnKYJgh1QcZen
 L/qsOtY4A0z4wN77Ki1+RFjDeh/YpLE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-0rfzqoPwOuGR2Uh725aiQg-1; Sat, 15 May 2021 13:38:08 -0400
X-MC-Unique: 0rfzqoPwOuGR2Uh725aiQg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so441028wmc.7
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1x0uvyxiT8wyEBGvclqUmai2RCxtpbNXg1x32V8Mlyo=;
 b=SC3DEtes0H4naU9p8WJwyOj1JKmwJFmphrqfxkuL5B9KelNPXv0guwTmH1aG7OsVq+
 tJqGSCgoHAOO8YcS8YBidcFIRiokhHVUQnNdRAJG9/Dk/VTp52OsttnxwJ52GXoUszXP
 DVfLg8MbAJ/r1oy5bvnPwgIUjtmQ0urzaH5FE+sLgw0MYegV4XHNLn/ENr4wu/rroipk
 qxRHcIF9pvcMdT1YPAZy1vmi8yN5xhG2+TLEUrhFHL3UQDo5LZs1wGZos8gB4bBtcm5K
 b976RQHY8s4svyiW8Xv12/ZGewCBojiy2ry/dDmUGVsb8Q/vSn01F/Jllv5R4H7cd5Iy
 KtVg==
X-Gm-Message-State: AOAM533lsxf0WVHVrN9nIczaE5cKOUHRjSwQiFhZq4gTN/YkaDQ/CbkO
 jaqKrMIr9j1IBW2q5BQ+SqZThbrBJYRmkVqVlNyl6EJIP1v1RXWxz/PJq7g+YUcXycsk9WecHaD
 fQJEdjZZ3z8PamLk=
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr8049122wmn.34.1621100286154; 
 Sat, 15 May 2021 10:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMTrQfpdVRUBxDdDTshuD8xC/K1JOLeK8ZGZcE4rK22H2ZM89m7JZ4Xv21inLYBWjycqc9PA==
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr8049108wmn.34.1621100286043; 
 Sat, 15 May 2021 10:38:06 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j14sm10847304wmj.19.2021.05.15.10.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 10/12] hw/isa/vt82c686: Add missing Kconfig dependencies
 (build error)
Date: Sat, 15 May 2021 19:37:14 +0200
Message-Id: <20210515173716.358295-11-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 17:38:13 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The VT82C686 device model misses various dependencies:

  /usr/bin/ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_realize':
  hw/isa/vt82c686.c:622: undefined reference to `i8259_init'
  /usr/bin/ld: hw/isa/vt82c686.c:624: undefined reference to `i8257_dma_init'
  /usr/bin/ld: hw/isa/vt82c686.c:627: undefined reference to `mc146818_rtc_init'

Add them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 55e0003ce40..0703512209a 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -49,6 +49,9 @@ config VT82C686
     select FDC
     select USB_UHCI
     select APM
+    select I8257
+    select I8259
+    select MC146818RTC
 
 config SMC37C669
     bool
-- 
2.26.3


