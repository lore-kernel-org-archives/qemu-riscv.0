Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C2ACCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:26:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoOe-0000wf-NM; Tue, 28 Oct 2025 14:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoOG-0000kZ-NP
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:25:55 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoO2-0003G5-Gz
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:25:47 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4711810948aso47298165e9.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675933; x=1762280733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tn83gNQMZpvVjlvYJUMJlHBXZNHdMQkO0M/7A+q+76Y=;
 b=CPEgcorJWuh5w4SU7dv13EhD9PMppxLRyO8RNI3Qt5sOY3iOmnhpQLv6TjtXG6E9Dp
 eMkcUw/TEVmMsZxwKb7lirnboaor1hdLYeu+5W1TPSfsDeG1eQd290GNgiXrDSBgm3cn
 pnQ1kCowibm3a41sY2i3sxRGx+6M2IScZauZhdjD+YthxbRd/y679TfuaasEYZNmMIK6
 Ba0hYYCutEfQEb5OWUrnCKsDD63PaLP1qJD3Ucl38j0LYAagPBR2576A4m6mR08nF04A
 e8y1BYzfHa7OfKKwDtgWAIBmjrlefZeOmNeOH2JWw8DijauR322hayi/hpAkcRr5chNF
 rVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675933; x=1762280733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tn83gNQMZpvVjlvYJUMJlHBXZNHdMQkO0M/7A+q+76Y=;
 b=JOXEcr5ov2sqpN1FabXFS6qIMLcu0P7ovlwsn0dlszS8tsRUHNo1omgOvVXc+lE3Id
 z5FK6EpEuyC7r3W7aKtwNjlTEIj40BwR4HDQmCf/rQaa6I4ug/S5sbWPeNYlNX7dShOs
 abAVi4zLKYv8qtJ4zZ6Y/HIdGLP/RkCGqzZmAN9wjghB3rvsMNTgCR6YOK8TvLK7THuH
 /DhY/06TF2JWY37JoVYfCZ57sXbQMBwlodYP9LEARw6sc66YvRVPU3Emp7BKxPMGhw08
 Pr1HBJoqTFtSV9Uv2IWdDgSh7HFR1oBjYbyafDzjdgnbz6JR8exkVAO7CYx24eAlunCU
 3xUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCuQsyewXFHNLcUdsHDX0j3NnLcBhCgkHASQDP7wzWSEkDTmouVitytqW47yHQNPeSdzE381JzIl9p@nongnu.org
X-Gm-Message-State: AOJu0YwjloKqOOWMNHwzx0lD/FouYodrhRX7I1DDa75UmPVyu5ppNkIo
 iPYVlmn6zM24Ra431DeO0uGPmlsTWQro4vr8jRFTKNyQotsWLt06jAT0GFOgwdld9SM=
X-Gm-Gg: ASbGnctRF0zQx0kTE7VMxciTMwannEsfuLVupJkXh3tXSkp1sbLDP3RvewOk45sPmrG
 rvdQ20vIchUPgN16H6uLbscTbLlZH9Z1MIywI5aPe2ayWrtLqbS0PYBRH+4gXGS2IgWshGY3TaT
 Nq8DU8oC6xvmA9DUW9whyQC9vzD9K50VF0RbTcsaDRnkZfMZqsLxgvmJjIIMFnkF7xovx+ix1Jo
 TNcvgYqBQ5BRu0ohTg0M8NaP/7dw2XThfynCLMCLVqwH3+vgM3AGsFd1ET0RIwCjCdVDmEIx6fo
 ems5pX6vL2VNESiM4Qe1upWt1uNjDDFo/AcE+iu3gQk9JDroMdhgTBfKDR2Pj/yWbF8nDJL1IX0
 LRbNCjYS5lPc2S16IYeqOxFm3ok/Sn7deR0cfMufpHDPCv8iHSZBH1ZIudqHvZyj/Uxri5omAPX
 NVtQzEskxkMpkxXHeh96Kv41lGgMFP3FFr7jNQ0Pn9VXL5BzJ5bQ==
X-Google-Smtp-Source: AGHT+IH1ugfFe0oxceS0sC4ktUe81XxAtBXaff6IVRGZbXQOpQBQXV+FUBM+u54B1peIOrlXSRWN6w==
X-Received: by 2002:a05:600c:4683:b0:46e:4883:27d with SMTP id
 5b1f17b1804b1-4771e3aca51mr3030645e9.30.1761675933009; 
 Tue, 28 Oct 2025 11:25:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3c878fsm4355455e9.17.2025.10.28.11.25.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:25:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 12/25] migration/ram: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:46 +0100
Message-ID: <20251028181300.41475-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 migration/ram.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5eef2efc781..3330c102977 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3144,7 +3144,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque, Error **errp)
                 qemu_put_be64(f, block->page_size);
             }
             if (migrate_ignore_shared()) {
-                qemu_put_be64(f, block->mr->addr);
+                qemu_put_be64(f, memory_region_get_address(block->mr));
             }
 
             if (migrate_mapped_ram()) {
@@ -4190,11 +4190,12 @@ static int parse_ramblock(QEMUFile *f, RAMBlock *block, ram_addr_t length)
     }
     if (migrate_ignore_shared()) {
         hwaddr addr = qemu_get_be64(f);
-        if (migrate_ram_is_ignored(block) &&
-            block->mr->addr != addr) {
+        hwaddr block_addr = memory_region_get_address(block->mr);
+
+        if (migrate_ram_is_ignored(block) && block_addr != addr) {
             error_report("Mismatched GPAs for block %s "
-                         "%" PRId64 "!= %" PRId64, block->idstr,
-                         (uint64_t)addr, (uint64_t)block->mr->addr);
+                         "0x" HWADDR_FMT_plx "!= 0x" HWADDR_FMT_plx,
+                         block->idstr, addr, block_addr);
             return -EINVAL;
         }
     }
-- 
2.51.0


