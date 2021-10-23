Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meK7N-0002BJ-NK
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 12:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meK7M-0002Ai-36; Sat, 23 Oct 2021 12:43:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meK7K-0002yd-Jy; Sat, 23 Oct 2021 12:43:35 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso7572920wmc.1; 
 Sat, 23 Oct 2021 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4h8cd2gj6LioCQKjAoPWyLIIdDE8FcGsphzqJRwMU9Y=;
 b=BGiGzrmKwvK3vOEiWCYA7h+8saonT4rKow5+osr07+qtqcWbPLj7c/a8w3cWrQfGY+
 gYTmN+TkToyb95ZA7Q7LXOYeG2NAaUiQ+3IpIEV5vdgUrk/L3DYfnpdzNDX8vuv8AWL5
 j8oyDA7iNQvarxOrePv6fsAXueYgw4xOdGOAeEdSxLWUmMhujg3eXlvvVPSJQWBm6Tlk
 cJnIzF6F73Nt5LeNZBvFRqVPabI+KX64Ud6XRLXnJ98i9y/wEq6h5/FFpbGQGS91SKI4
 0/zy536ZHlXCFBIosEqtHILwIg0YiE6llRxw5vOGUkiNvPFj9FBlIQLbCeGIT7nZz6kq
 Kaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4h8cd2gj6LioCQKjAoPWyLIIdDE8FcGsphzqJRwMU9Y=;
 b=LVFwI7Ub05P9NjJorPpwzqI8l3safhfz/HLqqGfKIXXcwfg+B957poYaS5X6P7FPvS
 gGefPsqjBVVDZ7YPRXBWUjDbpJN0YV/5x4CkAVrOMXyhkw+VQYWlQwDIw1FyEuXAvkWH
 7NC/x9V5eHBNLDsmaXkLGhXUSs4iIoo9V7Q56VSVcPsJsW/qBhNteH0PRsNaXF/vyL15
 cwMhOc4RooAQSRtV3kVmIbUyHZBU6KmUui0SsO7PCK32/OnvI/pSjASh1f/vubEhfrU0
 yB1PsSFtp98YEebFYuCXr8pQkxFBxtNA31rf1cPUl7K5S02cV+oLdHIUvyWfByzL47a8
 b5Yw==
X-Gm-Message-State: AOAM533LvP1HTBuSoIo7PPFRgOpOR3EusMqKPSCIG7Vh7amQO4YRoVaR
 qkU2O6ozgSERcNm4MX7Rss/cJxC0sms=
X-Google-Smtp-Source: ABdhPJw+dLngtrh3xgWKdY01Fc1RkuKoxB64GzgG01aaw2tQnuICPOf6L6VL7enfwEY7e6yWXXdAGg==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr7723168wmb.78.1635007411918; 
 Sat, 23 Oct 2021 09:43:31 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k6sm11478768wri.83.2021.10.23.09.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 09:43:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tests/tcg: Fix some targets default cross compiler path
Date: Sat, 23 Oct 2021 18:43:29 +0200
Message-Id: <20211023164329.328137-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 23 Oct 2021 16:43:36 -0000

We do not want a shell command substitution, but a parameter
substitution (with assignment). Replace $() -> ${}, otherwise
the expanded command return an empty string and the $cross_cc
variable is not set.

Fixes: 634ef789f8e ("tests/tcg: add more default compilers to configure.sh")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/configure.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 1f985ccfc0c..b8574165fa6 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -46,7 +46,7 @@ fi
 : ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
 : ${cross_cc_aarch64_be="$cross_cc_aarch64"}
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
-: $(cross_cc_alpha="alpha-linux-gnu-gcc")
+: ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
@@ -55,17 +55,17 @@ fi
 : ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
-: $(cross_cc_mips64el="mips64el-linux-gnuabi64-gcc")
-: $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
-: $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
-: $(cross_cc_mips="mips-linux-gnu-gcc")
+: ${cross_cc_mips64el="mips64el-linux-gnuabi64-gcc"}
+: ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
+: ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
+: ${cross_cc_mips="mips-linux-gnu-gcc"}
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
 : ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
-: $(cross_cc_riscv64="riscv64-linux-gnu-gcc")
+: ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
-: $(cross_cc_sh4="sh4-linux-gnu-gcc")
+: ${cross_cc_sh4="sh4-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
-- 
2.31.1


