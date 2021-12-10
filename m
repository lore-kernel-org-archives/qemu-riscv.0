Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvane-0005SX-Mz
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanW-00056r-1C
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:30 -0500
Received: from [2607:f8b0:4864:20::530] (port=46047
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanO-0006mK-Cx
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:29 -0500
Received: by mail-pg1-x530.google.com with SMTP id 133so7359993pgc.12
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7RjgWQRkK/L/sP8GA5QTbp8AmM8hllrmgkIJJiQNWx4=;
 b=NCbgZbNhVKfV46ivZq8I8mltSmwvgRR2TbFAVC0uoel9kDMP65REK4Rp+IZevadsx1
 w+RkkRBSFJ3swKzfkI8YXgnZgwb36nKwI0TBOKp02o+e/9iM/CS1n4F1Jdb9VxakpA01
 KlUvIb/hn1zGEsckFaBXvunsqGUGc2r5uxhMDYlroSF+FaSL1b/1PIoA5BTyyPYsHzLK
 TfkCr/V20S2VOz2flQWR1QDCvGGv8APnWpJPqIw0N7/Bmg5MA6cGlFdu/X30CUg8WBqa
 B3QqahMQCGyeGaHAyZUMWdZF9BICVGNbFVQXVXUvP3JKF7YonFdaCCDRKLZ9PqOaiDdY
 3wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7RjgWQRkK/L/sP8GA5QTbp8AmM8hllrmgkIJJiQNWx4=;
 b=6ruYzfaeK2YZmedsexpt8zdFZCmI8GfGZR6EjtCwijQ141PTYNdqDzYFr6Ux/Y0Z0C
 jh4lE7FoPeleu/O96iCar2ie39n0i05A83ehXvHqmCJxPGcBwzWMmeIGNlCPFBo+qbpl
 wwVvxdlsZhYUDblWgaPNgVKERiBO3pPiiC+AiDLhCczNKXDr1wnIKEA3BhlrQhufTZ+9
 OJbnGeYSIEkfn8iS7BVSmAig4dOvbDbyfmQ1XqrU6WmnPDDJDPMjI0qePAlA0AcgYt1Q
 NIT0ZkCcma5SXtZt77ZsvkGjUDhAZhDriufCPZdN2aapwF1aA9VFRyjs9Nf/Dm+LIkx/
 2Lag==
X-Gm-Message-State: AOAM532h86mXvghVClag5icUVgvnjAWa3zRWkteCoHG0i06otXkpS8fe
 OUojUdSAhJ5h/Nvblxa/d2ZbPg==
X-Google-Smtp-Source: ABdhPJxcXxMo2wTVKRa8fEteCpa2JVhPEdVuwY4P1WZm2irXeOtCD0HIeN6dNUl/fsRwX7sYgporsg==
X-Received: by 2002:a05:6a00:cc4:b0:4a0:e97:fe97 with SMTP id
 b4-20020a056a000cc400b004a00e97fe97mr16752288pfv.74.1639123100332; 
 Thu, 09 Dec 2021 23:58:20 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:20 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 20/77] target/riscv: rvv-1.0: stride load and store
 instructions
Date: Fri, 10 Dec 2021 15:56:06 +0800
Message-Id: <20211210075704.23951-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:32 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 129 ++------
 target/riscv/insn32.decode              |  43 ++-
 target/riscv/insn_trans/trans_rvv.c.inc | 376 ++++++++++++------------
 target/riscv/vector_helper.c            | 199 +++++--------
 4 files changed, 300 insertions(+), 447 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ecb6af6cd9..5a760fa4a3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -112,111 +112,30 @@ DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
 
 /* Vector functions */
 DEF_HELPER_3(vsetvl, tl, env, tl, tl)
-DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlb_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlh_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlw_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vle_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlbu_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlhu_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vlwu_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsb_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsh_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vsw_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_b, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_b_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_h, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_h_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_w, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_w_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_d, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_5(vse_v_d_mask, void, ptr, ptr, tl, env, i32)
-DEF_HELPER_6(vlsb_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsb_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsb_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsb_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsh_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsh_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsh_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsw_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsw_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlse_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlsbu_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlshu_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlshu_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlshu_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlswu_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vlswu_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssb_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssh_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssh_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssh_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssw_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vssw_v_d, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_b, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_h, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_w, void, ptr, ptr, tl, tl, env, i32)
-DEF_HELPER_6(vsse_v_d, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_5(vle8_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle16_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle32_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle64_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle8_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle16_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle32_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vle64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse8_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse16_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse32_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse64_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vlse64_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse16_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse32_v, void, ptr, ptr, tl, tl, env, i32)
+DEF_HELPER_6(vsse64_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vlxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vlxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3d57255fff..2d8f0cbe7c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -294,13 +294,26 @@ hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 
 # *** Vector loads and stores are encoded within LOADFP/STORE-FP ***
-vlb_v      ... 100 . 00000 ..... 000 ..... 0000111 @r2_nfvm
-vlh_v      ... 100 . 00000 ..... 101 ..... 0000111 @r2_nfvm
-vlw_v      ... 100 . 00000 ..... 110 ..... 0000111 @r2_nfvm
-vle_v      ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
-vlbu_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
-vlhu_v     ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
-vlwu_v     ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
+# Vector unit-stride load/store insns.
+vle8_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
+vle16_v    ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
+vle32_v    ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
+vle64_v    ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
+vse8_v     ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
+vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
+vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
+vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
+
+# Vector strided insns.
+vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
+vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
+vlse32_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
+vlse64_v    ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
+vsse8_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
+vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
+vsse32_v    ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
+vsse64_v    ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
+
 vlbff_v    ... 100 . 10000 ..... 000 ..... 0000111 @r2_nfvm
 vlhff_v    ... 100 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vlwff_v    ... 100 . 10000 ..... 110 ..... 0000111 @r2_nfvm
@@ -308,22 +321,6 @@ vleff_v    ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
 vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
 vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
 vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
-vsb_v      ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
-vsh_v      ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
-vsw_v      ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
-vse_v      ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
-
-vlsb_v     ... 110 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlsh_v     ... 110 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlsw_v     ... 110 . ..... ..... 110 ..... 0000111 @r_nfvm
-vlse_v     ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
-vlsbu_v    ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
-vlshu_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
-vlswu_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
-vssb_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
-vssh_v     ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
-vssw_v     ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
-vsse_v     ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
 
 vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 049688d83a..8a4f75f724 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -73,6 +73,12 @@ static bool require_vm(int vm, int vd)
     return (vm != 0 || vd != 0);
 }
 
+static bool require_nf(int vd, int nf, int lmul)
+{
+    int size = nf << MAX(lmul, 0);
+    return size <= 8 && vd + size <= 32;
+}
+
 /*
  * Vector register should aligned with the passed-in LMUL (EMUL).
  * If LMUL < 0, i.e. fractional LMUL, any vector register is allowed.
@@ -175,6 +181,115 @@ static uint32_t vreg_ofs(DisasContext *s, int reg)
 
 /* check functions */
 
+/*
+ * Vector unit-stride, strided, unit-stride segment, strided segment
+ * store check function.
+ *
+ * Rules to be checked here:
+ *   1. EMUL must within the range: 1/8 <= EMUL <= 8. (Section 7.3)
+ *   2. Destination vector register number is multiples of EMUL.
+ *      (Section 3.4.2, 7.3)
+ *   3. The EMUL setting must be such that EMUL * NFIELDS ≤ 8. (Section 7.8)
+ *   4. Vector register numbers accessed by the segment load or store
+ *      cannot increment past 31. (Section 7.8)
+ */
+static bool vext_check_store(DisasContext *s, int vd, int nf, uint8_t eew)
+{
+    int8_t emul = eew - s->sew + s->lmul;
+    return (emul >= -3 && emul <= 3) &&
+            require_align(vd, emul) &&
+            require_nf(vd, nf, emul);
+}
+
+/*
+ * Vector unit-stride, strided, unit-stride segment, strided segment
+ * load check function.
+ *
+ * Rules to be checked here:
+ *   1. All rules applies to store instructions are applies
+ *      to load instructions.
+ *   2. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_check_load(DisasContext *s, int vd, int nf, int vm,
+                            uint8_t eew)
+{
+    return vext_check_store(s, vd, nf, eew) && require_vm(vm, vd);
+}
+
+/*
+ * Vector indexed, indexed segment store check function.
+ *
+ * Rules to be checked here:
+ *   1. EMUL must within the range: 1/8 <= EMUL <= 8. (Section 7.3)
+ *   2. Index vector register number is multiples of EMUL.
+ *      (Section 3.4.2, 7.3)
+ *   3. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2, 7.3)
+ *   4. The EMUL setting must be such that EMUL * NFIELDS ≤ 8. (Section 7.8)
+ *   5. Vector register numbers accessed by the segment load or store
+ *      cannot increment past 31. (Section 7.8)
+ */
+static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
+                                uint8_t eew)
+{
+    int8_t emul = eew - s->sew + s->lmul;
+    return (emul >= -3 && emul <= 3) &&
+            require_align(vs2, emul) &&
+            require_align(vd, s->lmul) &&
+            require_nf(vd, nf, s->lmul);
+}
+
+/*
+ * Vector indexed, indexed segment load check function.
+ *
+ * Rules to be checked here:
+ *   1. All rules applies to store instructions are applies
+ *      to load instructions.
+ *   2. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   3. Destination vector register cannot overlap a source vector
+ *      register (vs2) group.
+ *      (Section 5.2)
+ *   4. Destination vector register groups cannot overlap
+ *      the source vector register (vs2) group for
+ *      indexed segment load instructions. (Section 7.8.3)
+ */
+static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
+                                int nf, int vm, uint8_t eew)
+{
+    int8_t seg_vd;
+    int8_t emul = eew - s->sew + s->lmul;
+    bool ret = vext_check_st_index(s, vd, vs2, nf, eew) &&
+        require_vm(vm, vd);
+
+    /* Each segment register group has to follow overlap rules. */
+    for (int i = 0; i < nf; ++i) {
+        seg_vd = vd + (1 << MAX(s->lmul, 0)) * i;
+
+        if (eew > s->sew) {
+            if (seg_vd != vs2) {
+                ret &= require_noover(seg_vd, s->lmul, vs2, emul);
+            }
+        } else if (eew < s->sew) {
+            ret &= require_noover(seg_vd, s->lmul, vs2, emul);
+        }
+
+        /*
+         * Destination vector register groups cannot overlap
+         * the source vector register (vs2) group for
+         * indexed segment load instructions.
+         */
+        if (nf > 1) {
+            ret &= !is_overlapped(seg_vd, 1 << MAX(s->lmul, 0),
+                                  vs2, 1 << MAX(emul, 0));
+        }
+    }
+    return ret;
+}
+
 static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
 {
     return require_vm(vm, vd) &&
@@ -415,63 +530,14 @@ static bool vext_check_isa_ill(DisasContext *s)
     return !s->vill;
 }
 
-/*
- * There are two rules check here.
- *
- * 1. Vector register numbers are multiples of LMUL. (Section 3.2)
- *
- * 2. For all widening instructions, the destination LMUL value must also be
- *    a supported LMUL value. (Section 11.2)
- */
-static bool vext_check_reg(DisasContext *s, uint32_t reg, bool widen)
-{
-    /*
-     * The destination vector register group results are arranged as if both
-     * SEW and LMUL were at twice their current settings. (Section 11.2).
-     */
-    int legal = widen ? 2 << s->lmul : 1 << s->lmul;
-
-    return !((s->lmul == 0x3 && widen) || (reg % legal));
-}
-
-/*
- * There are two rules check here.
- *
- * 1. The destination vector register group for a masked vector instruction can
- *    only overlap the source mask register (v0) when LMUL=1. (Section 5.3)
- *
- * 2. In widen instructions and some other insturctions, like vslideup.vx,
- *    there is no need to check whether LMUL=1.
- */
-static bool vext_check_overlap_mask(DisasContext *s, uint32_t vd, bool vm,
-    bool force)
-{
-    return (vm != 0 || vd != 0) || (!force && (s->lmul == 0));
-}
-
-/* The LMUL setting must be such that LMUL * NFIELDS <= 8. (Section 7.8) */
-static bool vext_check_nf(DisasContext *s, uint32_t nf)
-{
-    return (1 << s->lmul) * nf <= 8;
-}
-
-/*
- * The destination vector register group cannot overlap a source vector register
- * group of a different element width. (Section 11.2)
- */
-static inline bool vext_check_overlap_group(int rd, int dlen, int rs, int slen)
-{
-    return ((rd >= rs + slen) || (rs >= rd + dlen));
-}
-
 /* common translation macro */
-#define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
-static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
-{                                                          \
-    if (CHECK(s, a)) {                                     \
-        return OP(s, a, SEQ);                              \
-    }                                                      \
-    return false;                                          \
+#define GEN_VEXT_TRANS(NAME, EEW, ARGTYPE, OP, CHECK)        \
+static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
+{                                                            \
+    if (CHECK(s, a, EEW)) {                                  \
+        return OP(s, a, EEW);                                \
+    }                                                        \
+    return false;                                            \
 }
 
 /*
@@ -520,44 +586,20 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     return true;
 }
 
-static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
+static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
 {
     uint32_t data = 0;
     gen_helper_ldst_us *fn;
-    static gen_helper_ldst_us * const fns[2][7][4] = {
+    static gen_helper_ldst_us * const fns[2][4] = {
         /* masked unit stride load */
-        { { gen_helper_vlb_v_b_mask,  gen_helper_vlb_v_h_mask,
-            gen_helper_vlb_v_w_mask,  gen_helper_vlb_v_d_mask },
-          { NULL,                     gen_helper_vlh_v_h_mask,
-            gen_helper_vlh_v_w_mask,  gen_helper_vlh_v_d_mask },
-          { NULL,                     NULL,
-            gen_helper_vlw_v_w_mask,  gen_helper_vlw_v_d_mask },
-          { gen_helper_vle_v_b_mask,  gen_helper_vle_v_h_mask,
-            gen_helper_vle_v_w_mask,  gen_helper_vle_v_d_mask },
-          { gen_helper_vlbu_v_b_mask, gen_helper_vlbu_v_h_mask,
-            gen_helper_vlbu_v_w_mask, gen_helper_vlbu_v_d_mask },
-          { NULL,                     gen_helper_vlhu_v_h_mask,
-            gen_helper_vlhu_v_w_mask, gen_helper_vlhu_v_d_mask },
-          { NULL,                     NULL,
-            gen_helper_vlwu_v_w_mask, gen_helper_vlwu_v_d_mask } },
+        { gen_helper_vle8_v_mask, gen_helper_vle16_v_mask,
+          gen_helper_vle32_v_mask, gen_helper_vle64_v_mask },
         /* unmasked unit stride load */
-        { { gen_helper_vlb_v_b,  gen_helper_vlb_v_h,
-            gen_helper_vlb_v_w,  gen_helper_vlb_v_d },
-          { NULL,                gen_helper_vlh_v_h,
-            gen_helper_vlh_v_w,  gen_helper_vlh_v_d },
-          { NULL,                NULL,
-            gen_helper_vlw_v_w,  gen_helper_vlw_v_d },
-          { gen_helper_vle_v_b,  gen_helper_vle_v_h,
-            gen_helper_vle_v_w,  gen_helper_vle_v_d },
-          { gen_helper_vlbu_v_b, gen_helper_vlbu_v_h,
-            gen_helper_vlbu_v_w, gen_helper_vlbu_v_d },
-          { NULL,                gen_helper_vlhu_v_h,
-            gen_helper_vlhu_v_w, gen_helper_vlhu_v_d },
-          { NULL,                NULL,
-            gen_helper_vlwu_v_w, gen_helper_vlwu_v_d } }
+        { gen_helper_vle8_v, gen_helper_vle16_v,
+          gen_helper_vle32_v, gen_helper_vle64_v }
     };
 
-    fn =  fns[a->vm][seq][s->sew];
+    fn =  fns[a->vm][eew];
     if (fn == NULL) {
         return false;
     }
@@ -568,48 +610,32 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
 
-static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
+static bool ld_us_check(DisasContext *s, arg_r2nfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_load(s, a->rd, a->nf, a->vm, eew);
 }
 
-GEN_VEXT_TRANS(vlb_v, 0, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlh_v, 1, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlw_v, 2, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vle_v, 3, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlbu_v, 4, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlhu_v, 5, r2nfvm, ld_us_op, ld_us_check)
-GEN_VEXT_TRANS(vlwu_v, 6, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle8_v,  MO_8,  r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle16_v, MO_16, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle32_v, MO_32, r2nfvm, ld_us_op, ld_us_check)
+GEN_VEXT_TRANS(vle64_v, MO_64, r2nfvm, ld_us_op, ld_us_check)
 
-static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
+static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
 {
     uint32_t data = 0;
     gen_helper_ldst_us *fn;
-    static gen_helper_ldst_us * const fns[2][4][4] = {
-        /* masked unit stride load and store */
-        { { gen_helper_vsb_v_b_mask,  gen_helper_vsb_v_h_mask,
-            gen_helper_vsb_v_w_mask,  gen_helper_vsb_v_d_mask },
-          { NULL,                     gen_helper_vsh_v_h_mask,
-            gen_helper_vsh_v_w_mask,  gen_helper_vsh_v_d_mask },
-          { NULL,                     NULL,
-            gen_helper_vsw_v_w_mask,  gen_helper_vsw_v_d_mask },
-          { gen_helper_vse_v_b_mask,  gen_helper_vse_v_h_mask,
-            gen_helper_vse_v_w_mask,  gen_helper_vse_v_d_mask } },
+    static gen_helper_ldst_us * const fns[2][4] = {
+        /* masked unit stride store */
+        { gen_helper_vse8_v_mask, gen_helper_vse16_v_mask,
+          gen_helper_vse32_v_mask, gen_helper_vse64_v_mask },
         /* unmasked unit stride store */
-        { { gen_helper_vsb_v_b,  gen_helper_vsb_v_h,
-            gen_helper_vsb_v_w,  gen_helper_vsb_v_d },
-          { NULL,                gen_helper_vsh_v_h,
-            gen_helper_vsh_v_w,  gen_helper_vsh_v_d },
-          { NULL,                NULL,
-            gen_helper_vsw_v_w,  gen_helper_vsw_v_d },
-          { gen_helper_vse_v_b,  gen_helper_vse_v_h,
-            gen_helper_vse_v_w,  gen_helper_vse_v_d } }
+        { gen_helper_vse8_v, gen_helper_vse16_v,
+          gen_helper_vse32_v, gen_helper_vse64_v }
     };
 
-    fn =  fns[a->vm][seq][s->sew];
+    fn =  fns[a->vm][eew];
     if (fn == NULL) {
         return false;
     }
@@ -620,17 +646,17 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
 
-static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
+static bool st_us_check(DisasContext *s, arg_r2nfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_store(s, a->rd, a->nf, eew);
 }
 
-GEN_VEXT_TRANS(vsb_v, 0, r2nfvm, st_us_op, st_us_check)
-GEN_VEXT_TRANS(vsh_v, 1, r2nfvm, st_us_op, st_us_check)
-GEN_VEXT_TRANS(vsw_v, 2, r2nfvm, st_us_op, st_us_check)
-GEN_VEXT_TRANS(vse_v, 3, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse8_v,  MO_8,  r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
+GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
 
 /*
  *** stride load and store
@@ -671,28 +697,16 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     return true;
 }
 
-static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
+static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 {
     uint32_t data = 0;
     gen_helper_ldst_stride *fn;
-    static gen_helper_ldst_stride * const fns[7][4] = {
-        { gen_helper_vlsb_v_b,  gen_helper_vlsb_v_h,
-          gen_helper_vlsb_v_w,  gen_helper_vlsb_v_d },
-        { NULL,                 gen_helper_vlsh_v_h,
-          gen_helper_vlsh_v_w,  gen_helper_vlsh_v_d },
-        { NULL,                 NULL,
-          gen_helper_vlsw_v_w,  gen_helper_vlsw_v_d },
-        { gen_helper_vlse_v_b,  gen_helper_vlse_v_h,
-          gen_helper_vlse_v_w,  gen_helper_vlse_v_d },
-        { gen_helper_vlsbu_v_b, gen_helper_vlsbu_v_h,
-          gen_helper_vlsbu_v_w, gen_helper_vlsbu_v_d },
-        { NULL,                 gen_helper_vlshu_v_h,
-          gen_helper_vlshu_v_w, gen_helper_vlshu_v_d },
-        { NULL,                 NULL,
-          gen_helper_vlswu_v_w, gen_helper_vlswu_v_d },
+    static gen_helper_ldst_stride * const fns[4] = {
+        gen_helper_vlse8_v, gen_helper_vlse16_v,
+        gen_helper_vlse32_v, gen_helper_vlse64_v
     };
 
-    fn =  fns[seq][s->sew];
+    fn = fns[eew];
     if (fn == NULL) {
         return false;
     }
@@ -703,42 +717,32 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
-static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
+static bool ld_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_load(s, a->rd, a->nf, a->vm, eew);
 }
 
-GEN_VEXT_TRANS(vlsb_v, 0, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlsh_v, 1, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlsw_v, 2, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlse_v, 3, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlsbu_v, 4, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlshu_v, 5, rnfvm, ld_stride_op, ld_stride_check)
-GEN_VEXT_TRANS(vlswu_v, 6, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse8_v,  MO_8,  rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse16_v, MO_16, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse32_v, MO_32, rnfvm, ld_stride_op, ld_stride_check)
+GEN_VEXT_TRANS(vlse64_v, MO_64, rnfvm, ld_stride_op, ld_stride_check)
 
-static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
+static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
 {
     uint32_t data = 0;
     gen_helper_ldst_stride *fn;
-    static gen_helper_ldst_stride * const fns[4][4] = {
+    static gen_helper_ldst_stride * const fns[4] = {
         /* masked stride store */
-        { gen_helper_vssb_v_b,  gen_helper_vssb_v_h,
-          gen_helper_vssb_v_w,  gen_helper_vssb_v_d },
-        { NULL,                 gen_helper_vssh_v_h,
-          gen_helper_vssh_v_w,  gen_helper_vssh_v_d },
-        { NULL,                 NULL,
-          gen_helper_vssw_v_w,  gen_helper_vssw_v_d },
-        { gen_helper_vsse_v_b,  gen_helper_vsse_v_h,
-          gen_helper_vsse_v_w,  gen_helper_vsse_v_d }
+        gen_helper_vsse8_v,  gen_helper_vsse16_v,
+        gen_helper_vsse32_v,  gen_helper_vsse64_v
     };
 
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
-    fn =  fns[seq][s->sew];
+    fn = fns[eew];
     if (fn == NULL) {
         return false;
     }
@@ -746,17 +750,17 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
 
-static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
+static bool st_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_store(s, a->rd, a->nf, eew);
 }
 
-GEN_VEXT_TRANS(vssb_v, 0, rnfvm, st_stride_op, st_stride_check)
-GEN_VEXT_TRANS(vssh_v, 1, rnfvm, st_stride_op, st_stride_check)
-GEN_VEXT_TRANS(vssw_v, 2, rnfvm, st_stride_op, st_stride_check)
-GEN_VEXT_TRANS(vsse_v, 3, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse8_v,  MO_8,  rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse16_v, MO_16, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse32_v, MO_32, rnfvm, st_stride_op, st_stride_check)
+GEN_VEXT_TRANS(vsse64_v, MO_64, rnfvm, st_stride_op, st_stride_check)
 
 /*
  *** index load and store
@@ -836,16 +840,11 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
  * groups cannot overlap the source vector register group (specified by
  * `vs2`), else an illegal instruction exception is raised.
  */
-static bool ld_index_check(DisasContext *s, arg_rnfvm* a)
+static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_nf(s, a->nf) &&
-            ((a->nf == 1) ||
-             vext_check_overlap_group(a->rd, a->nf << s->lmul,
-                                      a->rs2, 1 << s->lmul)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew);
 }
 
 GEN_VEXT_TRANS(vlxb_v, 0, rnfvm, ld_index_op, ld_index_check)
@@ -882,12 +881,11 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
 
-static bool st_index_check(DisasContext *s, arg_rnfvm* a)
+static bool st_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_nf(s, a->nf));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew);
 }
 
 GEN_VEXT_TRANS(vsxb_v, 0, rnfvm, st_index_op, st_index_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 78fae78284..9141292994 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -178,38 +178,36 @@ static inline int vext_elem_mask(void *v0, int index)
 typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
                                uint32_t idx, void *vd, uintptr_t retaddr);
 
-#define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)     \
+#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
                  uint32_t idx, void *vd, uintptr_t retaddr)\
 {                                                          \
-    MTYPE data;                                            \
     ETYPE *cur = ((ETYPE *)vd + H(idx));                   \
-    data = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
-    *cur = data;                                           \
+    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
 }                                                          \
 
-GEN_VEXT_LD_ELEM(ldb_b, int8_t,  int8_t,  H1, ldsb)
-GEN_VEXT_LD_ELEM(ldb_h, int8_t,  int16_t, H2, ldsb)
-GEN_VEXT_LD_ELEM(ldb_w, int8_t,  int32_t, H4, ldsb)
-GEN_VEXT_LD_ELEM(ldb_d, int8_t,  int64_t, H8, ldsb)
-GEN_VEXT_LD_ELEM(ldh_h, int16_t, int16_t, H2, ldsw)
-GEN_VEXT_LD_ELEM(ldh_w, int16_t, int32_t, H4, ldsw)
-GEN_VEXT_LD_ELEM(ldh_d, int16_t, int64_t, H8, ldsw)
-GEN_VEXT_LD_ELEM(ldw_w, int32_t, int32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldw_d, int32_t, int64_t, H8, ldl)
-GEN_VEXT_LD_ELEM(lde_b, int8_t,  int8_t,  H1, ldsb)
-GEN_VEXT_LD_ELEM(lde_h, int16_t, int16_t, H2, ldsw)
-GEN_VEXT_LD_ELEM(lde_w, int32_t, int32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(lde_d, int64_t, int64_t, H8, ldq)
-GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  uint8_t,  H1, ldub)
-GEN_VEXT_LD_ELEM(ldbu_h, uint8_t,  uint16_t, H2, ldub)
-GEN_VEXT_LD_ELEM(ldbu_w, uint8_t,  uint32_t, H4, ldub)
-GEN_VEXT_LD_ELEM(ldbu_d, uint8_t,  uint64_t, H8, ldub)
-GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, uint16_t, H2, lduw)
-GEN_VEXT_LD_ELEM(ldhu_w, uint16_t, uint32_t, H4, lduw)
-GEN_VEXT_LD_ELEM(ldhu_d, uint16_t, uint64_t, H8, lduw)
-GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, uint32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(ldwu_d, uint32_t, uint64_t, H8, ldl)
+GEN_VEXT_LD_ELEM(ldb_b, int8_t,  H1, ldsb)
+GEN_VEXT_LD_ELEM(ldb_h, int16_t, H2, ldsb)
+GEN_VEXT_LD_ELEM(ldb_w, int32_t, H4, ldsb)
+GEN_VEXT_LD_ELEM(ldb_d, int64_t, H8, ldsb)
+GEN_VEXT_LD_ELEM(ldh_h, int16_t, H2, ldsw)
+GEN_VEXT_LD_ELEM(ldh_w, int32_t, H4, ldsw)
+GEN_VEXT_LD_ELEM(ldh_d, int64_t, H8, ldsw)
+GEN_VEXT_LD_ELEM(ldw_w, int32_t, H4, ldl)
+GEN_VEXT_LD_ELEM(ldw_d, int64_t, H8, ldl)
+GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
+GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
+GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
+GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
+GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  H1, ldub)
+GEN_VEXT_LD_ELEM(ldbu_h, uint16_t, H2, ldub)
+GEN_VEXT_LD_ELEM(ldbu_w, uint32_t, H4, ldub)
+GEN_VEXT_LD_ELEM(ldbu_d, uint64_t, H8, ldub)
+GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, H2, lduw)
+GEN_VEXT_LD_ELEM(ldhu_w, uint32_t, H4, lduw)
+GEN_VEXT_LD_ELEM(ldhu_d, uint64_t, H8, lduw)
+GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, H4, ldl)
+GEN_VEXT_LD_ELEM(ldwu_d, uint64_t, H8, ldl)
 
 #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
 static void NAME(CPURISCVState *env, abi_ptr addr,         \
@@ -241,8 +239,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
                  target_ulong stride, CPURISCVState *env,
                  uint32_t desc, uint32_t vm,
                  vext_ldst_elem_fn *ldst_elem,
-                 uint32_t esz, uint32_t msz, uintptr_t ra,
-                 MMUAccessType access_type)
+                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
@@ -253,7 +250,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        probe_pages(env, base + stride * i, nf * msz, ra, access_type);
+        probe_pages(env, base + stride * i, nf * esz, ra, access_type);
     }
     /* do real access */
     for (i = 0; i < env->vl; i++) {
@@ -262,71 +259,42 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
             continue;
         }
         while (k < nf) {
-            target_ulong addr = base + stride * i + k * msz;
+            target_ulong addr = base + stride * i + k * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
     }
 }
 
-#define GEN_VEXT_LD_STRIDE(NAME, MTYPE, ETYPE, LOAD_FN)                 \
+#define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
 void HELPER(NAME)(void *vd, void * v0, target_ulong base,               \
                   target_ulong stride, CPURISCVState *env,              \
                   uint32_t desc)                                        \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      \
-                     sizeof(ETYPE), sizeof(MTYPE),                      \
-                     GETPC(), MMU_DATA_LOAD);                           \
-}
-
-GEN_VEXT_LD_STRIDE(vlsb_v_b,  int8_t,   int8_t,   ldb_b)
-GEN_VEXT_LD_STRIDE(vlsb_v_h,  int8_t,   int16_t,  ldb_h)
-GEN_VEXT_LD_STRIDE(vlsb_v_w,  int8_t,   int32_t,  ldb_w)
-GEN_VEXT_LD_STRIDE(vlsb_v_d,  int8_t,   int64_t,  ldb_d)
-GEN_VEXT_LD_STRIDE(vlsh_v_h,  int16_t,  int16_t,  ldh_h)
-GEN_VEXT_LD_STRIDE(vlsh_v_w,  int16_t,  int32_t,  ldh_w)
-GEN_VEXT_LD_STRIDE(vlsh_v_d,  int16_t,  int64_t,  ldh_d)
-GEN_VEXT_LD_STRIDE(vlsw_v_w,  int32_t,  int32_t,  ldw_w)
-GEN_VEXT_LD_STRIDE(vlsw_v_d,  int32_t,  int64_t,  ldw_d)
-GEN_VEXT_LD_STRIDE(vlse_v_b,  int8_t,   int8_t,   lde_b)
-GEN_VEXT_LD_STRIDE(vlse_v_h,  int16_t,  int16_t,  lde_h)
-GEN_VEXT_LD_STRIDE(vlse_v_w,  int32_t,  int32_t,  lde_w)
-GEN_VEXT_LD_STRIDE(vlse_v_d,  int64_t,  int64_t,  lde_d)
-GEN_VEXT_LD_STRIDE(vlsbu_v_b, uint8_t,  uint8_t,  ldbu_b)
-GEN_VEXT_LD_STRIDE(vlsbu_v_h, uint8_t,  uint16_t, ldbu_h)
-GEN_VEXT_LD_STRIDE(vlsbu_v_w, uint8_t,  uint32_t, ldbu_w)
-GEN_VEXT_LD_STRIDE(vlsbu_v_d, uint8_t,  uint64_t, ldbu_d)
-GEN_VEXT_LD_STRIDE(vlshu_v_h, uint16_t, uint16_t, ldhu_h)
-GEN_VEXT_LD_STRIDE(vlshu_v_w, uint16_t, uint32_t, ldhu_w)
-GEN_VEXT_LD_STRIDE(vlshu_v_d, uint16_t, uint64_t, ldhu_d)
-GEN_VEXT_LD_STRIDE(vlswu_v_w, uint32_t, uint32_t, ldwu_w)
-GEN_VEXT_LD_STRIDE(vlswu_v_d, uint32_t, uint64_t, ldwu_d)
-
-#define GEN_VEXT_ST_STRIDE(NAME, MTYPE, ETYPE, STORE_FN)                \
+                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
+}
+
+GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_STRIDE(vlse16_v, int16_t, lde_h)
+GEN_VEXT_LD_STRIDE(vlse32_v, int32_t, lde_w)
+GEN_VEXT_LD_STRIDE(vlse64_v, int64_t, lde_d)
+
+#define GEN_VEXT_ST_STRIDE(NAME, ETYPE, STORE_FN)                       \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   target_ulong stride, CPURISCVState *env,              \
                   uint32_t desc)                                        \
 {                                                                       \
     uint32_t vm = vext_vm(desc);                                        \
     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     \
-                     sizeof(ETYPE), sizeof(MTYPE),                      \
-                     GETPC(), MMU_DATA_STORE);                          \
-}
-
-GEN_VEXT_ST_STRIDE(vssb_v_b, int8_t,  int8_t,  stb_b)
-GEN_VEXT_ST_STRIDE(vssb_v_h, int8_t,  int16_t, stb_h)
-GEN_VEXT_ST_STRIDE(vssb_v_w, int8_t,  int32_t, stb_w)
-GEN_VEXT_ST_STRIDE(vssb_v_d, int8_t,  int64_t, stb_d)
-GEN_VEXT_ST_STRIDE(vssh_v_h, int16_t, int16_t, sth_h)
-GEN_VEXT_ST_STRIDE(vssh_v_w, int16_t, int32_t, sth_w)
-GEN_VEXT_ST_STRIDE(vssh_v_d, int16_t, int64_t, sth_d)
-GEN_VEXT_ST_STRIDE(vssw_v_w, int32_t, int32_t, stw_w)
-GEN_VEXT_ST_STRIDE(vssw_v_d, int32_t, int64_t, stw_d)
-GEN_VEXT_ST_STRIDE(vsse_v_b, int8_t,  int8_t,  ste_b)
-GEN_VEXT_ST_STRIDE(vsse_v_h, int16_t, int16_t, ste_h)
-GEN_VEXT_ST_STRIDE(vsse_v_w, int32_t, int32_t, ste_w)
-GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
+                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
+}
+
+GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
+GEN_VEXT_ST_STRIDE(vsse16_v, int16_t, ste_h)
+GEN_VEXT_ST_STRIDE(vsse32_v, int32_t, ste_w)
+GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
 
 /*
  *** unit-stride: access elements stored contiguously in memory
@@ -335,20 +303,20 @@ GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
 /* unmasked unit-stride load and store operation*/
 static void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
-             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t msz,
-             uintptr_t ra, MMUAccessType access_type)
+             vext_ldst_elem_fn *ldst_elem,
+             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
 {
     uint32_t i, k;
     uint32_t nf = vext_nf(desc);
     uint32_t vlmax = vext_maxsz(desc) / esz;
 
     /* probe every access */
-    probe_pages(env, base, env->vl * nf * msz, ra, access_type);
+    probe_pages(env, base, env->vl * nf * esz, ra, access_type);
     /* load bytes from guest memory */
     for (i = 0; i < env->vl; i++) {
         k = 0;
         while (k < nf) {
-            target_ulong addr = base + (i * nf + k) * msz;
+            target_ulong addr = base + (i * nf + k) * esz;
             ldst_elem(env, addr, i + k * vlmax, vd, ra);
             k++;
         }
@@ -360,76 +328,47 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
  * stride = NF * sizeof (MTYPE)
  */
 
-#define GEN_VEXT_LD_US(NAME, MTYPE, ETYPE, LOAD_FN)                     \
+#define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            \
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
                          CPURISCVState *env, uint32_t desc)             \
 {                                                                       \
-    uint32_t stride = vext_nf(desc) * sizeof(MTYPE);                    \
+    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   \
-                     sizeof(ETYPE), sizeof(MTYPE),                      \
-                     GETPC(), MMU_DATA_LOAD);                           \
+                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            \
 }                                                                       \
                                                                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
-                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_LOAD); \
-}
-
-GEN_VEXT_LD_US(vlb_v_b,  int8_t,   int8_t,   ldb_b)
-GEN_VEXT_LD_US(vlb_v_h,  int8_t,   int16_t,  ldb_h)
-GEN_VEXT_LD_US(vlb_v_w,  int8_t,   int32_t,  ldb_w)
-GEN_VEXT_LD_US(vlb_v_d,  int8_t,   int64_t,  ldb_d)
-GEN_VEXT_LD_US(vlh_v_h,  int16_t,  int16_t,  ldh_h)
-GEN_VEXT_LD_US(vlh_v_w,  int16_t,  int32_t,  ldh_w)
-GEN_VEXT_LD_US(vlh_v_d,  int16_t,  int64_t,  ldh_d)
-GEN_VEXT_LD_US(vlw_v_w,  int32_t,  int32_t,  ldw_w)
-GEN_VEXT_LD_US(vlw_v_d,  int32_t,  int64_t,  ldw_d)
-GEN_VEXT_LD_US(vle_v_b,  int8_t,   int8_t,   lde_b)
-GEN_VEXT_LD_US(vle_v_h,  int16_t,  int16_t,  lde_h)
-GEN_VEXT_LD_US(vle_v_w,  int32_t,  int32_t,  lde_w)
-GEN_VEXT_LD_US(vle_v_d,  int64_t,  int64_t,  lde_d)
-GEN_VEXT_LD_US(vlbu_v_b, uint8_t,  uint8_t,  ldbu_b)
-GEN_VEXT_LD_US(vlbu_v_h, uint8_t,  uint16_t, ldbu_h)
-GEN_VEXT_LD_US(vlbu_v_w, uint8_t,  uint32_t, ldbu_w)
-GEN_VEXT_LD_US(vlbu_v_d, uint8_t,  uint64_t, ldbu_d)
-GEN_VEXT_LD_US(vlhu_v_h, uint16_t, uint16_t, ldhu_h)
-GEN_VEXT_LD_US(vlhu_v_w, uint16_t, uint32_t, ldhu_w)
-GEN_VEXT_LD_US(vlhu_v_d, uint16_t, uint64_t, ldhu_d)
-GEN_VEXT_LD_US(vlwu_v_w, uint32_t, uint32_t, ldwu_w)
-GEN_VEXT_LD_US(vlwu_v_d, uint32_t, uint64_t, ldwu_d)
-
-#define GEN_VEXT_ST_US(NAME, MTYPE, ETYPE, STORE_FN)                    \
+                 sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);                \
+}
+
+GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
+GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
+GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
+GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
+
+#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           \
 void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
                          CPURISCVState *env, uint32_t desc)             \
 {                                                                       \
-    uint32_t stride = vext_nf(desc) * sizeof(MTYPE);                    \
+    uint32_t stride = vext_nf(desc) * sizeof(ETYPE);                    \
     vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
-                     sizeof(ETYPE), sizeof(MTYPE),                      \
-                     GETPC(), MMU_DATA_STORE);                          \
+                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           \
 }                                                                       \
                                                                         \
 void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
                   CPURISCVState *env, uint32_t desc)                    \
 {                                                                       \
     vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
-                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_STORE);\
-}
-
-GEN_VEXT_ST_US(vsb_v_b, int8_t,  int8_t , stb_b)
-GEN_VEXT_ST_US(vsb_v_h, int8_t,  int16_t, stb_h)
-GEN_VEXT_ST_US(vsb_v_w, int8_t,  int32_t, stb_w)
-GEN_VEXT_ST_US(vsb_v_d, int8_t,  int64_t, stb_d)
-GEN_VEXT_ST_US(vsh_v_h, int16_t, int16_t, sth_h)
-GEN_VEXT_ST_US(vsh_v_w, int16_t, int32_t, sth_w)
-GEN_VEXT_ST_US(vsh_v_d, int16_t, int64_t, sth_d)
-GEN_VEXT_ST_US(vsw_v_w, int32_t, int32_t, stw_w)
-GEN_VEXT_ST_US(vsw_v_d, int32_t, int64_t, stw_d)
-GEN_VEXT_ST_US(vse_v_b, int8_t,  int8_t , ste_b)
-GEN_VEXT_ST_US(vse_v_h, int16_t, int16_t, ste_h)
-GEN_VEXT_ST_US(vse_v_w, int32_t, int32_t, ste_w)
-GEN_VEXT_ST_US(vse_v_d, int64_t, int64_t, ste_d)
+                 sizeof(ETYPE), GETPC(), MMU_DATA_STORE);               \
+}
+
+GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
+GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
+GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
+GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
 
 /*
  *** index: access vector element from indexed memory
-- 
2.31.1


