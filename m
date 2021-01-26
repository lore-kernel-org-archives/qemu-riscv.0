Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4HPT-0001Ai-8G
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jan 2021 01:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HPK-00014a-7k; Tue, 26 Jan 2021 01:00:58 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l4HPI-0001Xe-4N; Tue, 26 Jan 2021 01:00:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q20so9863487pfu.8;
 Mon, 25 Jan 2021 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gk6VLOJ8dC9W0TNqig3ksBlOBksYube8P0MfFHo64eg=;
 b=qgLSS5zEnbwmxRDpqPBk0EU0S60R5zvyrrjEyssQf6pDbLKNG+dxhtpFi21LciohxK
 K0fIED9z5jrxP3vV8iniZVC8Jbuot6EpuO4rR1RZBldEt+/HcIwSPmEqpZv6mNvsrwJ1
 vz9M/ainUSm7sF++0M4L58pdfWt8BjsoJiuaH1KQkz7er9ahCwRmuIlk6x6t9OdjDiLe
 HFDmj8BmE7pOeP5/O9651EAVp5w5fa5QLoyYhIiMSEG1oCVQUhqm6uAA2mJV65Bce4QU
 LzKHz2LzrWET4Jiz97fzyaGI5y7kGUlEKHalVacH96k011Zb2C1LelU4G+zFJlxeerSD
 g4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gk6VLOJ8dC9W0TNqig3ksBlOBksYube8P0MfFHo64eg=;
 b=HgIQ7NLZxKBuxZ5vr6OgNHmDjwBLC7O9opPIl3BJ4vif4P7WPWJ4e+C8p91j2xEEdp
 DF4Cf5bTpyyG3Mu1btpTEZBSNpGiuzsrRt9OE+TzUnw9YqtGGwA3sVIzGRUCrCKCy/IO
 GXqXkjMYfxJvBomhUUzlXT9S+g2Pih5zZ6soiVjodfSF9lhZu6pOarFfRYtrNwVcIV+T
 lQThpVWMRW85igh4JHmHjPMaseRnsHDzrKNcBVg0N2WhT3d8RNokzp/DSjggWsEXi71M
 VOj19fDZl31FQTEH5eIq+0GHVv/4DE4fxI23A1AiHUe4P+eJv7nv9I30xENblr9pk8q3
 kesA==
X-Gm-Message-State: AOAM531nbzM+eRFheOI2Clvlpwbw/Tk056bsluX8qn3R6Cm+nv52ImW/
 PbM1q/3WM7UWxivuOcdqmGON/j8ChL3vpA==
X-Google-Smtp-Source: ABdhPJypceHQ3mkBTpnmyfHBDY+YWVFBPhO+aKri0dunil2lrwsIjE/V1+rDL9t8YuJgfUE1/p3HtQ==
X-Received: by 2002:a62:18d6:0:b029:1bf:1c5f:bfa4 with SMTP id
 205-20020a6218d60000b02901bf1c5fbfa4mr3731065pfy.24.1611640850439; 
 Mon, 25 Jan 2021 22:00:50 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm12471076pfk.0.2021.01.25.22.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 22:00:50 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 7/9] docs/system: Sort targets in alphabetical order
Date: Tue, 26 Jan 2021 14:00:05 +0800
Message-Id: <20210126060007.12904-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126060007.12904-1-bmeng.cn@gmail.com>
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Tue, 26 Jan 2021 06:01:01 -0000

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


