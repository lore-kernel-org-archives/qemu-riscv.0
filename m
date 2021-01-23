Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMw-0003la-LA
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GMT-0003UZ-5X; Sat, 23 Jan 2021 05:41:45 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GMC-0003Gh-PK; Sat, 23 Jan 2021 05:41:43 -0500
Received: by mail-pj1-x102d.google.com with SMTP id md11so5399893pjb.0;
 Sat, 23 Jan 2021 02:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gk6VLOJ8dC9W0TNqig3ksBlOBksYube8P0MfFHo64eg=;
 b=oRAcgiHsJqFqvZE5q1SwDXLHphKwyCGzHTI4Dv9Ic8KUU91z8pD8flSAia+gvOoFCm
 /rxrPBbmOikHrk3BGNCmaEC3IK0GBRC8TrgJgH5xM0LdqZdyPmb/SGEOZ7DL1n81X7Wi
 LVP1T3DCW5jn8EnR6VGncBTC9r86Hzn8jETy8IXFzW93+VyKCC5Oy6jaN/LkL7on0IAe
 IN6ea724kciW11C/7GxRJBxEkvmWS656cGvCSma3Gkx3dkV/h20/bRHLXaO7+z9qmjlt
 s0DLiw/oI5N1MSXTGT+3+x+ry2P0BsIhZhdnlmdhDkwVKVTIO/cN/kSMG0yYIl1H/Stc
 VzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gk6VLOJ8dC9W0TNqig3ksBlOBksYube8P0MfFHo64eg=;
 b=aY8FT5xkfWq5G2G8vtcGYu/+VjCepq05iXuHuMFQnrt9VvDrlgs4HSY+/o5wd/2yMf
 YE7h6RUImzfjR18y4XHvf5pSvF/YB8pIAuD3XjrUpyHSoDkPbVZ/GE0KkiBl069/HHLM
 MUm2xUBGcPGMlv9o/ZrOrNnEa9ztPr+z4sr0njt5/Nq7QmnXVbdDcCuzInLSsrgPHkVA
 R4mUf7UhiZC3BpdBkkOB4nW9UUkMC5qbKPUhhPo6/TXl4WowtkmQ21QilKO2tvFZ1vry
 +WPYyUuPq4gcJTzWu4JyccEUMlOSuqGOigDNURLG8GytqXWHZLN4P69gu836jlyV3+jm
 UhkQ==
X-Gm-Message-State: AOAM5307A0G4mOumB4TKvaxs3YyuXU0fW/Xs3c34jsewiT/8F3pMW1Hj
 +9r8Jz7QYD9yHviMQew2lOk=
X-Google-Smtp-Source: ABdhPJxVZrVQ66aD2+emLqn96NuKY8q5E6uGxCZ3n1OeJAqxMroMNSpcSVNEW1XdbeSv6xYskJ11lA==
X-Received: by 2002:a17:90b:e8f:: with SMTP id
 fv15mr10851243pjb.178.1611398484099; 
 Sat, 23 Jan 2021 02:41:24 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 23/25] docs/system: Sort targets in alphabetical order
Date: Sat, 23 Jan 2021 18:40:14 +0800
Message-Id: <20210123104016.17485-24-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:57 -0000

From: Bin Meng <bin.meng@windriver.com>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

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


