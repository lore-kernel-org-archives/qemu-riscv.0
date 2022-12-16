Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6Iq6-0008Ig-FP
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 17:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ipt-0008D9-RJ
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:05:46 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ips-0005eR-1Q
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:05:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vv4so9335236ejc.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 14:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7T50GYoxuzsxHz0gV/DQYPMXubrUPNWTO69bc2wf0U=;
 b=FNMUEyzIGDVnMOPn06wdAMm5F88f2vDS0W/Pio/vkL7YbTJGBfIH7/I6EXNC9BWqgI
 s50vNYnYetikeMYdjNE58POlzFG0Dlol2yO02OKkV066bkNB1Y8Lf+Lukp0lukR++eF2
 09avbMgdKmjspzWpmCRKrGcvwCPyno/Wkhfayz+q0+9buhxRmGQ4ChLkqur27XpGwszs
 rngGrqkHESOTl4N/UwGhfpyfg6fxsN97D9BwboKqugSAQ9br3VrRIEqus/yo1WKNnKIT
 fJ87rzlrL1TiPhYeZzq3cPDTlS4CHLyyaCPuOd/daVSGUjd+vslKk+yKJcrk5Hz8SKrO
 5Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7T50GYoxuzsxHz0gV/DQYPMXubrUPNWTO69bc2wf0U=;
 b=mKGLqJIOUNaFqSu2kd3/x7N+N/qYnKgR4ANltajfMqnDEOZjQt+eNg124yOkOrGC2M
 vR3hl9+IPXF3BwZHFH1+hrfWh/yQRXbORNvO0igSqbizEU8N1dn86B2wY4/a3mfNr4bc
 d5tXzkETiuJd0kzGTeELxE5a+V6zSh8PWjdQbXuQ9GEbCdUH3IK9jbEoSkFbz2yDA+SV
 ORLJBLcmi5qByjgo8Ny1TSosPydTE7plDT0GL/TKEJ0w8K5XekXF30Np0ZuvopWM01nW
 53fxq7RMY9HCa4rv4e/idmJR/TworZMUORsgq0UlA/RtMonhf1ps65TOIsLMLJIgUzag
 k1Sg==
X-Gm-Message-State: ANoB5pmNR9qs8LBP3tyZDLX84ezeTB9AtUQqTpiW9ckd8OXTvkyACjpH
 dG6obOOYtp5eWSuI3E/xgTl97A==
X-Google-Smtp-Source: AA0mqf44yhTvz3RtdwbDos4Kwg7Eg1jD1JUuKfunW3A0mzuZy1ynWLJI3O9eLxMzaphMFeDpYk2yhg==
X-Received: by 2002:a17:906:3a59:b0:7be:e831:2b4b with SMTP id
 a25-20020a1709063a5900b007bee8312b4bmr27288198ejf.23.1671228342414; 
 Fri, 16 Dec 2022 14:05:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906318d00b0077077c62cadsm1291231ejy.31.2022.12.16.14.05.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:05:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/10] target/misc: Header cleanups around "cpu.h"
Date: Fri, 16 Dec 2022 23:05:29 +0100
Message-Id: <20221216220539.7065-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Fri, 16 Dec 2022 22:05:47 -0000

These patches are part of a big refactor cleanup
around "cpu.h". Most changes should be trivial IMHO.

Philippe Mathieu-Daudé (10):
  target/hppa/helper: Include missing "cpu.h" header
  target/hexagon: Declare hexagon_regnames[] in "cpu.h"
  target/loongarch/cpu: Remove unused "sysbus.h" header
  target/loongarch/cpu: Restrict "memory.h" header to sysemu
  target/m68k/helper: Include missing "cpu.h" header
  target/ppc/helper: Include missing "cpu.h" header
  target/ppc/internal: Restrict MMU declarations to sysemu
  target/riscv/cpu: Restrict sysemu-specific fields from CPUArchState
  target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY guard
  target/xtensa/cpu: Include missing "memory.h" header

 target/hexagon/cpu.h      |  2 ++
 target/hexagon/internal.h |  2 --
 target/hppa/helper.h      |  2 ++
 target/loongarch/cpu.h    |  3 ++-
 target/m68k/helper.h      |  2 ++
 target/ppc/helper.h       |  2 ++
 target/ppc/internal.h     |  5 +++++
 target/riscv/cpu.h        | 34 ++++++++++++++++++----------------
 target/sparc/mmu_helper.c |  2 --
 target/xtensa/cpu.c       |  3 +++
 10 files changed, 36 insertions(+), 21 deletions(-)

-- 
2.38.1


