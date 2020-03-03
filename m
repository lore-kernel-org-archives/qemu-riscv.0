Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlw-0004em-4T
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl0-0002oT-Ek
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vky-0004Yg-No
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:58 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkx-0004WJ-Ud
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:56 -0500
Received: by mail-pg1-x543.google.com with SMTP id t3so678392pgn.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=w0rkiSrEP29kyeWR5iSkNuT9vmqTLCQckp24RIRfysc=;
 b=ltbIk7D25Snlht3Gxq1PCQTiotaY+wadEJCQH312niibQLkKCgqbMRERmMq1n9ksag
 lXzPPfwa7v8fCIVxVW/Xa3RiWcLClK6fZ/BnDVGeBxTTHoXfSyqQfp0WNKuLP2r+OFMd
 8UuR+Ar5AGW3k7lSJeBT9QEdiljeZeSFi08bObHgSqORwiRRH6CkJAwpMGLXEiVIgTHj
 HHIXrx1VyR9XTpRvim3PH9ozG7g6GCEcN4NEVUj2vrhR0UuMQvmI6b/zIqbn8Np/pdOh
 YU3rhpDenj0vC/LQd94va3uCBwhQFvhrX7HkmJRDX7SV4f0PyVRnCWCU2vB77CSQd8od
 VOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=w0rkiSrEP29kyeWR5iSkNuT9vmqTLCQckp24RIRfysc=;
 b=CuaOsKAzbaZLVxJaXQ0xcb8CpGNqIRy3SYPcmGdCl5/2T4uSazsfh5GPcoNODvK/U1
 f/rTEfEgFl0qTUYOrw1PpS5f5+Tof5R+cvtRRJjLSELGjLQW9ozOCo0sxldbJZwGSyyN
 0nGcUzsN4HMgc21cO2fdwyj2u9+9YBYyIgrCWYZ/Hmi19qm2vnSt+vMSGBcnl2sOR+Sg
 1BbFYUWE1LktvAGVsiyvsW6HCZupdCYFfPfGogS03ERU93DB0RTXvFn6F4ohu725I8we
 aBlrD4wox9EodZcbgWWLZc+Ax2sDTMuaimGSAt/aoggRtNIebSrEKe0lSWWCVSDdiqvu
 +jxQ==
X-Gm-Message-State: ANhLgQ23AwA6rxYJkgIZWC4/7MRkuhmvt+vxywAQCKl7DJZj0HpjspyH
 epsFRuyt1ifazpQqHz9EIltwNbODJkbFkA==
X-Google-Smtp-Source: ADFU+vu4CDhk/Vcb14fa4GvavTH3LG9812Uh3ztyKwAICIYd/6BOYf4W/CPnRC7trbrLaUxnCFAcvQ==
X-Received: by 2002:a63:2356:: with SMTP id u22mr1451340pgm.245.1583196592667; 
 Mon, 02 Mar 2020 16:49:52 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 9sm18307328pge.65.2020.03.02.16.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:52 -0800 (PST)
Subject: [PULL 31/38] target/riscv: Raise the new execptions when 2nd stage
 translation fails
Date: Mon,  2 Mar 2020 16:48:41 -0800
Message-Id: <20200303004848.136788-32-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Tue, 03 Mar 2020 00:50:01 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 584b0c71fb..9e28b19c29 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -587,16 +587,28 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     }
     switch (access_type) {
     case MMU_INST_FETCH:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_LOAD:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_STORE:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.25.0.265.gbab2e86ba0-goog


