Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZ5-0004gc-6C
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ3-0004fR-NR
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:37 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYs-0004Ve-4N
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:37 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jl4so5863622plb.8
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ie3FlFBACJeq4X/M6VQiwe1m8Ml1Kbx+Yprz1q0XbrA=;
 b=Z15r7KZxo6FKWk9NQI5CRhE+8/7Y/WGTW39Y29D4hKJUkIKkC6fUGY6fDsLJ8Uj1OJ
 4mkSehnvjsUrwpkvvSOFrB4ULe04PPEt3eE3rSS805ppw6s3/6g8JHQ+31MHlEQx5kBb
 dRB/QdEIL49sKWQYZNzMtgInpZdQdeeeq7pkejuZNfbUS8YNAZCEswSTW4IuCvt6DEsl
 nOpvnNbv1DWAwEycMigmUBmJmYJNKN1eJiL6K8HHZfAYtBWVmnJRduLAIEegXGE1qY+U
 Sh9HdkSX4qeIbwI34dmRNaKjKuBbGOQn9t7zVOAxGpOtYz/oj5b5pSXEsvyJl07ruErH
 HaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ie3FlFBACJeq4X/M6VQiwe1m8Ml1Kbx+Yprz1q0XbrA=;
 b=73FQTUd1kfUWNBSepmJCKYSuK6yMkcrX6LY3hNOGPwyKhl8djY9CLeNaAeAJiAIDMU
 I2qwyJMeboEr2mi6qcdoDpfvC3NEc7fEK+CBXJqp6XgDaMxmdgGTOzo1MWSkv6G3xxrd
 Pn4egDGE0gKx9PDSZVo39ViyA0jwwqiHZAIU0hek952ALdWhLKfTG6M6NpM+KHSrtmFj
 7ViRK0MhfL6nHuxd3v1q90bQtXLjQ2gAVOBADAR78GCZGY11kYumA+KykGmMvZjRWamD
 pKgPtdohckb2TUjM7cKyEDAmCGYLzgzcusKw171/s4S8SlV30rdBlxvJJ8DwffhIzqc4
 wZfw==
X-Gm-Message-State: AFqh2kq88pep7IK/qZysCCnoVMnBdlzD8zsdMZDbQFmF+8AqF+v/VRLl
 MVLLMTGJ4nBIEMInf22BaJI1nw==
X-Google-Smtp-Source: AMrXdXsW2CjhvWbAVrh8ulwzsWWWefeDvIT9tKykiaRfAk2sc1JVK/ybfqkQeHdkKP5VPKJQ2TrvKw==
X-Received: by 2002:a05:6a20:a584:b0:ad:a5fd:b664 with SMTP id
 bc4-20020a056a20a58400b000ada5fdb664mr68551943pzb.37.1673145444802; 
 Sat, 07 Jan 2023 18:37:24 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Sat,  7 Jan 2023 18:36:46 -0800
Message-Id: <20230108023719.2466341-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:37 -0000

When allocating a temp to the stack frame, consider the
base type and allocate all parts at once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 99e6e4e1a8..7e69e2c9fd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3242,11 +3242,12 @@ static bool liveness_pass_2(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    int size = tcg_type_size(ts->type);
-    int align;
     intptr_t off;
+    int size, align;
 
-    switch (ts->type) {
+    /* When allocating an object, look at the full type. */
+    size = tcg_type_size(ts->base_type);
+    switch (ts->base_type) {
     case TCG_TYPE_I32:
         align = 4;
         break;
@@ -3277,13 +3278,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         tcg_raise_tb_overflow(s);
     }
     s->current_frame_offset = off + size;
-
-    ts->mem_offset = off;
 #if defined(__sparc__)
-    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+    off += TCG_TARGET_STACK_BIAS;
 #endif
-    ts->mem_base = s->frame_temp;
-    ts->mem_allocated = 1;
+
+    /* If the object was subdivided, assign memory to all the parts. */
+    if (ts->base_type != ts->type) {
+        int part_size = tcg_type_size(ts->type);
+        int part_count = size / part_size;
+
+        ts -= ts->temp_subindex;
+        for (int i = 0; i < part_count; ++i) {
+            ts[i].mem_offset = off + i * part_size;
+            ts[i].mem_base = s->frame_temp;
+            ts[i].mem_allocated = 1;
+        }
+    } else {
+        ts->mem_offset = off;
+        ts->mem_base = s->frame_temp;
+        ts->mem_allocated = 1;
+    }
 }
 
 /* Assign @reg to @ts, and update reg_to_temp[]. */
-- 
2.34.1


