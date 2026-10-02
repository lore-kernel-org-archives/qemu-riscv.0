Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893C0CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:03:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCdqw-00044z-EC; Fri, 02 Oct 2026 10:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdqq-00043q-3m
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:06 -0400
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdqo-000852-M6
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:03 -0400
Received: by mail-pj2-x2a.google.com with SMTP id
 d9443c01a7336-2e2dd05994cso13513715ad.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790949781; x=1791554581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V2RZzwl9oCOaU/YCJHZH2VBSRzb3jVPLLWNZRqi7UZ8=;
 b=c7oTeLr/tH7aQJyCpvzVHhcXOldcLr6oiL8QA9R7TwkEgaSTHta8nav+5rdp2Rkof+
 nAtLEhftK6MrsiQL+E73HDvTy8m5mbnBRdOVld26ciS9MmUXERj8NLz6JJIGXzJmwmUb
 YhuP/hE04ky0Yp5MCHIvpDsR5AAZd3U+iMtNmrTs/Kk/qammeZ3DRbIN3NbwiCWw6iEl
 jQsaaeRhbbNCq7d/mjDWzoRXkt7m3KWQx2h95T1ggPL/xU5/BKbcxISDLlEWQbjRPcQX
 tptXlHjtqPSpNU/bqiFtfQm76FJSf+J7LxahzFbttoLGcXqYqkMckkOljGIL73mLfww/
 kpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790949781; x=1791554581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V2RZzwl9oCOaU/YCJHZH2VBSRzb3jVPLLWNZRqi7UZ8=;
 b=JVAiYFqSDbmBdbThmTSRqZXA7UeV8zCvF3aisg5qj3B+yRX3tzeY8aElib+ugbCpzc
 lf3OucX9M2BiuU+5kFjLrjsZ7AtIBkBkh8UiLiykrNmE2CrxnvU4cujRz1bsh0+UO6oc
 bQfHduYcYtgBL67b09rjgmpAOVH7RVKQ5UkT6iL2ChoC+2Csm4Jm/sk2bvvtkMwZw+hn
 ZyoQBSgkoXygbJJQL/4ErrE0PpIFjEC74KD3vSApYOc9tq7hz0WninsxmQRlrRX+LeuH
 ttdc8mN3pm+S9gWJUf9U0TUQW8X2VOGGUboYF633gf99SJJiETzeqlhkhe/HQjqX2DeC
 BZ1g==
X-Gm-Message-State: AFq9FYIw2swLdCm69UkSH5+QOJ/88XzEqT610nQLou6ah3phfyrfs9Ls
 uJeFF0ADUdo/O6O6I2ExEi90b8KpB+OxismYkL+T7valnUrgv6V6e3pW
X-Gm-Gg: AYBFou37vZ7gfz03Kvblb1KBMAY5LxvdT61TE70XzucT4EAjzxEI5uyrfSdUMIy1Gre
 4oFsWe4vPfXf2KEaPRXmLEjDkvsm+ICjFViOBeJInUfupBo79kVFm0AqETCTES204S/718+4xQ4
 Nzp3fmBCL7eGdsomo1n6Oi5+lRwKs8MDNr2owbR1pHJnsJFvMrF8JoWgcgezeXTX97e+Q2Bw840
 8rDoBYKv5nqxH9iwdt3vNzMg9IckBFXPY4ZgA58hP+48EWZLa3bA8nOoXKNwMTnbTQZlYae3M7E
 NCC1CykU5zTkZnGUJkvllJ7wZFDDNorhE9Ok/NieWag2GrGX4EoS65wTtDC5u/7DxaZ/UJF/60A
 gxcHlq7lyJDZBgIMxWTDSdMmC6gWN27q+eLUZPtKh1a9lGZwydi9ZBB0a2tWGH6yjStG6oecJw8
 HklBIGigcbutAs2v7OZokIzbmGNVpu+gpTBb5vi5LLfm69ZVQ4ZzWJ0VpghUoztWph5J3Ap2buE
 8BAxWRXVsWO5cVw
X-Received: by 2002:a17:902:da89:b0:2e1:530b:d890 with SMTP id
 d9443c01a7336-2e499f09e52mr28982965ad.5.1790949780939; 
 Fri, 02 Oct 2026 07:03:00 -0700 (PDT)
Received: from dt-VM.localdomain ([101.207.27.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f723a77sm7996165ad.71.2026.10.02.07.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 07:03:00 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>
Subject: [PATCH v2 1/5] hw/misc: fix calculating output address overflow in
 k230_decomp_gzip
Date: Fri,  2 Oct 2026 22:02:41 +0800
Message-ID: <20261002140245.30214-2-dingtao0430@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002140245.30214-1-dingtao0430@163.com>
References: <20261002140245.30214-1-dingtao0430@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2a;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Use hwaddr for address calculations to avoid 32-bit overflow.

Resolves: Coverity CID 1685515

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
 hw/misc/k230_decomp_gzip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/k230_decomp_gzip.c b/hw/misc/k230_decomp_gzip.c
index 0d8a3b2d2e..ac06cc1571 100644
--- a/hw/misc/k230_decomp_gzip.c
+++ b/hw/misc/k230_decomp_gzip.c
@@ -53,7 +53,7 @@ static bool k230_decomp_gzip_write_mem(K230DecompGzipState *s, hwaddr addr,
 static hwaddr k230_decomp_gzip_output_addr(K230DecompGzipState *s)
 {
     return K230_DECOMP_GZIP_SRAM_OUT_BASE +
-           s->output.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
+           (hwaddr) s->output.slot * K230_DECOMP_GZIP_BLOCK_SIZE +
            s->output.current_offset;
 }
 
-- 
2.43.0


