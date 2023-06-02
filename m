Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199F6C7EE24
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 13:11:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q54Ye-0007oQ-MS; Fri, 02 Jun 2023 09:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1q51Ha-0002T5-RU
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 05:41:19 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rehn@rivosinc.com>) id 1q51HX-0000D7-J0
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 05:41:18 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af318fa2b8so24650651fa.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685698873; x=1688290873; 
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=le0QAAql+itTBpRz4mqbwg7nbDKJXpWGcULIraLJ6gs=;
 b=YAkIZpClkGm12/y2mCPaAEI0BCQCsKSP+Ue1zmJC2IKEkjEJ9Vgkbcf4LwFNI1Bcu8
 EfDqS0CMhTxlRKKh023H3lIT8SIkOuCpdASP5G1u5JaPzQwam0IK5kjwBZZ/kn8n//0s
 WCG35xARzovH67Nf0IKexzfAB4PXpXrlfGk/OLZvT354BYZbrn5Uwg4oT11hEKnJUPIH
 450XcLtoSQLDoNg9GjQsQZ09kQdpbrJsYVTvAz6oKz9jmJxVz6LeKf9uEr+WQ6K+LTC8
 h8MbUQ6wzjc5knChC85JeUbOY9lgK+x6K66jDYlvPyI5+YjQUFMJ8XHfrMsOAYINubSB
 oxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685698873; x=1688290873;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=le0QAAql+itTBpRz4mqbwg7nbDKJXpWGcULIraLJ6gs=;
 b=aI+7bIYRtRUyUlXDum6V6Nx7hajvw4/HvvOklXtzhx3B/mWD5OmVO6pRWqjmBGjDR8
 wRNyDQ6FTy+N2qe9h9t0z/wkst225yVx3zJAQwZ48/Aa8CtjyZkT8FMCgprXUx/a4pf+
 dBXbXE5/mNnJoYVzqJwr2LjvrhBZgdQCT6HG1iGc8yqdwSBrAJ2oFCW29bKy0ezG1TxZ
 MER0LDXWlyZqvOcy0ATKr7d88TJ5eYYzalagu/B/icypaHkGq9hz3uiwK/NmDmQ4Hgkr
 yQb0ALzVhnns7BaM1udi9MBSmhZaX0EQQY6S5/msz8vER7kCC+2pqCju4xDRDZZwXpN3
 haKw==
X-Gm-Message-State: AC+VfDy5j/NF5Q1+O7A/BZJZiOXJ2eVGq03ySldN3cllo6cbIW+h6nUw
 BegH53saLJ3iXmUbKQqk7qdc6A==
X-Google-Smtp-Source: ACHHUZ4sXF9WGhk8qBs83IDqR6DGcKxw03a20cWB6J5z580EDG99tpPVHd+WXTSJeRVEAfVF+PP9dA==
X-Received: by 2002:a19:c214:0:b0:4f4:b92c:eef5 with SMTP id
 l20-20020a19c214000000b004f4b92ceef5mr1508280lfc.68.1685698873670; 
 Fri, 02 Jun 2023 02:41:13 -0700 (PDT)
Received: from [192.168.50.45] (h-155-4-92-80.A980.priv.bahnhof.se.
 [155.4.92.80]) by smtp.gmail.com with ESMTPSA id
 c24-20020ac25318000000b004eefdd8b37fsm105942lfh.194.2023.06.02.02.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 02:41:13 -0700 (PDT)
Message-ID: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
Subject: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
From: Robbin Ehn <rehn@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Date: Fri, 02 Jun 2023 11:41:11 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=rehn@rivosinc.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 Jun 2023 09:11:07 -0400
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

Signed-off-by: Robbin Ehn <rehn@rivosinc.com>
---
v1->v2: Moved to syscall.c
---
 linux-user/riscv/syscall32_nr.h |   1 +
 linux-user/riscv/syscall64_nr.h |   1 +
 linux-user/syscall.c            | 109 ++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)

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
index 89b58b386b..cd394bbe26 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8772,6 +8772,74 @@ static int do_getdents64(abi_long dirfd, abi_long ar=
g2, abi_long count)
 }
 #endif /* TARGET_NR_getdents64 */
=20
+#if defined(TARGET_RISCV)
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
+    int64_t  key;
+    uint64_t value;
+};
+
+static void risc_hwprobe_fill_pairs(CPURISCVState *env,
+                                    struct riscv_hwprobe *pair,
+                                    size_t pair_count)
+{
+    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
+
+    for (; pair_count > 0; pair_count--, pair++) {
+        pair->value =3D 0;
+        switch (pair->key) {
+        case RISCV_HWPROBE_KEY_MVENDORID:
+            pair->value =3D cfg->mvendorid;
+            break;
+        case RISCV_HWPROBE_KEY_MARCHID:
+            pair->value =3D cfg->marchid;
+            break;
+        case RISCV_HWPROBE_KEY_MIMPID:
+            pair->value =3D cfg->mimpid;
+            break;
+        case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+            pair->value =3D riscv_has_ext(env, RVI) &&
+                          riscv_has_ext(env, RVM) &&
+                          riscv_has_ext(env, RVA) ?
+                          RISCV_HWPROBE_BASE_BEHAVIOR_IMA : 0;
+            break;
+        case RISCV_HWPROBE_KEY_IMA_EXT_0:
+            pair->value =3D riscv_has_ext(env, RVF) &&
+                          riscv_has_ext(env, RVD) ?
+                          RISCV_HWPROBE_IMA_FD : 0;
+            pair->value |=3D riscv_has_ext(env, RVC) ?
+                           RISCV_HWPROBE_IMA_C : pair->value;
+            break;
+        case RISCV_HWPROBE_KEY_CPUPERF_0:
+            pair->value =3D RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+            break;
+        default:
+            pair->key =3D -1;
+        break;
+        }
+    }
+}
+#endif
+
 #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
 _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
 #endif
@@ -13469,6 +13537,47 @@ static abi_long do_syscall1(CPUArchState *cpu_env,=
 int num, abi_long arg1,
         return ret;
 #endif
=20
+#if defined(TARGET_RISCV)
+    case TARGET_NR_riscv_hwprobe:
+        {
+            struct riscv_hwprobe *host_pairs;
+
+            /* flags must be 0 */
+            if (arg5 !=3D 0) {
+                return -TARGET_EINVAL;
+            }
+
+            /* check cpu_set */
+            if (arg3 !=3D 0) {
+                int ccpu;
+                size_t cpu_setsize =3D CPU_ALLOC_SIZE(arg3);
+                cpu_set_t *host_cpus =3D lock_user(VERIFY_READ, arg4,
+                                                 cpu_setsize, 0);
+                if (!host_cpus) {
+                    return -TARGET_EFAULT;
+                }
+                ccpu =3D CPU_COUNT_S(cpu_setsize, host_cpus);
+                unlock_user(host_cpus, arg4, cpu_setsize);
+                /* no selected cpu */
+                if (ccpu =3D=3D 0) {
+                    return -TARGET_EINVAL;
+                }
+            } else if (arg4 !=3D 0) {
+                return -TARGET_EINVAL;
+            }
+
+            host_pairs =3D lock_user(VERIFY_WRITE, arg1,
+                                   sizeof(*host_pairs) * (size_t)arg2, 0);
+            if (host_pairs =3D=3D NULL) {
+                return -TARGET_EFAULT;
+            }
+            risc_hwprobe_fill_pairs(cpu_env, host_pairs, arg2);
+            unlock_user(host_pairs, arg1, sizeof(*host_pairs) * (size_t)ar=
g2);
+            ret =3D 0;
+        }
+        return ret;
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
--=20
2.39.2


