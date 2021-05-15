Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEz-0001l0-Vz
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEy-0001ev-Ao
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEw-0006XE-Ie
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPLTr9/lf9Tjbqx5BLE7l6ti3Lxwf/eMPMqzxJa5Wn8=;
 b=aFy3ianoj6yYpcE5s5UNqjtY3DuuJplmOdyZeGW6fS24/Sp+ZsedWtKuReYiq51Lnptxt5
 XZ/wPuU2HYviLB5AnyfOeTexvY+Mc6a1Yf9mAJ5/Bc+sDHmisYJdKsCaWeHp9uKlPJb6iA
 drtIA+1va/SC3GZGjAOFIRkD0oaKTDc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-9NDEw2xAO3-IZ4xEfigglw-1; Sat, 15 May 2021 13:38:12 -0400
X-MC-Unique: 9NDEw2xAO3-IZ4xEfigglw-1
Received: by mail-wr1-f71.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so1384689wre.18
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zPLTr9/lf9Tjbqx5BLE7l6ti3Lxwf/eMPMqzxJa5Wn8=;
 b=lzZEAiely4JuBo4BtPCTwpU6d/laITCFgvd0r0NyU5tF/6FhXVJhgL1poi1LzGzPy1
 6oWnwn24HJabGZVEH3Pt2CGiZmvJe/iXk2gn9iBwq/TR/8JivC72nJaol1B701QHbO0a
 1KX+mEk4NQbYe/TD/bpP4a3W85Ff0exFBnpTzCNZ5jCo2wYoVRzzvPIyyStmh/sVVYuE
 FLiAKL2f+9/SGRnMDbgGQ/HQxdqUMI2MEx/yb4zMFcK59k3b+SEtleO2EgOFlp7+RjO+
 BQRRfw5Tj8rz5DW14/Urmlbx4j70lbCb0XK2v23tsUd9K/vsK9n6qyNM9J+7zTFM3jz3
 HDvA==
X-Gm-Message-State: AOAM530UVDBxhU0MkX3OWCRujiUszneruhlt7qxxm+2UFJ/nQLDMWupC
 9U3lrQuiojxouVtBXQE0xRq545lECM3qCR83BnoyV+MecFPS2Sh0rN4rzFhgq/zJUQ3fwvgfrJR
 d2DIHsDsDHAtkSFY=
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr17699059wmq.63.1621100290701; 
 Sat, 15 May 2021 10:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzii0Xl0VixUiqyqFHFGIsEHeMGPXKtofe5AKg67YPxW4QJJQNwlVEfch8ScK0g6JbQfJiAGw==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr17699051wmq.63.1621100290564; 
 Sat, 15 May 2021 10:38:10 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k7sm10529562wro.8.2021.05.15.10.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 11/12] hw/isa/vt82c686: Add missing Kconfig dependency
 (runtime error)
Date: Sat, 15 May 2021 19:37:15 +0200
Message-Id: <20210515173716.358295-12-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
X-List-Received-Date: Sat, 15 May 2021 17:38:16 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building the Pegasos2 machine stand-alone we get:

  $ qemu-system-ppc -M pegasos2 -bios pegasos2.rom
  ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
  Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)

Looking at the backtrace:

  Thread 1 "qemu-system-ppc" received signal SIGABRT, Aborted.
  (gdb) bt
  #0  0x00007ffff53877d5 in raise () at /lib64/libc.so.6
  #1  0x00007ffff5370895 in abort () at /lib64/libc.so.6
  #2  0x00007ffff6dc4b6c in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
  #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
  #4  0x0000555555a0c8f4 in object_new_with_type (type=0x0) at qom/object.c:714
  #5  0x0000555555a0c9d5 in object_new (typename=0x555555c7afe4 "isa-pit") at qom/object.c:747
  #6  0x0000555555a053b8 in qdev_new (name=0x555555c7afe4 "isa-pit") at hw/core/qdev.c:153
  #7  0x00005555557cdd05 in isa_new (name=0x555555c7afe4 "isa-pit") at hw/isa/isa-bus.c:160
  #8  0x00005555557cf518 in i8254_pit_init (bus=0x55555603d140, base=64, isa_irq=0, alt_irq=0x0) at include/hw/timer/i8254.h:54
  #9  0x00005555557d12f9 in vt8231_realize (d=0x5555563d9770, errp=0x7fffffffcc28) at hw/isa/vt82c686.c:704
  #10 0x00005555557e1340 in pci_qdev_realize (qdev=0x5555563d9770, errp=0x7fffffffcca0) at hw/pci/pci.c:2116
  #11 0x0000555555a06a84 in device_set_realized (obj=0x5555563d9770, value=true, errp=0x7fffffffcda8) at hw/core/qdev.c:761
  #12 0x0000555555a0ff9e in property_set_bool (obj=0x5555563d9770, v=0x5555563da090, name=0x555555cd7881 "realized", opaque=0x5555560acf80, errp=0x7fffffffcda8) at qom/object.c:2257
  #13 0x0000555555a0e098 in object_property_set (obj=0x5555563d9770, name=0x555555cd7881 "realized", v=0x5555563da090, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1402
  #14 0x0000555555a12271 in object_property_set_qobject (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=0x5555563cf0a0, errp=0x555555fc3fa0 <error_fatal>) at qom/qom-qobject.c:28
  #15 0x0000555555a0e3fb in object_property_set_bool (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=true, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1472
  #16 0x0000555555a05b15 in qdev_realize (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:389
  #17 0x0000555555a05b42 in qdev_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:396
  #18 0x00005555557e160f in pci_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/pci/pci.c:2181
  #19 0x00005555557e165b in pci_create_simple_multifunction (bus=0x5555563d32b0, devfn=96, multifunction=true, name=0x555555c9b63b "vt8231-isa") at hw/pci/pci.c:2189
  #20 0x0000555555867730 in pegasos2_init (machine=0x5555560427a0) at hw/ppc/pegasos2.c:105

The "isa-pit" type (TYPE_I8254) is missing. Add it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 0703512209a..9822a90ce95 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -49,6 +49,7 @@ config VT82C686
     select FDC
     select USB_UHCI
     select APM
+    select I8254
     select I8257
     select I8259
     select MC146818RTC
-- 
2.26.3


