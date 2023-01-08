Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELad-0006m4-Vo
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaQ-0006UN-0i
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:39:02 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZP-0004nR-9Q
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:39:01 -0500
Received: by mail-pl1-x632.google.com with SMTP id 17so5918035pll.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdHoeH+hZ0t51S2EuQPsB5HeY/0JCfhoxTNUbpkf+2E=;
 b=XPo5xEUOrItF78dICgV6Q+o2yG+GIWyORRH2fq0KKJYRWTh2LPUmJ39WfST6SXa1Ee
 LX54/sh5jWr90y0USup6xo/zHnvJe9n2DOQG2UpIlqZNZflG8/q151TbDSbOLHgjdrfj
 4oRycYWSxXZ5mnIvfzTQ/Sz6PqjAQAHKHq8uHTKHNRSM9HtFWjCexHygTW0BxJXJMJyJ
 MCia3QHaSJEp+0Dl1nnBhZnPINcrTSLlBHopy4Bhsd08+Nc3JJNusfe8yH9hOh0qNDsi
 5u6D0VcWov+bT/RZT2rS0Fj1haEm/WVsnds3cLJV3mj+uyrE05/whMH0WLtvasUXS5i1
 ekhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdHoeH+hZ0t51S2EuQPsB5HeY/0JCfhoxTNUbpkf+2E=;
 b=CPsd5xa+fzv3eZIjsmH6EOvcNC7Xd6617nsHHixBblOLrELe+w/mVjcin7NCIlmyDR
 Gw1juKK3q+1jd+8qUwfN4obFJxKSQSsDKnyLW/DpQ9hauQdkveicL5kHXYTec+mZP5+y
 UdRa6nLTsXg72UY+O5RuGRy8PqlaL2CrggS1Y2m5R2VjvLD3TY1xrEY0eA0B5TEJ3hEQ
 gqcHjZpjzbPy9skWQ4eqIkab/w+ThBFsnt/DUk4S8ETQFyhf9L52hrWBPJKY5l3VFwVB
 BG5ynEgJ41CXr3epjpxMlajoPlpoOmRCC7q3I9FIMofBkxyLkFCRq1wzWxY/iWs74Ra0
 f2iQ==
X-Gm-Message-State: AFqh2ko8dMb0xk8ntkddjtwjGABVeN+5fLtURQQz1L+9TuFrtSAiygff
 UgoaIeyookSk2GjXPcCHfX7fRg==
X-Google-Smtp-Source: AMrXdXtE7kZ6fmDjzr7ktyC/V62m5EKKHyaGI3BuJ3qLC32xs1VMRPmbrHwXH5u8gjU9GcwyEMZyzw==
X-Received: by 2002:a17:902:7d93:b0:186:644f:bef1 with SMTP id
 a19-20020a1709027d9300b00186644fbef1mr65128014plm.6.1673145477997; 
 Sat, 07 Jan 2023 18:37:57 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 33/36] target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
Date: Sat,  7 Jan 2023 18:37:16 -0800
Message-Id: <20230108023719.2466341-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:39:03 -0000

This case is trivial to implement inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 0dafa27dab..b8cb21c395 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -625,6 +625,9 @@ static void gen_op_calc_cc(DisasContext *s)
         /* env->cc_op already is the cc value */
         break;
     case CC_OP_NZ:
+        tcg_gen_setcondi_i64(TCG_COND_NE, cc_dst, cc_dst, 0);
+        tcg_gen_extrl_i64_i32(cc_op, cc_dst);
+        break;
     case CC_OP_ABS_64:
     case CC_OP_NABS_64:
     case CC_OP_ABS_32:
-- 
2.34.1


