Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh5PG-0002Gb-BK
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 04:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Ox-0002BB-Jw
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:32 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Ov-0001NH-Q5
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id i24so1250170pfa.7
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 01:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HvbeKznqsAptCGDFkM6PvU3ipBd3LG7mLmT6Dxt6mJ4=;
 b=cvEjm5kNkRFupZYBWifwEjyyyONcxzZ8Q/u+InyDZzUYlM689wdyyJQupaNz40Kv1y
 FRPJBYqXoVDAjEatZlVYnTT69AIG6RVX51E8SrhY8Q9icYOKrloegCjsUqMhlxIk5SuS
 Omf/s2rTZpIQru/+UWjPplMyklEEOI2DjfSdlKBgjPzCsQTCMrJmVWPd0u2Xpg07g/ee
 U9tVUN0HMhME93GKiwWKMMACJGZFyvura5bX6bHUynXrY5mHbJbZA3LT4EttqfsspMvU
 fMfNCCUSAnvdEkUIBkgBvMDsHV5M342ZQu2vinJkqJKbQHy2f4bjGOV6LksacgEanPA/
 ucVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HvbeKznqsAptCGDFkM6PvU3ipBd3LG7mLmT6Dxt6mJ4=;
 b=3iMOrIegVjX8YcN5mTWBfjj3wtKKrMvv2vx0Q1xHBfnWXrKwEBF+eT+2Nxgyttq7mQ
 KFgDIZcAoOptRC5bEevIVbxqY/uVvOavf3SxzxJBus6zmg8skMS30gX7BGTnsFQcnOBC
 UYwXWt5Cxvn335yKmkfKrEWxADytuDr3SCpjPmV3806DUzhT86pGucErW0uIdc4inLkN
 /Vt4qtdN0IqdbJ0wxwR6K17rJ2m1Li0EpHX/DVhybxx2fVzqjHl7zGSkQWqCN7OdXUec
 CUUDuJKQM/jOWFVRhXYSaxikkArkg7+RaLp0iG+wkOoGyJfcL9pBuxnqloEQVu70kypH
 boDA==
X-Gm-Message-State: AOAM532SvIxfiV6JkZRSA242o36HpdJBSOr3JBq88Q4Oj2x+iT9HoaaF
 cxHLO7l6+/5b0FLOetUrP+x2q+YWZtVatXFC
X-Google-Smtp-Source: ABdhPJxD1aXHrzoGnUrapsZOdPzXaFLFgGxTzAfEEZvku87egWy/iGhjzNu0NqVoMtZG6v841LXQgA==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr21974771pfj.57.1650442163922; 
 Wed, 20 Apr 2022 01:09:23 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Shu <jim.shu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 4/4] hw/intc: riscv_aclint: Add reset function of ACLINT
 devices
Date: Wed, 20 Apr 2022 16:09:00 +0800
Message-Id: <20220420080901.14655-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420080901.14655-1-frank.chang@sifive.com>
References: <20220420080901.14655-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 08:09:36 -0000

From: Jim Shu <jim.shu@sifive.com>

This commit implements reset function of all ACLINT devices.
ACLINT device reset will clear MTIME and MSIP register to 0.

Depend on RISC-V ACLINT spec v1.0-rc4:
https://github.com/riscv/riscv-aclint/blob/v1.0-rc4/riscv-aclint.adoc

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 3b3ab548f6..0412edc982 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -293,11 +293,29 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
+{
+    /*
+     * According to RISC-V ACLINT spec:
+     *   - On MTIMER device reset, the MTIME register is cleared to zero.
+     *   - On MTIMER device reset, the MTIMECMP registers are in unknown state.
+     */
+    RISCVAclintMTimerState *mtimer = RISCV_ACLINT_MTIMER(obj);
+
+    /*
+     * Clear mtime register by writing to 0 it.
+     * Pending mtime interrupts will also be cleared at the same time.
+     */
+    riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
+}
+
 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     dc->realize = riscv_aclint_mtimer_realize;
     device_class_set_props(dc, riscv_aclint_mtimer_properties);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    rc->phases.enter = riscv_aclint_mtimer_reset_enter;
 }
 
 static const TypeInfo riscv_aclint_mtimer_info = {
@@ -452,11 +470,32 @@ static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void riscv_aclint_swi_reset_enter(Object *obj, ResetType type)
+{
+    /*
+     * According to RISC-V ACLINT spec:
+     *   - On MSWI device reset, each MSIP register is cleared to zero.
+     *
+     * p.s. SSWI device reset does nothing since SETSIP register always reads 0.
+     */
+    RISCVAclintSwiState *swi = RISCV_ACLINT_SWI(obj);
+    int i;
+
+    if (!swi->sswi) {
+        for (i = 0; i < swi->num_harts; i++) {
+            /* Clear MSIP registers by lowering software interrupts. */
+            qemu_irq_lower(swi->soft_irqs[i]);
+        }
+    }
+}
+
 static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     dc->realize = riscv_aclint_swi_realize;
     device_class_set_props(dc, riscv_aclint_swi_properties);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    rc->phases.enter = riscv_aclint_swi_reset_enter;
 }
 
 static const TypeInfo riscv_aclint_swi_info = {
-- 
2.35.1


