Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9A1EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 08:24:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBABI-0003zP-53; Mon, 19 Jun 2023 04:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1qBABF-0003z6-TD
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 04:24:09 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1qBABD-000550-BS
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 04:24:09 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f63006b4e3so4070857e87.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687163045; x=1689755045; 
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XyBvxKKF5LTSBxTjCOXJrhpv5ZrsMWOiLk0E8PEx/Wc=;
 b=2FBbMF8EzG5orZjUxVGzTZbxmNc+SkYYaGF7yKh7PXmhRhEL+eMS08TWUivK39ANTP
 VRNN0SxGt5ggCcYqoD+DoHkbUJgy1CP4EDuRLrG7cEDi4h505DBExEIdCfGSqYUxaYXG
 iPzEGKY4E2SWbcXX0eSqIkS8MFBeJTR0LCA+OUK0QIuWXcJ2YtyQ9yFyFTGTtXTmtSLL
 POK0lXtX/+hmexllSpxFNt573pTYiIXnQBg7cTGERwkN48DjYwlFD9t6HS2iT1aaWgjz
 qEGoENj91a9SmaB5AJYiE3mcT8zOmHoErcl6YF1Hxg8MiSe5Vy8QOFCDcn8KkYvj4opD
 +uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687163045; x=1689755045;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyBvxKKF5LTSBxTjCOXJrhpv5ZrsMWOiLk0E8PEx/Wc=;
 b=RXPdQpQCF6tJRZlBMJ9twxe6H5lYQi4eL6CZT0tJTlrZ8UxhxOWYaoqIgTJMtr78qa
 9CR4RTSQtXD2Jz5eWkC1cTxKZ/ra46cNj6dNSZznNFSE4bdaiK531z2IPihW3qVF4arf
 wcIPVOKI97QE+O1uilCwqC38cFYPFFw6aRbkhveadLoJDVgMSMMpFmjU6mgnMuM3yA33
 XvRjIo812zZymXabFz+lU79CHn/SIJ1BuUVadywCuSjF7yHf1yfzHTpZO0ZshMki3Ao6
 umnEu3AOwt4JVxvSGEIfU5QADOtzevy7H0ytsAxW/ab3cER8KlSSy+eG8I2QXSDw/bsX
 4Hrg==
X-Gm-Message-State: AC+VfDz7c3KV8pi6vosKhYhOSd/vhPdLthqnnIMqHHIMXu3Op4JFe79j
 hnVxsjryc/Nc8nOlTqROFXPQow==
X-Google-Smtp-Source: ACHHUZ4lCCG9iOyTdk/LBz7F5xklHsY6wM85rLoH7sMiB/UVoIT5CNsUeL1iKW1n6FIz0iK9pmRFUg==
X-Received: by 2002:a05:6512:1c5:b0:4f1:3eea:eaf9 with SMTP id
 f5-20020a05651201c500b004f13eeaeaf9mr5146632lfp.24.1687163044532; 
 Mon, 19 Jun 2023 01:24:04 -0700 (PDT)
Received: from [192.168.50.45] (h-155-4-92-80.A980.priv.bahnhof.se.
 [155.4.92.80]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056512048500b004f86e7ffe28sm447068lfq.47.2023.06.19.01.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 01:24:04 -0700 (PDT)
Message-ID: <06a4543df2aa6101ca9a48f21a3198064b4f1f87.camel@rivosinc.com>
Subject: [PATCH] linux-user/riscv: Add syscall riscv_hwprobe
From: Robbin Ehn <rehn@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: palmer@rivosinc.com, laurent@vivier.eu, qemu-riscv@nongnu.org, 
 richard.henderson@linaro.org, ajones@ventanamicro.com
Date: Mon, 19 Jun 2023 10:24:03 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=rehn@rivosinc.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This patch adds the new syscall for the
"RISC-V Hardware Probing Interface"
(https://docs.kernel.org/riscv/hwprobe.html).

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
---
v1->v2: Moved to syscall.c
v2->v3: Separate function, get/put user
v3->patch
---
 linux-user/riscv/syscall32_nr.h |   1 +
 linux-user/riscv/syscall64_nr.h |   1 +
 linux-user/syscall.c            | 146 ++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)

diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32_n=
r.h
index 1327d7dffa..412e58e5b2 100644
--- a/linux-user/riscv/syscall32_nr.h
+++ b/linux-user/riscv/syscall32_nr.h
@@ -228,6 +228,7 @@
 #define TARGET_NR_accept4 242
 #define TARGET_NR_arch_specific_syscall 244
 #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15=
)
+#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
 #define TARGET_NR_prlimit64 261
 #define TARGET_NR_fanotify_init 262
 #define TARGET_NR_fanotify_mark 263
diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall64_n=
r.h
index 6659751933..29e1eb2075 100644
--- a/linux-user/riscv/syscall64_nr.h
+++ b/linux-user/riscv/syscall64_nr.h
@@ -251,6 +251,7 @@
 #define TARGET_NR_recvmmsg 243
 #define TARGET_NR_arch_specific_syscall 244
 #define TARGET_NR_riscv_flush_icache (TARGET_NR_arch_specific_syscall + 15=
)
+#define TARGET_NR_riscv_hwprobe (TARGET_NR_arch_specific_syscall + 14)
 #define TARGET_NR_wait4 260
 #define TARGET_NR_prlimit64 261
 #define TARGET_NR_fanotify_init 262
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f2cb101d83..55becf3666 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8874,6 +8874,147 @@ static int do_getdents64(abi_long dirfd, abi_long a=
rg2, abi_long count)
 }
 #endif /* TARGET_NR_getdents64 */
=20
+#if defined(TARGET_NR_riscv_hwprobe)
+
+#define RISCV_HWPROBE_KEY_MVENDORID     0
+#define RISCV_HWPROBE_KEY_MARCHID       1
+#define RISCV_HWPROBE_KEY_MIMPID        2
+
+#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR 3
+#define     RISCV_HWPROBE_BASE_BEHAVIOR_IMA (1 << 0)
+
+#define RISCV_HWPROBE_KEY_IMA_EXT_0     4
+#define     RISCV_HWPROBE_IMA_FD       (1 << 0)
+#define     RISCV_HWPROBE_IMA_C        (1 << 1)
+
+#define RISCV_HWPROBE_KEY_CPUPERF_0     5
+#define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
+#define     RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)
+#define     RISCV_HWPROBE_MISALIGNED_SLOW        (2 << 0)
+#define     RISCV_HWPROBE_MISALIGNED_FAST        (3 << 0)
+#define     RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
+#define     RISCV_HWPROBE_MISALIGNED_MASK        (7 << 0)
+
+struct riscv_hwprobe {
+    abi_llong  key;
+    abi_ullong value;
+};
+
+static void risc_hwprobe_fill_pairs(CPURISCVState *env,
+                                    struct riscv_hwprobe *pair,
+                                    size_t pair_count)
+{
+    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
+
+    for (; pair_count > 0; pair_count--, pair++) {
+        abi_llong key;
+        abi_ullong value;
+        __put_user(0, &pair->value);
+        __get_user(key, &pair->key);
+        switch (key) {
+        case RISCV_HWPROBE_KEY_MVENDORID:
+            __put_user(cfg->mvendorid, &pair->value);
+            break;
+        case RISCV_HWPROBE_KEY_MARCHID:
+            __put_user(cfg->marchid, &pair->value);
+            break;
+        case RISCV_HWPROBE_KEY_MIMPID:
+            __put_user(cfg->mimpid, &pair->value);
+            break;
+        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+            value =3D riscv_has_ext(env, RVI) &&
+                    riscv_has_ext(env, RVM) &&
+                    riscv_has_ext(env, RVA) ?
+                    RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
+            __put_user(value, &pair->value);
+            break;
+        case RISCV_HWPROBE_KEY_IMA_EXT_0:
+            value =3D riscv_has_ext(env, RVF) &&
+                    riscv_has_ext(env, RVD) ?
+                    RISCV_HWPROBE_IMA_FD : 0;
+            value |=3D riscv_has_ext(env, RVC) ?
+                     RISCV_HWPROBE_IMA_C : pair->value;
+            __put_user(value, &pair->value);
+            break;
+        case RISCV_HWPROBE_KEY_CPUPERF_0:
+            __put_user(RISCV_HWPROBE_MISALIGNED_FAST, &pair->value);
+            break;
+        default:
+            __put_user(-1, &pair->key);
+            break;
+        }
+    }
+}
+
+static int cpu_set_valid(abi_long arg3, abi_long arg4)
+{
+    int ret, i, tmp;
+    size_t host_mask_size, target_mask_size;
+    unsigned long *host_mask;
+
+    /*
+     * cpu_set_t represent CPU masks as bit masks of type unsigned long *.
+     * arg3 contains the cpu count.
+     */
+    tmp =3D (8 * sizeof(abi_ulong));
+    target_mask_size =3D ((arg3 + tmp - 1) / tmp) * sizeof(abi_ulong);
+    host_mask_size =3D (target_mask_size + (sizeof(*host_mask) - 1)) &
+                     ~(sizeof(*host_mask) - 1);
+
+    host_mask =3D alloca(host_mask_size);
+
+    ret =3D target_to_host_cpu_mask(host_mask, host_mask_size,
+                                  arg4, target_mask_size);
+    if (ret !=3D 0) {
+        return ret;
+    }
+
+    for (i =3D 0 ; i < host_mask_size / sizeof(*host_mask); i++) {
+        if (host_mask[i] !=3D 0) {
+            return 0;
+        }
+    }
+    return -TARGET_EINVAL;
+}
+
+static abi_long do_riscv_hwprobe(CPUArchState *cpu_env, abi_long arg1,
+                                 abi_long arg2, abi_long arg3,
+                                 abi_long arg4, abi_long arg5)
+{
+    int ret;
+    struct riscv_hwprobe *host_pairs;
+
+    /* flags must be 0 */
+    if (arg5 !=3D 0) {
+        return -TARGET_EINVAL;
+    }
+
+    /* check cpu_set */
+    if (arg3 !=3D 0) {
+        ret =3D cpu_set_valid(arg3, arg4);
+        if (ret !=3D 0) {
+            return ret;
+        }
+    } else if (arg4 !=3D 0) {
+        return -TARGET_EINVAL;
+    }
+
+    /* no pairs */
+    if (arg2 =3D=3D 0) {
+        return 0;
+    }
+
+    host_pairs =3D lock_user(VERIFY_WRITE, arg1,
+                           sizeof(*host_pairs) * (size_t)arg2, 0);
+    if (host_pairs =3D=3D NULL) {
+        return -TARGET_EFAULT;
+    }
+    risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
+    unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)arg2);
+    return 0;
+}
+#endif /* TARGET_NR_riscv_hwprobe */
+
 #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
 _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
 #endif
@@ -13571,6 +13712,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env,=
 int num, abi_long arg1,
         return ret;
 #endif
=20
+#if defined(TARGET_NR_riscv_hwprobe)
+    case TARGET_NR_riscv_hwprobe:
+        return do_riscv_hwprobe(cpu_env, arg1, arg2, arg3, arg4, arg5);
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
--=20
2.39.2


