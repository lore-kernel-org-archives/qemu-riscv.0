Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLpOC-0007z1-79
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 12:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpO7-0007ug-Ci; Thu, 02 Sep 2021 12:16:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpO5-0000r1-TP; Thu, 02 Sep 2021 12:16:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u16so3836703wrn.5;
 Thu, 02 Sep 2021 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TscxpaThIFwXh/P1Ycdn5GNQgbZxc3kDvlQfbrdl29A=;
 b=qoOL8i+0Y9KqXMdm9wOQ3u/uPCdX/SQlDbKgluqhkScnDC2t1qHTT+2MTI//DWFAUT
 NEejCit7VB+NanpfXq6Qc1DSyRxFphKWmmaSUCPbUNDcmTFSjm/7IHDyWLstRl23/liL
 PZvnmlnErsZ1z8G7bMly2o0U/t5YGH3JGm4ZynAQjU//ks9rQoD8imqPSgj5ddgnhNdE
 jy4fS/nmBse8JHRRQZwgmcXXvfWbpfY46jYzcfi3LWel1xENjZOe87hdj9MZ//4GUVRq
 cQn36iCUZBXsphDCe0vsC3FLk68GDc7pyonHjq+49CjqDRjeD5GGI1ltJX+qXIdflDGH
 EuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TscxpaThIFwXh/P1Ycdn5GNQgbZxc3kDvlQfbrdl29A=;
 b=nwr9Drx9B8VYAE1hEiRb0zRsxGVBmmEIiZabS6LkxnStBdIwaJ44Xv1DJgqemBPAf8
 Iofcfto+kyoL46yXDvFkMzZuoq7iieCbHsewulWNJ4HscagQBkjv9S1Ht9a4o1DvkUcI
 LRL0UJ3qGo8Fd4rxezrx9NjGIY9p/cOJOCzdY8sJJVJc/xkHPurdttdVZSMQ6pSWxN9/
 Q7Q2p8BpKLwn6n296JCM0N4InJ9DNpFU5XzN1mIuoKInpP5GLWsi91J4d0UTFJziVdE2
 N887JZPQET0qFf4eno5Skdgm7YxbSAfH545VvMnv2tS2DbhXLMSFfyPRSw3HT4ckxUf5
 wp4A==
X-Gm-Message-State: AOAM533hCFejJ9raL1F+ofch/PrlYM8L5WinuUBMdJHmXsfjZsNVJvJo
 jaGCRIDEwtpV20njmQTprCSI68N9rCg=
X-Google-Smtp-Source: ABdhPJwGGBwl9Y1sjN8okEHWYycyYyvr2xi+NUWJxoO5KxfkCZlVjxWvfmucwDATrcvJW3+aRgOqDw==
X-Received: by 2002:adf:b741:: with SMTP id n1mr4708081wre.354.1630599382926; 
 Thu, 02 Sep 2021 09:16:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 k37sm1787439wms.18.2021.09.02.09.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 06/30] accel/whpx: Implement AccelOpsClass::has_work()
Date: Thu,  2 Sep 2021 18:15:19 +0200
Message-Id: <20210902161543.417092-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Thu, 02 Sep 2021 16:16:30 -0000

Implement WHPX has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c                    | 4 +---
 target/i386/whpx/whpx-accel-ops.c | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 3db7bd4eb4d..6bce52ce561 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -41,7 +41,6 @@
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
-#include "sysemu/whpx.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 #include "trace.h"
@@ -89,8 +88,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
     if (cpu_is_stopped(cpu)) {
         return true;
     }
-    if (!cpu->halted || cpu_has_work(cpu) ||
-        whpx_apic_in_platform()) {
+    if (!cpu->halted || cpu_has_work(cpu)) {
         return false;
     }
     return true;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 6bc47c53098..1f9c6d52c27 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -83,6 +83,11 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
     }
 }
 
+static bool whpx_cpu_has_work(CPUState *cpu)
+{
+    return whpx_apic_in_platform();
+}
+
 static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
     ops->synchronize_state = whpx_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
+    ops->has_work = whpx_cpu_has_work;
 }
 
 static const TypeInfo whpx_accel_ops_type = {
-- 
2.31.1


