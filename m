Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md8hY-0004GR-GC
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 06:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hQ-0003pC-CW; Wed, 20 Oct 2021 06:19:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1md8hK-0002zq-PN; Wed, 20 Oct 2021 06:19:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i20so23928643edj.10;
 Wed, 20 Oct 2021 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxGW3q7OnYm8XKJF6QWr7hh+mJnqfCRkNv0/dwcD8DA=;
 b=Xpg7lERYKMMTZc8M7uhl0jWi/yJI7r0jhHg5Xw7J4c//FthkniXWenUhlcojZf7HRl
 ZcmaFaJWQI6Xb3PJa3XlMA7ZUDkw1FUXqcpBVHrWEESS9M8OB4hzjbxkHUVeQZdrHkXR
 GIiRPz+FvEYe2XB2kusVUQ68iZJUFXmAMomlcWC3lY93d8Gj4A/WLHMPxkrBRWtdZyIV
 HyOV2uKg7yDdyNCip9+43pjIZff7HShHi9m2ZahBGVWQd+2Oao6RhZ4tOTPTBJrjV1KL
 okexwE4dUQkjohim36Cn9YP1HIwCpnWMI4ka8ElyVU8cgfnV78VOv8/L0mAwKhSg+Cs5
 oH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxGW3q7OnYm8XKJF6QWr7hh+mJnqfCRkNv0/dwcD8DA=;
 b=1HwsUmI3phasD63Am7BHR/o0nB6CGgk8neAwOk/dvQVk+Tcaif1UC9X4jdjid8VFQL
 8W2e1s9H3DOTuC+aw9pcMjJsVwfLx1mTvSDWIKJhQxgKggNtFG1Dq0BnD2Zwm3iPQYBx
 SQlAs/XX7GWLarX9Rn0MIgeS5agsY+nqON6R4XrOT5KmlavyJF28hv5MyFcco1Asdob6
 OEIqgAIh/p1qpcF6lJ0b4eafr9A644Pp7DH7wc+zlZV0oG46KRTvBcMEdhX6JUN4gUJn
 gKrrSsSt/8k9e9ioITi9ixrhdM6MtVAI7Smds41B0Gmr+3QP8N+/m+Yuq4ZE8jkNNhBt
 Cqww==
X-Gm-Message-State: AOAM531aRS8hWqI4Z+nkJVGsaOfiIRiXHH8lqEL4fxeEwgr+GsrLIjpu
 9oES5C56WQcE9FhqJN2lBOc=
X-Google-Smtp-Source: ABdhPJxQiKZPnE90icQoIzmxBVFC3VpoFhW+yZP/T0BELwWg4A38SsA5KCbWwVnAfntU8XEYh8en8g==
X-Received: by 2002:a50:e044:: with SMTP id g4mr59914117edl.46.1634725187165; 
 Wed, 20 Oct 2021 03:19:47 -0700 (PDT)
Received: from neptune.lab ([46.39.228.224])
 by smtp.googlemail.com with ESMTPSA id k19sm821284ejg.13.2021.10.20.03.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:46 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v15 4/8] [RISCV_PM] Add J extension state description
Date: Wed, 20 Oct 2021 13:19:31 +0300
Message-Id: <20211020101935.1369682-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
References: <20211020101935.1369682-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 10:19:56 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/machine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 16a08302da..ae82f82525 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
     return riscv_has_ext(env, RVV);
 }
 
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
     .version_id = 1,
@@ -138,6 +146,24 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
+static const VMStateDescription vmstate_pointermasking = {
+    .name = "cpu/pointer_masking",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pointermasking_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.mmte, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 2,
@@ -189,6 +215,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pmp,
         &vmstate_hyper,
         &vmstate_vector,
+        &vmstate_pointermasking,
         NULL
     }
 };
-- 
2.30.2


