Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C295CA5FE2
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 14:04:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCdrv-0004Xr-9p; Fri, 02 Oct 2026 10:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdr7-00046d-M9
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:39 -0400
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCdr5-00086L-T3
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 10:03:21 -0400
Received: by mail-pj2-x2a.google.com with SMTP id
 d9443c01a7336-2e2db9f927cso19545915ad.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790949797; x=1791554597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KKj70xiMz7h/gagRNUkAOOkov58WG1YJeesJ3q/MfEY=;
 b=csnofDTGo/HQTHy/FlgASnxCHSdUuV5XUKRTAB1NNxndvbIbm9bIv57gQvchK/dnp7
 N/OT1IvyZg3ujLn+/u685BKtIBDuDK1A6enTRyI2gkBwIuIL0cGgiXMtCLCdx3/Q9GDq
 EiPDxZd00nMIqfGoSKo3j6VOtchF3qEpzKd6lzFETwmPAtBNRDHf1Z5hpBUmgBXbPM9Y
 ozF8Czj12Ld3z3daf8KHMZgyNctN8ZGvp71rakCJu4rneO12HwriMy7De/bAS9mhbqaE
 DJeRR9DmhO4wj4kqERd386rWWixlxB+vAYFFpFRe7meUsTVtPQrmVygx7zuoD0kAhQao
 74ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790949797; x=1791554597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KKj70xiMz7h/gagRNUkAOOkov58WG1YJeesJ3q/MfEY=;
 b=LL0uQrFsFDoI8Tp5V008Xt9JBzU1wS7AjPSiUO2vYddpwgCdiAGlSYvsUn5fx4p14c
 WgY4qjxJT+JidOTNZMJlT0ky7gWQHrWctlx9ydprJinZn7DwK9fL0KXu3a5pPFHX7+Bi
 GFsU2C3JtzlB2gXXjyt278F/Bh3fqSd0LlIO2waLHUaixCKPGSmCWVMNgy11HUUDN8Hr
 kEdrHLGtiL+O7M4xfQOo/IOU05AOuKKnboPKwJRH+KNl7OXz+0YUJPzNuRxQLTYNe0qf
 df+RQ/CLXSX+AfCap8f4YgRu5x/jIz/UawvXV29ZN6vZTasNQCpyHVCNApuFU1Hr8Bvm
 dhug==
X-Gm-Message-State: AFq9FYLGn6GhczJigesal9Ba1js5fPRe5Bf7d5/kEfrbSsxJeHZBKjy/
 z/f3xUEbkSGj/jPW1ZdqCqCksYiSS0yi/W/kSlfeP8A7lz4CJMaCiH4H
X-Gm-Gg: AYBFou0Y4GfXHhAhVCpG679wobvxcNREIgaqHKWMbwHhJhTJtvh525eGc9SI664OYHS
 stGS2iw7P8Oo42C0MChbPf2v0zF4ZT3LmcXiGsbz7Sb54DRlKrSQH1EDSHd9zyX786lOPy05PD3
 g3xYKw8u7G2IdidialpQgEsxcddhrNbk+Vsd9ZcbbVkt8js/K/8W3ojzFJYXnKn1wPzjLQFMVHG
 VaPe9Nz8fKIeQM1Ex0me3Gjn168dBzl+Vn4//gj3lkBafPj7kDOAQT6FpLqQmkGOVguX7pB6AAS
 9IhoUl79u6BJOMkKJNpb/LQToGj4DLJhZBO2H8mQhdT3gY5nh2LquvX35z1X1xUg2lhD7fcSIjb
 algmE8HGzp7vG0S99yNHhdFVM2Sln8D6covBglUwzcdIWcOIWKEBHwos/ScjMMVt9xeyT3O0pvc
 phLHa6UtvCkU8t7pbsi0SOWjdH51J5/0FptsN3LKopXl6EDv0VyJOj6AeQIcHX+xdeGKJuQUMcJ
 RzEIbNS0TJEWqhUVezf0LTmz7I=
X-Received: by 2002:a17:903:3d0e:b0:2dd:c100:4b82 with SMTP id
 d9443c01a7336-2e49b6dee89mr26152415ad.57.1790949797429; 
 Fri, 02 Oct 2026 07:03:17 -0700 (PDT)
Received: from dt-VM.localdomain ([101.207.27.235])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f723a77sm7996165ad.71.2026.10.02.07.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 07:03:16 -0700 (PDT)
From: Tao Ding <dingtaodtdt@gmail.com>
X-Google-Original-From: Tao Ding <dingtao0430@163.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, chao.liu@processmission.com, farosas@suse.de,
 lvivier@redhat.com, pbonzini@redhat.com, Alistair.Francis@wdc.com,
 Tao Ding <dingtao0430@163.com>
Subject: [PATCH v2 5/5] hw/dma: fix k230_gsdma integer handling issues
Date: Fri,  2 Oct 2026 22:02:45 +0800
Message-ID: <20261002140245.30214-6-dingtao0430@163.com>
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

Validate the address before subtracting the channel base and use hwaddr 
for channel calculations to prevent unsigned underflow and truncation.

Resolves: Coverity CID 1685514

Reported-by: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Tao Ding <dingtao0430@163.com>
---
Compared to patchv1, the modification of ch has been removed. 
Because ch is an unsigned int, it is sufficient.

 hw/dma/k230_gsdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/dma/k230_gsdma.c b/hw/dma/k230_gsdma.c
index 7635cd19e8..e422b436a2 100644
--- a/hw/dma/k230_gsdma.c
+++ b/hw/dma/k230_gsdma.c
@@ -329,6 +329,9 @@ static uint64_t k230_gsdma_read(void *opaque, hwaddr addr, unsigned int size)
         break;
     }
 
+    if (addr < K230_GSDMA_CH_BASE) {
+        goto out;
+    }
     ch = (addr - K230_GSDMA_CH_BASE) / K230_GSDMA_CH_STRIDE;
     ch_off = (addr - K230_GSDMA_CH_BASE) % K230_GSDMA_CH_STRIDE;
     if (ch < K230_GSDMA_NUM_SDMA_CHANNELS) {
@@ -355,6 +358,7 @@ static uint64_t k230_gsdma_read(void *opaque, hwaddr addr, unsigned int size)
         }
     }
 
+out:
     trace_k230_gsdma_read(addr, size, ret);
     return ret;
 }
-- 
2.43.0


