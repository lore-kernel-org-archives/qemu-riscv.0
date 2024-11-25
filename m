Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAABD58D4C
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 14:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFZkL-0003FQ-1l; Mon, 25 Nov 2024 09:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZk5-0002j7-1B
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:10 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZk2-0006ie-AO
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 09:07:07 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53de6b7da14so525471e87.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543624; x=1733148424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEkIR2vBaISG4rMjnIPuSSQYyM7zelGC+1W4S9oVQCo=;
 b=rrKyp7u7YICai8X3vlghwFPBOkED+jmkXZAbNNLDG3uavXYgfoko0ILw0r2RCu28c3
 L/bXqoB4HphOJB00tQqolx/jNuosXUrnCLf9Qcdi++0SEaXx3w34WXGGvaZEAb6Jd0/I
 VdblJew4XS5P95wg4NOq8SxrvRQIhuqnavxlPln5y8BGICW4SRX9DhACqAMxugvd4KMQ
 pirRxCiU8HvXhIcw5Hwjqsaj38YlWPado7HVRw7LGLK2WmOd3eloXUcRi2fw0nbuIUHt
 EuDkbZXZznenVF6kNzu89dB2ObKBiZMvFIwwLqbegjdZWpxp8Tt7ayRqPRoOCiZcFVgJ
 Hj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543624; x=1733148424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEkIR2vBaISG4rMjnIPuSSQYyM7zelGC+1W4S9oVQCo=;
 b=QvhD+Z5gvHtXXDMge9brtLujFgoASOoxpFKQkPt8c+h1eElNhT6zkssDYP/VWs4m+T
 DtoBE2/ljCfWTpvA3JULgNMeUe8ALDLhjiiSUnaTycaANNO4uzsZ4N9BY1xtlszRMlDL
 GbAEMVDbUesmOkOgwhbK0cKr0qa8KJD2zu9+rtxirlohXV9SgYtJ2IbNiF7Jnalty4ak
 lfaZtAm/UoiGB/b03f5q+TINvOjYVOv5z96CVXkC1/AgEOkXpwQCEhdp1n02TReIsS+E
 51hLxGQB/8xiSMrHGsvBGODbxyq8oyAA++r+NHMAHYRF+a2RWjI9fXylO4UYr23eu2Cc
 0zOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRYcH1bHa9/3BTwg7Ja+tlfKgwy3gdl22BbTATq6qVAB1xDZl3eYneilxtM6IWTOQqqjWYhCuWuEC2@nongnu.org
X-Gm-Message-State: AOJu0Yw7moO9f3wY6fB5ZzjOUxV7ZcikvhsB8Yc5YitkEi9ExylZDNak
 jVS0B5L4ukbM5O4qpjZTRW7p1SADl8J40/yyEdtjCowXuGazkR0FvdGwM53x2SM=
X-Gm-Gg: ASbGnctJ6AhvQWcAnsnI//ofVbKJeyJBniISnGVYrTnw1kW25MeQ2mmJS3/wPKoJJzW
 DmPy4FHkK2D2RrzKbmhhexrRJR/bau6utBY0XyShbgpBStRVQPhozxdTfv84rYF72r50TxHrDGc
 qILgTuO/BID8or4y82XioryUuGzS3JbU31C9ngr520kFRhlyRSfg/MkhnBYlepDgOPmLuFHVzwe
 1Wvf30IpXRLD96m067A3yBF1RU/pwpAJSqS9NQY2fiG/VbY/wRto47Hfw9lhGcPS1pcT+8a
X-Google-Smtp-Source: AGHT+IFL9b08/2sB7lpIlsx+WOKML5g57kEkneZkhfRmHVvCJsZQUyqUW8XUhBzB/6deDUzkrl500Q==
X-Received: by 2002:a05:6512:3b0a:b0:53d:de48:7409 with SMTP id
 2adb3069b0e04-53dde48744cmr2788380e87.0.1732543624453; 
 Mon, 25 Nov 2024 06:07:04 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4348e272094sm84910365e9.7.2024.11.25.06.07.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:07:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 5/8] hw/arm/sbsa-ref: Set PCI_BUS_IO_ADDR0_ALLOWED
 flag on GPEX host bridge
Date: Mon, 25 Nov 2024 15:05:32 +0100
Message-ID: <20241125140535.4526-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All SBSA-Ref machines set this flag in MachineClass.
Directly set it to the GPEX bridge.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e3195d5449..988a0a236e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -647,6 +647,8 @@ static void create_pcie(SBSAMachineState *sms)
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "allow-io-addr0-accesses",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Map ECAM space */
@@ -896,7 +898,6 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n2");
     mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = 512;
-    mc->pci_allow_0_address = true;
     mc->minimum_page_bits = 12;
     mc->block_default_type = IF_IDE;
     mc->no_cdrom = 1;
-- 
2.45.2


