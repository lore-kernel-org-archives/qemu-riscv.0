Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A5C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 05:56:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtIzz-0003zH-Iq; Mon, 10 Aug 2026 01:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtIzx-0003yu-IW
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:56:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wtIzw-0007m5-0p
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 01:56:33 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8486ac3f347so3886622b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786341391; x=1786946191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pUQsVGlNAyu4YTIkQTsuLMum3YqpPIoLE3oSMiljqpU=;
 b=EReE9CsWwEOiq2xlKinSewMLI6PW16NQbjTZWEsX2aifK6N4GuI0yGVsNddJumqxrx
 WvMxY49ZLuwU/XzQpsOZA11qzwfJ4qJ4dC4k1KhiaN2wnlQqeYMJYZTo2DEKsnsej/KO
 BgON1mrXs27idW9BRbmj3yhSC9VcHmyvxcIKQVgG2OVa2kpaBKWX1BrkVM/kDhlb13GZ
 pEKPfdjJV+9herCmA8hiawgdALPPPVrc2x55VBjKLpdCtlucqzcVq0DNc53bb9Mvpd8I
 dwOoAslyQFKHwPBmJyHKRSCZ/PpN1J1S2f2rmy6HHcEmU6mDhBhKz0/N3pFiiYRTOSmF
 XapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786341391; x=1786946191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pUQsVGlNAyu4YTIkQTsuLMum3YqpPIoLE3oSMiljqpU=;
 b=kqMisXck1c9pZO6wQg2b76OVRigZ+IkQt908xRLryGw4VYZy+BQ/gpPqceu0ewBvy9
 o8wu+Bbtvsc2e/LMYM5dsy/LWSSx405HbQtuGuqg91CgdijJI1dvk4OI+dLY+a9M4cQP
 I9wLrZ5JHUgLIPq8VZqHikaiRJ/lmOwoqRVPZ7SrPMJ8Mn4CZ/EOgcAXN09PADUdVUYs
 PLkaySSpoYMPQf5t1JBsIU9hXoI9ti8AnL0k85msuDpZfi5jizU/deuQwz8B5IXhKmod
 N5AGmHnr4gpLDzRD95RZcdedL/+b7wjBn4czZOLeimCysN1LXpqm5yT9us4nLgK2M91w
 Y9Lw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNlZ6J72UpJW26I3z+Jav4HEhh15quODphDMHgSyHuiT3j/KRVmzSHACRBwmxUARIqCvcJqikJiroR@nongnu.org
X-Gm-Message-State: AOJu0Yx4XH+QVdQ+wdwcPcpkzJttIKpUx0y8l6z883nL4UJlA+v9jE8/
 rpBWiy4bOmb+RuUv8oDQOcDF5jOIRZdlXnPntzABvRInWIvo8Goa3Oi8C0E7uo+Eawo=
X-Gm-Gg: AR+sD12v2fhzT9TXXEmpTb40jnytsos17SuP4MeHBTjNFMmhVpW4ZlaQwHSgW+Lpafy
 /jsHvt2wVlSZF6HEIFBSoBF7wjo1Y2jN65TJaAiS5lXeGwBoCOG+GodAIzdQpDwsqjzFYidBusv
 C59YSHD5eO8AJXflJ3Ad2Wzden7qUjn+4AxlKqIjWTiG7nH+sX533/qAsqmVNSRYhbM9750s0WO
 qxng3sTFSEtvfwfcrRMhRR8DW2TH8f3FRD7m6iU3Mb9dNHOMRjJw2S4tUIj+j8AZ41WKIs/CJ2k
 QYvUm6yLBbRTymE1XMLZo7jMUd07WuVb5gJEFN+Nzd4yRcThllO5qMXtIzqQ/xXbGigpoQOBxlp
 tQkEajuA0YqgFMmKy17gfQTknQlr7J65zeF+K+a9eZZy+xfoiprYSVOqWowxQVjvhNfWBj8wUBm
 +aYkUP4Pc3PRJE5uajwYczlODZ9Dh9ZqssUQcgcdJ7TDWJAUudhiYyOuqNoMQoHiUBvec4tfre0
 /a+bfHc+Q0SY+HGK3gV4ZbbMA==
X-Received: by 2002:a05:6300:141:b0:3c3:750f:3cf9 with SMTP id
 adf61e73a8af0-3cbd3ac3fbemr18282181637.11.1786341390689; 
 Sun, 09 Aug 2026 22:56:30 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315be86fc7bsm39172122eec.1.2026.08.09.22.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 22:56:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v8 2/7] hw/riscv: sifive_u: Align ROM reset vector data
Date: Mon, 10 Aug 2026 13:56:13 +0800
Message-ID: <20260810055618.1175500-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810055618.1175500-1-frank.chang@sifive.com>
References: <20260810055618.1175500-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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

From: Frank Chang <frank.chang@sifive.com>

The SiFive U ROM reset vector data needs proper 8-byte alignment for
RV64 ld instructions. The misaligned load will cause exception when
Zicclsm is supported as SiFive U CPU doesn't support hardware misaligned
loads and stores.

Add padding to ensure start_addr and fdt_load_addr are placed at 8-byte
aligned offsets and adjust the load instruction offsets to match the new
data layout.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/sifive_u.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 99423ef472d..57a57c96e16 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -564,19 +564,20 @@ static void sifive_u_machine_init(MachineState *machine)
         0,
         0,
         0x00028067,                    /*     jr     t0 */
+        0x00000000,                    /* padding for alignment */
         start_addr,                    /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,                 /* fdt_laddr: .dword */
         fdt_load_addr_hi32,
-        0x00000000,
                                        /* fw_dyn: */
     };
+
     if (riscv_is_32bit(&s->soc.u_cpus)) {
-        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
-        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
+        reset_vec[4] = 0x0242a583;     /*     lw     a1, 36(t0) */
+        reset_vec[5] = 0x01c2a283;     /*     lw     t0, 28(t0) */
     } else {
-        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
-        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
+        reset_vec[4] = 0x0242b583;     /*     ld     a1, 36(t0) */
+        reset_vec[5] = 0x01c2b283;     /*     ld     t0, 28(t0) */
     }
 
 
-- 
2.43.0


