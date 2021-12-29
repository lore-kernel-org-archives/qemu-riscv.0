Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2OnZ-0004rb-OZ
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnY-0004nB-O4
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:40 -0500
Received: from [2607:f8b0:4864:20::62b] (port=34348
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnX-0004gl-6d
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:40 -0500
Received: by mail-pl1-x62b.google.com with SMTP id x15so14847566plg.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gVgNP+lNfNGU4BTAjk3ZtDth023tc9GvfIxx/eyTFzE=;
 b=nZflVh2aCo2WGOYt+XVZqAY+0WepX9wMMTueFs7v/3rVgtj42r3MYE64jetRPeIl6I
 fVCg1fNln/G6qZMkjj0iezCAR2EFyIpxuueThgwAxoMGtoCQGazD4rtD2zHj6QcRN1zX
 j5BH6jApuodQB3LJF+4SFLCPM3tOOGCph6nixu0JVgf4D/AyCVw0k9VDzlSzuz+yljHo
 I0sRxDRGJrr5iL/aFRgEugzMV1P0pVO2Hw60KKH/GNGKDmY2Lz1jtO/poh93OSOquFbd
 HCIRBpMf8ftZ+hlaQOELL1bLv0Jw2hHYaM/ZU+qBvXt1dcPvO0Q1BElj9nFNNyPltplN
 gXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gVgNP+lNfNGU4BTAjk3ZtDth023tc9GvfIxx/eyTFzE=;
 b=dxNH5tTbdLlwYG0uetrERy5osp/k/2Eq2gEfIIS/uddYvff0Ua8cJE0abna/8vjLht
 +68mIMDQvaTD+SR4waq0qWvVDtFiEUq4NDsMFncRb0tjc+56bkJhh/JNke4eKAXV4RUs
 LEJQc/tKeKaWRxEM9HPdXMVerwwiuN/tONUqxcxlqWm9qiddqk5C4yBJ2yiNKLvl5TSS
 Pwq14P6g+JNfZanHQRCqjFLtlfPjntNRuj4KNWX+NmsB3kEvsnOlFVJALf733KxClD/b
 jx2ic9IszMu4fih9AjF3XrXiJ5mytv+n2YmXwLXhgb63VrLb4zMn1nGousQG6COqUobM
 mvBw==
X-Gm-Message-State: AOAM530XcnXyDSuDovEQ/PfyMUiLfughAj+u8ZCA1oZbSYd8xcYnx/Kl
 UxsZl6RRwkap39ZXb75vVUX8iOMSiajhcJVR
X-Google-Smtp-Source: ABdhPJxFD0aLKR3TpIWgC/BipOci+KruiREYpzUvL8RLegEeUGR6tx/B+wePPFlxtexpi2yP7vkHBw==
X-Received: by 2002:a17:90a:4f41:: with SMTP id
 w1mr29848427pjl.222.1640745278121; 
 Tue, 28 Dec 2021 18:34:38 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 14/17] target/riscv: rvv-1.0: Add Zve32f support for
 single-width fp reduction insns
Date: Wed, 29 Dec 2021 10:33:41 +0800
Message-Id: <20211229023348.12606-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Vector single-width floating-point reduction operations for EEW=32 are
supported for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1f5a75eca7..c3f4dabf36 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2974,6 +2974,7 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
-- 
2.31.1


