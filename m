Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYN03-0005o4-9n
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYN01-0005jm-De
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 02:03:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMzz-0004ot-Pa
 for qemu-riscv@nongnu.org; Mon, 19 Apr 2021 02:03:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id u11so13616210pjr.0
 for <qemu-riscv@nongnu.org>; Sun, 18 Apr 2021 23:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=41vtdKBbxUOFhp4p6eMdPTd6SyBd/ck8tNGb28KQNqA=;
 b=P2Gkq3xhnvboohiN8KLkgPCBjn7OcNZAFRh//o+L9FznXn1cdOAVgmfkbcKE3vHrqD
 B6tXfTb37wQlthGc8A97w9L2YN2679g0jXyje/W5CR+iy3Q+ufWpjkQD7OVOUEl3Xj+I
 3+u5X3r403quYcL6BJqr8IePmHYtvOUaDVEgrBiQU7CDfjPctdkUzT8Fi6ZbqwnAMyRc
 Hy2mxPFtArNMnUEh9QYMCZxAzDZ5u4Skz3rM1oF3alEqEWK6Bt0z52C3yrQBeswiRzud
 lfiP2KEq2H4gJDfCPp3PlkvWe2KjAl7Q8Hs/MWvO2zzeOl/NUBtoBE4yBFNpEUAay5gd
 M3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=41vtdKBbxUOFhp4p6eMdPTd6SyBd/ck8tNGb28KQNqA=;
 b=ae2apad6deARZKjys4EPTXZEFUtFLE8folE68mtQcoHVIaYJ/t1eRTYCg21+YeD4/Y
 N4MqHu0aMRiG73EKTMDumY/xbX4PXSzwLhh9K/AHRk27kRxRojoeqa6VnMVdTXoCMHR6
 DMYzUbwrFD10kJkieOzdaRawtjeI82otThEk74w9M7JtV99YC5V+SrAEtUM2gpv98/BQ
 lMFGLhFqXp4k1vzaIpsKRjKYAAF7VaIaZOURJHldhN1WoLJ2LrsC1jD42fKl+RfPyoIq
 j+Uy8Pf/lojAuxy1HvdIg/46R2X2TEUJiuIPB+5eMY9sujAIbO8Ch7JRxkW6XNi82cZl
 NETw==
X-Gm-Message-State: AOAM5327VqpwC0CGViOSzPj6IkNHxXc5aLcisp0FxpkjfONVPTkq3PMH
 IZO6jYyCu15ZieBo5b1wgVDp1g==
X-Google-Smtp-Source: ABdhPJxII5Btbdx5IEaOpeI/n42ng91b4o41UUzoPvPPyEVHZJi36SBc36osMUZ/DyJ5M+RuCrjFeA==
X-Received: by 2002:a17:902:edd5:b029:e9:7477:5f0a with SMTP id
 q21-20020a170902edd5b02900e974775f0amr20915755plk.81.1618812186128; 
 Sun, 18 Apr 2021 23:03:06 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x83sm5939316pfc.219.2021.04.18.23.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 23:03:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH] target/riscv: fix vrgather macro index variable type bug
Date: Mon, 19 Apr 2021 14:03:01 +0800
Message-Id: <20210419060302.14075-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 19 Apr 2021 06:03:09 -0000

From: Frank Chang <frank.chang@sifive.com>

ETYPE may be type of uint64_t, thus index variable has to be declared as
type of uint64_t, too. Otherwise the value read from vs1 register may be
truncated to type of uint32_t.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..4a70776af32 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4796,7 +4796,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index, i;                                                    \
+    uint64_t index;                                                       \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4826,7 +4827,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index = s1, i;                                               \
+    uint64_t index = s1;                                                  \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
-- 
2.17.1


