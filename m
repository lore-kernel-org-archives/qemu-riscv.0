Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC6C624D6
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:54:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20OS-00086h-Rn; Thu, 03 Sep 2026 01:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20OO-00083N-4v
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:44 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20OM-0006WN-IU
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d032846c95so23853535ad.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414821; x=1789019621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ia4P/jyA4f87m0nyaT4ywXgyJnS0qKlG0zYD7mw5Fo0=;
 b=lDDadWvLig4+G5Wfwai3nfnmMx8i478pJvXLcZI0+PSUmjmpwC+lIzUi0f21rReQsR
 IOOxFx+d6aZM+18GYzXwfpWlS/eQ8bT5oR/ujjhx0rDPC1J3knFyQx+RzlYWzpm67XSD
 R36ZN+Pt3HQCWMSnPSjlEp+m0P3TtUULw3qtenpA93hlXA+VR7WkWsyeEvAiFfnqkijJ
 IlRzcAatQ/DINapn86pnIFEwlObtqFYECggCo/g7v37/P27r+8YMqplpUt0xN9muvwpg
 SuGtNrn65z98IPT5g063+ADniP0tVH6YcoaFPHK2eN30YBbsddc6bSWauhI/ahGvLtLf
 L40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414821; x=1789019621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ia4P/jyA4f87m0nyaT4ywXgyJnS0qKlG0zYD7mw5Fo0=;
 b=MOTp7zWUDGhnzGTUuYR59KCVTh2BdQ6l5BWZyGyqX8hQUrkqzhk/hwMuiPvleL275L
 5F+vKDnDHikirH1hX/SfWy7o4i8ozQm3IvM9bzVsxhpdDuJHJDQkjnpJOPWeqzSu4Jrw
 KAqadWDITHF8wECQRqeY9bn78yuaBIRoCB45ALPfsZMMgI9cs2ryVjNjoh7k5tlrR3Bu
 UzkXQdFOaqz7fh6WPtNP0hxoksshu5vVVsgsGJklNTl8BfZKPgf3/6TZQLQsMyBjSp1d
 CkUfAXiY7jzJkVRWXsai2doWwV3YbVNC8SZ+d0f/PAsFNh0BOLNHXKhGlXxPaIZmZZCS
 DOZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByM6eDEay2CAyAmKriUYh52Gf5iFC6q7q0M+rm6W6NJMgJVwwKjtC4SNdJzu7D4vRBDtrhH6MaEfpYX@nongnu.org
X-Gm-Message-State: AFuF++lISighID+RwNUhKczNJTsAcAZfHQNiyog22oKYLeCIAqsvReXD
 vfQFtgm5IpB92v7mAp7VXVfJCilOK/qoR+UOxh51VEHgCDjEHQK5ARqf
X-Gm-Gg: AYBFou12FG05UD5V71GJEXxE144xCQPByJgHVjsPmhb5J8iHllPD25OvOkPtR11sNXy
 VGA7lmZIWNb3z6KG0lsXbxK5LBcjnfPS+hfWPaOZHn2rN+MBJAA52SnAdHqr2jip9IkKIiT6j1R
 T0njfagyCO9qMjPDL1UaJMpYEoCvSeb0rNWcMAt3I9Nh4CPmjA7rhLTe5K1AImDlIQn0dFHzK4I
 6ldiH4v962MedZAul+DlDGs6URS5Dc6eCbOzJaRp+k0XkP+iiCKOfkGvXWS6N56xU8GkGo9lZLF
 lh/ZRmQaClFrxaYM3nUgBhv0mJoeL44Mhabr+99TsYZ5HAxqbsIPcQTfKjKxnvx9iKrmCaqm+jo
 T5nMaCJjtcnHmo0kfbYd0dcFjef2o16rTQaYwu702nQlk3GbIoao67R8EbtKF01GR68qiHmjwm/
 Qkr1cwc+EsskzAVUiXJI9wZAXRhzOpFCDLw3n3hx4DUcb2ygU4eSiJAkW3K8LZrZ+JGgQu1OUXD
 nsbeMRtQ7/SkgVTh+geNFp2AD80noF2r3x+SfS7kXTR83gAuL9jwlI4t2ovsqXem6mXILDo6GHG
 BULd78PuXy+Nus5xKg8a9t5hdP1J7Nk=
X-Received: by 2002:a17:90b:268d:b0:398:ab03:95b2 with SMTP id
 98e67ed59e1d1-39aee023191mr16722961a91.10.1788414821101; 
 Wed, 02 Sep 2026 22:53:41 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:53:39 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Portia Stephens <portias@oss.tenstorrent.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] hw/riscv: Add property to hart array to allow
 private memory
Date: Thu,  3 Sep 2026 15:21:28 +0930
Message-ID: <20260903055131.257903-15-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Portia Stephens <portias@oss.tenstorrent.com>

There are platforms where CPUs have different mapping of system memory.
The global system memory does not allow for this. This adds an optional
property on the hart array to assign a specific memory region. The array
passes the region to each hart it creates, so a machine can alias the
harts' memory to system memory, while the harts view memory from their
own memory region.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/riscv_hart.h | 2 ++
 hw/riscv/riscv_hart.c         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 197fa1623115..c3cd05a2c877 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -42,6 +42,8 @@ struct RISCVHartArrayState {
     uint64_t *rnmi_irqvec;
     uint32_t num_rnmi_excpvec;
     uint64_t *rnmi_excpvec;
+    /* Optional private memory region for use instead of system memory */
+    MemoryRegion *memory;
     RISCVCPU *harts;
 };
 
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 747754be6158..32fd39737ff6 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -53,6 +53,8 @@ static const Property riscv_harts_props[] = {
     DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
                       num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
                       uint64_t),
+    DEFINE_PROP_LINK("memory", RISCVHartArrayState, memory,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
 };
 
 static void riscv_harts_cpu_reset(void *opaque)
@@ -117,6 +119,12 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
 
+    /* Use private memory instead of system_memory if provided */
+    if (s->memory) {
+        object_property_set_link(OBJECT(&s->harts[idx]), "memory",
+                                 OBJECT(s->memory), &error_abort);
+    }
+
     if (s->harts[idx].cfg.ext_smrnmi) {
         if (idx < s->num_rnmi_irqvec) {
             qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
-- 
2.47.3


