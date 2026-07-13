Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BCCC44508
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 03:52:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wj7hy-0006sy-Jn; Sun, 12 Jul 2026 23:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7hx-0006qu-Kf
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:51:53 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7hw-0001Mt-61
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:51:53 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c9eefcf9175so2311836a12.3
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2026 20:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783914711; x=1784519511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GcM9CWd/ht3d20xl8qsrrISWs+dRJAPurFgEz0tOvKM=;
 b=DynNfBaiLrr75RmBBJW/Ra53dQ69lYtICPLHxUhYPdLhnI3ZLYbxepviB2b8PMoJK9
 HTPn7oNdqeOMvWgOswfwVsy4yCM3qjDsZwV8qeO9mwwlR6H8W8/V6N3O2vjfqR2Oa2SD
 /xCSPGwnjl3sqtg5bX7h7FoEBw7i0vwotMjjMyi2rbEKbSYD18YY+32U9h5nGtZAvvXm
 V3tjOKYPmUzHjIy/PXiW6fABWnxLDr6NAmJAzp7rn4sW+Ds6ZPSbjKrlXYBRYb3GECDF
 jydx8F2uattZKj2fqeM5xwWPoBFrGHJFaMpcnlvk26903CdcnatZ4P4HQ+TcFZnOB7s7
 uGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783914711; x=1784519511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GcM9CWd/ht3d20xl8qsrrISWs+dRJAPurFgEz0tOvKM=;
 b=Cynd5JhIk2OeqDMt5X/doTd7+O+8Gzdiu8b62Msy1JaCLz4zqTkoWEqJmbvKGzgO27
 3tTstDplPZ20VcQHF/mqVFZvN0vHAaZ6uJdwHOI0E6yDjuy6dmtDyhi2BU79MxB8JO6/
 3mxuuljlnmaeTiTFcQrzuNKTEy41tgeoKZmleWLlnplT0Cxi8XCPc3aewXcD3g54TAD5
 5la8IlL4UHo5FWu1tpjgVo268Stx8Ee1K2PdhUl3d3XkGQGTcaCEGQWHlrWEJlpYqgqA
 bTaiStWUEqbr5LdJ1ifBZEckL1v1pWm/Yyt07vnTUCxDl7yjrMWsmMxfaPVCkOsR8yIU
 wfCw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTCgANROmqNzW7sLpgf5EvnyDrXNG/nYCKiY7GWQzoOR3r3p/vD6txIqI5TmPGe/G6mnWERj0KnPBi@nongnu.org
X-Gm-Message-State: AOJu0Yy6FvO4bHpKqosS8E9YVL3eP2tIQ0tTx2Le0EbgYA3NvB6K3XFq
 xu47VfTRZEx4hUnvkIr2DB18Z5n2va5lgmYJgQDXMaZE2YVdnlbpHmi4kQmj8kzNNQU=
X-Gm-Gg: AfdE7ckgGe/jTgDP5RfIEac7+/3QajXpuD1KqdsXFNQ39j+H+X13lAaLp730uWFK8BF
 8OQn4fl70+rAYlU+d99XlpJ+9E86Kr/uHoMdvL1ax4NDE5q5P5E4T33BY6u/ZhQelVQzxb/WPL0
 GxbQJ1PZX8SFVelpDDQXUdLMjOvca7pie1tGmWAwu6Lr66yJS4BidIFohJhvdkYRJc4hvpJT8f/
 9WpyPGL0GzqEjoiETlISMU8XGphzp4nCEHwS5bxi5sgzNHF4j646zsp1Bk/uvi4CbROOz2uF73y
 N+1pRdUhtkwBGKUGOc968JegbCMH3jHMF7kAPib8HiFWylsKSk9vFGZVMH8aswBJ9AU9sqQBjtV
 2PiLjwz7ZZM4j6i9a/Z2RbJzjuvGT76CNs102XWGscNulPiwtGIqAbE8KeiYe3h0qWugBFKEpqi
 baFYsjiwEfcFpK1Opi2cqHZnPgc4ttyIKzWjhSK5A=
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id
 adf61e73a8af0-3c110163ecbmr8409695637.26.1783914710921; 
 Sun, 12 Jul 2026 20:51:50 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3162d3csm7739884a12.18.2026.07.12.20.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 20:51:50 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v6 3/6] hw/riscv: sifive_u: Align ROM reset vector data
Date: Mon, 13 Jul 2026 11:51:32 +0800
Message-ID: <20260713035135.3996990-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713035135.3996990-1-frank.chang@sifive.com>
References: <20260713035135.3996990-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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


