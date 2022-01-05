Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfc-00074c-0d
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:09:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfZ-00070d-O4; Tue, 04 Jan 2022 22:08:57 -0500
Received: from [2607:f8b0:4864:20::102a] (port=35575
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfY-0001we-6E; Tue, 04 Jan 2022 22:08:57 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso2028722pje.0; 
 Tue, 04 Jan 2022 19:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9sdvt0SCvD2QSOMHtz/9igRF47GFOyS9Q4ZZZNZ/yIc=;
 b=obB03EIcWsiKFsUdcQ1O8JyaigoZu5ZHQpBKINBnEnOGC9fksk47Lniz5OYoLpfenR
 oF8IrOQM18hYSzSqcIWt/+rarvuaEYrCdesSaDjIZgJrFa8pbX2hbbe0nnjEQeCskc/S
 qYMP9NLkc+nQ/WZ+4byE2wPPhhzfKXIhmrHtkd+StHbnNcFEqhqVI2LFEnuWThhn+gfF
 4rN7KxfaQpKNx7d4SNfh/L1MU+ZNtRgp0v0X3Vu3doDGtg4ga2Q2U/wQ/Vmy7X1kDq2N
 Mhe/OfHHOh7PfRZ5Km1q160ek4hgJRQ17GWWtNh6JRQ0Mh2oFa+WAhpFZIYHpbmkQi52
 ymQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9sdvt0SCvD2QSOMHtz/9igRF47GFOyS9Q4ZZZNZ/yIc=;
 b=B8RJLJ/jL8j4yQrjMAU0hJJYGkEcvo1JE1yBZiuz7Z0O3o7OCH4m67KI9nXUmj7MbB
 FW91eTz5YkH6Q+kLSxCFFvKSHHfXe7X079HhoGhANeayVMi18KX+iHIif4Wv7aYpkSSO
 e8Bw/bg9LWdKAWV+vGwMqz+m47RDuNzELeBIwXdgtOzToJUCo/kQWbQQhaHCGX0/lLsR
 51nmWRpVP1HbHNS3RMVL6IE800zO9oAVFlSzfC20t1lI/RoMzy3Z9/EXWb+z+1rAJCLV
 rzlDzOjvXeB0Vm7LTvrlwCBQxl/XVQ7uN3bS3Q7pYYktPOAS2le9Ys9zGPYlxL6eLQpt
 XyuQ==
X-Gm-Message-State: AOAM530+kGX4XhAip/IwuMLVKNPUbDXdzM+cfzs10jT0Op2FjggpcPMM
 Tp8z36TJkJm9wQ8lkluAy+E=
X-Google-Smtp-Source: ABdhPJxoA/J60/Lo8PZcxUMLjVYU4ba3ALv5iSM4fySF7//Ep/pQkBSZFoDaUba4qeLgtO7iyB0JVQ==
X-Received: by 2002:a17:902:eaca:b0:148:c78e:3064 with SMTP id
 p10-20020a170902eaca00b00148c78e3064mr52573116pld.53.1641352134727; 
 Tue, 04 Jan 2022 19:08:54 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:08:54 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RESEND PATCH v3 2/7] target/riscv: machine: Add debug state
 description
Date: Wed,  5 Jan 2022 11:08:39 +0800
Message-Id: <20220105030844.780642-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030844.780642-1-bmeng.cn@gmail.com>
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:08:58 -0000

From: Bin Meng <bin.meng@windriver.com>

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


