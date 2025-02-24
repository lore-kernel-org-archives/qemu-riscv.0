Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F02EC021B3
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 02:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmOfK-0000tX-SY; Sun, 23 Feb 2025 21:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmOfI-0000qC-47
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2025 21:57:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1tmOfG-0001Ae-0h
 for qemu-riscv@nongnu.org; Sun, 23 Feb 2025 21:57:51 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-219f8263ae0so78943155ad.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Feb 2025 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740365868; x=1740970668; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rsbbdzwUTIdz+SJN+vwMzPlK/Tfp1AKNRLi4ZEU2WTU=;
 b=k7AZMdk7dlI9RI3g+M7s5WTDd1s7KxU6wYN/ofZC/PWptYKyfBnRq/uKvX5qCHeZRF
 cO5L4gb9Zl/ARuIGjZYjji5Qc3+/5TQOsrRU2oRreR1x2pJstNuMwncZ4llkhxT+C2fk
 mBvc/KMinWFccgi8nlixRZH5Tz2ogDa+ZzRDpr5A1CpIPXduFKNdZ7YEdTAmkKKuEpfv
 Vy3GyJhu2HFc1g8tc8f5Fl/jEMKHklq40ZaQZ5B85QMYp352md14/6w5Vs5bkhWDTIib
 514JemNmrckAFicxoZRLZctNRTIljIVS91qmm0uc/BCR+V7lO3Bd+0rekGIiAoEuVKRx
 a49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740365868; x=1740970668;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rsbbdzwUTIdz+SJN+vwMzPlK/Tfp1AKNRLi4ZEU2WTU=;
 b=Oh2SlnzRcy/LdbrfJvCg4T+qV5nPD1t9MpodvVbzxwg29CAi/n1EFfA+hv0cZi7fsH
 QJyVOAzQkZGCBOkkUca7Qn9SBrGXgkTXh8OV5fV5F2pou0QJ8Bc7R+M/nTArOh5I43k1
 VHWYvm4ECNaT/benuonrWqcEjX7h5fdcqH78EVkE85UhBUl10zJLas7fkkMFPm5lDpF6
 IqPLZ1vuY7khu8Ep8rl0Fb92nYKBgGIL8cnSfxapjnVrPM5XCcViy4EyR/I8f177nKDv
 P2aLUDoGuKHVtl2QwZhUsBw2L99px8UER7878Ruau4wOas6AyzlmeQ+457Q8zFTExAaC
 wb/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVahtL6Wlj6AZWMQqh8qIdb2FzTjt7HJZ5Xv4UteMQtveqZaCGJRBag1sJ8DywBhu7JoCSgjuoZ3mkL@nongnu.org
X-Gm-Message-State: AOJu0Yxz62gXGmz7GPqnEXa6NrbvIJa/Rmy1/lEqKNqJjfpdPTPoZSaa
 Bkk96n2QhyIkvj+IfnJhTwT/xN+l3JvnGSZPOzBvX36ifSZ3l4JnD8ZiJeSd3CU=
X-Gm-Gg: ASbGncs5hwSIV0kwJDCaF/Bd8RmFH+3ceYvHaDDkFhIhKwWDZhLnWJK2RdJ33kMX7xp
 fyozbd7Tt2FrUFP7f2K+1jSJvR7j9LrR5KON/lhGU4RN2ZUT8vH3jHJrWZm1h0ls+ndpjRY7aUw
 rc0E7ZD3IrmupKCcMdQJ8RhgqxvglHKASDKZUZb6oltqakouAXhHTLdXuB4ute5+tzkkdqImGiI
 E6isMQo4JphX/5I/+xBlr+qsfcPUu19OdplSqtIeSoXWH6ax+IT6OQJ7R5fkkEOTuk9ie6CzzqU
 kkIm8iKTdMiMM4u6+MOOhuYSkgpIy2tU+nNuJfzsEw4xB6iDQmquLG00
X-Google-Smtp-Source: AGHT+IEJCX5vZgveq7Has+i5og/h67WkggkqDWIC04MnputBAxFU0ihYbpFtgL0l3UTVbqnik8wgaw==
X-Received: by 2002:a17:902:ccc2:b0:220:c113:714e with SMTP id
 d9443c01a7336-221a10ea4fbmr167667815ad.21.1740365868437; 
 Sun, 23 Feb 2025 18:57:48 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d53490c2sm171660665ad.47.2025.02.23.18.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 18:57:48 -0800 (PST)
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
Subject: [PATCH v2 3/3] hw/intc/aplic: refine kvm_msicfgaddr
Date: Mon, 24 Feb 2025 10:57:20 +0800
Message-Id: <20250224025722.3999-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250224025722.3999-1-yongxuan.wang@sifive.com>
References: <20250224025722.3999-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x62c.google.com
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


