Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdz8q-0008Jv-JM
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 14:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8n-0008D8-JG; Fri, 22 Oct 2021 14:19:42 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mdz8Y-0004qX-OR; Fri, 22 Oct 2021 14:19:41 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w19so4655793edd.2;
 Fri, 22 Oct 2021 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Czbi/vUawZUe0SX4m8TkJPzL7ZQqeZvUuHtWi7xGVQ=;
 b=hs01Wo2X49JkBucSQv2jdXs4hkLW17deYpEX9rqU5CTO/8cA1643dkyYQb+M7CE/Uh
 xJQMR/FoGhE7THp4sFN5sF5WyWhmg1leZ1VtBKodAxv0sTx7BOdG6cVXw5d7jvL2iTwA
 2vclmb5sqoP6HOV4T/4GnJ3/NdVD2rgIQexoVb9QYiDIDNraG4v4YG4tifmJTXVvSAEj
 Vng1svER2JI+sY8zB8AQo10s9ojGKiVwl2eZDtMXb2il41mFXNGGaF7tnKS3g0aiAi2J
 AVMMOyzWhnDDcETYVYFo24Trg0ggp0ePPUNgOGL+5fHfZyVjzTdzm84ndZS4pw22sUXE
 ZS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Czbi/vUawZUe0SX4m8TkJPzL7ZQqeZvUuHtWi7xGVQ=;
 b=oV3KM7a7CcFPKq+5Rr6k1OzJJ6F5NOXLqJyrut8FvVN6EjV+vUWXg9/B2tFPU/CVEE
 k3nLReNpJxhAj67BZZZeWKPi1PqyqsIq6gvCt78mpAESwVCDZIWfGVCCCNBUhKZmUS7u
 HZYE8lmW5BuQ/H/Wo+ll5vpUo4Rs75iJNa+5s71pdVNFKVxJxysKvOMKNGNCRW0pipWl
 vvwcmjXvsuS6a7RQX5iHz3hgvoKdOxM7xBOK/ym8V568E2Ix7T3Sx/SBfIXoHl44zYpx
 jVMRaYCmX44XZ5yAabolI9bzHgR5SJmtMU1jB7DNaZdImMK/+DXcrf6etijTjGpF0G6k
 lclQ==
X-Gm-Message-State: AOAM531giRnN07PE5WDn60fJ7YC54YNuIsHSMbENYt71C53R8mVo1hbb
 N+XhsKE5B2dda3DiLYunKEE=
X-Google-Smtp-Source: ABdhPJzi21bHQEbxCLADF4dc7ci/BIycwvG9IEhGze+njWScIN7JIXy1Kpf+1D8Z/aKlWWDU+w+1Tg==
X-Received: by 2002:a50:a45d:: with SMTP id v29mr1975791edb.295.1634926765027; 
 Fri, 22 Oct 2021 11:19:25 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id p22sm4233079ejl.90.2021.10.22.11.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 11:19:24 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v16 4/8] [RISCV_PM] Add J extension state description
Date: Fri, 22 Oct 2021 21:19:06 +0300
Message-Id: <20211022181910.1999197-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Oct 2021 18:19:43 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f64b2a96c1..7b4c739564 100644
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
@@ -100,6 +108,24 @@ static const VMStateDescription vmstate_vector = {
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
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
     .version_id = 1,
@@ -191,6 +217,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pmp,
         &vmstate_hyper,
         &vmstate_vector,
+        &vmstate_pointermasking,
         NULL
     }
 };
-- 
2.30.2


