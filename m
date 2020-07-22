Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAuF-0000oV-ML
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuE-0000k1-2f
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:18 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuC-0005Xp-Do
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:17 -0400
Received: by mail-pj1-x102b.google.com with SMTP id mn17so861771pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t2sySwVAYzBgFbUWGNCph7loGGmEs8LojJHT2BEgias=;
 b=XXyGIhqrBdD6fi+0eDuLGFcejzSU/BUvO8w67CO2ZV+VSjnMxRAC6v1eGRgqsFM3q2
 QfEqlgmhKR0QAyq6QGNguQjZoHqEe6L0Y4CrAtRo6EHJ28JdwTWtJvefYeN/y2CwDTgb
 tISHqjAcOXhp6n0ehXGORwGqyHRvnkoSL6/pj2pCfG8R0LRFKG3DXl/kRDk+mA0xsLq8
 k2Go2c4ct0AySLqPSJmwWJPMh5cMlTg9B1R55xFNEI3XYSJgnBGkYF+0o1AL0dCr/omG
 Yd5a51CMBpxkoW5mVp9BZeiadsgdFz+zqr5a+kK+iez9kM0AOJ3PJOkdQ4JgwqTZHqN7
 ya/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t2sySwVAYzBgFbUWGNCph7loGGmEs8LojJHT2BEgias=;
 b=rAoNuQa6cIwn094bJ5GV37zMQ8GUxGc/EbaNyhGm9dZQoRB/yTxhxuHOeU9j2FQwIi
 ll0ahtTuCSTgtfAWrEcjDy0NyTo9wENUUjrSsa90OdnveVkK+rCakzFnHRWnKmQ+eQZC
 iGubulhifcB56ygS4ebeITPiEzfPFU1aQUYpkZTkIYeUtPlthjDdCh3tNmZQOVtEc+zU
 oAv8Z97ZprAesgm229hPs2jWyDZS49iZpZCoJJy+JjtpXT3gfXbgUqoMjGJzzXcyFuif
 i6lkrn6b9aB3bYbnpcoek5Cy8MUJQEF4qAksXvJi6rJBIAdyy1sXBBQbI/4NYXSOM8U4
 SqwA==
X-Gm-Message-State: AOAM532y/ukelga4pg6+LVHtUbXHBNuGQMyYzf01rvRsCebU/7/hH/G6
 0fsZZBJrcZP4wpTplD5lGy1BVw==
X-Google-Smtp-Source: ABdhPJxs7SuZ07/HcM+uwTVeCJ1zCs2ziXosnUbE1NJq5LdHXr/h1wnk8FFojGZYZO4cOY20cxMBpQ==
X-Received: by 2002:a17:90a:8c91:: with SMTP id
 b17mr9343086pjo.74.1595409555109; 
 Wed, 22 Jul 2020 02:19:15 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 24/76] target/riscv: rvv-0.9: fix address index overflow bug
 of indexed load/store insns
Date: Wed, 22 Jul 2020 17:15:47 +0800
Message-Id: <20200722091641.8834-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:18 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 13634be66a..1c4aba21c6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -449,10 +449,10 @@ static target_ulong NAME(target_ulong base,            \
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


