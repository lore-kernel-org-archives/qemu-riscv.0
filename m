Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iJy2M-0006qm-B9
	for mharc-qemu-riscv@gnu.org; Mon, 14 Oct 2019 06:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iJy29-0006a5-KI
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 06:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iJy28-00058Y-78
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 06:57:01 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iJy28-00055E-0x
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 06:57:00 -0400
Received: by mail-wm1-x343.google.com with SMTP id y135so14227038wmc.1
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2019 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+MF52Dp1tIuy0gH0L5TXn68Hzokx6/nbmqPRJPtyksM=;
 b=tOsfDhQrvWGnrPVlnmK5f/TXut0hgwt19BVb3kVnHdg7JIntLwUKOuGk3Fex87sNFR
 ua29FaRJ944GmxxOQ//ypy/qqlukJYMb3mqxVyFDroPTMLD2u4depBlyruhBXYiQw2tF
 If+TmHeHP7dXxUZGmdTVVOkDbXJapok2RhVK7TXwF+N+eekRisc+jBBAfKI2m+O2yeXq
 Zs+VKBsLO07sGKafYHMMOqdG98VV6tT8/G8ABwQmlILJpT7IycWM7sxEoIRvemobI+TR
 JHriRBpULPNIr3vyWfS6UXitMRyfxj+l/NjwnbOqaf5GZgVOtqozjEHQn4n8mvVSCJB7
 BCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+MF52Dp1tIuy0gH0L5TXn68Hzokx6/nbmqPRJPtyksM=;
 b=Xo5iY9jzmT9tPCI7YH8sp3emYJm+jnt0tQPLCtNb7C2HB/0X2PUw4GZyfsSh4QKAHs
 F19+kfiJBpjJAQqjexOyc4Cp3OJoNHGB3DyDRSFvYgo4gxE9hYGyWHfPe/C4j2e12o4D
 USeADm6rYySbjsvT5UU5O90O/5MLPs6WMyYF518y52ljI6Hk29DAOlG9qbT86paEr8yb
 WZYAGHMGshpOtO2KiCFpElfh6dzpeTjRh9WoCwMVRbvwhPwz9b4iE0fys9QvpwMDOzYZ
 HDdY4u+VDle/wtU6vKyYk2VQcEiF3xiBzQrZ6rEudVUJhZvrVoLL4sb5jS7MQtCFK7yH
 M8BA==
X-Gm-Message-State: APjAAAXcSwmG8nZh1syR42UuxXknV0fIscnAYwuElaJpr2GzfW88luqJ
 LpGWfUaDy8R4rTc/pg327Ao/cw==
X-Google-Smtp-Source: APXvYqwdnroOs3N9SFTp/ThRxrZn8iyvA5atzSUAbk4eSCk8ccw4KTWL0AyTvjsSFp/gNDzgpECE+A==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr15324749wma.81.1571050617771; 
 Mon, 14 Oct 2019 03:56:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm16009547wmj.17.2019.10.14.03.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 03:56:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30E8C1FF8C;
 Mon, 14 Oct 2019 11:49:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, aaron@os.amperecomputing.com, peter.puhov@futurewei.com,
 robert.foley@futurewei.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v5 31/55] target/riscv: fetch code with translator_ld
Date: Mon, 14 Oct 2019 11:49:24 +0100
Message-Id: <20191014104948.4291-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014104948.4291-1-alex.bennee@linaro.org>
References: <20191014104948.4291-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Mon, 14 Oct 2019 10:57:03 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index adeddb85f6..b26533d4fd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -779,7 +779,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-- 
2.20.1


