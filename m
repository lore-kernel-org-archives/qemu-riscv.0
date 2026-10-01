Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C360CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:44:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC7iF-0001qF-3q; Wed, 30 Sep 2026 23:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xC6S3-00063W-HB
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 22:23:15 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xC6S0-0002Pz-S2
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 22:23:14 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d90ba1d807so47025295ad.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 19:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790821391; x=1791426191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BhUe709SE/yREJSv4luWIhgYYagp305FisiQ5h0HuUs=;
 b=SmMQShdo9V23ihXKv08wvg8u6X7gY6UYaOUJUTYNZpfnffiNOb31gf44fpvO8tn7gW
 K1xMid2Dc71tr0K3MIK9IhQAvK0cwkghgo0fSCgnNLYGd1Bdb1zwjGHgtxQaUcviKys3
 1bvu7wPjZtqGWtId2u8LChURxsPDRYhrdee6D/5YgXGBckatVZkw7w1tCAD48CxhOjPd
 IniCuZ3txltWlGAb7uSRpAPj9YEtMVeC+qK8wdPgq1VsQkZxdPIs2lICVce6DrRiZHyN
 7jL8bPYzoUfqvkLdh2VO3f1pOl4dBrkMkSXAD0n9YI2iOA+EKGJY5dEH0NLAeYrR+24q
 jKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790821391; x=1791426191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BhUe709SE/yREJSv4luWIhgYYagp305FisiQ5h0HuUs=;
 b=IiSsStqIlDMT6vXjHzXdyhEvL5XG7AwfZN6+Cm5QGQU0m1KO6/RLOkFROOYCX+CaIB
 UgLM1BAhd0BLIOm5egmz5qnGLSPhnrckW172vRu9Vl7zbyui6ipW5PUPogpQSNe8SvsS
 YfvpOscYGvwcu2C1jcPcKmW0ZlehWBBv4GXFgzL+0zCckG3vxYIMl5wbgOkWT5w/pZDH
 BXnCDdOBSVOTIDwqNQe9LB3QEjSymdCfFqbBeq6Z7PvVvhw07FLBPVxa3Z6PBHI6A495
 ZdRZl6GbPUXhlYSlh+CdIr/JrHd/kLjrvNK67NRRoy/q1meg1IlH8k0OvNqEvHZfG1Zg
 bH9A==
X-Gm-Message-State: AFq9FYKdoD0PbiZkP1+/z5MMIG+2K19vh7ZouuzbbvNWdb7S/TS7NyJq
 ZHX7zDB5CEpW43k11Ppw1NHAhUGZwx7Eqqqv9wG9z9x4dDlxs129vB9m
X-Gm-Gg: AYBFou1H/wtnrTshA7cRcb0Lohf8EnBueTvs5FCDRHvSQfOQ2zHCNIFt+OHQNQhkRC6
 aN1ARTTrS14ovQLlUN8feSsnOsd4DeFWNxKnO8pvcIOkCIL6kFcnz7EHnK8NWrmTQGKIwFGD5/i
 a0zCedg31CD0xEE8q+hMM6pMStopzALxgZ8f+wxPBsDREcvN6ZmKor9Bdv12dCbtUbHR5ydZD0x
 2R/4LqQpBOfS9GwB1UlrsodIUhVkz+ngbZvcdQW0MVCx/QdLMUOYRXTPeI7N4xY9+lb3bduuPwU
 TZZGrrK+atyHDwoTHRSt/PXsSYNIHmSJv8ZCl3MtWlMBX+PUS2EFAiV9A85LViiCmfNs7knxt4V
 BihWsl6V7PyHWNZNhq/4F3vPQDAMKltMJ9sY99tM1v32Ouqx3on1l1mBQ6U7qi2nUsiUUHW4HH4
 ZqDlpoeAXUxRRBIlVPyD0IPA06DrkDFpd/hXzWFIZuhhNTcwJqRtRECzCPrBax2ibthHzp8KKll
 E3D2s95g8mTPEpy3Qm/iQgLRKA=
X-Received: by 2002:a17:903:2283:b0:2dd:c100:a5de with SMTP id
 d9443c01a7336-2e2e4b9ea03mr26256215ad.50.1790821390656; 
 Wed, 30 Sep 2026 19:23:10 -0700 (PDT)
Received: from dt-VM.localdomain ([175.152.37.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e300b8fd4csm3943635ad.80.2026.09.30.19.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 19:23:10 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Tao Ding <dingtao0430@163.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 1/3] hw/misc: fix k230_decomp_gzip integer handling issues
Date: Thu,  1 Oct 2026 10:22:21 +0800
Message-ID: <20261001022223.8633-2-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001022223.8633-1-dingtao0430@163.com>
References: <20261001022223.8633-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Sep 2026 23:44:02 -0400
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

Use hwaddr for address calculations to avoid 32-bit overflow and
address truncation.

Resolves: Coverity CID 1685515, 1685517

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/misc/k230_decomp_gzip.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
index 0d8a3b2d2e..54303c0e7f 100644
--- a/hw/misc/k230_decomp_gzip.c
+++ b/hw/misc/k230_decomp_gzip.c
@@ -53,13 +53,13 @@ static bool k230_decomp_gzip_write_mem(K230DecompGzipState *s, hwaddr addr,
 static hwaddr k230_decomp_gzip_output_addr(K230DecompGzipState *s)
 {
     return K230_DECOMP_GZIP_SRAM_OUT_BASE +
-           s->output.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
+           (hwaddr) s->output.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
            s->output.current_offset;
 }
 
 static hwaddr k230_decomp_gzip_input_addr(K230DecompGzipState *s)
 {
-    return s->input.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
+    return (hwaddr) s->input.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
            K230_DECOMP_GZIP_SRAM_IN_BASE;
 }
 
@@ -102,7 +102,7 @@ static void k230_decomp_gzip_finish(K230DecompGzipState *s, bool crc_ok)
 }
 
 static bool k230_decomp_gzip_load_input(K230DecompGzipState *s,
-                                        uint32_t addr, uint32_t size)
+                                        hwaddr addr, uint32_t size)
 {
     s->input.current_offset = 0;
 
-- 
2.43.0


