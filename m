Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPET-00048t-0N
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEQ-00041Y-PY; Sat, 09 May 2020 09:09:30 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEP-0003L7-UG; Sat, 09 May 2020 09:09:30 -0400
Received: by mail-wm1-x344.google.com with SMTP id m24so3357416wml.2;
 Sat, 09 May 2020 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/deFlLfSBeeZSBPphjSFXwpz9fqQ8rThdLclvTAwgLE=;
 b=GXc5WD/jotqsaemJao8jVSg1pXJuzyf3A6lWcUqvDc3kiEcIAE+1c7w8dft4D3P4PQ
 8933I0NI8h47a5aOH3PEbvKagCUFu7KMOMW/e6+ZgFYN09dkTIUFYz0DGi/pNWSL/Idm
 bW1Y+JkBDZBPP/47h0/q5kq3uBxu4HCBqYD2GzQrV7vp1pVMgmDVEEu5TGis/ayRRhwO
 3BPIs9U0+X6XuHls3MMhYQHiz0RwtmcuL/J4tdaSIQVfdtX9kglYaQ6u7TbqNX6m607Z
 zy4D0ShG0JNc1PFYtgHeKfGtulBzHHIbVDJouBXhPdd3uBzxhR9LAM59/TYbj5vPjSmg
 L3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/deFlLfSBeeZSBPphjSFXwpz9fqQ8rThdLclvTAwgLE=;
 b=ZgW7AM+TUTEGUjVIpQnYXThNrfVeXmKWRSVHR743Oiga0d04Yt6imMx/Rl/6bb9miD
 t4OLnEbBUSTZns01ll7/7aRecCLutTBkfSzg1pYfKtOSLtNMz00JKl8Ux65GvrZ0OAeA
 n2zBnzfST14JTj6TjXog/eULExXcyXRyF5zBbCc7vbfq8P6OO/8yBpGZe3+SHwqDvEO8
 BoYa+y4YDRHS4YsdpXw8+elIH7u2iLrVmUzbxWUdn64YWKYuvQJFO2HpyKvU0H1129KL
 c/udDnu6Ll1Vb0m9GGx/XPXx2kDC4MdxMtwslld86YexYeV5FKAuTtjxr3JbLScNv5NF
 NPaA==
X-Gm-Message-State: AGi0Pua91mmY7yvMapsXT/qt+lbJyJsTuryINUv1KneZ30Cf6/fxJ/O2
 Ff/ykQpQvilcoNes64hGEn8JD4kqU0s=
X-Google-Smtp-Source: APiQypIVCdAFyRkc2ubH7ow2MRfiq0XjMLNU48lJ+FFzNlFhFUf46VOfeXAxA1DxSFAhNQrANi6jWw==
X-Received: by 2002:a05:600c:14d4:: with SMTP id
 i20mr22378257wmh.118.1589029766837; 
 Sat, 09 May 2020 06:09:26 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:26 -0700 (PDT)
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
Subject: [PATCH 04/11] sysemu/hvf: Only declare hvf_allowed when HVF is
 available
Date: Sat,  9 May 2020 15:09:03 +0200
Message-Id: <20200509130910.26335-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
X-List-Received-Date: Sat, 09 May 2020 13:09:31 -0000

When HVF is not available, the tcg_allowed variable does not exist.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/hvf.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index d211e808e9..fe95743124 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -18,7 +18,6 @@
 #include "exec/memory.h"
 #include "sysemu/accel.h"
 
-extern bool hvf_allowed;
 #ifdef CONFIG_HVF
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
@@ -26,11 +25,12 @@ extern bool hvf_allowed;
 #include "target/i386/cpu.h"
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                                  int reg);
+extern bool hvf_allowed;
 #define hvf_enabled() (hvf_allowed)
-#else
+#else /* !CONFIG_HVF */
 #define hvf_enabled() 0
 #define hvf_get_supported_cpuid(func, idx, reg) 0
-#endif
+#endif /* !CONFIG_HVF */
 
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
-- 
2.21.3


