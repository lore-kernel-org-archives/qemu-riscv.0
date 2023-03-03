Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zF-00086M-I0
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zD-000853-PO
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:55 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zC-0007yS-8D
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:55 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so1937758plw.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832912;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRW11J/J45CAJ0uTYQ2YvgkRQZQK3nFD6G/IjMnU3Tg=;
 b=c6gVhheHWLm/RKENoG/nXrH59Vg0xamP9DsDMygzFBkYSYrbSaLyEItECxC/ToQ99p
 wcJ9KHzrJGUKTOp6Qq6/cX4TqLr0516tYFmwkKzQzymtG08fUzNbHFianRye8WJceYXv
 sMhnRq1EturNCbpY/7tFrzmBt4iIMfnAtd9ZB+S/wgSnv9oF71ojynDMH9nfGI8M44Ei
 GdB+IfOOugv1X0h2t8FO112cuhw4oSI/z60lUb0+s2662lTnxNFAEITG/Bz0sjl1NqZp
 TTxR7NfW0oB9pv/QtIxF9PIzgW7niENRGjcQ8OCh8Dpc81xyepfPBoTBMV5kKSgch+Qw
 FTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832912;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRW11J/J45CAJ0uTYQ2YvgkRQZQK3nFD6G/IjMnU3Tg=;
 b=s0VvhdraW2L0f8gvQDGmjX+jHaOXcK0F6JyHvOYF8tdh9zxEPI0AchV0+HGxURMb19
 buRGhgI/sIBqpDL9gGP3Mm1ULOIK8gJ6aVJuXJ+svmnAr+O352P/QJzCdKE/8u/yhjGO
 +UU7rnBX/5dXJzuFlW8bqlTT12VvwDalXMvgjf4rBxquANR2EznpPGwPLr+WCYT4L5aQ
 AJkJlOsBsxzJs2pBc+3MWpVUJLTK+Vp+en/RWndQxbq8m6u0ODnwm6SlRjd34Du1+eFn
 4+xTDAFneDdifYgJ4kv/nnnKgDy7X8AOFEpw1dJQe7c04+rKh06K4J9t6suGj7d0afMM
 MdTQ==
X-Gm-Message-State: AO0yUKVp/MHH+TYEcNQ9HfbqvR8g2iP1QMc8bf9aBwdCeVoqux4idOs/
 9cQdFfryiChJuzbwGUFUC+ZqnAujGFkdAxtI
X-Google-Smtp-Source: AK7set8NALu8qq8g53l2mJG9wcKMSpf1y8LAtZgaeVo9siV3cyrKK531NEG3Qh9hvGoGYtmPnDSOWQ==
X-Received: by 2002:a17:90b:1d0e:b0:234:d42:163e with SMTP id
 on14-20020a17090b1d0e00b002340d42163emr901180pjb.28.1677832912623; 
 Fri, 03 Mar 2023 00:41:52 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170902f54400b0019a6cce205bsm972175plf.154.2023.03.03.00.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:52 -0800 (PST)
Subject: [PULL 25/59] target/riscv: gdbstub: Check priv spec version before
 reporting CSR
Date: Fri,  3 Mar 2023 00:37:06 -0800
Message-Id: <20230303083740.12817-26-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:56 -0000

From: Bin Meng <bmeng@tinylab.org>

The gdbstub CSR XML is dynamically generated according to the result
of the CSR predicate() result. This has been working fine until
commit 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
introduced the privilege spec version check in riscv_csrrw_check().

When debugging the 'sifive_u' machine whose priv spec is at 1.10,
gdbstub reports priv spec 1.12 CSRs like menvcfg in the XML, hence
we see "remote failure reply 'E14'" message when examining all CSRs
via "info register system" from gdb.

Add the priv spec version check in the CSR XML generation logic to
fix this issue.

Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-2-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/gdbstub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 6e7bbdbd5e..e57372db38 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -290,6 +290,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
+        if (env->priv_ver < csr_ops[i].min_priv_ver) {
+            continue;
+        }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
             if (csr_ops[i].name) {
-- 
2.39.2


