Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKld-00058G-3O
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlV-0004wt-RN; Wed, 20 Apr 2022 20:33:47 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlU-0008Ls-Bd; Wed, 20 Apr 2022 20:33:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id l127so3485046pfl.6;
 Wed, 20 Apr 2022 17:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GH2FT9hl0QobN2IwU/hnYZutReJp+9cZOVo+GqkwIiU=;
 b=C9PFtI82dw5q4V2bl8D/5mFH7h0TaR2vKI3CsCCq9vk3KlYDjO64HJYKgWQYTCwP+u
 ndyg8Co57Dhr78EkW6VOEhk8FFMp/NPmfSjOzXgroI7cwg+v8Bfrq93BAYkbYCxp1Q/g
 T8C/gbCAB2/asDKdwoOuwUy1rlKbo9dNYuiLvZIVLXIO57Q9z/CSssJCFT1XkQ0yknq9
 vqXMeTXSlygUfkd0sSR4p1TM8vOGb8SI4jqPLgY3tUVMStn9dx+zT6BDzvqbfb4aP96T
 +PYH4Iy8GeEFYOxxdTDM0Y7jW3zpwHUH1OQ2Bpqz3IuyMqm8Tf+rcilaIf++Ci6hbypd
 BPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GH2FT9hl0QobN2IwU/hnYZutReJp+9cZOVo+GqkwIiU=;
 b=3eHx9nQ23h3pa2P/cwpVjsx+diBNzt850se+Y8IcqusQ1KFtxi9xeJtFZ0nlapw+iH
 GuEedPrQVg3aYK/G9YbnzIh5pV5JuuSrQiIe2axN+siyt5BFRu1qGUBjC0UWOb5+pC/s
 ZPHapj40eXb++Pl8uSdox1YzmahSSijm3SOgovjOhCwAZ+zC2Lm0xXtj/h+qJLXHpmea
 f9gRpAYEPy1hTPkdxQJvTRke0SwaIJSu349rOsrBzRB46T9tSYW7uwbA8mNbRtvXM6XE
 7MXqDLVxBkUvRRWlrQxLt+b9qM/ViTo4fbaood1rggt4RZAngGEVVy+otQl6lK9dy6kr
 fdUw==
X-Gm-Message-State: AOAM533t1k6UNGcLgRzSsNjHINOtpsuaXHUU6ArXZ8yWYqglKeKjdt7v
 DwPBZvYVqA/KB4PtDUD0BoE=
X-Google-Smtp-Source: ABdhPJw7wGcIlOgd9mjfeldRwDzH6wLAK3A8+EVnC+Rh09nv5SgSyUE4rXqdLInqT+znjD6eR90NSQ==
X-Received: by 2002:a63:5518:0:b0:3a8:c75d:8536 with SMTP id
 j24-20020a635518000000b003a8c75d8536mr18696083pgb.366.1650501222690; 
 Wed, 20 Apr 2022 17:33:42 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 4/6] target/riscv: machine: Add debug state description
Date: Thu, 21 Apr 2022 08:33:22 +0800
Message-Id: <20220421003324.1134983-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:48 -0000

From: Bin Meng <bin.meng@windriver.com>

Add a subsection to machine.c to migrate debug CSR state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v2)

Changes in v2:
- new patch: add debug state description

 target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 243f567949..2a437b29a1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtimer = {
         VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool debug_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+}
 
+static const VMStateDescription vmstate_debug_type2 = {
+    .name = "cpu/debug/type2",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
+        VMSTATE_UINTTL(maddress, type2_trigger_t),
+        VMSTATE_END_OF_LIST()
+   }
+};
+
+static const VMStateDescription vmstate_debug = {
+    .name = "cpu/debug",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = debug_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
+        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM,
+                             0, vmstate_debug_type2, type2_trigger_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -315,6 +346,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_rv128,
         &vmstate_kvmtimer,
         &vmstate_envcfg,
+        &vmstate_debug,
         NULL
     }
 };
-- 
2.25.1


