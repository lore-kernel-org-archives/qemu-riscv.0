Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCz-00060g-Pl
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCv-0005vq-NT
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:21 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCp-00087L-GL
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:21 -0500
Received: by mail-pl1-x62a.google.com with SMTP id j1so1120772pld.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=g4Yls9WlZWytmjrs6WK5pK2relced9exxP+C+DIiR3ydvQP/AFmJQs/Q1FxBmT8Wvb
 KCRnkR4+8oI+AoNH635irpmtZoLJe0w/WTeGc7rSxRjDw8/akfsXkD+BPO+BHz50+Mem
 6GHxgq7GrEw7gMqxkJNqt/Puwh4H4whym2l/1hXpwDaymJRiPP40tw3ni5t+SPYjqLyW
 CBII8dbYu+CbzpDObgn+IvJIfI96pKdN9jMKY4+HNO+zaWTyw5Th8xae+0sA9vxbYcDR
 2+JO6Va0ATcnuS304BuoI1eq8bakSxJyG+vEeedxNWIGsQ27oLGn6DkzWiXGepd51HHV
 X/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=eIRVkZzsxBeqytFtFkri9XWUWedsu+oiYWlpTrHUAFUjpX+dKWkqCjLhJ8Dm4ceJmt
 bNd+9FKUkkTjVc4yGuuGAAPS5mPxO9g3SK/0fsi8nvJ2WEoJGKugQYNOydqDi3p7tMZU
 qWLtnkvqTw3gtTV+ngqmR4I6BXXjyruDk3fFKfSpntoqeFQ1KMHqGTjtbO5UXEL5v/ML
 Fx+SnZ9C11tfjBRdvicCtVltzj1Er3NPo+g0tfBhmeeKBJ/5lq92ll/Ppalv3JGeq2fG
 8LJaW8/2ejv7cT7ROYnTvdzQw6t2IqL+1NvxR6QwtVmdwSbdagtGV9YakId+0NFh2dud
 luGg==
X-Gm-Message-State: AOAM5328wCSSn0fTG+TQj/SGyq+YYBUpwsJftovLJ681Bf81FhsPXmf3
 u2ZBtu2Q4Az79X3so0k5a/KsAw==
X-Google-Smtp-Source: ABdhPJyzKknNlUzYrK9SUo4X+EItWnzTh0ZrNAEfs2lH7ImCdku2ZkynQmwi/r8JQusxaV8uorRraA==
X-Received: by 2002:a17:902:ff0a:b029:de:1d1f:8558 with SMTP id
 f10-20020a170902ff0ab02900de1d1f8558mr1777966plj.85.1610444593615; 
 Tue, 12 Jan 2021 01:43:13 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 47/72] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Tue, 12 Jan 2021 17:39:21 +0800
Message-Id: <20210112093950.17530-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5622fb23f85..93ed6f54e99 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3919,7 +3919,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3931,9 +3930,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3946,7 +3942,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3957,9 +3952,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.17.1


