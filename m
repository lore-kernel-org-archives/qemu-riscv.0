Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F5606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 04:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kBw3iL61
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJk1S-0003oJ-5i; Thu, 22 Oct 2026 00:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1xJk1P-0003nL-2Y
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:03:19 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1xJk1N-0006B0-8J
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:03:18 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-5eadadf23e5so1263791e0c.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792641796; x=1793246596; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/uetjsA9Z42pxGQEPsZaIXxyPFdfdHALxEuTtBc7tAA=;
 b=kBw3iL61mp5l8/S1yhKSq06EpiE6m0YIJo1D7t/Ibd2vFiJgvOeH8YqjFmWS82ulVG
 2GtWW41gwDAo47BvJhKmjBJ8Xqo4Ec+Gesd8jivPr0Yhngt1NyeXSeRml7SBIi+QKvJ0
 IU4DaqGfICOnGV4PCCqal0LkmuU9Z9i8hoiXlU2IMb6L1whvaWF3+YvMiIAw14pgGQKp
 E05RQCZVO/CjViUdr+6DUMisf5Nu/F3DgxjoqI3QSBwPqsXD7osLr4rCWeKpsehFuKKC
 H398S0paVBVSTFKIldnm8CoDh4Z/DCqeMuX8K5bakLyC0jyv5qCagkk1k3o4jUrMpcWQ
 89Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792641796; x=1793246596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/uetjsA9Z42pxGQEPsZaIXxyPFdfdHALxEuTtBc7tAA=;
 b=pT9LVp1NU8wBNOO/c2SfJIJqbLm4Nqax1er3djsVqaaMmbpGPLfidIjATnvqXAZaBt
 u+AATBDqNV0XwE92GbAhzOs7fBnpoGPUqG8vZP7w8Er/LeqvKI2a0JRKjwpgihusK9XX
 pH1jJLO5ZIJH433cBvRHH2MFFV6q/ptAQ2NJfBUXZYkiV81y4it3bE7iO0wNTf6sLAK0
 HpED2Ht5SfsTbfIJ4H7y4LtPvvclWfwYNDz1fZsyS3Ki7szpQXAFZOrg+RmQlU1qhCOp
 gJRaF2AcqnTZhwIYz3a5yhYaaxZt/0ENBF2rlPDs2zyOHEImY/NGdKt+84UJtER+AKKR
 kvZA==
X-Gm-Message-State: AFq9FYLgwyZXVCi6kxkHtrHGBTHlEvW49US1bsqgMvFX1tsHourj7JBS
 iUsNlpfem6mpiTFm+xd9pA1yb+YU8hnQZ4ArqZRWUWzI6TtS1+VWyILv
X-Gm-Gg: AYBFou3aNSgDA+x9U7/Qs5CMWy3JAcACEJttdAfHrKM0dkwXzx6a+w9vKApnpYt+1P1
 d7w0J7W9nu0DTEQBJgirhFcg9M+JJLkNT7v0dUF6zeBgSKdFbQm4MB8eY1OUHG0oMZ5prUP3OJd
 bN0E/YRM2khw4Eo3eW2e/EhRnyxzTG7IHOJvBXLFcyDJgkBYuHV/mFMKok5p3A6skdogMqVz2Mz
 czERxyvFejsZfLT1zl2gAEjnStNL/1yzhknRLCxPhq8/pFbLh6EUF2ZKAHNGg6yiuzQdIAd6+ke
 50iGrdmJir5IaQeC9fEJJsvEiR7UwVdjF3AwQoDMSvguenMlU07hYCZeGYgOHUyrv7jsAPQKyl1
 P8IFb7VwRhGe4LVx8uTiaygsQgBqt2/x6eAv+BgeINZ8fLXQGup7KFfQFiEFar3gqN7ox6HU6VJ
 fY27FQwGlIFKq5WNtYEI37tE+tFPLO1UVnGLcbpyVs1xNOuvkBBykSXJadl14BOgI7kq9Z4d47N
 4B2/KAdI6hI2+GWWdNMdfFLuTfMk81A0rYF8l/mgegShrHp09T/TNH88PWmVPaeVvP024qcy1WJ
 v8i4s/M3MdFq+eaK9NT2OYS96ZbyGqcNgWp1vUmTWLvf
X-Received: by 2002:a05:6122:469e:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5eaebd6d4bbmr1751513e0c.8.1792641796129; 
 Wed, 21 Oct 2026 21:03:16 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5eae969803dsm5859810e0c.2.2026.10.21.21.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 21:03:15 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 richard.henderson@linaro.org, Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH v3 1/2] target/riscv: pmp: clear A and L on every implemented
 PMP entry at reset
Date: Wed, 21 Oct 2026 22:02:57 -0600
Message-ID: <20261022040258.1509306-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022040258.1509306-1-sebasjosue84@gmail.com>
References: <20261022040258.1509306-1-sebasjosue84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=sebasjosue84@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pmp_unlock_entries() bounds its loop with pmp_get_num_rules(), which
returns the number of entries whose A field is not OFF rather than the
number of implemented entries. With a sparse configuration the loop
stops early: with entries 0 and 1 OFF and entries 2 and 3 locked,
num_rules is 2, the loop covers i = 0 and i = 1, and entries 2 and 3
keep their lock and address-match bits across reset.

riscv_cpu_reset_hold() clears mseccfg, and with it RLB, before calling
this, so pmp_is_readonly() then silently discards every subsequent
pmpcfg write to those entries. The stale rules survive for the
lifetime of the machine.

Bound the loop by the number of implemented regions instead.

Fixes: 4bf501dc0118 ("target/riscv: pmp: Clear pmp/smepmp bits on reset")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---
 target/riscv/tcg/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 41b55519a8..061f0e078d 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -201,7 +201,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 
 void pmp_unlock_entries(CPURISCVState *env)
 {
-    uint32_t pmp_num = pmp_get_num_rules(env);
+    uint32_t pmp_num = riscv_cpu_cfg(env)->pmp_regions;
     int i;
 
     for (i = 0; i < pmp_num; i++) {
-- 
2.43.0


