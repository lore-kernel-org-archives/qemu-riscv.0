Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU15y-00084a-Fg
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:55:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU15x-0007zK-0D; Tue, 15 Mar 2022 02:55:49 -0400
Received: from [2607:f8b0:4864:20::431] (port=43950
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU15v-0001td-Ld; Tue, 15 Mar 2022 02:55:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id t2so15443682pfj.10;
 Mon, 14 Mar 2022 23:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFB1A8Xyg8o44t2nNQnUN5pM95x45LdOb1NLqMmGO4w=;
 b=BzpyaUayewRMba4ml4+9c+UYP5ABlEHTf9yLmHmbXoqJgtE2MiTAkUWFS3HkEJCpMp
 p5UaJtD09efyf3EKJDryQyBoaurK9+KazhmYgyMdQox541LsJYbiakqlPq3UriD5XIf7
 rWdqPX1Wai0XnlYKmaDb0fSmA/5SHjpdJPgs0D4/vrsubPnVApn3DmCWM2rqQ2NjG5EG
 NiqSI0qXRlkLxTXNkZCqgtP6eFaHslWYjeiW+8sv9f3zrjDAY0gDESlKNhJs0NcHrlbb
 6CBmyXjF/Q0ptt6opUi9z+0kcH0e0g6pVRG2sh1DDo+mtwkLJjxxbKhQbd9bMDbPszMW
 7++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFB1A8Xyg8o44t2nNQnUN5pM95x45LdOb1NLqMmGO4w=;
 b=c3SgEPRZzvFKk3ByOiRaOezmx2qbMQpIxArATTmtfszh4HaD6qThpGFtYDoMNO6NYg
 Cx6vVEqzT7pJSqpQiM3YNhp/PNsnb1bYSrxgoaVJ/h2wIGFczzQRanvKVUy2bpBAdPed
 aG2gpsAenBQz7qADwbfnqicyBsjI6xARk1BodI65YJN5z5GorKe82vZxcjXoVI0MwljN
 Sst1fpyPLuGhlGrornag7QT8eRu30FZSnjJEoanTK4aehXyK7FLBQCP9SJ4ok0pTOG2N
 xkDkS/MN1DvgOzV/gTZcithk4PRPhrhEM9LIVyIerycxhOK5xk5/CZRnKykRwrgeh33s
 d9pA==
X-Gm-Message-State: AOAM530UVdCxMX6bqJwff7VvQT4E8bUqG7HwX9fNsRxKomzgIuP1QWSU
 KSrEPzYlDToBmmf80bZC1ywD9cDyZM8FgQ==
X-Google-Smtp-Source: ABdhPJzpzp4TDd3TqJePLOEr4JwxzJLPZNKqRD6qSvzrByN25SDmANVWoy42U+DgGCjNqCQOVJh9hA==
X-Received: by 2002:a65:41cc:0:b0:380:6f53:a550 with SMTP id
 b12-20020a6541cc000000b003806f53a550mr22836255pgq.471.1647327346125; 
 Mon, 14 Mar 2022 23:55:46 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm22970500pfv.69.2022.03.14.23.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:55:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 2/7] target/riscv: machine: Add debug state description
Date: Tue, 15 Mar 2022 14:55:24 +0800
Message-Id: <20220315065529.62198-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315065529.62198-1-bmeng.cn@gmail.com>
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 06:55:49 -0000

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
index 5178b3fec9..4921dad09d 100644
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
@@ -292,6 +323,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pointermasking,
         &vmstate_rv128,
         &vmstate_kvmtimer,
+        &vmstate_debug,
         NULL
     }
 };
-- 
2.25.1


