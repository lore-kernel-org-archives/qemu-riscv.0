Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRe-0002Ha-H6
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRc-0002CW-JV
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:20 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRZ-0007nT-Rd
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:20 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g33so9065903pgb.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MeZ3DbVQFubD9Ck0Xx/O6GBTXdFjHoV45D2FONbf3aI=;
 b=VCVbI+kFwqbNUL8dAllKLrzgxA9nxxBloX+RSu4VyUg3OVI1XsHNmrJ5xPdtTJ6DTb
 HOMsM6grbh3t17wmT8j3pffN7p1RW2RhzTyNtAiuNxy6MzxJXK27IQgFPF+WlirbMahH
 C3C/TdfIk9i6A9IPTsJr6xQICgrTw25GD0bDu38aas06voBy+qx2LlNbre6H1DFNPpGZ
 XBzxH0WFpJLBtt99INVOX1/YNbyth+sRxjsakw57Hz+oCx/qOwkJtzHxZwGhwh86Olgj
 hCWJfJkE1BwlCLojDhQZ5I7tcISu5yds23cwYUZ5uwuvYLUXBFY9sN9ZIM5mjoOStqFb
 CBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MeZ3DbVQFubD9Ck0Xx/O6GBTXdFjHoV45D2FONbf3aI=;
 b=GtkM5hVpuzrXJSO3d0zCyPzMX19Iqu7EPpJVM8Z62X3SdvOaHP3IL5GOrz+VWL0ocg
 oNw2vPucfFyX339XfWgzHjrFIeiuwipjhSbEVevD50Si8+eWjKdIV9+EjzF4vRyf7qHj
 ElUDdl4O9CpqZmSV8ojjA13RBiiJLWDKBaUCeuIE84vHXyFTUBkEbYqm/f+6wQFeL6g6
 Olo4fDokmotE0uiykeqNiVssfdlHvbv3WgH7U4pftbyskWwWRv+szJAuUXTS2NMNyz7U
 Md27zvyKMiO+U34w4ZzWs9JbnY785u+x9WQLtdM87oZpPyyNMy8i4X9QnQfPUdVjzurm
 YOYg==
X-Gm-Message-State: AOAM533FsugbGvtjTZ51jutzX2H4On0hPM4HJ9PiJ+ye7a3jBbTeQjWE
 1jzTfTjY8wIcCab9VgnRnuoUHQ==
X-Google-Smtp-Source: ABdhPJwa9PY61jq6BwvIjLneO1wLxVNhO27SA5lO3dvk0fASrfWYsVLiLQX0Z1+8bVyTpnH8o55vnw==
X-Received: by 2002:a62:e704:: with SMTP id s4mr8107606pfh.177.1596710895992; 
 Thu, 06 Aug 2020 03:48:15 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:15 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 22/71] target/riscv: rvv-1.0: fix address index overflow bug
 of indexed load/store insns
Date: Thu,  6 Aug 2020 18:46:19 +0800
Message-Id: <20200806104709.13235-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:20 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9ba60dd7018..1ba4f720922 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -364,10 +364,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.17.1


