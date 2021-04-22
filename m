Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfB6-0002iJ-36
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfB3-0002e8-4w; Thu, 22 Apr 2021 15:39:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfB0-0005Sp-5c; Thu, 22 Apr 2021 15:39:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j5so44973692wrn.4;
 Thu, 22 Apr 2021 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0SewrfFia3MN/Y1Mrlk9GQqVPEPPPTWV4cIuNY98mI=;
 b=XvIfzh9s4D3rNvJhfhGz6qxDpz1QQYKnKaq5uUTj+X2t6H17sXF0dvUn5WpZDGJfIU
 yVoW2W7Rgk3fIOZ5jpxx0XluMOW3COULK7P/NMabvOjvUsBzQrWH9RqNubRy0FosQMd4
 /sJcxnRP+M9wVpXowIdaJMKoIfFXfmGgykrBzWKaZ5P45a+kpsJN0ZQMZNLcTsovIebB
 u44U0DPboGnNVSIfmJrdmr+PfqieIqtDQxrgX99pFKTUpcNWZGcNJm8ODL/wEHvQal/3
 Z2nUYbR3vGadI52ah6baO2Gd8L4LQpLAqX/6NU/5MZhFxRleiVq/abNW28GQBqBV3GRh
 lcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A0SewrfFia3MN/Y1Mrlk9GQqVPEPPPTWV4cIuNY98mI=;
 b=lKCQ9PuROHK3QD4FbL17ZktIWdjTs48dXan5ou4gDWq9MmBs13qSz8NFLGVVow993f
 SbdicgS7o/pWusCFBgwDFJ0CbSb/CJj6NUneNn7inIjh7q+URK3nKX5mXstV9omCLIVI
 yIfKmAtjcC2AIgecP33Zv5DxyuY+YgPKKqh+neXo6THNxxq/jxiCKTwsYkffqIobpMCR
 O+fYgjDSJx0JV8KPdfStv5/JMVTEOwg50Ug23b7sfEdHFza7MSOysA5FdW8RxWs4viHA
 5Fom4ruZAWKKqtCZwHU5aQO1W+bSMELKZ+9JauGp7YHWssBgI/WQu/Dpq66B+YPg3bZg
 5OXg==
X-Gm-Message-State: AOAM531uABXTwt/QsUi4g4/Mh3GMz5tU3exnN5imvl9fSimf23VLUCiH
 Tt0UP0bWb+xCfc6HXsVh4mxAXk766EtyFA==
X-Google-Smtp-Source: ABdhPJzp2UUVNaX5pMQpfMuNrFnNcC60VYSIrLYYeKrMHteHYRUXryfs92M8dfHvYlH0RL6TY/2dQw==
X-Received: by 2002:adf:f504:: with SMTP id q4mr21359wro.304.1619120386990;
 Thu, 22 Apr 2021 12:39:46 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l9sm5256228wrz.7.2021.04.22.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>, Michael Walle <michael@walle.cc>,
 Anthony Green <green@moxielogic.com>
Subject: [PATCH v6 08/18] cpu/{avr, lm32,
 moxie}: Set DeviceClass vmsd field (not CPUClass one)
Date: Thu, 22 Apr 2021 21:38:52 +0200
Message-Id: <20210422193902.2644064-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Apr 2021 19:39:55 -0000

See rationale in previous commit. Targets should use the vmsd field
of DeviceClass, not CPUClass. As migration is not important on the
avr/lm32/moxie targets, break the migration compatibility and set
the DeviceClass vmsd field.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c   | 2 +-
 target/lm32/cpu.c  | 2 +-
 target/moxie/cpu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 37a8ebcc86f..3353bcb9fc7 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -213,7 +213,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vms_avr_cpu;
+    dc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c0388142528..e27c1a8bc97 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -241,7 +241,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_lm32_cpu;
+    dc->vmsd = &vmstate_lm32_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 3c81a088eaa..e5da3fa3f17 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -122,7 +122,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = moxie_cpu_set_pc;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_moxie_cpu;
+    dc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
     cc->tcg_ops = &moxie_tcg_ops;
-- 
2.26.3


