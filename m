Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmN-0005Ur-P8
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkn-0002P9-5d
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkm-0004Rh-8z
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:45 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkm-0004RK-4B
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:44 -0500
Received: by mail-pf1-x433.google.com with SMTP id l7so559370pff.6
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=p/aHvK4Ow3ycdFh8n3Jb7MsDbfRWgHzYPLH7LzUr5BY=;
 b=dt9vrbrLfbbL/2xf5fuMrXyA192F+47JRTaFVyaK9Ncr4NeeVU8cl2E8pwib0KXQG/
 /jnS17zYQsH//CG4tUbWbPFaJiJgafbDAMtnLj6oMAnRpXYB4Rr467xRG0vY90uMoje4
 anV61bQAQsvVSmmq5z4T8k1IVnwcb/v8+xP6THZMiMbLI+h9nJI4xUzRBK9Z1k95QWa9
 +NgITLtrJ6GRqNTGdPhvDlQ3k/fPqwKn3Hnq8+9kHxXlfE/QNyW3X6ezIM7FoY7PxjNa
 /QkFZH4IMm5sceC/ZTww5jOpu7fEGPTaeSdF4fU4c+jmx+MNp3UrO/+cWOt0rybcICIJ
 r+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=p/aHvK4Ow3ycdFh8n3Jb7MsDbfRWgHzYPLH7LzUr5BY=;
 b=hc2endux8tuhoApa1CZdxlh4Uk9YM9mxqlByL1bWA6F6cMAfAL4a6dS7blxdnUowz+
 r+9ln2L+T/Q36gYVYEJ0WPC/ItduRNvFqpxvgbmnLZx9Ox98yUbP3OGvmxDf2Tw9jeJj
 JQq6Pqsx0PRWVo+Sc7T08SM7HVwCPfgXnobAn+FbP0nGZWgJ/JXuLP1/VFVnK7pzR3mP
 UgtduAV0D+oXM3g0LRhjVEYTzIvJuhkcDo0H1zW7yCyk32PqQhFiUs4bXaG1S2s0X2Up
 f6in5aFv72LCviizDC7Ahvi/h3M593BrSs0dt9dcfJAzBt6Y0deRKQRB9rydhE1MeoNQ
 AH/g==
X-Gm-Message-State: ANhLgQ0FSNRvPkfJPbmO94jhuDbnaiNzE3YepFRIN/cxCKfAR8UOca7n
 eI3jSmzLtrgTpHXBumqH3MO4d6A9Z6zVsQ==
X-Google-Smtp-Source: ADFU+vv96l6UZqK/+eeM++pmgQdQxUmvygEPEeNsj0eHzkhc8DX9fqavMgAFP/ekSt6eiJSIvg3xbA==
X-Received: by 2002:aa7:8687:: with SMTP id d7mr1622724pfo.164.1583196582854; 
 Mon, 02 Mar 2020 16:49:42 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id v8sm289539pjr.10.2020.03.02.16.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:42 -0800 (PST)
Subject: [PULL 25/38] target/riscv: Only set TB flags with FP status if enabled
Date: Mon,  2 Mar 2020 16:48:35 -0800
Message-Id: <20200303004848.136788-26-palmerdabbelt@google.com>
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
X-Received-From: 2607:f8b0:4864:20::433
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:46 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5b889a0065..aa04e5cca7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -332,7 +332,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 #ifdef CONFIG_USER_ONLY
     *flags = TB_FLAGS_MSTATUS_FS;
 #else
-    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
+    *flags = cpu_mmu_index(env, 0);
+    if (riscv_cpu_fp_enabled(env)) {
+        *flags |= env->mstatus & MSTATUS_FS;
+    }
 #endif
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog


