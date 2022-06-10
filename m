Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzWy5-0003Us-Bm
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 01:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxw-0003Lt-Kb
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:50 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxv-0007bV-7B
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so1181018pjq.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2p8l64Jlaec7udx1XYJ9DFcPbvulXsTX1OpQh2oSmd8=;
 b=kgkU1Innt4ang0oOs+QLfmvaMmiSrLPa5AGFYBqY119YQ2e7Z1TjzFYhHhwO23Drmi
 x5CQrUZ4c+u5MFblcqv96LgDH+CRgElMGt950rINFPCwo1zvv3qMok6K/vRcraDuG3Ri
 ek0WoJqVszmMkV2gTlAD//wQwLq4r9tIQvfKyjjEqYxRAjLpnTaoWmfbVH2DGiO+EZvV
 v54W9vzK19Wttnm2F505uV5rV/O0wn4Towwtls4+14bMc0FC+4CCN2kkKFYROxX0JmMK
 K5bAkO+4ylfGnRywxEFww0SDDG4Jim3wCKU8TOOjEBTo2zuKOMAuGjfUOYBhxz0D+MEQ
 TJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2p8l64Jlaec7udx1XYJ9DFcPbvulXsTX1OpQh2oSmd8=;
 b=E6kS8J23ZZGjs+LgkB+FxDUfz7J4zwHqHwmfhaCRdsr6aMSc6v023z8kDOKfMVX0l/
 Urb00dNGktub0F7B7GrR8OoYU+9dRnkBJdKBju6Bk1WmE+c804onGA7/hDbbOhIxRzgn
 mCccFyFhp5GTTEqK9zrk75vLJ80UryNzjW41lM1p9/FBTrgWyllgs4zqutj66AEELYUx
 XtY95SHH8/qhL5nFuskcJr3uGOA1fFu5JNSLsbOfNoZC4Js2BMxlJs/Bo5eCBDu7EuBu
 J0Qr5F6nhl0+ptOZ/pDuIrQM4wsRV6A4JXTCh/zA3hqq4uLFuw1tIXdXnXwDy/QBHpKe
 b0zA==
X-Gm-Message-State: AOAM5303FnJ352Ek8L97gtlbhb1A2b5NRrDj2NOz1fG29n/dr2D/rY9x
 N8XRSRQHhHMO6cOGbd7eEpPj7w==
X-Google-Smtp-Source: ABdhPJy+4cSqPZbIh54m+UbdBrsFbDPviY3tXkHvpx7lObb8/JUZiXkBb8vmrYHoNbcv3Sd1jWYlkQ==
X-Received: by 2002:a17:90b:1b07:b0:1e8:41d8:fa2 with SMTP id
 nu7-20020a17090b1b0700b001e841d80fa2mr6924164pjb.204.1654838025942; 
 Thu, 09 Jun 2022 22:13:45 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 4/9] target/riscv: debug: Restrict the range of tselect value
 can be written
Date: Fri, 10 Jun 2022 13:13:21 +0800
Message-Id: <20220610051328.7078-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jun 2022 05:13:50 -0000

From: Frank Chang <frank.chang@sifive.com>

The value of tselect CSR can be written should be limited within the
range of supported triggers number.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/debug.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 6913682f75..296192ffc4 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -126,10 +126,6 @@ bool tdata_available(CPURISCVState *env, int tdata_index)
         return false;
     }
 
-    if (unlikely(env->trigger_cur >= RV_MAX_TRIGGERS)) {
-        return false;
-    }
-
     return tdata_mapping[trigger_type][tdata_index];
 }
 
@@ -140,8 +136,9 @@ target_ulong tselect_csr_read(CPURISCVState *env)
 
 void tselect_csr_write(CPURISCVState *env, target_ulong val)
 {
-    /* all target_ulong bits of tselect are implemented */
-    env->trigger_cur = val;
+    if (val < RV_MAX_TRIGGERS) {
+        env->trigger_cur = val;
+    }
 }
 
 static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
-- 
2.36.1


