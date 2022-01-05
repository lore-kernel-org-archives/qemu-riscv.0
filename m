Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYg-0007eW-UQ
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYe-0007c8-PL; Tue, 04 Jan 2022 22:01:48 -0500
Received: from [2607:f8b0:4864:20::1029] (port=43783
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYZ-0007PS-Vw; Tue, 04 Jan 2022 22:01:46 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so5064621pjw.2; 
 Tue, 04 Jan 2022 19:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jrAL6g1TphcXjMCq2zldzmFnpuJynAAzFwwf2uBTSZk=;
 b=qdHdsHbRqx/V8KEO71KncmLPurE5FIhw/oHW7uPsiag5Dc/hO+AvsbrJ6cvAqdPqON
 JO7a4H5bm9+h591UZLwXurKMlsG3SX14IOdd9dPObkQIn/nQZUNcxCH9+4UrI8nM1E5Q
 cooslR0tNiqXFmdS8ysfsS2jhk9ZcukF8bv2Wv11Mw5sOFOcDwoTaa1ai9r2ZOEpQts0
 XyzVM0BXRoTJ/L88rmmwq280nvMZgLK8NWz/NHgywlDEhmIWBb+j3gsNe8mmoQFvL7Ni
 1r1Rh4jZbUO9BET13A69V8gvq1QFAkNUGX9Q/A84m9vkHbEBe2efNgRkjo6Rto8xNg8q
 OczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrAL6g1TphcXjMCq2zldzmFnpuJynAAzFwwf2uBTSZk=;
 b=owqlr6UoCA4ULDb/Ti5i3tT+KLlDvgor9UyNeZyVyGX1lyhbATzdHJW0ei+mDbGis/
 H8q3x4gVaR9U6ThkfLVWNmi/IGfECia/ylI44yKDiECZHlpGBAluXt7pcKV3IA282TCT
 ht1bzRFYsynEK/LggpsEI5b7oprra7iptfTzbwNm/Uzbk/e/uRACwVvoWus1T/ZkSJ42
 R48+qBXoB6VDwTN+UEgQ/w9rzO8GmoJZLGPMBU2vx0D7Zaas7Vr6F4CekdaShLAJvYKG
 xNRASvik5uQjGph4ERkblxhPYwODtzAm0sB9Y1LEC2ExIU5da498atbLKOS6RkeH4k7V
 f1hQ==
X-Gm-Message-State: AOAM531vUhYTvbmPuE+XtbO83SGvt2jXpvkCjJwkmWsvaYbh+l0PsIE3
 KAwGTYxZjg4w9n7lpCP2S6Y=
X-Google-Smtp-Source: ABdhPJyyzqF7TjTv05xFneXy23U1S0u1h3Q9qmFh73EKHBuBwUo+ekOpnQsqz9NkoYCOz9pJ8ccb0Q==
X-Received: by 2002:a17:90b:33d2:: with SMTP id
 lk18mr1682773pjb.218.1641351701895; 
 Tue, 04 Jan 2022 19:01:41 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/7] target/riscv: machine: Add debug state description
Date: Wed,  5 Jan 2022 11:01:21 +0800
Message-Id: <20220105030126.778503-3-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 03:01:49 -0000

Add a subsection to machine.c to migrate debug CSR state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v2)

Changes in v2:
- new patch: add debug state description

 target/riscv/machine.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..25aa3b38f7 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,6 +164,38 @@ static const VMStateDescription vmstate_pointermasking = {
     }
 };
 
+static bool debug_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+}
+
+static const VMStateDescription vmstate_debug_type2 = {
+    .name = "cpu/debug/type2",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(mcontrol, trigger_type2_t),
+        VMSTATE_UINTTL(maddress, trigger_type2_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_debug = {
+    .name = "cpu/debug",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = debug_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
+        VMSTATE_STRUCT_ARRAY(env.trigger_type2, RISCVCPU, TRIGGER_TYPE2_NUM,
+                             0, vmstate_debug_type2, trigger_type2_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -218,6 +250,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_hyper,
         &vmstate_vector,
         &vmstate_pointermasking,
+        &vmstate_debug,
         NULL
     }
 };
-- 
2.25.1


