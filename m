Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWDj-00053R-N0
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCz-0003Mb-UA
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCv-0002ov-8i
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:55 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso3997515pjs.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=Vhwm0qvsjtsA6wvMpMuv4W6xBYYfrNezIKAp1isoNgu76u1vMp7xhKecNJbXi5PLRj
 VLnSkrB/UWEuiTxmzawxYjYdYYTuh+vWTBrVED11GTk000z4aQ8V1pOJCHYOcKWvnDTK
 4d7qwo5fAjmWH0jE8qWjN7RQVtJK/XKo+1x+knGwuB8xeGNdcgyrjSqr5vcRn3E+BY4w
 +DUm9Pw1bPw+SsP5ZN3nnD8qBPgLRJy2h3zxyTTaIBDF3ZiIuOU5Ly1x0KMLHIXbcbeK
 hR56oHByAhBwBh959oqfDl09C5XZFgCLz/hh9tUOkDhLLMwgCwGmmCipHJqlFR7Kn37p
 NKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=kK6uguE7k5SByy+UnV3a17CPuM6IaJwdGjY67r3fxyFUD+5mcdAXdekulOKLaaDKxF
 Mre2cCKW8/+EkLPsiwkh5/uHfXk3NaVa7LG3LYPWLMDbF+lf4duQEGRdQK6qXFnK3jIX
 gSkD+7HA2S7rpVB15gE99S5hDWfuYxqtGSRCIG5mBaVec1otVhsPt6/Wdb46gWxxOk/n
 YYtiToPNnWVvsxgdsbfxeqhq0BJRY+xI4neipjHWkvPDY5AjE5Bj4A5L+lgnTlepndYQ
 0g9UqRoywyJ6+mPzmcNirAOetW/og1b+X4zcabevyLuQqfsezwlOPagcDvDeC1bKwao8
 RlcQ==
X-Gm-Message-State: AO0yUKVHKiGSuL71w99rLF5SpApbhi+KLVw6/oKuir2Gq5Thxc98xa9c
 OBWfLQoZ1H3uxldazwH76Z3/9Q==
X-Google-Smtp-Source: AK7set8Q5vVzPSgdqFTqxNSa5WCUFQsLUB38WZ5JWVzCAsDGVbbJKxR7xELhkZdHW1buXbRIUSV+Wg==
X-Received: by 2002:a05:6a20:9388:b0:cd:11e3:4105 with SMTP id
 x8-20020a056a20938800b000cd11e34105mr5068539pzh.27.1677476270706; 
 Sun, 26 Feb 2023 21:37:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 16/31] accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
Date: Sun, 26 Feb 2023 19:36:46 -1000
Message-Id: <20230227053701.368744-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2023 05:38:11 -0000

Here we are creating a temp whose value needs to be replaced,
but always storing NULL into CPUState.plugin_mem_cbs.
Use tcg_constant_ptr(0) explicitly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9b793ac62c..c42a436c0c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -630,8 +630,6 @@ static void inject_mem_disable_helper(struct qemu_plugin_insn *plugin_insn,
 /* called before finishing a TB with exit_tb, goto_tb or goto_ptr */
 void plugin_gen_disable_mem_helpers(void)
 {
-    TCGv_ptr ptr;
-
     /*
      * We could emit the clearing unconditionally and be done. However, this can
      * be wasteful if for instance plugins don't track memory accesses, or if
@@ -644,10 +642,8 @@ void plugin_gen_disable_mem_helpers(void)
     if (!tcg_ctx->plugin_tb->mem_helper) {
         return;
     }
-    ptr = tcg_const_ptr(NULL);
-    tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
-                                 offsetof(ArchCPU, env));
-    tcg_temp_free_ptr(ptr);
+    tcg_gen_st_ptr(tcg_constant_ptr(NULL), cpu_env,
+                   offsetof(CPUState, plugin_mem_cbs) - offsetof(ArchCPU, env));
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
-- 
2.34.1


