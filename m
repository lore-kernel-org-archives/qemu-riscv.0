Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa18-0006UP-3s
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0z-0006O4-Qp
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:11 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0y-0005Uq-Db
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:09 -0500
Received: by mail-pj1-x1034.google.com with SMTP id d2so12102466pjd.5
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgzlygJJuvY6dcow83KRw6ped9RQQR2f9ScRzTB5pLI=;
 b=TESWMqTtmWIBuD5doSsdP0OVG1VEj4lTMbyDmoQaAt+xGqwgfCugMKL0j6x+AG79Zv
 gacwIy5my4P7/rhrG4iiAYUVoesqzbtuFAtSAumkep36zvrolrsdEPuPp9CdW35mtnz3
 YCSm6XEK87LxHi+Pe1clirfodxLcyPOk02lgR+rdgHnVGPPRdjmRA/P5doJp5kKY4aAt
 m3tCaoINp1TPUdFh09spbUOTW3WL//jE3zUeZaaHW5Dceitsomt6CNmT5LKPb2LcHOhR
 jtMFoDYYSjP89qjNwz+MYyoCg77Pqu60BGffgzUuol0PuTSxMRhGFUkzZi+hCtXL8URo
 7YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RgzlygJJuvY6dcow83KRw6ped9RQQR2f9ScRzTB5pLI=;
 b=8Hm/Vt+u8jNfUtDpuoQOWBGbwcMNRhvmTlOce4ewVWBTFeV/x85N+8o8z4DWKj3vpv
 rohuuGsF7lilbSYfzggkzsmDwoAADDZke/uqj1EcjZEZ7+mrAkUF1rz2hMmKI02Ja742
 tjXW+scHnb6fx17rQOKZGz9sbZCn+kop7KgnB7dkJsrgxitradoUYGwvK+8PP2AqxOPu
 OK6fkdalVWKAP6cmu+9uvBCs+onzdIznw+cpLRzujId+NxVZ8zVo5nhx56IsxBl1tO/x
 +dwvwvZ3Rk8Xx1CyogH9ZUOA4ePmcx9PxBsIcq0/84jFsENZ3tygOMa+OlI1euvJF61F
 y95g==
X-Gm-Message-State: AO0yUKU7dxHIDw/d42C+WYGFpgZ44lDWHgGh44/paiGJircyp32Ustpt
 LQu2OcssfHqaY5P6rlwXRwnPpw==
X-Google-Smtp-Source: AK7set/C5vjJgsDoml0IXhtFoy1ylq5WSOdPSbfDkzx9WvRqCvG/odsH12B80XvPl8hezDYSZnMnWg==
X-Received: by 2002:a17:90b:4f90:b0:234:3d3:51b6 with SMTP id
 qe16-20020a17090b4f9000b0023403d351b6mr2963098pjb.23.1676299267282; 
 Mon, 13 Feb 2023 06:41:07 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:07 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V2 07/10] hw/riscv: meson.build: Build virt-acpi-build.c
Date: Mon, 13 Feb 2023 20:10:35 +0530
Message-Id: <20230213144038.2547584-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 13 Feb 2023 14:41:11 -0000

ACPI functions are defined in new file virt-acpi-build.c. Enable
it to be built as part of virt machine if CONFIG_ACPI is set.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index ab6cae57ea..2f7ee81be3 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.34.1


