Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVTQJ-00060G-I4
	for mharc-qemu-riscv@gnu.org; Thu, 14 Nov 2019 23:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iVTQH-0005zt-LX
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2019 23:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iVTQG-00084i-NV
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2019 23:41:29 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iVTQG-00084H-Iv
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2019 23:41:28 -0500
Received: by mail-pg1-x529.google.com with SMTP id 29so5198296pgm.6
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2019 20:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=OzEoao2IwUVlnSm2tLOqOqfLN0Byl7NdWouaeEHTbz8=;
 b=YtEUxre54I2H3ekSyai7tTjcbmebsXNZrIAv+n6Z3tleuJouK7s3pMaa18Tx6TJZVH
 rqdhOqe3K99p6PiVOhgytj216zVFNK2he3GRT+vX/3LrwmHxr61aFITSopLi03DAKNey
 3ldy0KgcFEhrfDWsUJ08rrAyuRCEs8T/iRwg++S83G1C82b6jtugn85iQMk/W0AlN6Sd
 KC1MXpmKGuygrBMGSMMCEj3im9V7DppOZMpiiu6WV/Ntuff/3sIrPyd3yX67rDPkaDdg
 UposlhaZmCjixPmQmpCNLHaUVmMbs7ED7jDGfGWotx8PyNKufwZAQG+wdZ64auwf98iM
 JPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=OzEoao2IwUVlnSm2tLOqOqfLN0Byl7NdWouaeEHTbz8=;
 b=hqdeO3v9pFNDa/ALGc/V9c1ke705IVHy+3bD2YpbYzzNpKuxOwOTsd/QunnaJFRAaB
 e5+rcvHcr/AXk6Gz7FZ0GkZRxbc0yn4zKVdj+dtM/YvWaPyIuLiFmWlqewpbIQsExdTg
 kQRXGMY8HU7dmXJcpZX6p1XSYbj/f0Ad+D4IamNeQvfvKmriZV+KldkkFizW60sPhqY0
 jP/G1qlsz1DWJDOaE8n4pohtQOjhSNlK/6D0wLDERriiiF+6BxIcjdpyRKFsDCnlz+bK
 I61ZwY+GPDTuPOYaAg/RZ52+Kny9XzEM2iWTcRFxQ/C4GOBs0D4e6Vojc885H2eNSNEh
 8ROA==
X-Gm-Message-State: APjAAAV75GgV1LngX70HF5KwCoKuvv3x2aecG4XFYpXzMkTp/ArbX1rm
 ymSupO+iq5OWbLuAaWMxEJWb/iW3PSk=
X-Google-Smtp-Source: APXvYqw6RvrDK8qlNn1ESpbD2e3Tj8Arj2xjs0SF6ZWTlrhDJ7sIYvp2BMGrnup4RX8Y1y09H8TSsg==
X-Received: by 2002:a17:90a:a00d:: with SMTP id
 q13mr16931431pjp.106.1573792887135; 
 Thu, 14 Nov 2019 20:41:27 -0800 (PST)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id a12sm9419246pfk.188.2019.11.14.20.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 20:41:26 -0800 (PST)
Subject: [PULL 1/4] remove unnecessary ifdef TARGET_RISCV64
Date: Thu, 14 Nov 2019 20:41:01 -0800
Message-Id: <20191115044104.4197-2-palmer@dabbelt.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115044104.4197-1-palmer@dabbelt.com>
References: <20191115044104.4197-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 "hiroyuki.obinata" <hiroyuki.obinata@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::529
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
X-List-Received-Date: Fri, 15 Nov 2019 04:41:30 -0000

From: "hiroyuki.obinata" <hiroyuki.obinata@gmail.com>

Signed-off-by: Hiroyuki Obinata <hiroyuki.obinata@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b26533d4fd78..ab6a891dc381 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -64,12 +64,10 @@ static const int tcg_memop_lookup[8] = {
     [0] = MO_SB,
     [1] = MO_TESW,
     [2] = MO_TESL,
+    [3] = MO_TEQ,
     [4] = MO_UB,
     [5] = MO_TEUW,
-#ifdef TARGET_RISCV64
-    [3] = MO_TEQ,
     [6] = MO_TEUL,
-#endif
 };
 #endif
 
-- 
2.21.0


