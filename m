Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELYz-0004ca-M8
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYy-0004bk-HQ
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:32 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYr-0004Up-03
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:32 -0500
Received: by mail-pl1-x631.google.com with SMTP id w3so5884919ply.3
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYWDMTmY+SCzbBTfhDbUxfPgw9Xf88DejLV4GZrSQBc=;
 b=pLPuT5WYnfYC0HZG4mjD8WIko7UQ+srtvnZ/EiccQdvk17ChX1JQy1w72AdEHmv5QX
 gV1V3W7e4CV/xqypyVex8Faxl64GJNgPwdA5Ac3fpFDz/MN6434G5HmD+GVmNsikKyln
 r+5NZgYD7Nr90c8vN24QisRcP3Ky+7M2XR3e3mv50xX6VvivWiXauoVAPssseDpbXmuD
 /ktI4UsIWqvz2uErK1oOczcMImYGMOkKkGZe7yUJJgBupI6s/jstMRklaRLW1kwxQKMT
 9rTdTHHwZ5qiPFHMH+FT3W8/2DiL6OZiIfMNWFOIV6BLawi7NzbN7S3fCZVmSqZWUHx2
 0aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AYWDMTmY+SCzbBTfhDbUxfPgw9Xf88DejLV4GZrSQBc=;
 b=AVujFg3EfLMOLm2s5dktGvuawNw/dc63Td43ANhcUd8UeUZqKxF2U/w4ywN0bxi2E3
 XD4wtC+vFoID9qJPc3D+DHC9BdSTdDPD3VHDe/Imb1Sl2ajPtbU1KmULmQQMxY5ndW4i
 2HudEbhevVWdNpJq04A0gWj5xfKgkCnaS9yg5smjRxMNu9h2y/XqftnF+s9btnY1XPCx
 /SbBdc3pbKWGB7mMtPAzM+SJwQSsqClWsaOtgsrgzkDVexETgy1Llas+Y6t/NpOIEf1T
 yGAlQ5A2GNbC/2xAkH52iwnfnr4qEFfBDz18zQTQrA9hZuTrc9jIg6VevrQ88+D/4YYo
 25Vg==
X-Gm-Message-State: AFqh2kofpQulEMkNkTLnhdeWzm3Cn7pcgghhZ21JQdRGtWhxlDa67984
 tehDXvgvFXw+nhksEBDm7NXofA==
X-Google-Smtp-Source: AMrXdXtcU2/5ET2pswa2iwJIb30/Jp+plIb9YuhEGBEJELjmTS74pvcgI+fKIRE1vAIrvjmPUpUhig==
X-Received: by 2002:a17:903:186:b0:188:d2b3:26c1 with SMTP id
 z6-20020a170903018600b00188d2b326c1mr81236833plg.10.1673145442678; 
 Sat, 07 Jan 2023 18:37:22 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper macros
Date: Sat,  7 Jan 2023 18:36:44 -0800
Message-Id: <20230108023719.2466341-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:32 -0000

Begin staging in support for TCGv_i128 with Int128.
Define the type enumerator, the typedef, and the
helper-head.h macros.

This cannot yet be used, because you can't allocate
temporaries of this new type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |  7 +++++++
 include/tcg/tcg.h          | 17 ++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index bc6698b19f..b8d1140dc7 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -26,6 +26,7 @@
 #define dh_alias_int i32
 #define dh_alias_i64 i64
 #define dh_alias_s64 i64
+#define dh_alias_i128 i128
 #define dh_alias_f16 i32
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
@@ -40,6 +41,7 @@
 #define dh_ctype_int int
 #define dh_ctype_i64 uint64_t
 #define dh_ctype_s64 int64_t
+#define dh_ctype_i128 Int128
 #define dh_ctype_f16 uint32_t
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
@@ -71,6 +73,7 @@
 #define dh_retvar_decl0_noreturn void
 #define dh_retvar_decl0_i32 TCGv_i32 retval
 #define dh_retvar_decl0_i64 TCGv_i64 retval
+#define dh_retval_decl0_i128 TCGv_i128 retval
 #define dh_retvar_decl0_ptr TCGv_ptr retval
 #define dh_retvar_decl0(t) glue(dh_retvar_decl0_, dh_alias(t))
 
@@ -78,6 +81,7 @@
 #define dh_retvar_decl_noreturn
 #define dh_retvar_decl_i32 TCGv_i32 retval,
 #define dh_retvar_decl_i64 TCGv_i64 retval,
+#define dh_retvar_decl_i128 TCGv_i128 retval,
 #define dh_retvar_decl_ptr TCGv_ptr retval,
 #define dh_retvar_decl(t) glue(dh_retvar_decl_, dh_alias(t))
 
@@ -85,6 +89,7 @@
 #define dh_retvar_noreturn NULL
 #define dh_retvar_i32 tcgv_i32_temp(retval)
 #define dh_retvar_i64 tcgv_i64_temp(retval)
+#define dh_retvar_i128 tcgv_i128_temp(retval)
 #define dh_retvar_ptr tcgv_ptr_temp(retval)
 #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
 
@@ -95,6 +100,7 @@
 #define dh_typecode_i64 4
 #define dh_typecode_s64 5
 #define dh_typecode_ptr 6
+#define dh_typecode_i128 7
 #define dh_typecode_int dh_typecode_s32
 #define dh_typecode_f16 dh_typecode_i32
 #define dh_typecode_f32 dh_typecode_i32
@@ -104,6 +110,7 @@
 
 #define dh_callflag_i32  0
 #define dh_callflag_i64  0
+#define dh_callflag_i128 0
 #define dh_callflag_ptr  0
 #define dh_callflag_void 0
 #define dh_callflag_noreturn TCG_CALL_NO_RETURN
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b949d75fdd..7d346192ca 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -277,6 +277,7 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
+    TCG_TYPE_I128,
 
     TCG_TYPE_V64,
     TCG_TYPE_V128,
@@ -358,13 +359,14 @@ typedef tcg_target_ulong TCGArg;
    in tcg/README. Target CPU front-end code uses these types to deal
    with TCG variables as it emits TCG code via the tcg_gen_* functions.
    They come in several flavours:
-    * TCGv_i32 : 32 bit integer type
-    * TCGv_i64 : 64 bit integer type
-    * TCGv_ptr : a host pointer type
-    * TCGv_vec : a host vector type; the exact size is not exposed
-                 to the CPU front-end code.
-    * TCGv : an integer type the same size as target_ulong
-             (an alias for either TCGv_i32 or TCGv_i64)
+    * TCGv_i32  : 32 bit integer type
+    * TCGv_i64  : 64 bit integer type
+    * TCGv_i128 : 128 bit integer type
+    * TCGv_ptr  : a host pointer type
+    * TCGv_vec  : a host vector type; the exact size is not exposed
+                  to the CPU front-end code.
+    * TCGv      : an integer type the same size as target_ulong
+                  (an alias for either TCGv_i32 or TCGv_i64)
    The compiler's type checking will complain if you mix them
    up and pass the wrong sized TCGv to a function.
 
@@ -384,6 +386,7 @@ typedef tcg_target_ulong TCGArg;
 
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
+typedef struct TCGv_i128_d *TCGv_i128;
 typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
-- 
2.34.1


