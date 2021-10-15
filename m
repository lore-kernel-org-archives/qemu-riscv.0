Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbGRk-0004af-7v
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 02:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbGRf-0004XM-Dd
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:11:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbGRd-0001wd-13
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 02:11:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id t11so5737836plq.11
 for <qemu-riscv@nongnu.org>; Thu, 14 Oct 2021 23:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LA3n51aVlEgbwHV98iyYH55ZjkabaHWokae08NAPXHA=;
 b=c6pwtFyGt4xSM5JKjSTC/Ut0RXCm1VINfS3GVAH8BtyML8lThkDUhcWCbhWj/alZQx
 LgXIoJy2c2TGERpVovpzvwzUgum8Y2eg0aU8QDb77dj80bFszwhmJJ5mgm479wxUpmER
 IkITQ4aHJXXx8oL79p++CZOqyuIdkLrhQrzsldHRnGxCB5AnlER8vCaGjNJKZaKP34/o
 Le6uoidNcRCHjWXm79vctddurl7SgHJo33Cyyr1xFMTZfeZ0TYfcYYdYxbBK56bkBSCe
 6mmkm+MLaf9tTEbbsGuVVTqnel399OeL/UOzOQJfgDxJDU65iGQClF61CMOP2wmAuHlv
 YAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LA3n51aVlEgbwHV98iyYH55ZjkabaHWokae08NAPXHA=;
 b=5Axutbyrmm9I+5/DNfa/+wc751G4G09xVHzRM76q/lNEHpX193ZtiHvSyA7kxeF1GP
 PlcaQgxDYbmo8Ykz+7oEbc1NeWIdV+Z/HVrd92tQeUj3Bayr6Sup0ObqJ8hsy7eKdTFd
 yueK1sMh48xQBSWL9VJwXGipui2pEYpz6oruQpsknsW83Ar4fpcIYATqpwETW1ZcdBgy
 a2pq7YRafDfdbyQv6EMPnk1GHWzLbhTT5hShcYfjAhHh11Us0P3qUYG4KgiuEvHcKRgV
 zOYbTkAtmwlZRpTU7KEjm9Z/GfzvZX92EeC6RcnFHrhVBUU9MImKj+rTvZs7kTW5quOj
 z5rA==
X-Gm-Message-State: AOAM531xQRpfyGuPUpIy35sby948ruqh01/tPqB+pZhSg8S/S9wvCLdC
 m15dKeUnwhwNf+94/QRSja9itg==
X-Google-Smtp-Source: ABdhPJyYNV2I2Y3RbbE5Nr6urPEFWU9epJFZxq+SaBKd16dIWbvw3vbs2yIn8mj9nHWt+UvSOpPyOw==
X-Received: by 2002:a17:90b:1e4a:: with SMTP id
 pi10mr11524012pjb.142.1634278311828; 
 Thu, 14 Oct 2021 23:11:51 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k14sm4211373pji.45.2021.10.14.23.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:11:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
Date: Fri, 15 Oct 2021 14:11:33 +0800
Message-Id: <20211015061138.3766862-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015061138.3766862-1-frank.chang@sifive.com>
References: <20211015061138.3766862-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 06:11:55 -0000

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


