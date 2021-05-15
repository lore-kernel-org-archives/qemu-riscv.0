Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEs-0001OZ-1o
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEp-0001Fj-Jb
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEn-0006RL-Hr
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
 b=GecnskS1W4y3lxaZnmGbTFOL6jTM6nh82s3mCtmZdDsqUbd2gITQWaCVDGBGkTbPs9AJ8U
 24ag4/DDxk5i7LByYgArbYJVRAAQrJFXWkhgG/r8atH6D8KvlNOaWwAXnhO7BxN45DQFgx
 qrtHygs8gP5i7QPvMaDnttY37YUFYHE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-ofXyRc07NS2de6QKPDj6xQ-1; Sat, 15 May 2021 13:38:02 -0400
X-MC-Unique: ofXyRc07NS2de6QKPDj6xQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so1668231wmy.1
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
 b=AUU/H7IFlRbDoCe+nETFdRmLgurv9yI9nJCGAzp3PiLGtIxuCbcSbkmZ+DRJe2ctss
 1UQGXU7G2TeeRYa3uCO2AzymmSq9k+ipXu2eKrDJngaxETnxZ6ald7n3Y2buZLTqyG3G
 uBEQ8tmG57kwNRa3l5RXME3WyU/3ZVyg6Cklcot4dqwePKtVGcG2gg2xGw3mtyc9oo0W
 ChgVCKdcppX2a91jNzH523iOct0/vf3on0YslHKg0O57QV/37r/RaEx2MUvAEJtiJJiY
 ECNDM7wwi1icIIoKbBIdgqHgiRWYPkh6Ibsr8Jkp4WN8fx7ePAxbcrQXtT1Keyd0ncVp
 SzaA==
X-Gm-Message-State: AOAM531RkpUlHSVKh3S9yaEbeA9Sqc6Fl1Hi0Lxw7Twt85NvhZ0qJP3y
 9zf9pk58SNfpIwOPKBMH5X4u+ZKIcC6PyRDSGzTQZdagwspA8HPXi9hzHbsuw1CL5npLOkN5upp
 fvDTtBuHjhNmXS+E=
X-Received: by 2002:a05:600c:4ca1:: with SMTP id
 g33mr19751673wmp.7.1621100281681; 
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzdkdaJKsqQvEMuw/in8yhkYSzmz4ZUGj7uT9+EgpNyG/uYj5c6KEaDv2tlbB8+jf6n0nPnw==
X-Received: by 2002:a05:600c:4ca1:: with SMTP id
 g33mr19751656wmp.7.1621100281560; 
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k6sm14457835wmi.42.2021.05.15.10.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency MV64361
 -> I8259
Date: Sat, 15 May 2021 19:37:13 +0200
Message-Id: <20210515173716.358295-10-philmd@redhat.com>
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
X-List-Received-Date: Sat, 15 May 2021 17:38:08 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Looking at the MV64340 model source, there is a dependency on the
8259 interrupt controller:

  523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
  524         /* FIXME: Should this be sent via the PCI bus somehow? */
  525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
  526             ret = pic_read_irq(isa_pic);
  527         }
  528         break;

Add it to Kconfig to avoid the following build failure:

  /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
  hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
  /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'

Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 79c20bf28bb..9dc0d761815 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -76,3 +76,4 @@ config SH_PCI
 config MV64361
     bool
     select PCI
+    select I8259
-- 
2.26.3


