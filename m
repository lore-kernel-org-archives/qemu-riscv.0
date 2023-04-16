Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poBdv-0000Cb-VV
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 19:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdu-0000Bs-Uh
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:46 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBds-0004J4-Ms
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:46 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 hg14-20020a17090b300e00b002471efa7a8fso10701919pjb.0
 for <qemu-riscv@nongnu.org>; Sun, 16 Apr 2023 16:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687123; x=1684279123; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwBG6Pl2CkA9rx243kWPynVcrCTlSNrfaWPXCORGhZo=;
 b=T7FwQ3npcJxGGuYGoy6X1Tl69nPfVn+No+UJ0ZlsY+BVfhoH5xORKHqzGvg9aV8gNJ
 qW1c73gDjSpsJ53MTUJKuUBrNXZi/1WC00RTOXm0JUCGuwyJ9JmsiF8HIj/mGz5iFPjB
 4Zrena4LeLyXZD5LBCWbCs8VvCSuJOJpt7JOHSI92acs85KKCo1f35ZolpzwtOBSlUJQ
 /6Pj5s/a7LKxhXDhuReMgDdm6s6Sfdac5VSu+iYnB++kaqZgFbj/gVVYsGWGEj1AaGFJ
 M+mSgpZk/XEtwiw+nTW28zYF7o7TFaPOFS+hg3OEyCEL1TVZ4ps6jI9nBhiAbL6xiR4j
 epEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687123; x=1684279123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwBG6Pl2CkA9rx243kWPynVcrCTlSNrfaWPXCORGhZo=;
 b=MmSvhg/GxJonIAQlSirswwUCH3gtp1iliYjibPv/lc8qOWH3DxuYXuXSWOhzKi9j7S
 UkT5SSGeuQs2crjQsHUpnntQaBYvax1actX34bFDmP0F7KfgBuuJznjhZd2WzGhMgM72
 ABrPKiRI+QqnD2yDldtfFwair/F1d1qNZ8jA+CjvFGiobv21agcutLwHFzxRMmZeRwGQ
 QWEE8B3+tfUg3j5xRMFXqn1+l24ZXiD/lURTTAQcVV4p6PVfMIXgHat+JoGh55nzGiVM
 q1Dfg28ys3i1CrXwcCda0LJGhvwHlUyZJO2jvNtbClzgyi5Gdq7ld7zFfTlElVIreB6s
 oMSg==
X-Gm-Message-State: AAQBX9dhn7/vReHNYAQnAwBtmqIfXehN/g/ed+jtHeXS5z9ujdDOd5w2
 UYBAFbWy8hzLf5mk0856XA6BtA==
X-Google-Smtp-Source: AKy350aLPlncG1oH9tCMz7KdABtq+cAmv/gg76oobZ3f6bvYoqFXMybGaT9FoUXf05q58kUPlt51wA==
X-Received: by 2002:a17:902:e747:b0:1a2:8f0d:766d with SMTP id
 p7-20020a170902e74700b001a28f0d766dmr13796131plf.62.1681687123360; 
 Sun, 16 Apr 2023 16:18:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:42 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 7/8] hw/riscv: meson: add CBQRI options to the build
Date: Sun, 16 Apr 2023 16:20:49 -0700
Message-Id: <20230416232050.4094820-8-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416232050.4094820-1-dfustini@baylibre.com>
References: <20230416232050.4094820-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 16 Apr 2023 23:18:47 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Build the CBQRI controllers and CBQRI example configuration when enabled
by Kconfig.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 hw/riscv/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 2f7ee81be3ca..cec6ecdcf5de 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -11,4 +11,8 @@ riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
 riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 
+riscv_ss.add(when: 'CONFIG_RISCV_CBQRI',
+              if_true: files('cbqri_capacity.c', 'cbqri_bandwidth.c'))
+riscv_ss.add(when: 'CONFIG_CBQRI_EXAMPLE_SOC', if_true: files('cbqri_example_soc.c'))
+
 hw_arch += {'riscv': riscv_ss}
-- 
2.34.1


