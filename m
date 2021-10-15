Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbH7r-0006Q9-J4
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 02:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7h-0006OU-Cm
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:55:23 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbH7d-0000PS-IY
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:55:21 -0400
Received: by mail-pf1-x431.google.com with SMTP id c29so7609183pfp.2
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LA3n51aVlEgbwHV98iyYH55ZjkabaHWokae08NAPXHA=;
 b=kyQoCT0TAJagFQOf23Sx9PN0Rj/bFKMd4hmjJq9HGbAOz7teW0Jn/PedjuQyF9OKsY
 lxob2xI5fZKhc692Wvu8M1eTURYjgS/TKScnDO2mBJnaXNcA0f7jViBSeNDsUAUa4iCP
 W8oDHzaPOwCleX4qQ2keWcYk+VrgAUlp7gQARpNn+m43YOKxCsK8T71j41YP4MsSXUTC
 VbBAjdkNyr7XvQoKEtCyFxH37LdvuLwxXQpb6ViQl5sy/LDlK8or8euQNQFHfPKfqJ1b
 SM4YUQ9dtXr1Ht/swGm57K2icf7iT+apzMyHM+E55b12iwl7rWdlorYn8uZi/g3KafU3
 gv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LA3n51aVlEgbwHV98iyYH55ZjkabaHWokae08NAPXHA=;
 b=Vvs1UarqMrv8oHJuez8VJe819H90eaofhFa0upxZyo63QjxzVYbBPQ1FTXOWlqN6cG
 3IUpF6Ai/K1RBU9G0Homv80CkUBY97DrCZuglNjwTfqBDOdShBD6sOVE4G2POndrvFOQ
 l/jJ8FeVkx+LM+DDgS5QIKtrxrvE911HV1Hkgkds2RwnrccAw4ghR0LleYxxO4u1BVfN
 yCKAnTp/6Tf1W7dwNFg9AElPxyjJWPEHlxUNkBFTbQV2WnvHOQWdN13sZIhnNTN/TxF1
 nvTfwAu26MbYzkRHl7dzEI7D0PqV9w8wO82YO6bFrDoRH+dBkWAyXw5hlVjrNdbDKZ46
 3ETA==
X-Gm-Message-State: AOAM5315a7t6uhGVx3yjMhAv4QuWBbWIangG0OzLq+9RuwIg6DhXG1AD
 PLlWN6znrX0oqzvC8UdMPfq4+Q==
X-Google-Smtp-Source: ABdhPJz+lHJyW6xnnrzt16HZPKqrCgFH0S+Ledj5yEh6ELuNLd9VigKYY+k06yba/VyF9j7TZE92mg==
X-Received: by 2002:a63:d60a:: with SMTP id q10mr7900175pgg.335.1634280914272; 
 Thu, 14 Oct 2021 23:55:14 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id d6sm4105059pfa.39.2021.10.14.23.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:55:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
Date: Fri, 15 Oct 2021 14:54:57 +0800
Message-Id: <20211015065500.3850513-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015065500.3850513-1-frank.chang@sifive.com>
References: <20211015065500.3850513-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 06:55:29 -0000

From: Chih-Min Chao <chihmin.chao@sifive.com>

The sNaN propagation behavior has been changed since
cd20cee7 in https://github.com/riscv/riscv-isa-manual

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 target/riscv/fpu_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 8700516a14c..1472ead2528 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(float32_maxnum_noprop(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
@@ -283,12 +283,12 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 
 uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_minnum(frs1, frs2, &env->fp_status);
+    return float64_minnum_noprop(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_maxnum(frs1, frs2, &env->fp_status);
+    return float64_maxnum_noprop(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
-- 
2.25.1


