Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6azw-0001z4-IM
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 12:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6azu-0001wl-CB
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:18 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6azs-0002NB-L9
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 12:29:18 -0500
Received: by mail-ej1-x631.google.com with SMTP id x22so12883631ejs.11
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RkESMP3x1FE047sZUBJV3WOGl5f5HviWYbiyNe/Ty0w=;
 b=r8t7gfWG44OuIBDPgERWEIrmMq+3xtXx9TsAgBg6NPydgamW7MqFqdBo7Jl1ks3/rG
 KV/ongsim603ZgWgNeXUty+30Rg6f5WNKH8mgCUAB80pm4Qk8R+oRHWnHrZNLjK/AU5B
 X2zXWUy+93dK+lVfodvv2yowe9gHbVXkusvEhapVHa3SaagySt+0mhesOVBZVf3ojZRl
 Kt8cRBe5Ut7uWUQGVFDei6cQBklOm++BxivHyAdU2tJza900PwNNMwnwX0NzBexC2egR
 fxY9YBHGrbsSrxgme+RI9N11kr2YZj+U/imVxJUFO5mLWn+c/b2/JvyZlz+Igs8ZsxFZ
 nz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkESMP3x1FE047sZUBJV3WOGl5f5HviWYbiyNe/Ty0w=;
 b=n99cvgAtceMpPDxfmxhjWxXhhHpibROEWnCaHqA76rIdOTv0CQDgm4z6P2yAXrYPC1
 Zql55xpHEWqNvxZ1+vMT4T7GWNppPrYMx6uO+crlgBF+8v1ROc2HwTPYkpFVRaexEp4m
 PY9FxyuWi3w4B1wpkQpajHxf05eW8grugOxaLYRHRjpjOJQVjxgzDoyc/WOuqof3azIB
 kpVoZX8nGv/BeBXQg96Rr10ncFuyukAs4WL6GkfToMd9mbnFWWGO0anDboQO43XCpk2X
 BkX0S/dD1Kbc7/iMH99eduPuqQjznU2yyOPJo32hI2flcdkzMpt99XGuPhpmjqcQSDaD
 JELQ==
X-Gm-Message-State: ANoB5pmhY43ivdHKJcobF6F8MzcWe/Lgygazh/XjDzRQQzT8peZzA1Ru
 1iv3MzSmJggIltLcHXx6rwNN4g==
X-Google-Smtp-Source: AA0mqf7bplq0MI9y3hQD8R/dtV9v7/hoZBZEQfuXG3+aSQszzX9lCXgjToXydjQ+IJPgTfteUVcFnw==
X-Received: by 2002:a17:906:4c4b:b0:7c1:1ada:5e1e with SMTP id
 d11-20020a1709064c4b00b007c11ada5e1emr29928529ejw.26.1671298153883; 
 Sat, 17 Dec 2022 09:29:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a17090637d100b007c0efbaa724sm2185713ejc.49.2022.12.17.09.29.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:29:13 -0800 (PST)
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
Subject: [PATCH v2 0/9] target/misc: Header cleanups around "cpu.h"
Date: Sat, 17 Dec 2022 18:28:58 +0100
Message-Id: <20221217172907.8364-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 17:29:18 -0000

These patches are part of a big refactor cleanup
around "cpu.h". Most changes should be trivial IMHO.

Since v1:
- dropped patches including "cpu.h" in multiply included 'helper.h'
- dropped Hexagon patch
- better split sysemu fields in RISC-V's CPUArchState

Bernhard Beschow (1):
  target/loongarch/cpu: Remove unused "sysbus.h" header

Philippe Mathieu-Daudé (8):
  target/alpha: Remove obsolete STATUS document
  target/loongarch/cpu: Restrict "memory.h" header to sysemu
  target/ppc/internal: Restrict MMU declarations to sysemu
  target/ppc/kvm: Remove unused "sysbus.h" header
  target/riscv/cpu: Move Floating-Point fields closer
  target/riscv/cpu: Restrict some sysemu-specific fields from
    CPUArchState
  target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY guard
  target/xtensa/cpu: Include missing "memory.h" header

 target/alpha/STATUS       | 28 ----------------------------
 target/loongarch/cpu.h    |  3 ++-
 target/ppc/internal.h     |  5 +++++
 target/ppc/kvm.c          |  1 -
 target/riscv/cpu.h        | 23 +++++++++++++----------
 target/sparc/mmu_helper.c |  2 --
 target/xtensa/cpu.c       |  3 +++
 7 files changed, 23 insertions(+), 42 deletions(-)
 delete mode 100644 target/alpha/STATUS

-- 
2.38.1


