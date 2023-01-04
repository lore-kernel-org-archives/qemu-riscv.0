Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBvf-0002X0-1N
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBvI-0002Eq-F4
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBvG-0005ax-Bu
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:07:48 -0500
Received: by mail-ej1-x62e.google.com with SMTP id m18so85792152eji.5
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjXAofq2INlxh6v+H74awaoGQiZxjj50d0Z5Ts91LMc=;
 b=YuZ/RbgeRSH2UGDgiOTNsUVPdo4mOEmyERt1MFFXdLGIKux5+lYgedDMDUlPIo7uAG
 HCdFl3rAFgNcCIZGBTUNWSjeIuxXs1SiPqbTU9IeJtbutnISUc9H9xCBlGh7pDhBYcPO
 fnJ4AnEP+2AcI7mYoLMPsKiBcnOjk0KEM51PwpFWTGU6Tf8kMF0p5DEfNOclhKW7Fy5M
 qxJ+VpnQH1lkJNRJQDNrfnVmt1cWnCTEr/F/YWZxcwr+HBY5ygqx6Dn3J47bOUcYtb68
 BRQ/qtJ5KpLO1izOsqcCLAMqcAgzZz91mLiU3aUzkWDtfvRAB/c9/eGIJ1h7axW/YWr2
 JXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZjXAofq2INlxh6v+H74awaoGQiZxjj50d0Z5Ts91LMc=;
 b=xy2q1XiWj9KVcUpQUsPwSNLUWlFOhFpcdsighkY0Wt5Nk8hQMlBp0zsMLMuwIbAxu/
 DOS9JoDErWzkYm5DARkCDcKVZGlD6pz09/2jPIOhZXUY9hsFNbQOlT2eyjkQ3TQX5eAN
 yV1WbDeNBhbzl8DOpqgg/o6U9C08p3Rnt7/x8luwXgOzcN0gE1DFVo3rO+vS81ASQwBL
 UfOKO6luFSwIxltXVPEssVV01N/87sbF4jYNlECscqUWqVaTMQwGBUQzAVj8Wzgku3co
 gJY7ejK3edA/zKzOsou3Czkhsp6eOzoPZ4d9ZxDa1+5e4a5WmCVdkmBEvCB+u/mgFpxQ
 /K/g==
X-Gm-Message-State: AFqh2kq1PN2A3PHDKrogWax1qjopEG5F6qjxtLvU9atNG8Fbvf8ykwOP
 2nIPJP2hCcbv2tluh85MomVBOA==
X-Google-Smtp-Source: AMrXdXuQehTIL3AgRCtjjcqKMnh43Pr3sNqSeRnvtfYsbBIKL/6VQB/4YQR8Ogc+6YuL1DOCwGPyaA==
X-Received: by 2002:a17:907:9a98:b0:7c1:d4c:f08c with SMTP id
 km24-20020a1709079a9800b007c10d4cf08cmr42464785ejc.4.1672870065626; 
 Wed, 04 Jan 2023 14:07:45 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170906305100b007bed316a6d9sm15915461ejd.18.2023.01.04.14.07.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:45 -0800 (PST)
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
Subject: [PATCH 20/20] hw/block: Make PFlashCFI02 QOM declaration internal
Date: Wed,  4 Jan 2023 23:04:49 +0100
Message-Id: <20230104220449.41337-21-philmd@linaro.org>
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
X-List-Received-Date: Wed, 04 Jan 2023 22:07:59 -0000

Convert the QOM PFlashCFI02 to a forward/opaque pointer declaration.
Only pflash_cfi02.c is able to poke at the internal fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c  | 2 ++
 include/hw/block/flash.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index a9dcabdeb2..90b5feb36c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -63,6 +63,8 @@ enum {
     WCYCLE_AUTOSELECT_CFI   = 8,
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
+
 struct PFlashCFI02 {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 64ee40c561..aefbaa9493 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -30,7 +30,6 @@ void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 /* pflash_cfi02.c */
 
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
-OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
 
 /**
  * Create and realize a parallel NOR flash (CFI type 2) on the heap.
-- 
2.38.1


