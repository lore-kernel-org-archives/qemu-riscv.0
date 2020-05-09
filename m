Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPEK-0003iC-0d
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEH-0003c9-UU; Sat, 09 May 2020 09:09:21 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEH-0002qr-3W; Sat, 09 May 2020 09:09:21 -0400
Received: by mail-wm1-x343.google.com with SMTP id u127so13582409wmg.1;
 Sat, 09 May 2020 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TeWtSAei3ep1DJcrXDtpu+82w6foJlJk1rjchgbdgfo=;
 b=FVDqgvQ0ukrRJhtKvI+c9JPloXHMWIoy4AmFxurl2ULEWeMwOVaSrI1H5mBNVyd+H1
 Ed95DK3yvQ4R/SlqX2RCwHGKz/P19lTQd0mUepd5K91LqBkDxhjIlkXh//7fOecLtnL/
 r58B6l/H4/FQ2PUD2TtH87WSEDAle4hkIVJRdXeRybIVjl21R8MIuCc4yRUQUPToZ6lG
 SRAuTKsLgWJdL4s5CCiNuuX546BqvIFtJkUUu5YwAancGKkw+JLUcHNgt5tWiS/gndED
 D5+gmz1DkoKQfL1Dy+dft260i0kfLg6ar12XmZgV7hqsRhdfAF0HqCC2Z1QqjN+bVGtH
 D44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TeWtSAei3ep1DJcrXDtpu+82w6foJlJk1rjchgbdgfo=;
 b=culRO1TUFFoXO5qduN58a1tWZ0n+ZqdVAD0yqi6x88Z+6uUJyLlqcSEjFupChAtK6j
 UsbUzlVfv3/9LXUbjC2IpSPM43JTRaYG59oFeO2eCbIug/INWD8JtaYPJ/DoGmlCevM1
 YEh0FetCeKmbnvkAisaek8CRGhCIPwBxnfrUCequI3cIbr87uFLaJpi19Q6XqqQGCRLr
 cElP58HhxnoZ0iWIHl3C3sb6JFNg0oGTWNdL2QcwzpashKQDKf2syb1dfc7YoxWj5YNu
 h6InouU6K3tXP9o8sc7b9KtTJhRyZ06COXJ2jaOem3/+Jyo/Oj8Yck1OKKLkjjDhX7EZ
 k5JQ==
X-Gm-Message-State: AGi0PuZ3qnzqt6v3c0OiZR0lh44XZxlYMbAie5o2B4hMjOZ8IVOq/dX7
 kPVRqMMLQin/khyvt9ksqxZjQVIQ+uY=
X-Google-Smtp-Source: APiQypK3virEnIkWexu8Mf8qsHDhzVfpImcldIBfa3jsD5SK4vyes6cGvXjwqv8wQQgx4WnoNRS06g==
X-Received: by 2002:a1c:f306:: with SMTP id q6mr21073205wmq.169.1589029758217; 
 Sat, 09 May 2020 06:09:18 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 01/11] plugins: Restrict functions handling hwaddr to
 system-mode
Date: Sat,  9 May 2020 15:09:00 +0200
Message-Id: <20200509130910.26335-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 09 May 2020 13:09:22 -0000

Restrict qemu_plugin_hwaddr_is_io() and
qemu_plugin_hwaddr_device_offset() to system-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/qemu-plugin.h |  2 ++
 plugins/api.c              | 17 ++---------------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5502e112c8..06c271a107 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -326,6 +326,7 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
+#ifndef CONFIG_USER_ONLY
 /*
  * The following additional queries can be run on the hwaddr structure
  * to return information about it. For non-IO accesses the device
@@ -333,6 +334,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
  */
 bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr);
 uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+#endif /* CONFIG_USER_ONLY */
 
 typedef void
 (*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
diff --git a/plugins/api.c b/plugins/api.c
index 53c8a73582..785ad2e45e 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -249,7 +249,8 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
  * Virtual Memory queries
  */
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
+
 static __thread struct qemu_plugin_hwaddr hwaddr_info;
 
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
@@ -267,26 +268,14 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
 
     return &hwaddr_info;
 }
-#else
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
-                                                  uint64_t vaddr)
-{
-    return NULL;
-}
-#endif
 
 bool qemu_plugin_hwaddr_is_io(struct qemu_plugin_hwaddr *hwaddr)
 {
-#ifdef CONFIG_SOFTMMU
     return hwaddr->is_io;
-#else
-    return false;
-#endif
 }
 
 uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
 {
-#ifdef CONFIG_SOFTMMU
     if (haddr) {
         if (!haddr->is_io) {
             ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
@@ -299,7 +288,6 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
             return haddr->v.io.offset;
         }
     }
-#endif
     return 0;
 }
 
@@ -308,7 +296,6 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
  * will be. This helps the plugin dimension per-vcpu arrays.
  */
 
-#ifndef CONFIG_USER_ONLY
 static MachineState * get_ms(void)
 {
     return MACHINE(qdev_get_machine());
-- 
2.21.3


