Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BCACCF2C4
	for <qemu-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 14:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xIRap-0005ma-Dr; Sun, 18 Oct 2026 10:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRao-0005mI-3T
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:30 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xIRam-0004zW-Mj
 for qemu-riscv@nongnu.org; Sun, 18 Oct 2026 10:10:29 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8a064dcfcfdso59219b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 18 Oct 2026 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792332627; x=1792937427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QJ2vmhNG/CjE3MDSpCuzv+6F5+re1f9SXvYAgJYl+7Y=;
 b=J0Dq2QMg16mfIvb+KfdEgEGm5rHmhS0Md4pHomRIwprWY+DFtsqUO9mcUqogpiLBQn
 BO9aM9E96gOloGO9m9EdZdp6WX0raHZQRgP+rDoM25dm3+5uCENDIv95zYw9/AY+HYU6
 T4goKhwZi0t9s6kF8sOK6K1AxkW/2kFLSkwGwJUimpsWoKt0h1yY7cODfeC9ZtR65rRV
 1pR1umau/5VmlFkfU8tiGVhcMfNij+BD6GoAsg2OpPJIkcZrb6cArxjxwGnlN2M+jJTL
 N6dTBmoVhqZbdlkCrlYpiVyZ2C+BZ3kSbEgiWUiksf1V1k7WypNcoFTj2Uq/OhgNF8kT
 ioHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792332627; x=1792937427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QJ2vmhNG/CjE3MDSpCuzv+6F5+re1f9SXvYAgJYl+7Y=;
 b=oRlo5HgmgKf7ky+C5pnf4mFosquplBsikucXGq66urQQh2WUPYJJJPx4tygGvBAP68
 S1NBvWe/z6nFMDzefIkxDFF0lNg3moVQdsEwRh3fa170l5crlh1a5ATqIQ0Oc68L1RU/
 0wIoE+fQTVDWDqYykn/GqH4rLpI9OJ2RPzXjzRkhRcvCUduZHjUfua/ru0CRVB+QsOG5
 cEXpAxW2BPLFf/nACBc9eDYXapeot56v+WmhW4nmH8go3uXK4Q59SmxXUnPgg09NGxbI
 TpoQ3DbquXfHtPEa7DHn3lE9eC/ehN/bJM6pIbCfBJq/SZWiholOdzSAM1QrzWVZ64E6
 Zd0w==
X-Gm-Message-State: AFq9FYI2kYkysVFRd2/o4fFIG3pin/lf3rzkLxipG0IHAFRXUVfAnJrR
 HeiG1pj0IFRpmX3dZOZnmZETYmkzG6HEW/PFhsJCaQcKhfFVUyw+OEHR
X-Gm-Gg: AYBFou1/vG3PoXVS6xczDhItmDUl2cobAWrUEi6MBskWHJBbsMNFtWsG45B1I8UJ9Gp
 lzTAkbEbyaO4i68uAdBjQc4xS9DeLUawiAaH7myneqKnNx4CVqhcQKp7i9gU+n7pqD51wKiQajQ
 4LBnmjy9SWs5sBchRGPyvy43kaHJq3whA/ze7HwKJ0v/3Er9PKAtdKXnXqOn/VbEC43UUq8fFQF
 1Gr9Np4TExLO8NfbFVhTH1NyZ51e/QUJg7zd1Re6DdTu6UociSS0IAls2HUYsMJTcregcVRpmz4
 iBREYEf0yQ6NPuvpI4YNl0zKVSOK5M10/KIbZw+hsVMCCQhXRnj/zmFVlQTrgY5qqw9adyaFhu9
 2qlp0pC8kfVD+ME535tRjh91mM7dLHdZ5oqcjiX6ecm6kAG+67i1u03uU76N5L9VwvqwFFgeDvz
 yVHxfPlNKuwqwrCsE8uTr+R3DDsVV3OIUoCs/20Y4v9idOGKcDeXkLz5nWMf0n4F0GOjcPfn3AT
 HEavuEKZmuVZyoO
X-Received: by 2002:a05:6a00:4c99:b0:87c:b126:8e4d with SMTP id
 d2e1a72fcca58-8a04aa2a824mr3534421b3a.3.1792332626931; 
 Sun, 18 Oct 2026 07:10:26 -0700 (PDT)
Received: from dt-VM.localdomain ([101.204.150.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-89f57653ea9sm2949430b3a.32.2026.10.18.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 07:10:26 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/5] hw/misc: fix calculating input address overflow in
 k230_decomp_gzip
Date: Sun, 18 Oct 2026 22:10:03 +0800
Message-ID: <20261018141006.16398-3-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018141006.16398-1-dingtao0430@163.com>
References: <20261018141006.16398-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Use hwaddr for address calculations to avoid 32-bit overflow.

Resolves: Coverity CID 1685517

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/misc/k230_decomp_gzip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
index ac06cc1571..da4dc6f954 100644
--- a/hw/misc/k230_decomp_gzip.c
+++ b/hw/misc/k230_decomp_gzip.c
@@ -59,7 +59,7 @@ static hwaddr k230_decomp_gzip_output_addr(K230DecompGzipState *s)
 
 static hwaddr k230_decomp_gzip_input_addr(K230DecompGzipState *s)
 {
-    return s->input.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
+    return (hwaddr) s->input.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
            K230_DECOMP_GZIP_SRAM_IN_BASE;
 }
 
-- 
2.43.0


