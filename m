Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prPNg-0007Q8-B3
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 16:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNe-0007PM-KE
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:18 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNc-0002jw-6G
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:18 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-517c01edaaaso4646762a12.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454914; x=1685046914; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3dvkE3GbLlQqO1fEgzoVVvZUz8nVUWz3OR+7sSPK4g=;
 b=YdeBrd0E2NBAQQfO9E/j4fQc1zRV5lR7Ssy6KM8aC0n1ZAwok+41QDDk0mjfa8g0oN
 7pyFOUCd+duyUk+4Ftg/n70az4kEAwHwoAQ9Rhr5BaeRAaJHgCxHstO7gRyl0b2EalaM
 vzcymVT34Wa3/ArYXp8NnyI2PpbeSJ8X4k/VkRkkauRkvNZndbaJQrl9wPZkSqiC1F77
 5NnGWHwExH0GnwJqLg2IVR5/3MM7zzwU6lUgGgmCsi1k1KepcMjwwZsEQ7UaEZQfED0r
 lcM5KyAmM+WzLktsREgvHa1xSQyWGzVXExtdiYHNICOCQ7NKpeZAcXKbtWI4HEnLHhaR
 bCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454914; x=1685046914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3dvkE3GbLlQqO1fEgzoVVvZUz8nVUWz3OR+7sSPK4g=;
 b=XXMO2MwseV6+U520cU5kOgUAmn686RSBrhKslpmaELSBChCjYDsjJcXQCJ5ZQMNzUb
 TAopypSsQ6/vMFTlSTYl+JpRvWst9zCqgb1WEgLCWUGtxWeVrrRFuWnpboem/Hei+ZiO
 N1PgDvMSMAerBdbW387lX2dgiRePx5RN37zTPCUNIRksGo1md+iaFKApcPvrd7+kw553
 QGY96JVXrFt/Jcn3Kah+kKotdgopfaXN33yX3GClGrfxcL+ze3BBQJKGquZDE3xUgdOo
 Ciu3Rl6qj+dpmenjhZu4c+1GQV6/100agjAi9bFUicU5AAY2kd0+rgQJQL+ftX3Dvd/r
 gLnw==
X-Gm-Message-State: AAQBX9dGmTFIOTE4hJam6OmV7OWueJAb4dk+su7t1vbhfN5UHQuUfjuQ
 xFppz/EukFl+aigw/5BuoYUs0A==
X-Google-Smtp-Source: AKy350Yz8vBew2ExzoEgokZ/2jr/t8xQeSKi5hT9cZxeyelV0FxjmThPI9Jb8FzaZKAjLElRsv61HQ==
X-Received: by 2002:a17:90b:8cd:b0:23f:5fe7:25a1 with SMTP id
 ds13-20020a17090b08cd00b0023f5fe725a1mr18376172pjb.13.1682454913893; 
 Tue, 25 Apr 2023 13:35:13 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:13 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 6/9] hw/riscv: meson: add CBQRI controllers to the build
Date: Tue, 25 Apr 2023 13:38:31 -0700
Message-Id: <20230425203834.1135306-7-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=dfustini@baylibre.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 20:35:18 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Build the CBQRI controllers when RISC-V CBQRI is enabled by Kconfig.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Changes since v1:
- remove example SoC now that command line arguments supported for CBQRI

 hw/riscv/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index 2f7ee81be3ca..2281d17d0b09 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -10,5 +10,7 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
 riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_CBQRI',
+              if_true: files('cbqri_capacity.c', 'cbqri_bandwidth.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.34.1


