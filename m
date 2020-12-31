Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwBN-0000BP-33
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwB7-000084-8n; Thu, 31 Dec 2020 06:31:38 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwB1-0007TA-QC; Thu, 31 Dec 2020 06:31:37 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q22so11128893pfk.12;
 Thu, 31 Dec 2020 03:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcaVKYOKC0zw0322A/CSsJ4a3JkSb99+ebegG5WHvn0=;
 b=s6DT+aTMRODhzaiPeIqgwBwelAj0F0qrz//Hmgv40OiR7Z5kdf2g3P0+k3R7tc4SSw
 fSMBA7UC9nQjRfHnY5XOnfJjrBn1/s/kjX1GFCK/Bstcw3sP0ei3kAlQphY2DZPZAGh1
 bmXuQou4YPvCBOjdmGks0B7iqz+fYz7r58JIvLp2YDay2rXLdcE8eeicu92TDO2yPEoa
 hDOfMDuBtuEOnVpuahcsmX8G+wFGyNDKJ0CqKggPAMfX2MhdvhSgezici3vuBzMLCB7J
 rpY7UYVAbtZCqE6vqEfPU0RyJNxXyuPb5a7Y2ztA9WGzHCMN3I2Pwr+yWD9JatckHhra
 Mb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcaVKYOKC0zw0322A/CSsJ4a3JkSb99+ebegG5WHvn0=;
 b=N2gYp58lz/hVY2UahYxEJwMp0sDYlreaGlk4/RtfdmFgrYnqxefX3kcCKInCf6i3KP
 u3MXe6WQ4RKGsALb9e5eFjJ7eLlpyAp3yA+aWITvtcDciDeXMf4FMNyLPiAYjwGS4uAx
 VwPRoKxDVVEhuhDgjFb6qoiL/Uz307JZMpSWpz9t02vhe/gV7eLq986emOTzTGWsVxev
 zVXvUlyYm4brJK3yUvsnF64di69H6R5vGnhmCErBK3wLB0o77MDGbTWulA4I5BxXGsR3
 Ks9ohd0nXVJC3s9FIKzdI3KXsP4jeAmoulLZMrl8zFQJV8c1LOZzsS9g1rd4Y2Bn0Rn5
 ZJlQ==
X-Gm-Message-State: AOAM532dxRpy1c+xw4D9VmEvukVhLL0Oauz8yZQfUdCpWwYysgMc1Hb1
 yS6usrqoQMYVaMuFzidfZMA=
X-Google-Smtp-Source: ABdhPJyP305uQiYtJogj3+v477I4OH/plvvQIdE8GuhcHAECmewg9pKsrfaYxMRAqvQCmbdy8jgnZA==
X-Received: by 2002:a62:8205:0:b029:19e:717c:d647 with SMTP id
 w5-20020a6282050000b029019e717cd647mr51812784pfd.50.1609414286818; 
 Thu, 31 Dec 2020 03:31:26 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 20/22] docs/system: Sort targets in alphabetical order
Date: Thu, 31 Dec 2020 19:30:08 +0800
Message-Id: <20201231113010.27108-21-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:47 -0000

From: Bin Meng <bin.meng@windriver.com>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/system/targets.rst | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 560783644d..564cea9a9b 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -7,16 +7,21 @@ various targets are mentioned in the following sections.
 
 Contents:
 
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
 .. toctree::
 
-   target-i386
+   target-arm
+   target-avr
+   target-m68k
+   target-mips
    target-ppc
+   target-rx
+   target-s390x
    target-sparc
    target-sparc64
-   target-mips
-   target-arm
-   target-m68k
+   target-i386
    target-xtensa
-   target-s390x
-   target-rx
-   target-avr
-- 
2.25.1


