Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1vqT-00025j-Fl
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 12:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqQ-0001yx-JC
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1vqP-0000Ie-Gw
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:38 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43565)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1vqP-0000I4-AT
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 12:30:37 -0500
Received: by mail-pf1-x432.google.com with SMTP id s1so1557232pfh.10
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2020 09:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=jvUnrCfwBmFS79rScsI1Rt17EyEa11qYGHquQ8V2ZQY=;
 b=fQ/I2joQFMaynu4jWp9UQZX/4R92DGprjnwF4HK5xMNmgKJkNnWv5bZEZ3udG0zcRy
 DcI8arHDLvgUoa2I5h6hEgnokPMqJl4lxAMHLOqmLmVrt5RnSgJoBEPPqf+ZkJju678s
 5uRGh7MdlVLhq/MurySrb1MBJnSQuaueGIXJrkwHiCEVa3kddJ53GlUuk4l9mB8yAz1P
 elUzcZ7l6CNT5JQiBjVFVnb70XGDwnrL1lTBtH4Cx77JqtN5hwSTTuSnq8OLsPec8BEY
 eN82YyqxUklYzUJeL/8qd0zaTTRZB1tg+fG6MplPQPYUdcMfkgtJRMvzLJfeND+pIkj8
 J8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jvUnrCfwBmFS79rScsI1Rt17EyEa11qYGHquQ8V2ZQY=;
 b=IQ1/QPUydXorR7ei05je8m40Y/rBdyHlzj7p7dmnnbVFhjetdlGiDdILyKnWge9OGv
 hDfVnEIvejQByndqAfPzOhkW6u05Lvc5tCIRzaUMq5kFbXenvonloHh7e9nb9x9OLY8J
 io/nO1laC0SfRWOAy+n0EWFIuQ1dA0RclN5OOd2nBXU87KCltGHoZpdTZWiE6I77Wjn6
 hNbDBiUn8Cal79LuOTcPrNkdIraC4skGs/e8jZ9T8GiWCvLN+Bi/5A02lf211YGVS43H
 s4qnnjVjpDd8PM+yBqb/0YqkhLEV8j5Af/S0Vdehm5pk4/pQES96g59I+q/YJ16C5SbW
 twlg==
X-Gm-Message-State: APjAAAVabRLKno4MmY7bm27wBhDmBIK/mfPRD+FTZqe6isql77bwrc5X
 oE/vAZTC/0uWF5CYdkHDsbeOcw==
X-Google-Smtp-Source: APXvYqwy57jU5T4RF43F6BY/GDPQpznZUrJoEHYug2LlYD1fKV9nybBmCQVrbAsqdezaqC5V6CtuzQ==
X-Received: by 2002:a63:d042:: with SMTP id s2mr13380564pgi.66.1581528636271; 
 Wed, 12 Feb 2020 09:30:36 -0800 (PST)
Received: from localhost ([2620:0:1000:fd28:dc94:91b3:e554:4ae7])
 by smtp.gmail.com with ESMTPSA id g9sm1530599pfm.150.2020.02.12.09.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 09:30:35 -0800 (PST)
Subject: [PULL 5/5] MAINTAINERS: Add maintainer entry for Goldfish RTC
Date: Wed, 12 Feb 2020 09:29:21 -0800
Message-Id: <20200212172921.36796-6-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200212172921.36796-1-palmerdabbelt@google.com>
References: <20200212172921.36796-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
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
X-List-Received-Date: Wed, 12 Feb 2020 17:30:40 -0000

From: Anup Patel <Anup.Patel@wdc.com>

Add myself as Goldfish RTC maintainer until someone else is
willing to maintain it.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce46c0a552..43d29ea662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -562,6 +562,14 @@ F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
 
+Goldfish RTC
+M: Anup Patel <anup.patel@wdc.com>
+M: Alistair Francis <Alistair.Francis@wdc.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: hw/rtc/goldfish_rtc.c
+F: include/hw/rtc/goldfish_rtc.h
+
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
-- 
2.25.0.225.g125e21ebc7-goog


