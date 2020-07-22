Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAxm-00009y-T8
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxl-00004q-5I
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:57 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAxj-0006HQ-Gm
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:56 -0400
Received: by mail-pg1-x535.google.com with SMTP id s189so862471pgc.13
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GIJ/UPBp2WO1BlyJ6/1RakPZrL4gW2QpybA3d/fh+SA=;
 b=TbbuQQtXZYu2JpdFy8Tdk7LxbOGQyLrthVVvl0wL1MDdvLcXnf3uS2TKeJ0Q7bq+Zw
 gsLKn/nZC0HA+012QiJ3HEhgYGrTPw1lUo2MM+25qpzxpKK3DOv00HRWA2w+1HMtcIgO
 eSD9SIWanyGhOF6gKUAGYgcAiEMwCoBUot1MpNLI/fIUh/omnsd3Hay5NNXw5atdbMQC
 Zp3hrOfevwPqU3dSmiGaeudf6LMN6hy9fm8f4hl8imlwWIDTp94mZ/xAztDhJD2rdH4s
 0U5S8GDvYxrQ+sCXNSgStr24wDKE+4XGjE2K3kAGgquuasVC05vh03Q+qnSBE/Bmo+PJ
 wXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GIJ/UPBp2WO1BlyJ6/1RakPZrL4gW2QpybA3d/fh+SA=;
 b=aSNTKRU+9hAVCve+TVO4hjhItkulsjxtunZGkG3L25JNwuxgC0MNrwW1ca5KF0mate
 rfeyvG8kcmvdsvYtuoreDb/DhTfgcmkU16WMaxXix/1eD32fLAOX7RvyRJg6422s6SjS
 4LG0sn9OQCfSYipqfX8y0j4+Dakbt3KNT6G/MyLFBZjdueX6+8pizAUgmwEsyAjhSQnE
 Aj+EyP5n+85FGWF/Tq/WYi+pVzGA7pyidgLMNxZcptb9Y1JHMMYrFmSNlFCzw4Li/dn/
 x0uemAt0pnU/xnGiBX/GRYHDk2yqAtrkaNk61Ey4TIg5LrmZhmEKDDuQvr/tfqE7l7wt
 ZL1g==
X-Gm-Message-State: AOAM531ZLRgNGRviwe5XXSRxPEph4YuBYdA8AGmY2Tmyqj9FV8sBBLGM
 4ZlL1CKCc+KSPsctHJCa52egFMlPH0M=
X-Google-Smtp-Source: ABdhPJyHbDRWFvF6iQV+zWgVF8l6wJO3Q5vFAKDFGHWF6yMpzrPehgMV82I6RSBAaCJ0Ht7gF/Nt/w==
X-Received: by 2002:a65:43c1:: with SMTP id n1mr25240703pgp.67.1595409774369; 
 Wed, 22 Jul 2020 02:22:54 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:54 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC v2 76/76] target/riscv: gdb: support vector registers for rv32
Date: Wed, 22 Jul 2020 17:16:39 +0800
Message-Id: <20200722091641.8834-77-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:57 -0000

From: Greentime Hu <greentime.hu@sifive.com>

This patch adds vector support for rv32 gdb. It allows gdb client to access
vector registers correctly.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8d69013a97..dbe3c4e4c5 100755
--- a/configure
+++ b/configure
@@ -8222,7 +8222,7 @@ case "$target_name" in
     TARGET_BASE_ARCH=riscv
     TARGET_ABI_DIR=riscv
     mttcg=yes
-    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit-fpu.xml riscv-32bit-csr.xml riscv-32bit-virtual.xml"
+    gdb_xml_files="riscv-32bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit-fpu.xml riscv-64bit-vector-128b.xml riscv-64bit-vector-256b.xml riscv-64bit-vector-512b.xml riscv-32bit-csr.xml riscv-32bit-virtual.xml"
   ;;
   riscv64)
     TARGET_BASE_ARCH=riscv
-- 
2.17.1


