Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhEND-0002bj-12
	for mharc-qemu-riscv@gnu.org; Thu, 13 May 2021 12:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENA-0002Vx-5B
 for qemu-riscv@nongnu.org; Thu, 13 May 2021 12:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN2-0000wE-WE
 for qemu-riscv@nongnu.org; Thu, 13 May 2021 12:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjYvOAyPTrpSNhVqdAN7BGoQLHD/mxypL8yaob15sP8=;
 b=d/2nrCJ+P8jf4ZmHRa21qIKT0wzxiEG8neyC0ei4N/lLFgnQKKEFLXrbldW+EEsXX9zoIt
 FpE+qhk+msB7HFuGSGJ+Vw52zMPZYo9P6FXMKn9Fl3eaEswinSytuDQtcQdBGjhZI9Vamt
 pLqHUXHvkEOGOC7iL7wl0VXbtaYnKog=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-rZPhTBf_OumsI_nPAtxRgw-1; Thu, 13 May 2021 12:39:30 -0400
X-MC-Unique: rZPhTBf_OumsI_nPAtxRgw-1
Received: by mail-ed1-f69.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so15017633edq.23
 for <qemu-riscv@nongnu.org>; Thu, 13 May 2021 09:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XjYvOAyPTrpSNhVqdAN7BGoQLHD/mxypL8yaob15sP8=;
 b=mBinVCawtfA/9mw1WZJvZ0PE2bn7OeC7pOJmhkm7C9MPRKng/DS8UZ0prlveyUdb1B
 4V1GQQg979iC4rp+WSI3/LXebNKpBGQX1/okjrUK4DVDxmepWK8nMhn/5PNoWA9Q+hEV
 ovx5b8aWx6VzoJ8jisHkSDICnDrMii2Fj/boqDwfVl/ubWeHJhPCO8xgaSW9wP8Hu4Ul
 ROmkARk5GuThSVMzHHeSrsYoTxI7DfPSm9Z5ltdG5+H5toraFoNpBrI6t2JodJuSpw6a
 tpt8ngHUK91S2WdSXyH0YaW4aD9/l7OnIPEJQBlSp3vMIOcohPGsIjHtQ47Vx+o+z1RP
 f05g==
X-Gm-Message-State: AOAM530hrfX1++u1eA8eArbUrtl2z9yNVt2EvXGWKCaxAPNYpYeUCXsw
 1pIb70lkqd1Pqj7J9V2Ci9jGpBt1N7/IfBV34IOImbl0nvd21VXVaXPllDZVlGLRo0uIB3dgyXw
 RKgSDyqgjfP0mc9c=
X-Received: by 2002:a50:eb47:: with SMTP id z7mr52056281edp.68.1620923969236; 
 Thu, 13 May 2021 09:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQQR8VCvYN64Fsq/tEUlN0mpcNMtt2b6hN9PG/yK7gHSmibN4yT03uqEfFRMs0WBiaNdkRSw==
X-Received: by 2002:a50:eb47:: with SMTP id z7mr52056264edp.68.1620923969072; 
 Thu, 13 May 2021 09:39:29 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id w21sm2598159edq.82.2021.05.13.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 06/10] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
Date: Thu, 13 May 2021 18:38:54 +0200
Message-Id: <20210513163858.3928976-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
X-List-Received-Date: Thu, 13 May 2021 16:39:40 -0000

Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
emulation") added a dependency on the SERIAL model, but forgot to
add the Kconfig selector. Fix that to solve when built the
MICROCHIP_PFSOC machine stand-alone:

  /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function `mchp_pfsoc_mmuart_create':
  hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'

Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulation")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 86957ec7b06..b72a248809e 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -12,6 +12,7 @@ config MICROCHIP_PFSOC
     select SIFIVE_CLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
+    select SERIAL
     select UNIMP
 
 config OPENTITAN
-- 
2.26.3


