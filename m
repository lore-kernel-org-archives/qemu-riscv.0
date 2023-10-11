Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6DCCD6E71
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:47:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqZX3-00044b-Rz; Wed, 11 Oct 2023 09:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqZWb-0003rN-0f
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 09:45:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqZWP-0001Vw-EU
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 09:45:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso6495222f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697031906; x=1697636706;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PR/k1jk+L5GVDsO5EvG9L65Srx4ejFSRYd/PckSLUK8=;
 b=ahA6FWYauRayOgm7zywz9j6ePjrA+NLE5d8cKi7/+2Da9QH5oKees7zJIwoeBPo/RZ
 4pXDsQyzp/H4wgRn+GAM7vzS+qDpJR2mTf+5wCTH0I0zBMP05kFO/OY+SusgamZD64nP
 IYkbiaQgMdyRVCAgkhronlPMiweaQOtN8ONQ3S9T7JjnMGW0KrMJcuAhJ6T7S+GAjg21
 ZMtL1/NTy7RZoWbT03fLYL0MniKYVRCkvMy5+PtghhzPqKLtcFMO5hqm9uJnm8czGlyf
 3ZhmYdgcwH1MCZHhRxiUjam/pxmWdlIxWYqvEKiEaQvZnHIM4pScwL3I2kpa2FuLSUHv
 maFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697031906; x=1697636706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PR/k1jk+L5GVDsO5EvG9L65Srx4ejFSRYd/PckSLUK8=;
 b=Rmaf0YHSr2ice7W+2C1k35b/gVGAP9eo7OkXekBjEsChR2jSyBTbDCWC1RI+Sb6YAT
 lnZXzPt0pVka+sP5Gc7Glw8UStbB5b0WpiXt/znDjmcaqRYwIkfDDxq9rJJVksXNiSdz
 iRPkiQXgV01/bmZ/5B34avBdzoRxfOdZRt/6l4Mv0vZmHBZrFFuTjdkikvk+DYLkc3uv
 XiDtqHkj2pILFe+oDr6KWa+I+EYE5bLUkNwneO1l8WACIB0J7LrtBny83CIYlA1xcLMu
 DeqF2FGYODmxcX1AP52x7XUl6v4DHVO9ye6OVogSGv96G5DPaJ+50DXNVlmyG8B0jmYz
 YDQA==
X-Gm-Message-State: AOJu0YzNswDYsyWCI3Wen+AwCWdVmNVAk77Lt3BcM5a8QuYYlyErjAdB
 zudImWDHLrqQXl3yXIa6Ud+F9uV8/dw0qYiZcbHryQ==
X-Google-Smtp-Source: AGHT+IGS5jQXR+UdTa6GNv0WcjqmEiAwxnL2mbU4brez2BKgIg5B3dJo8e+5h6Gc9TDu/vwyD0lkbQ==
X-Received: by 2002:a5d:4d06:0:b0:320:824:e3df with SMTP id
 z6-20020a5d4d06000000b003200824e3dfmr17929446wrt.35.1697031906376; 
 Wed, 11 Oct 2023 06:45:06 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.ba.rivosinc.com
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm15583141wru.35.2023.10.11.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 06:45:05 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v3 3/6] target/riscv: Set VS* bits to one in mideleg when
 H-Ext is enabled
Date: Wed, 11 Oct 2023 14:44:47 +0100
Message-Id: <20231011134450.117629-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011134450.117629-1-rkanwal@rivosinc.com>
References: <20231011134450.117629-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

With H-Ext supported, VS bits are all hardwired to one in MIDELEG
denoting always delegated interrupts. This is being done in rmw_mideleg
but given mideleg is used in other places when routing interrupts
this change initializes it in riscv_cpu_realize to be on the safe side.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac2b94b6a6..0e7620d1ad 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1492,7 +1492,12 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                           riscv_pmu_timer_cb, cpu);
         }
-     }
+    }
+
+    /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. */
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;
+    }
 #endif
 }
 
-- 
2.34.1


