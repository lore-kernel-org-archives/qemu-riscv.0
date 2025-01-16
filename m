Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB07C02180
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 13:49:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYQFN-0001L9-SK; Thu, 16 Jan 2025 08:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1tYLWr-0003Pb-VY
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 03:47:06 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1tYLWn-0007SK-N4
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 03:47:05 -0500
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso3399255e9.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jan 2025 00:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1737017218; x=1737622018; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ubcG+QppDIx/jZMkDYBenA+AlXgLGAnXxSTUOAzYLiY=;
 b=LyeJW6CGG1Gmx/D4nJtLZ4NHd8VR/mP5lBcd4B66kCElnrfjIFu76UeOZ+TkJgJB3W
 /w9jTyCsBj7MlWaIjtypgmQ9elhgJbHmSwbyolI2UVj8ShRtAhRPy4T2UVLMGSECruG0
 lrqnsBQDdtJ93ZB+ENSfTN/xA5ExQrSZOgReYVsx2RmAYpR/aT9swsJBE+mNh5pg0Rgn
 hQxt+Bf3/GzcNntcRP2aDdUMvBF+uAxeNhuIhY264BUS2abgpXWVuxXHIwS1dhLHgAZ6
 KxW58NTuw0kqvETux2+xq4oSYpftpa1vQY8iiTf4Sl6abgWH9p1y8/EZsagQkTvfZOkD
 Me+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737017218; x=1737622018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ubcG+QppDIx/jZMkDYBenA+AlXgLGAnXxSTUOAzYLiY=;
 b=jiod5/3HSdqkNNZ1W4faUByfV0++Tp90EqZza9kWuDDPxI6vDLYyxxGk4ECaMm+M2y
 YVcbwROuiwKjCxTi4E1LLDyjLARj3VBaCBTo4AGCfPzSGWDTHcqIm8ZaToWFy+vItgEO
 Yu0t2uYAZxF9VmtJxbL/M4lxwFspD30ZwJ1XrPtnaOSfL2qDNRWCYCrm/owo2kT/2l9s
 wktgfRnr87MbmVj3/701gxvLvASQff15HwVzuN+tpsUNti9zn6JPdrojZbQtGvvTPocg
 WT4mpSiFPoxTKMJTRdahZLE5MgpnlCimBcSpXepts66BVz1brr8oGlkr1CIJCAUroXdn
 4Z8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Pu7SPgYH9l0RB4H+IvyQoZlNguZsH306RoRVbiEDjxYKX9CVwAb/v9lHJ1j4IonUTkA7hwQpj1tP@nongnu.org
X-Gm-Message-State: AOJu0YxXu8QvIxEx9GF8QZirO9liRWBss3GAvKM0/h5d/gLnR2ugmunb
 GkwFSwP3XjufgrUuT6i0AlWbvltDFqprpmcERsO7JOXpYOfNPKddjS9DcQoIRbs=
X-Gm-Gg: ASbGncvoDbBqR9NeyyNxJJv9B/Nhx3csd+MNvWU8ioCpyjmheIOr/5bcRzHWyVNyEx7
 NlDqeavyqnnuOyRHeHVRywaCRmOwre1p/NMpbS8HPySOtbKunPI54CNDfAmFTGmBLzMjTt1OD4i
 AujMhfq59O/5/sAZzMz1FpLQk20pyNvD9uorcnKeL4LdPv0+N5PLdapENk6IQ82EUATVZ9ke/75
 +jdIVm5y+Yemyh1DPw5MvFWBawreNjSf1mi4m81PNG/aesLBvOyWb891VVQyow+j32tSjcyIcq5
 JDpEWRWe
X-Google-Smtp-Source: AGHT+IENMaoAUqAfcQ0CR0pDWEGtn8YlDJyp8bt/gm8HstNDpQganqvqF/tsu+4qVqf1M1SKac/dhQ==
X-Received: by 2002:a05:600c:4f81:b0:434:f1d5:1453 with SMTP id
 5b1f17b1804b1-436e2531ec8mr318843695e9.0.1737017217780; 
 Thu, 16 Jan 2025 00:46:57 -0800 (PST)
Received: from localhost (ppp-2-86-138-70.home.otenet.gr. [2.86.138.70])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-437c7499502sm51600425e9.4.2025.01.16.00.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 00:46:57 -0800 (PST)
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, jason.chien@sifive.com,
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com,
 ajones@ventanamicro.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 philmd@linaro.org, Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: [RFC PATCH] hw/riscv/virt: Add serial alias in DTB
Date: Thu, 16 Jan 2025 09:46:29 +0100
Message-ID: <20250116084629.19983-1-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=vliaskovitis@suse.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:49:21 -0500
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

This patch adds an "aliases" node with a "serial0" entry for the
single UART in the riscv64 virt machine.

This was requested in Gitlab #2774. However, since the machine only
has one UART at the moment, it's not clear that this addition makes
sense.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2774
Signed-off-by: Vasilis Liaskovitis <vliaskovitis@suse.com>
---
 hw/riscv/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2bc5a9dd98..67b80e9430 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -971,6 +971,8 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 
     qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
+    qemu_fdt_add_subnode(ms->fdt, "/aliases");
+    qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", name);
 }
 
 static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
-- 
2.46.0


