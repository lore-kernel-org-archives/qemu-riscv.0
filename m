Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79592C369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 08:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4bR9-0002nX-UB; Tue, 15 Apr 2025 04:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bQG-0008MW-6v
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:13:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u4bQE-00020c-6m
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 04:13:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-223fd89d036so63014315ad.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Apr 2025 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744704812; x=1745309612; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vz+7rJLKk52J8xcxBS8V6jPxUUQa+S+ay0i6P14+Mmc=;
 b=OjPxos+717VhX7VyvcgHU5bJQ891nJryj37Yrqf7wi7S1FRhyi2nnjM3Ak6M+yO1xB
 XQqzbHpsF8bFAm/J5gVSgVqynigyXXTtaJ9BDbYMqK88wpa6kX+/fY7vOtQjQggDe339
 FwT+4/tMuhVI4Z4Xo/zUyzuJiI+Zthl2khJp2+Zw9NqPT7t2NqCpWzWB26nlFDqrasRB
 +0+ThlFEoep0ayEdqHJv47O6ALZ+RK0fFmJ6s/NRS1xO4wFqukEHjdySVQ0Z0YRFg0Cq
 nZuJhq90imPEbst/RLYnlfrzGRJpc1g4xa/J3a7oM8F11yWDYS+d3YPqYsUMTTJCb/+z
 zfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744704812; x=1745309612;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vz+7rJLKk52J8xcxBS8V6jPxUUQa+S+ay0i6P14+Mmc=;
 b=LdDAe2cEk8uRiwPpaQcr5TKHYATbAIZ3ZJzcItXx+0GRbFG6T9xYzhewv5oxlRRs3X
 tbYMhUJuZiELIoo6052hGSfx3jPg6tNDXkA6eoGdXFv5s0XUV35EdKPBLe8Axt+A7RUd
 sFPhB85MMpr4Z9i3LRRjIMYMBPtrMJ4QzyKtw5Wh7jnaaM3kmpsMOoGr5Dh+OFbe+i7D
 3TiESXKat2Oi626RYArk6ubgSX9UgAKRNZB/gLjM3tic+XczlCz/fgXmZRfjw9bPWJV7
 RUZrUiPhpbpeSoyUza124x9Nm2brUdbQr1l1piYIfELnWWtNeFBJYR2gMdgOg36eZOaH
 lJ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO/iM4ITilaDwkG2OmFJqq/Kh+vcpBBCxcArY03tQoHaXt0j4qbU1YU5C8r1vbv9iccrHtnHKsa0Lr@nongnu.org
X-Gm-Message-State: AOJu0YyCZCiLR8Q+crR7zitV4JejHK00j5cUCPbQwzb3J3FK4gYI2h7G
 NHRj3VqDKO3J8BZIILHgr1KItqs5m/Jos+DLBlzmGjaElLjqUMZtiZBNu/ukoM4=
X-Gm-Gg: ASbGncu0oADpLbhT3lWmMfivpIQZdfpwfyAhQgt8tJ3NsTjWgC6dVt78SVL0NZArIun
 35B03yHWF4KkdAaxvaupXis7oMrzMI/xWzSYzG9hoxL09/8nYTGozQ5Z4x6gWunY+cOb7CktBpo
 9zsXmIna1HosY2IdJD/jVH61kOpNRPccOg0C3xL7bL9MmIRUM+xL3D3AqrTOhUZeEV+7K2I/p0Q
 RRNdS3nrCigBdfYWW340K88orDM5N/+S6uV1JSDFN7se4IQeEflXYdHngRGuOf/1pCgB37QlPTM
 DUDcmR3/95BjahbZKDQ1ouCDBdUxTSnI1qnlxTc7kmPN/KdzyIVc/YVWhCsuqbw=
X-Google-Smtp-Source: AGHT+IHHoPm4QQ9v0tOplwzjlpJQqhF8CoNoqXf2+aqmcGjlUFn1SmyfmdIGlkgop9tgFk3wJfZdHg==
X-Received: by 2002:a17:902:f707:b0:224:2175:b0cd with SMTP id
 d9443c01a7336-22bea4c3baamr220686105ad.26.1744704812581; 
 Tue, 15 Apr 2025 01:13:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7c95cd1sm111082335ad.150.2025.04.15.01.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 01:13:32 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs),
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 08/17] target/riscv: Allow global WG config to set WG CPU
 callbacks
Date: Tue, 15 Apr 2025 16:12:22 +0800
Message-Id: <20250415081231.21186-9-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250415081231.21186-1-jim.shu@sifive.com>
References: <20250415081231.21186-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62f.google.com
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

Some WG CPU functions depend on global WG config (like num-of-world), so
we let the global WG config device to set callbacks of a RISC-V HART.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ac50928b57..6dfc260a07 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -500,6 +500,10 @@ struct CPUArchState {
     target_ulong rnmip;
     uint64_t rnmi_irqvec;
     uint64_t rnmi_excpvec;
+
+    /* machine specific WorldGuard callback */
+    void (*wg_reset)(CPURISCVState *env);
+    void (*wid_to_mem_attrs)(MemTxAttrs *attrs, uint32_t wid);
 };
 
 /*
-- 
2.17.1


