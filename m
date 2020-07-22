Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwJ-0005Ol-QN
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwI-0005KO-89
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:26 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwF-00062S-7R
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d1so649889plr.8
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=59BWiZrmPRQuRcEmfLlUp8+VJfVUsYTl3vyGYCbvxMo=;
 b=DW8VGy/u8HNcDzgL4u1IG/sTeSPjp0wgPD6QOlBXvlgeQwnXLzIWtzmcn7ckdVjAS8
 yqZOIvJczRI7xzeK/K8THZB4WHtnufONVIRPVs15+67V5vwO45GDjA47bVHyOISbppol
 KAJcV4cGqS3MbbAhAExCrJ8aq40KcC7KIp7uHDETnbFfunc0NgQtS0gpLXomtU6T1Z0b
 l+YuluheBbbtgFMVku1g4k6SVqAnMCbuVt5meVMWOLfRIPCZpD6Hog7RL/AzhIYgJ5Eh
 GSGrvq46QOly6xoNR1UW6kIqRy2ikgsd96ZdEYvI0pFNC5QOpDCaGCizU1Ha67b3M7ce
 nNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=59BWiZrmPRQuRcEmfLlUp8+VJfVUsYTl3vyGYCbvxMo=;
 b=iHY6/6wCfvNyGxUDaGpOZCbmI0k7/t4xplpe8wGtkGHWl0XXD41loa0XR6631Iv2IF
 ghYK7RKLsi+mMP/sU1MCmKds+9JLpGCiDSK6jfrq0HnaZ7ZpKPbYURV8uXeY8NhWoZUN
 vx43noHW5G7W9kT7IV8N0vOH9KV3gT5PkixVAWBWAl5QyPgvPTCDznwBqIrL0K1JD5m/
 zF6Ld9CoY2Z8PwVNTe0s3born6fmWn0KR8Er71h9D/7BHiy0392GRWUBHnj3G8DQtKsh
 D4nH78UNZzX09GTAxvd08wQI6vR2e/HjEAL8FacPnAKR/5KFLffpY1tpTHtkgzWROjOG
 U6TA==
X-Gm-Message-State: AOAM533Z1ARE+sLr2vWY19ftBi3EFKBA3tRsS2PuzGNGIZZLTGXosbjl
 YAPYrPM24AeLJTZU2UMk1s1hiQ==
X-Google-Smtp-Source: ABdhPJwD9dVVRqrh9a9dDtRhgIMUQafBtyHE5pQDLZd5IL9uU0j7nQdo5o5LYz3LoXb7jHm0aMz+/w==
X-Received: by 2002:a17:90a:ef17:: with SMTP id
 k23mr8230563pjz.45.1595409682007; 
 Wed, 22 Jul 2020 02:21:22 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 53/76] target/riscv: use softfloat lib float16 comparison
 functions
Date: Wed, 22 Jul 2020 17:16:16 +0800
Message-Id: <20200722091641.8834-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:26 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index dc883e0352..95cce063d0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4197,12 +4197,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     }                                                         \
 }
 
-static bool float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_w, uint32_t, H4, float32_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_d, uint64_t, H8, float64_eq_quiet)
@@ -4258,12 +4252,6 @@ GEN_VEXT_CMP_VF(vmfne_vf_h, uint16_t, H2, vmfne16)
 GEN_VEXT_CMP_VF(vmfne_vf_w, uint32_t, H4, vmfne32)
 GEN_VEXT_CMP_VF(vmfne_vf_d, uint64_t, H8, vmfne64)
 
-static bool float16_lt(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_d, uint64_t, H8, float64_lt)
@@ -4271,13 +4259,6 @@ GEN_VEXT_CMP_VF(vmflt_vf_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_d, uint64_t, H8, float64_lt)
 
-static bool float16_le(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less ||
-           compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_h, uint16_t, H2, float16_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_w, uint32_t, H4, float32_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_d, uint64_t, H8, float64_le)
-- 
2.17.1


