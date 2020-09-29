Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKz9-000738-DL
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyz-00070f-UG
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:15 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyy-0002OF-8E
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:13 -0400
Received: by mail-pf1-x441.google.com with SMTP id k13so5554736pfg.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PC++Gs28pgF8ncCYZAzqDzSai9TvAAVDPTPF+0FgnNI=;
 b=KCtJ8STxOYz+diq9PpnmAkXwlApsCnGK0vad2K2pjMGjo6B4I5EdWXq1ryU8SxKW3a
 1aRjGo7fgbaB+nsW/97kbQJD8sA1QRwyjWwrmIAG32jaid3pL4+3fOc3YdBkXihKY4Nf
 7lhyBChLJhshqFCI/Pf+IGhIK3aVxKwMRHHGnyWLnukhU/RdlyX2QNc/4HRsIeBW96et
 UpR+15WHNUJBxdTRJ/5d2CAM0fGZ3CaAzno/JSjrKb0L+irH4CxLs+OtsSRmfFdd+3mw
 ql4NjExO2etSD7FhmezmVI9bIlafcwcmbA6EmfGtAj3/okCtdwqnUPk+We+ilhVdFeeo
 QXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PC++Gs28pgF8ncCYZAzqDzSai9TvAAVDPTPF+0FgnNI=;
 b=rNZd51UuZ8taKTTEULrJLpTy4pjbk2zcnFe5lc6p8CoNwNwgg4/A4IbBMb948xcZbb
 2GYvm1qy+Ed8UmJ6bpl/aGrQGFqoMMMaeqREkzLAw9LJcRYblhLHe6cSO/U0La7PEmih
 yFvcXRmeKHiVtQgu8am2wgHtmztvSMSWJM5d6pUFRxWkT2xtHdLaJHvRKFoqw9qfdtaz
 a3eALJB2EzTePUcqoy7c0uTOvx13uW9m303Pmx/ogYJ+i8BWS7mMr4POaYEwtzRu+iVT
 JP3U4E6Ke7KbIXmt6w4/FW9lyNzjCEImrJoOSHfmRCPKXIz3uDIGB35P/3TGTx5iKVHD
 cI3g==
X-Gm-Message-State: AOAM532YBMOQVxsgUktu72ZhOHVQH6Xr0q0K0RuaHNEv4VfVhrANISVh
 9izJrhanDOWW5KVO+6QWyJGVQw==
X-Google-Smtp-Source: ABdhPJw+DjYoFbhVNgUeE7rjDe0RtYAPsZaYHcDXYuH0YSY+aH5H2eRL1hr1DwM4tK8Wa3AwlTZw9w==
X-Received: by 2002:a63:c948:: with SMTP id y8mr4544404pgg.164.1601406491133; 
 Tue, 29 Sep 2020 12:08:11 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 49/68] target/riscv: rvv-1.0: slide instructions
Date: Wed, 30 Sep 2020 03:04:24 +0800
Message-Id: <20200929190448.31116-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:15 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a2ef6b708c..fac387353f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4639,17 +4639,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.17.1


