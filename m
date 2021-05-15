Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhyEo-0001Ar-4e
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 13:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEl-000129-Pa
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEi-0006Nq-SL
 for qemu-riscv@nongnu.org; Sat, 15 May 2021 13:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
 b=BoOXzhht5sk/LyL60CmbHxij6vC5wMIBR4TfUw0ygEZq8MdRCAkdbBAjwZ+vGDy1+967XU
 wYX+koUZGp1qBUsbPGOWX6dKFzO4pfUYTAPGXnU/DHGgGZSwrHTxdZl+K+UasLcPgUEzsm
 D5OQK+IqsKP2rwAWwjkyeJxGRZO8ANM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-P1I7k8eTNbWKWm8dcxC1zQ-1; Sat, 15 May 2021 13:37:58 -0400
X-MC-Unique: P1I7k8eTNbWKWm8dcxC1zQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so1679422wmg.0
 for <qemu-riscv@nongnu.org>; Sat, 15 May 2021 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
 b=scnSi1ZaGEDnF4M0NrlEG0YfQZE3QFXXpc9MIXOtl46a5gSo1HP2+LZsKsIN5HSZA/
 Wm9dHXLtDwMjFj4cn5TdIe9Iir94kpBpnd2QdfJq7x8lkJhImu59lfQLo1kaR5LFnsXj
 uFQuuvUdt/NfOYvVU/E51ipA7/Ef8tHBGffWm6LrGMK0LL+ntdLFeCeJL6xZ4zVFnZZx
 XJTCU1Unzia5HGyU0aWI8DvJJvi/qnRCFiOxlmb3UjcFNDeEB/f1jBWj3ULwsjyHSMmy
 8+vDxIDwZYgr11d+YIWUjSeYM0f2UTg08KmDsKnrLlQpKa7Wq0FdtZiQlGf55aqO8xNy
 zQPA==
X-Gm-Message-State: AOAM531QtgvwZLdYz8HtXlil1pzPELzAm/bTjMK/UWaBI4QsAtpAfH3u
 w5CgwQ3Lw48yXhUB62i+okYJziMQ22BwITf53IP3dfXjty4VHb43+QzhRfCVvtvletV0HepVZuo
 D7QXHvMgfv5EjnPo=
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr67329375wrt.29.1621100277258; 
 Sat, 15 May 2021 10:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ5d81gqNTqrDXPeRo6Xnm+gpF+7UbrE+plkceXU1QyAbiT09oDT/OoiwpyrXTKJOCVC29lg==
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr67329371wrt.29.1621100277148; 
 Sat, 15 May 2021 10:37:57 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c206sm3495060wmf.12.2021.05.15.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 08/12] hw/ppc/Kconfig: Add missing dependency E500 ->
 DS1338 RTC
Date: Sat, 15 May 2021 19:37:12 +0200
Message-Id: <20210515173716.358295-9-philmd@redhat.com>
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
X-List-Received-Date: Sat, 15 May 2021 17:38:04 -0000

Commit 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate
RTC with it") added a global dependency on the DS1338 model, instead
of a machine one (via Kconfig). This gives trouble when building
standalone machines not exposing I2C bus:

  The following clauses were found for DS1338

      CONFIG_DS1338=y
      config DS1338 depends on I2C

Fix by selecting the DS1338 symbol in the single machine requiring
it, the E500.

Fixes: 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate RTC with it")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/ppc-softmmu.mak | 1 -
 hw/ppc/Kconfig                          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
index c2d41198cde..5a7f99d1e45 100644
--- a/default-configs/devices/ppc-softmmu.mak
+++ b/default-configs/devices/ppc-softmmu.mak
@@ -1,7 +1,6 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_DS1338=y
 CONFIG_E500=y
 CONFIG_PPC405=y
 CONFIG_PPC440=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 66e0b15d9ef..2e4c56eb770 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -128,6 +128,7 @@ config E500
     select SERIAL
     select MPC_I2C
     select FDT_PPC
+    select DS1338
 
 config VIRTEX
     bool
-- 
2.26.3


