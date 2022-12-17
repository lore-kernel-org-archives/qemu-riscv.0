Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6b03-0001zn-Ms
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 12:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b03-0001zd-8U
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:27 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b01-0002Ni-Gc
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:26 -0500
Received: by mail-ej1-x632.google.com with SMTP id gh17so12948605ejb.6
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 09:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhg804KZ0j3EDv2yEyvkNjHpleyZtJnZbPJM5lHyuH8=;
 b=Wf4354pc/8cn9IPaI2w98r6AGC3aq63l7EE3po+2OcUGgXc/1lnQZv4+ZR239vYh3u
 yAXOI+dRf2qVwoVClMlLpvaHOhsQxZKLwlDo5dcecP+9P+OItccCwlA8lUbP/lN7vqiS
 cEoVg0qUO/D9eCmDZuh2nAX5Y2NZwgnDNyUMXNfP7t940M/QA1Sy8v0KiAlYE9eJcnWV
 soWHhz0iortDLEiUnnTWc8/QtjVGgS5zAVwXmbSr/TCl9PfrkeDU4dtQ0Xce09Xh51+K
 vKMGD0O/LdoSYsQb9V5K+HLmGYoYpimaVcKxEBPXPgWZo8a6WQSyWZ6fwes5gf3RYFEF
 XLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhg804KZ0j3EDv2yEyvkNjHpleyZtJnZbPJM5lHyuH8=;
 b=o5V0vFWDCRELM3RDzi6+Tik4QbJ0N9Lt4qX7PBQ4STDW5o7U8y1M2afLJjILoL5rj+
 IHRTJA+KbAHwafJQqvKlQpevTyrzb9/SuG7Jv/kbjBbOvyv1WfxO1ZzYmAztNXHQsm2b
 Y9Lvw3aJoJ497wuXxmGz81jDDpHkNfYL56erTiWsRCZ2eIXOP6nKZ3Tru/iQaentborr
 RGJgufpcAztN0xXzqJkSSUcGB1lXKIs92jmg/0UCpkxcSl8fi5xMLKB13QAf6wUJ1s5L
 d34yLId40dgLpUlAR/1Qib6FBxEnHNDLQS875zbUklAz6qepfDIp3/BXINACfszL8Crf
 cljg==
X-Gm-Message-State: ANoB5plk2qIXCYWUT0cKCQzEKuOvN2zINW8WnJXlu+PsmAkmnhzSRJKY
 Nge7IBhgtYMoOAIiZHHHw4LSqA==
X-Google-Smtp-Source: AA0mqf7VIbBfexhuryH1yv6q6S6xFabt++RaCuZEwZtGbg/SMlf2Ithtj56FIQ3BUDdIrzua0XbR/A==
X-Received: by 2002:a17:906:fb02:b0:78d:f454:386d with SMTP id
 lz2-20020a170906fb0200b0078df454386dmr31919910ejb.42.1671298164333; 
 Sat, 17 Dec 2022 09:29:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170906a38300b00788c622fa2csm2173136ejz.135.2022.12.17.09.29.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/9] target/alpha: Remove obsolete STATUS document
Date: Sat, 17 Dec 2022 18:28:59 +0100
Message-Id: <20221217172907.8364-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 17:29:27 -0000

Likely out of sync: last update is from 2008
(commit d1412eb240), 12 years ago.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/STATUS | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 target/alpha/STATUS

diff --git a/target/alpha/STATUS b/target/alpha/STATUS
deleted file mode 100644
index 6c9744569e..0000000000
--- a/target/alpha/STATUS
+++ /dev/null
@@ -1,28 +0,0 @@
-(to be completed)
-
-Alpha emulation structure:
-cpu.h           : CPU definitions globally exported
-exec.h          : CPU definitions used only for translated code execution
-helper.c        : helpers that can be called either by the translated code
-                  or the QEMU core, including the exception handler.
-op_helper.c     : helpers that can be called only from TCG
-helper.h        : TCG helpers prototypes
-translate.c     : Alpha instructions to micro-operations translator
-
-Code translator status:
-The Alpha CPU instruction emulation should be quite complete with the
-limitation that the VAX floating-point load and stores are not tested.
-The 4 MMU modes are implemented.
-
-Linux user mode emulation status:
-a few programs start to run. Most crash at a certain point, dereferencing a
-NULL pointer. It seems that the UNIQUE register is not initialized properly.
-It may appear that old executables, not relying on TLS support, run but
-this is to be proved...
-
-Full system emulation status:
-* Alpha PALCode emulation is in a very early stage and is not sufficient
-  to run any real OS. The alpha-softmmu target is not enabled for now.
-* no hardware platform description is implemented
-* there might be problems in the Alpha PALCode dedicated instructions
-  that would prevent to use a native PALCode image.
-- 
2.38.1


