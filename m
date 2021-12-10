Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvapw-0000ui-1c
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 03:01:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapo-0000iv-13
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:52 -0500
Received: from [2607:f8b0:4864:20::1032] (port=40590
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvapl-00005R-Fc
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 03:00:51 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so8836900pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Dec 2021 00:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SShPGNx4+Wv1wldPcrSkgipzikKbh+nacBUONgL4E7k=;
 b=SNC6If/ulLleG0Wn6SoOYHwQTXsC77Qo867nq6rZirgxbOkIGXxgM9iEvtd0AoyRWT
 jxm5XFIPw7xPNPwjszurVAwtdBEqI/RMXw/Z/FqfX7vAliKWcZDJelEvAyqxQYkuzs5h
 Y2Ms1ALdt6AvfLOBELYEgLKzUf5WwOGhNJA1thh7SHpc5YZHkYD4X2gHVx7+C6hXpetr
 oLlCfD5JllmR2assQthhabgn58VJqKfoSjlqmzYda5vW03QELiUyNum+h88voxhLS1xo
 IKMa9Iadajw8D51y5z1n+uF1TsFsISLx5sN/1TSCvuRO14ZDfVU9oMSy9VoRi0EvJx/l
 jeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SShPGNx4+Wv1wldPcrSkgipzikKbh+nacBUONgL4E7k=;
 b=my1NOdcOxhjvAvQHUOoUfoUVLw3qdQrnL/j5qkz+0+IGcRsNrfB8McGrjaOy1U08QX
 yRyz3G2K+IC6jIDcfKXLkyRVjSqv7mln1sP/kmyxF0TuqJGHIClPABuAaLADVO9P6ctn
 jWbTyeX3AUTTIH9ZmUe8THxlksoXwXPqknxQ9ql7D+c4ZSYTo8xV5eiYXECM4x+zOdQR
 DsVbl9viaactHwDn1uJUsXpYOL+Fo9SYZmCXlD+z2d3eGMFoS7owmIc5N6RVHWxrrVDK
 0ETHgR2vaOWHo+W2uzBw7clpKg1UYEiQTKSRZlIDABAvjGa3c6vhpWvOgtW5NWfQwmSw
 Hrsw==
X-Gm-Message-State: AOAM533gIKSn1KgUl7NOlhmKAdRNr3HaMCTwp5jib9+6cbgiwxHzrm0d
 LU9jlFeWL1IGz7PkMZidvBWmJA==
X-Google-Smtp-Source: ABdhPJxkmWytkwVuobNmSsRtxN485S+H14rpLLVH/lc8S7xy/qewHFg0CcvPy46F8nJKup3NsjDnEQ==
X-Received: by 2002:a17:902:ea10:b0:142:112d:c0b9 with SMTP id
 s16-20020a170902ea1000b00142112dc0b9mr73238850plg.35.1639123248267; 
 Fri, 10 Dec 2021 00:00:48 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 75/77] target/riscv: rvv-1.0: rename vmandnot.mm and
 vmornot.mm to vmandn.mm and vmorn.mm
Date: Fri, 10 Dec 2021 15:57:01 +0800
Message-Id: <20211210075704.23951-76-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 08:00:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 4 ++--
 target/riscv/insn32.decode              | 4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6e58343af3..c15497e4a1 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1016,11 +1016,11 @@ DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmandnot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmandn_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmorn_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1a4a287146..8617307b29 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -635,11 +635,11 @@ vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
 vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
 vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
-vmandnot_mm     011000 - ..... ..... 010 ..... 1010111 @r
+vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
 vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
 vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
-vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
+vmorn_mm        011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 97b1dc1026..33ef7926e6 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2862,11 +2862,11 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 
 GEN_MM_TRANS(vmand_mm)
 GEN_MM_TRANS(vmnand_mm)
-GEN_MM_TRANS(vmandnot_mm)
+GEN_MM_TRANS(vmandn_mm)
 GEN_MM_TRANS(vmxor_mm)
 GEN_MM_TRANS(vmor_mm)
 GEN_MM_TRANS(vmnor_mm)
-GEN_MM_TRANS(vmornot_mm)
+GEN_MM_TRANS(vmorn_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
 /* Vector count population in mask vcpop */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4c1a1310e6..ad505ec9b2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4470,11 +4470,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
 
 GEN_VEXT_MASK_VV(vmand_mm, DO_AND)
 GEN_VEXT_MASK_VV(vmnand_mm, DO_NAND)
-GEN_VEXT_MASK_VV(vmandnot_mm, DO_ANDNOT)
+GEN_VEXT_MASK_VV(vmandn_mm, DO_ANDNOT)
 GEN_VEXT_MASK_VV(vmxor_mm, DO_XOR)
 GEN_VEXT_MASK_VV(vmor_mm, DO_OR)
 GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
-GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
+GEN_VEXT_MASK_VV(vmorn_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
 /* Vector count population in mask vcpop */
-- 
2.31.1


