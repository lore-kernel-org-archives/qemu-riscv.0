Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBvD-0002CL-Cu
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBun-0001zf-Rn
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuf-0005ax-5Z
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:12 -0500
Received: by mail-ej1-x62e.google.com with SMTP id m18so85788417eji.5
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSPCaBssOqcI16x2eeMpiNddAyoEtVRJPGPKXdjNpIQ=;
 b=aCZaH0vh5oj1E5E4InNiTNoAmKmy+457xeL73gS5nxOTrGV20hoWJXGVDlyusBzKe2
 8pfl7iNSDuNn54XFnBajK1L5Qg8oUqJEN4fba74ENRvxdJ0DnKUsoWCE5dwKz2e1SJzg
 10qmJeWfd8vmN4s3mqMMfnHSHhWx4M4ukd0MCYh7eTCGf80Nv5HrHD/fqmRAJAALfS5m
 6IBpYTuRvgSWTp5S6+e/DT1jTZYAsCMns9oWvoQl16iKXNATL0ej2vQdPpIAplKG/3qd
 hl2z9qeh9oLUjGVjbkn8g2ZX05MMFG0+FavRmbzVZpikeaafVImNvPdEoGJ1GojPfYhH
 TOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSPCaBssOqcI16x2eeMpiNddAyoEtVRJPGPKXdjNpIQ=;
 b=qHtw9PIe8NHAaUtaX0qGIM/xuVPXPo3RsVhH3Z4BJVwpwfDKmZeQbt2XaWFfesP/6e
 VE7I9kX2L5Fhsn4tdT8q+t2qA+maAr0XF/fCWmj8gYoQDpfPFycwRsdMvwfjEu5Skbq9
 EIWZhJoalCL29mZLCRaVoZiZ95oHe91d+an43PzX3luUND2nHQf8j5FHoOA/jlb2l/6v
 bjcnKcorwDUc0zDwMkOZIoaKKTEMMZU3QXJ2CzAVQ1A3NjPGG98zfvWl29EzYGZnsqxK
 vtCVTn5x+4gAk8R2BleXRYGajxN9zzN6WxuCTM9bwXalZYlR+PL7ZJy4eCzJYK4MtxlT
 yWrQ==
X-Gm-Message-State: AFqh2kryzCphw/QDhOUvoYRqHtF6npffayuZXjiTas2g8WGXayhjLc1O
 RQJ6MicXPUE3o4Sr7rQRj0bA1g==
X-Google-Smtp-Source: AMrXdXu0qfsSlm3Zih88aaQ/o6QEwPEpyma1jJ5BVEasDZz0Sqa8vAIckF3WveKZEJhRf68EYXsQag==
X-Received: by 2002:a17:906:279a:b0:7c1:10b4:4742 with SMTP id
 j26-20020a170906279a00b007c110b44742mr40854672ejc.55.1672870021716; 
 Wed, 04 Jan 2023 14:07:01 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a17090623e200b007add62dafbasm15551057ejg.157.2023.01.04.14.06.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 15/20] hw/block: Make PFlashCFI01 QOM declaration internal
Date: Wed,  4 Jan 2023 23:04:44 +0100
Message-Id: <20230104220449.41337-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:20 -0000

Convert the QOM PFlashCFI01 to a forward/opaque pointer declaration.
Only pflash_cfi01.c is able to poke at the internal fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 2 ++
 include/hw/block/flash.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9df79b102b..2af9273fc1 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -59,6 +59,8 @@
 #define PFLASH_BE          0
 #define PFLASH_SECURE      1
 
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
+
 struct PFlashCFI01 {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 858c0a1b6e..321aede8ef 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -9,7 +9,6 @@
 /* pflash_cfi01.c */
 
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
-OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
 /**
  * Create and realize a parallel NOR flash (CFI type 1) on the heap.
-- 
2.38.1


