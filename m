Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jXPEn-0005A2-BC
	for mharc-qemu-riscv@gnu.org; Sat, 09 May 2020 09:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEk-00052e-SO; Sat, 09 May 2020 09:09:50 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jXPEk-0007KQ-2k; Sat, 09 May 2020 09:09:50 -0400
Received: by mail-wm1-x344.google.com with SMTP id d207so184525wmd.0;
 Sat, 09 May 2020 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FhXzEDZMFN7nI/HcObjzYIjU52XHskJ+5ArXsA4s8n0=;
 b=tMA+dOHPorUcef3Ii8plnVwx5/I0le3h8ZG+eca+U8AHmyZPa1SS3f3WuI15TwaqMj
 dp9D1WaZwrnsb5FDXqtTKtmj9ql7Ri9+E8lUya6BaANZi94a9jnQGJI6G4UF9TPdagy3
 OgmgfqIWppS9Pv6g6oO0G49S6T5H9O2kFz53VTuxNlRRSqGgB2PYtlmYAhUAAIgl/CYG
 HU4xvfI3vTtrbHl3Tih+sk24b+RCb6pHPSaM+TNWHXOX0xGVdE/7Gx1IYmx3SoM0UFHV
 VJQOMdVbuLbFyNLdR4Iii9ly1xsgPL8IN+1T7566Y3evQ9HqdPdME6aN9M/UwH5+GcKH
 jFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FhXzEDZMFN7nI/HcObjzYIjU52XHskJ+5ArXsA4s8n0=;
 b=O8iCxlCsqFws6bOvjOGDWHIrBjkPezLF/ik5kl+ewBKajosPnOhoZl2VZio1cK3YHL
 SYdR+xH5DEbXRjRlw+M714JqNuq1U9oNnfb9DGeKJiFPPy0A1yJxN8W7s9LTbE47NlPm
 zVmnNrLvifzh56Ao08sCsHo1pb61caUbaGWJjBCAT3jphIks3lMWZqRDlQQr9bKkYJBB
 9ns5v0OEQQ+fDAp9CMG6a4eOfNWxkWG+RhfzxPu25tNQN8sNz4lr31fvgRdlJl3mixhT
 RncLJM+N45goXFyL6WS+X5fDqHPRPOtTDn2fcbyX5+iOpO5glCi+2Gkhg7G5QHn6EG0v
 Fvwg==
X-Gm-Message-State: AGi0PubTgWopvLKhMmaA023Mfz/tcC7EXemDXMOS85J48Ssm24UGA7l7
 i4xnqGNXOtk7vVJLTLb05OVQoYL3n0Y=
X-Google-Smtp-Source: APiQypIPiOQOoy1QDhlipK4I1Af7DTsG6G0dwlgqBHdFcvssaN5XNM/0LHVECJmyi5GMwxGZeM77rg==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr20571336wmi.173.1589029787021; 
 Sat, 09 May 2020 06:09:47 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:09:46 -0700 (PDT)
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
Subject: [PATCH 11/11] exec/cpu-common: Poison hwaddr type in user-mode
 emulation
Date: Sat,  9 May 2020 15:09:10 +0200
Message-Id: <20200509130910.26335-12-f4bug@amsat.org>
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
X-List-Received-Date: Sat, 09 May 2020 13:09:51 -0000

The 'hwaddr' type is restricted to system-mode.
Declare it poisoned on user-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Checkpatch complains:

 WARNING: architecture specific defines should be avoided
 #10: FILE: include/exec/cpu-common.h:7:
 +#ifdef __GNUC__
---
 include/exec/cpu-common.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index b47e5630e7..56cfce8153 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -3,9 +3,13 @@
 
 /* CPU interfaces that are target independent.  */
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+#ifdef __GNUC__
+#pragma GCC poison hwaddr
+#endif /* __GNUC__ */
+#else
 #include "exec/hwaddr.h"
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
 void qemu_init_cpu_list(void);
-- 
2.21.3


