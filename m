Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyF5-00021z-2K
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyF3-0001wd-EZ
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyF0-0006ak-Ja
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGHwK2BS4Tjt7sYTruLWMJBHTB2i72gwei4DqcaqGkk=;
 b=iYyP6JDjAvkq5oiooT5JPiLzhQJEYf2+bCIKCgsz2Txc6KTZH+2t/bN47enRkUoGvxW2UD
 YBXVU37ctRsICGk7D9m1ITMHgRvhIlOF1WKCJltsT3ZEB3k4Athzt/kq53RiRHXSaFJJJ2
 SuKxsHPtfB7302Y5yGRW+/DW8HNLf8g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-8DCiwoqrMMylyFSHjHLAxw-1; Sat, 15 May 2021 13:38:16 -0400
X-MC-Unique: 8DCiwoqrMMylyFSHjHLAxw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1649045wmn.9
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGHwK2BS4Tjt7sYTruLWMJBHTB2i72gwei4DqcaqGkk=;
 b=UV7znY8xEigvKHPGDwhQIDbpm5oeGg3kJVB4TQWanHdiPmIMYKyxNoniq1+SAGiupm
 LR1RoE+R8kZlZ3um/GLpamJi9gZkcnbQUPD95zrW/Skl23JRnWgc478oV38LechOMeB5
 /waoiv2eRVuENo89V04fHA5C+U5uahyG4a4vadTvtQsYXUjsfS9X0uV5CVIjjkTMW5oC
 hgFPPyitFgeMsEvMtECSmdQgn2OAV5bBUVK5GJeqyc675BqnDwrEQS1T+BmPUaUSH0Yi
 4AOen23TTBWGuNgsvjsV1e3fR/IjsnXgTIinwYJUBiaaG+kD1RXX5k8jFfOWw0XLqjuI
 18Cw==
X-Gm-Message-State: AOAM5327gGkT3Y9fqvY0P7/ik8PTOfYM7fySvi4NSV6/mn8ZHI9+zMhW
 ZxUsNwoXO9RrNIgcpK64AHXYlYhRz0n+lBU9cn5ZyPlcIQegKGK577TUaE6ockmT4bTV0ciphV4
 DoxBKZVutwwFMnxQ=
X-Received: by 2002:a5d:6291:: with SMTP id k17mr67310865wru.247.1621100295154; 
 Sat, 15 May 2021 10:38:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziUdH0gQaG56xw1W0ltobq2jlmlmrXQ0vKqRadi5wNLYD7c6p1gpn9keAKYuORV89RZuLUbA==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr67310848wru.247.1621100294991; 
 Sat, 15 May 2021 10:38:14 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c65sm1856551wme.47.2021.05.15.10.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 12/12] hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA
Date: Sat, 15 May 2021 19:37:16 +0200
Message-Id: <20210515173716.358295-13-philmd@redhat.com>
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
X-List-Received-Date: Sat, 15 May 2021 17:38:21 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

While the ATI VGA device isn't a requisite (no crash without it):

  $ qemu-system-ppc -M pegasos2
  qemu-system-ppc: standard VGA not available

it is useful to have it with the Pegasos2 machine:

  $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device ati-vga,romfile=
  qemu-system-ppc: -device ati-vga,romfile=: 'ati-vga' is not a valid device model name

Add it as an implicit Kconfig dependency.

Fixes: ba7e5ac18e7 ("hw/ppc: Add emulation of Genesi/bPlan Pegasos II")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 2e4c56eb770..e36db08665a 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -77,6 +77,7 @@ config PEGASOS2
     select SMBUS_EEPROM
 # This should come with VT82C686
     select ACPI_X86
+    imply ATI_VGA
 
 config PREP
     bool
-- 
2.26.3


