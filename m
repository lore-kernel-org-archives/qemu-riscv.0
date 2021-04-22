Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfAj-0002Gy-3N
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAg-0002D6-G5; Thu, 22 Apr 2021 15:39:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAe-0005GA-M1; Thu, 22 Apr 2021 15:39:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id c4so7033246wrt.8;
 Thu, 22 Apr 2021 12:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y73DhisXrZCkQN7S3qTtV5uihkPH6tpgdxs7MXvhbiA=;
 b=pNr6/qa9lboCYvjEvNJDtJja3LMS+tGT7vQRd5q/INNliVyvNJdkn9qs0WhikHDZoX
 /q0HTEfrk1K5sqZ/ohzb8Ebykx/okt5ycDLkSdQUnrcJyB2TGE8iByH+KJFDLMGyzVv4
 sDqY/LXaR9DY2DiMZtPGTVThUbv94k0DweMctT6VLs5h1ovTQNJS4THqfVZxX8FulVQ/
 LxRsxM7O6DBOEbMuvxurH36Q9bDuodTTZPWKLZkF/rvY9Qmdqsdj1BMDSjptNnhwGKMs
 8guGPA8+yUyGlmctG4AvoSUh/yz8ZwEj5G16legaeE9i3+PaxaomFDgk87sKdmyVIpUI
 OFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y73DhisXrZCkQN7S3qTtV5uihkPH6tpgdxs7MXvhbiA=;
 b=VY+5Fps9jIhTYDugZ10CbuoSdkOZjMuHzuDNDiCOcYCPJ7xQjQYHj2qCuSHMBjqzsh
 ix5OELE/0zUTTjYW+uAiAbQ8GuSnORWOCDYA46tHJLmNqknIeOS/JlQD7atDkEx9UTsX
 tBQ+8AS9Jh6g+p7fdCQehUAklbD/8wI6K9oSPy2Y4azbvibNuWU/HWJnqODwQ/tiBolY
 ptcMRDpdeKvuvk6PQn0+YE9QUSSoxa/p+Op0xRuuhVjPhY5+PORt3nQXwcu1mEgh+A/1
 VmbcN2Ydk0AWejg8DUXwrKjxoV/Md8/GzXKUpqUrwx4ilWZhhte1Lx/P9rnoiyqgLFTT
 agBw==
X-Gm-Message-State: AOAM532Rdx7D90oyR2Ta3y60zgI0oV4iw70QQF5w9kn8hPhHNe954aR4
 R1unixedQtilFqJvEXhE3Y1+MuPB7wlgUw==
X-Google-Smtp-Source: ABdhPJwJEZM1S3DhwhbP1ayv2uAsUBBJscKSE5VW0fsRFool14C3rGlWC/j/SvKr8UxCkkrrVvLjvw==
X-Received: by 2002:a05:6000:1567:: with SMTP id 7mr5486wrz.47.1619120365658; 
 Thu, 22 Apr 2021 12:39:25 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t63sm4692739wma.20.2021.04.22.12.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:25 -0700 (PDT)
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 04/18] cpu: Directly use get_paging_enabled() fallback
 handlers in place
Date: Thu, 22 Apr 2021 21:38:48 +0200
Message-Id: <20210422193902.2644064-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:31 -0000

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index a9ee2c74ec5..1de00bbb474 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,11 +71,10 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    return cc->get_paging_enabled(cpu);
-}
+    if (cc->get_paging_enabled) {
+        return cc->get_paging_enabled(cpu);
+    }
 
-static bool cpu_common_get_paging_enabled(const CPUState *cpu)
-{
     return false;
 }
 
@@ -420,7 +419,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-- 
2.26.3


