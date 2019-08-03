Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1htnDE-0005Xt-Il
	for mharc-qemu-riscv@gnu.org; Sat, 03 Aug 2019 02:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48837)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1htnDC-0005WS-LX
 for qemu-riscv@nongnu.org; Sat, 03 Aug 2019 02:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1htnDB-0005F5-RR
 for qemu-riscv@nongnu.org; Sat, 03 Aug 2019 02:08:14 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41082)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1htnD9-0005EQ-UB; Sat, 03 Aug 2019 02:08:12 -0400
Received: by mail-pg1-x543.google.com with SMTP id x15so26749656pgg.8;
 Fri, 02 Aug 2019 23:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=HJIRYtqKylWtB5jnwqzjoBDWP8DZvSi1J+GyGHETGNU=;
 b=fF45+FSjGQt76Uo5D4ALcbKynDIGOXOwE5U+CorVJVkodVyF7A2s/As3IZPZFs5P2y
 XYIYJaGn9v6QBMMuBjvB0pO6SLNXWlpE9ArWc7XwrnjQnXRfJcAXw7d/S/zhKvuXFhqM
 +zmGZoBgf0ZTBou242XsJlNB2QiSIX4EMCFlA6G/EEF+8f5rzPCCT9MmqDpo8U+zvJf3
 dqQGWGOGuiRrj9zzAdT+iEn/f2uw/zmM0Sk8Pk0Jw6p0Lt8ASygzmsJHkRFCSp1KGW3w
 OQCzEoO3xH4aShGFTggh7tuBfPK69yOsp1l8BW99VWW3FdrreVsEVFemrXeYeC9dcVJf
 Tajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=HJIRYtqKylWtB5jnwqzjoBDWP8DZvSi1J+GyGHETGNU=;
 b=jton956EQkz+4AzVg45A0bADkOs/Sh38x97UaUpejf53hWUV14Ty42brktcF+mV2qr
 dqoGTn3dv2BIKZi9G+b44QoZDlTOEpje00y0KLx/5Agna0XsKe6gx9IhK+ItyPVD38+K
 uNxTvFOLCOWpdF/Jq/LhT+UYELYJ+JtKOxX7hImMH2gUpS3IJiDUn4XFBUbPT7AvI2VC
 PgASO90WSjUfqoqnONzNsQTuUhH3yCUUUozyxB0yMfF7ShrwzLrnvkd/coUpz2+9vFrH
 E4znXhSidx+CNf2nwyjkVKWP4hA88IlraFEgSOaBvF+A9qgvvs8rS5AI+aXCO0Mjp050
 pwNw==
X-Gm-Message-State: APjAAAW9srM2xYQX4XE5OvewD7rgUIk6K/ngdUyA8MgWOKHycrGcUbAI
 tlB6vAw/EWey2UZS0R6s16E=
X-Google-Smtp-Source: APXvYqz450oi9/h9B+T6rM9De41tFIk04v71JX+9pdMSP3mKM9hImDV0yN60vz1kpGzn8W3vadL4vw==
X-Received: by 2002:a63:f401:: with SMTP id g1mr131346086pgi.314.1564812490882; 
 Fri, 02 Aug 2019 23:08:10 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id n7sm86778663pff.59.2019.08.02.23.08.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 02 Aug 2019 23:08:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  2 Aug 2019 23:08:04 -0700
Message-Id: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [FOR 4.1 PATCH] riscv: roms: Fix make rules for
 building sifive_u bios
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
X-List-Received-Date: Sat, 03 Aug 2019 06:08:15 -0000

Currently the make rules are wrongly using qemu/virt opensbi image
for sifive_u machine. Correct it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

 roms/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index dc70fb5..775c963 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -183,7 +183,7 @@ opensbi64-sifive_u:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=$(riscv64_cross_prefix) \
 		PLATFORM="qemu/sifive_u"
-	cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
+	cp opensbi/build/platform/qemu/sifive_u/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
-- 
2.7.4


