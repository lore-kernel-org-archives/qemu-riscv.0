Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vkD-0000yV-5W
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkA-0000wR-4r
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vk8-000479-8o
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:05 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vk7-00046h-UY
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:04 -0500
Received: by mail-pg1-x530.google.com with SMTP id t24so664560pgj.7
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=B0OixvxDRun+czMvNrLEKq3Xb6qPIsVdgs0f+iZ/N/w=;
 b=LROWYOLHx5phwHtn15nNwfW3SEWM2Kod68jrhN86Lxio1eWRgbh4IOB8C+3c5qYJa3
 lk7YcGC+lHXhqXQ9VZj215HGmFSFlimvWGN9s/SJV4DlScXScMEf84Qoe1gVXmM08Eq8
 So47E9QmgEJWUMERNKsvHapJRduwL8+MOW8PGeT7K4M5aVMnw3Yu7nlIrces41Q4JRnt
 p6v26/U2OnBICiFHX7X7nUgnR1PzaHTFSi7Tb+i7agwJTuK6x7wuPP/zoJb4gXv1rm4j
 Uc1JipGc5apj7XtFuf1UA3Bh5scYw520x4dnoqmqe505IxCHA3sllC7zpBHLUqlBna8I
 IuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=B0OixvxDRun+czMvNrLEKq3Xb6qPIsVdgs0f+iZ/N/w=;
 b=o/5m9qCqRFdEeaHPQbT/leMYkC/2gID+4Zng7wbVaxUJ4TPvEb9O41XYBXqUEmMFrl
 tK5kWfvvdYurhpnUwQap6ejmYKpwIUM3XA2X2LAGa/WYc+nvoWrSS4GB5qyVQSvkZDy3
 KgdZTEaiEeTZV60jC9/IabRSAgFBNrVU/HjV5gqo6AyJwIPn8X1+qndnjk043kRAJ7PI
 2CeVPV14wpxjOWfa/EENcAdgMLYP/LXaqWXkZAuPk0wZrDAIfdqxiCABiJqEgh0qUgTk
 XMetdc1MueBtmIFpP5Ykq5xuLT7ppDCqjYG027Xj7zM9uP2sqzyg+BLBD/PYVP5YdN1V
 d6qQ==
X-Gm-Message-State: ANhLgQ1WDrOI91UmIi9HYhYB46ww6CtOLQtqRpStybNyb5PmUUg0w8Og
 0LaGWwI5RNctDI19Qtjj2Epbwf7yC90NKw==
X-Google-Smtp-Source: ADFU+vsllffNd3sCuj8cQAWV9aVjzlRGaKxS/MMKIeGmcqQW/QttVPy3qPeo4mmWy83HqfjrVY3RoQ==
X-Received: by 2002:a63:1404:: with SMTP id u4mr522050pgl.172.1583196541538;
 Mon, 02 Mar 2020 16:49:01 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id g20sm348025pjv.20.2020.03.02.16.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:00 -0800 (PST)
Subject: [PULL 02/38] target/riscv: Add the Hypervisor extension
Date: Mon,  2 Mar 2020 16:48:12 -0800
Message-Id: <20200303004848.136788-3-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::530
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:07 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 95de9e58a2..010125efd6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVC RV('C')
 #define RVS RV('S')
 #define RVU RV('U')
+#define RVH RV('H')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
-- 
2.25.0.265.gbab2e86ba0-goog


