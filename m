Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngjrK-0004HR-V2
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 05:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjrH-00049j-1S
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 05:09:15 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjrB-0007t5-HS
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 05:09:11 -0400
Received: by mail-pl1-x630.google.com with SMTP id d15so14931494pll.10
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8sLh2iau92At/B6mq07hztRDUwrTE4mFjmBRk+/t8SQ=;
 b=LHvycIGFj9hdWTefg9CurWZbqsAW/mQXYiqySAXPBftwmkIvybd5CvpC3xH4D8hrsW
 8/cvzdEzs2Z1AtoFdjENhM7VDDy0YGvpEEOLWA9611ZIyHk02Z1TRkJerb/JFcdSkiQI
 2gp1kRVbtaIIzqk53YeTkVBbIfSKJfZo0LW4nw+Vl3DyZdd0Lzoqh2GKdUdfsqhwO/kp
 dU68frG/WWHOQeAENUc+jUfoiTvh1m96BDaj6AwZUvPxMqqW+knO7fYGOXZ67GP6CfxJ
 zqB6ZrOLqIWs6GETGwhFk3/ej5jA81C+rxMORYaJ4NMiEOsCzFd5Hf0JgBbOPAZFFyB+
 bfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8sLh2iau92At/B6mq07hztRDUwrTE4mFjmBRk+/t8SQ=;
 b=Dz9eCMxFy1oGIWz9v4xU/p/z6FfLqeOnYDo2AJ1A8ySCl7XM0V0RF/3IzY7W/ceg6d
 VRPPJI2lgQPsXo+GfNKCz1FuIFGy72ulIlQUMqNZTbvSELHLKzbZlGIJdDrAhIQT6arc
 rNVvzMU6swASV/bSIp18xSrW2Z78rGa48dcwCfdUaUXMuYfr/phnPVRtNOEHAFlrTPKy
 wBj1YmTtGhRyo/5EIx7kXOBgLCyRqzblMSlNQvKjlAdiFCDY+h75HBrV01baZRE0vJO7
 Q84qSUQA+12BK0vxOGbM4SEmqI6magy4OWeDb6yf1Pndgw2JkRZ7Y8notnKtslj9A9gm
 e01g==
X-Gm-Message-State: AOAM5339EKV4kKS/304BMx0xWm1Aywws3DuNOb5nAoWOvZGSDGp4Yug0
 7/5Z7KaiIVWZ10MR+PXHc6xM8A==
X-Google-Smtp-Source: ABdhPJxBNN6hjEsYh7cftDG+sNPRzx+1zIfKwDYGMv5zOn7wblsr3cMSFfww/ZC04uQ5pIX2bqj8Iw==
X-Received: by 2002:a17:902:b213:b0:158:d44d:cad4 with SMTP id
 t19-20020a170902b21300b00158d44dcad4mr14802948plr.45.1650359348259; 
 Tue, 19 Apr 2022 02:09:08 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 fv7-20020a17090b0e8700b001ce18c551dcsm14963381pjb.19.2022.04.19.02.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:09:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Shu <jim.shu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 4/4] hw/intc: riscv_aclint: Add reset function of ACLINT
 devices
Date: Tue, 19 Apr 2022 17:08:45 +0800
Message-Id: <20220419090848.9018-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419090848.9018-1-frank.chang@sifive.com>
References: <20220419090848.9018-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Tue, 19 Apr 2022 09:09:15 -0000

From: Jim Shu <jim.shu@sifive.com>

This commit implements reset function of all ACLINT devices.
ACLINT device reset will clear MTIME and MSIP register to 0.

Depend on RISC-V ACLINT spec v1.0-rc4:
https://github.com/riscv/riscv-aclint/blob/v1.0-rc4/riscv-aclint.adoc

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/riscv_aclint.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index ad7ccf96cd..67a07bb5b9 100644
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


