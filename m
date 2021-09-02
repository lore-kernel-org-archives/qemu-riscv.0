Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLpON-00086E-UW
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 12:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOD-0007zg-VD; Thu, 02 Sep 2021 12:16:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOC-0000wk-Jk; Thu, 02 Sep 2021 12:16:33 -0400
Received: by mail-wr1-x429.google.com with SMTP id t15so3835557wrg.7;
 Thu, 02 Sep 2021 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBDJiXTHT9IuEk9FfrTxtULybQQn9dfnXif9nUI7YC4=;
 b=LsbNjaXg9ZfDPBy35BgL3iTqoeboaHkvnknRwyAU2+xh3Y/GU5flK162rFrVD6PusK
 Zqye8j5GUtb9gwLuuAwBTaOPWqvSsNMI+LA1B5XlyhQj2OVug2mbnYS/clkuPBIuFEym
 pP4NuPbllHtklBm3Yk0D0W9rgb1jh68G001/gVtLBxzuFMcKbp53adEKS/t8pLvhfvjr
 /zEon0LvHHXUsmhiO9rLMnilC4Arm5Crf6gVF6CvpbMBshlkL+4jtharx5Q/STsgQBAC
 MvKjTe/KtyoK/YH9U42tNMwUXpXFN7GCzVSMFrxoghGcQKddKIXW2rcVsMa4qI3qYUFC
 llIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gBDJiXTHT9IuEk9FfrTxtULybQQn9dfnXif9nUI7YC4=;
 b=f5ZML2kpx+NZmN+8czi9CSFjYuQWTrUXu9MhEOEHf7BJn03p/nLKpXB6OCON0vEpGa
 ybqiID2ifa1DwjhMJItUlUFwHoDsQ0tGalfS5NT3kT6AB0VrruiKuKhltFv+vy2skJ/H
 BBimQyF51TNo6cXSsgwZbM2p6Qdfc3vkl35meB2sodOPYrj9PvbZ2tLHwBuVOg/kojl4
 WXXGyfisaoTsSeqTqvCLArbvIN41N+DEX1Z77vG+FkNVsClPSeB6emKrxsq0YRQQTukc
 PHk+p75+eyQvGPH9z+/aRl/KHf1WGR0PYYk3uZW9ZTgxWYM9h6JvewrBcXXeoaZOyzA9
 nY3Q==
X-Gm-Message-State: AOAM530eukdvC1zn+zXIxd8jSlXuGHXbjqqRs8ehjDWVe6stai3pNc4R
 XrFg7+uuT842Hk+GmfXuaocpTFIbRdE=
X-Google-Smtp-Source: ABdhPJxj90aNQOBb3bG354GuN1ofupsCwK8r7Qe99fRLxGQ8aaew/tNKGnIR32ntB4hlx8/hSq93OA==
X-Received: by 2002:a05:6000:36e:: with SMTP id
 f14mr4867472wrf.196.1630599389049; 
 Thu, 02 Sep 2021 09:16:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g138sm2059442wmg.34.2021.09.02.09.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:28 -0700 (PDT)
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
Subject: [PATCH v3 07/30] accel/tcg: Implement AccelOpsClass::has_work() as
 stub
Date: Thu,  2 Sep 2021 18:15:20 +0200
Message-Id: <20210902161543.417092-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 16:16:38 -0000

Add TCG target-specific has_work() handler in TCGCPUOps,
and add tcg_cpu_has_work() as AccelOpsClass has_work()
implementation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++++
 accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index bbec7760f48..919d9006e24 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -66,6 +66,10 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd6..ed4ebe735fe 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -73,6 +74,16 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static bool tcg_cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->tcg_ops->has_work) {
+        return false;
+    }
+    return cc->tcg_ops->has_work(cpu);
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -108,6 +119,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     }
+    ops->has_work = tcg_cpu_has_work;
 }
 
 static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


