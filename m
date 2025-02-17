Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044FC021A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:22:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjwMd-0007ct-BI; Mon, 17 Feb 2025 03:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwM9-0006U3-7z
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:19:57 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tjwM7-00018f-49
 for qemu-riscv@nongnu.org; Mon, 17 Feb 2025 03:19:56 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-219f8263ae0so71023305ad.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Feb 2025 00:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1739780393; x=1740385193; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rsbbdzwUTIdz+SJN+vwMzPlK/Tfp1AKNRLi4ZEU2WTU=;
 b=TXgjrxVcvrV42VU8pNo7yCUzDYEtXYEUq1hBCaapd7n6rLKmDgP3L3wtv0d0N+cUT1
 s7ua9LmgIxN2zplUvqwXg7Jin75rCaR2GfQhtOoyyRMYH6ZBOD76GqxDIkiMjtKd6Plz
 2AfZsE98b52VRMUt9TEZs2Yf09CMa3ixT8JPBmQGqJA5UJNEuL/S2APhZ5PmbUwG4erB
 IyOj1YmagHsbGg+usIDENFqEg9SC8nBuV+HxFX3qblGF+7QpIvzpw4vA+26gzengCflT
 TtwXmdGLUYKgGOHmhv/A98OrRiBSiDstOUFMV7Tg8kWmSlROtRtrP5XAugYXokQLafOv
 Kqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739780393; x=1740385193;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rsbbdzwUTIdz+SJN+vwMzPlK/Tfp1AKNRLi4ZEU2WTU=;
 b=G5XeEENJHAXsr1QxeqeBGAWcMhbFORtCI3H1mvKFw4ZgEbVKbX1hTiVxrwOaFEf8ga
 uQtEKDWUExmBsMWGx/DLraenedhkBjkxrz3r+lk5BZkc88WzSUPYw9W2PUxF6JSFpW3p
 A8y3Hf9kT+FGy8fJ9byfmk7vwhHLkE7+gGSa0yGaqX9xbTZALYOFKjrXiucErL8E0OOr
 e9VRdKd33ZOHKezqP2NqSRknq2gUz8T0AI1z+gUTHD4oz/F4VU1xwFq6ldBrV7Nu7oyV
 hiM8Ex+9wOSmDKzl5FqgpOIXe8bNcFX6ACZrvQ0cnY6dWOYpWHn9nQVTEPi1FS4fuHgR
 gWOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHrsln9sKv3PB1Y0r9OFLrAPs7GlryGNyGf4k5LZq+h31zolsaUKvzKlXM7G0Xf+TL4iBNjhnarEzv@nongnu.org
X-Gm-Message-State: AOJu0YwgHZ81CSJkBbntECw5zSUOkKc/HO4u+R27nuEaxaGpaxq0WXUY
 rWl1V1fvWW6M54s3XW7lBEW5fRP4wJotESUGHFfyedlMbhLhWn9wTpTCZWRKkeY=
X-Gm-Gg: ASbGncv0i7wI8d5zro3MGPRm04obpwNPQ6wtPHOik3PukPSrZyolQnDSjZbZGQZFd5+
 XOs2Rg+ycrqVAsLNWxzFB6DioSK3pUIUX2wEjAr8q7DqS/YiMWDK9CuW3K41yd3O2zD7xzkfUrP
 52Sq3ILCgqt8jvtwbfJLV7q3yzV6WRaAm2nafCClePhezJr941Of7XVY4g5UZ+bhimK3VORRJno
 zAx0JRU+5t5yD3nmvAJ8Jx1vcHIzFwfaXrQp4/cPWu7KU3Ww66+P6u0hJvAogtf6uhUD2Xr5mIX
 MupRw3Z9ryTCnTLzNTMkqvEUH9jSNeuQYl00il8+Cz3MGA==
X-Google-Smtp-Source: AGHT+IErxbEeh1400cHRCZvfrsixcv8DALoxrTLqvpdfmv/G8dI4FA/lBB6GEBH9+uV7LqaK/VkNiA==
X-Received: by 2002:a17:902:f612:b0:21f:9c7:2d2e with SMTP id
 d9443c01a7336-221040bdb68mr154732425ad.40.1739780393650; 
 Mon, 17 Feb 2025 00:19:53 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556d5e6sm66023445ad.173.2025.02.17.00.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 00:19:53 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 4/4] hw/intc/aplic: refine kvm_msicfgaddr
Date: Mon, 17 Feb 2025 16:19:26 +0800
Message-Id: <20250217081927.10613-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250217081927.10613-1-yongxuan.wang@sifive.com>
References: <20250217081927.10613-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Let kvm_msicfgaddr use the same format with mmsicfgaddr and smsicfgaddr.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 hw/intc/riscv_aplic.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index e5714267c096..5964cde7e09e 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -181,8 +181,10 @@ void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
 {
 #ifdef CONFIG_KVM
     if (riscv_use_emulated_aplic(aplic->msimode)) {
+        addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
         aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
-        aplic->kvm_msicfgaddrH = extract64(addr, 32, 32);
+        aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
+                                 APLIC_xMSICFGADDRH_VALID_MASK;
     }
 #endif
 }
@@ -403,12 +405,17 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
         }
     }
 
-    if (aplic->mmode) {
-        msicfgaddr = aplic_m->mmsicfgaddr;
-        msicfgaddrH = aplic_m->mmsicfgaddrH;
+    if (aplic->kvm_splitmode) {
+        msicfgaddr = aplic->kvm_msicfgaddr;
+        msicfgaddrH = ((uint64_t)aplic->kvm_msicfgaddrH << 32);
     } else {
-        msicfgaddr = aplic_m->smsicfgaddr;
-        msicfgaddrH = aplic_m->smsicfgaddrH;
+        if (aplic->mmode) {
+            msicfgaddr = aplic_m->mmsicfgaddr;
+            msicfgaddrH = aplic_m->mmsicfgaddrH;
+        } else {
+            msicfgaddr = aplic_m->smsicfgaddr;
+            msicfgaddrH = aplic_m->smsicfgaddrH;
+        }
     }
 
     lhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
@@ -431,11 +438,6 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
     addr |= (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
     addr <<= APLIC_xMSICFGADDR_PPN_SHIFT;
 
-    if (aplic->kvm_splitmode) {
-        addr |= aplic->kvm_msicfgaddr;
-        addr |= ((uint64_t)aplic->kvm_msicfgaddrH << 32);
-    }
-
     address_space_stl_le(&address_space_memory, addr,
                          eiid, MEMTXATTRS_UNSPECIFIED, &result);
     if (result != MEMTX_OK) {
-- 
2.17.1


