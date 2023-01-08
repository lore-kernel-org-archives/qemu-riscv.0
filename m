Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZ0-0004dT-NR
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYz-0004c5-Ar
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:33 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYr-0004VH-DF
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id bj3so2175044pjb.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uy+1LYtKetQWFHYH8PaN7/XbqnFh4isIp+PwWLyalNo=;
 b=gTpYFrptaAB6DVGm8liAVvYlvcGaeThZF2mSsuwEqS4MEeWIVtzmrjxAPkfyqo81wt
 Wf/8VzoDmI7kIwUgNmIojeIsEiDh0lPa9YTDX4ihp52j2MYtu8zzNnn/+ypAM4+6pCuP
 s1KGmVCKigKUA7/mWjpExzTJvNbyFQZ7yjF+kd/xYJtvOjZyvG8e0RxwLSKuGd40GEzm
 wOF6s3JhjJt0rkH3ZTkzyvvrZ/tUWmpfOK+Hxm4CAEyEH3lV6A+jD3hZyJARCsxC1owi
 eq8kyYx4F6v2rnsMHgRxqROpU85Tx+xa9ES1PhMKKRdhGHJyxaXqMAVMI1ImrlanDKrp
 xOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uy+1LYtKetQWFHYH8PaN7/XbqnFh4isIp+PwWLyalNo=;
 b=1sxKqJMwuHcyclly9kAfyWmhoR6KEDLiVk9wiL3UC+1PVvrxTEwPFJLKAdSXhTTzGQ
 Ms0pc8y05KgqJCL+oPdV4r3BCk8HVzlaGcsjLNhsfC0GUp6WCIq2moPKjOhFf+YlYajW
 HICELhYKvcp37+UemPKeskDGUSVZNpv7EXAzUtp3BGyEpTKcAxZhN3cc8hxOvkejyrvL
 50XpA7a5QsuJNcZyzJoOa9rdg8VnQ3qSlrD0WvF2XgVeKad2K4I4XPOOo8yohvfFUdml
 AIxqOD+39QMZjTzECEIXYkPLytpai0O7a6EdDE0+kjv/V5rh24pTDuBv9RoCU6PeFMbY
 idYA==
X-Gm-Message-State: AFqh2kq6OnKaZ0zNEiIE7gHGhAm1MYJZDFa1gnuiYGg6yYPIJ1DPgveQ
 CtgaG9Mg2ECRwVRClDoXSE9SXTTNOBK4iBc0
X-Google-Smtp-Source: AMrXdXuXQ9EW1XNokSvls9hPBC8/jQRcqSDMFCWua55675KWLzN/6yZkEbH8hlUYpYsRQ9NSl90IfQ==
X-Received: by 2002:a17:902:aa8e:b0:189:abdd:400a with SMTP id
 d14-20020a170902aa8e00b00189abdd400amr62371783plr.15.1673145443887; 
 Sat, 07 Jan 2023 18:37:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 02/36] tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,
 ARG}_NORMAL
Date: Sat,  7 Jan 2023 18:36:45 -0800
Message-Id: <20230108023719.2466341-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:33 -0000

Many hosts pass and return 128-bit quantities like sequential
64-bit quantities.  Treat this just like we currently break
down 64-bit quantities for a 32-bit host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index da91779890..99e6e4e1a8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -686,11 +686,22 @@ static void init_call_layout(TCGHelperInfo *info)
     case dh_typecode_s64:
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
+        assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+        break;
+    case dh_typecode_i128:
+        info->nr_out = 128 / TCG_TARGET_REG_BITS;
+        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
+        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        case TCG_CALL_RET_NORMAL:
+            assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+            break;
+        default:
+            qemu_build_not_reached();
+        }
         break;
     default:
         g_assert_not_reached();
     }
-    assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
 
     /*
      * Parse and place function arguments.
@@ -712,6 +723,9 @@ static void init_call_layout(TCGHelperInfo *info)
         case dh_typecode_ptr:
             type = TCG_TYPE_PTR;
             break;
+        case dh_typecode_i128:
+            type = TCG_TYPE_I128;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -751,6 +765,19 @@ static void init_call_layout(TCGHelperInfo *info)
             }
             break;
 
+        case TCG_TYPE_I128:
+            switch (/* TODO */ TCG_CALL_ARG_NORMAL) {
+            case TCG_CALL_ARG_EVEN:
+                layout_arg_even(&cum);
+                /* fall through */
+            case TCG_CALL_ARG_NORMAL:
+                layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
+                break;
+            default:
+                qemu_build_not_reached();
+            }
+            break;
+
         default:
             g_assert_not_reached();
         }
@@ -1668,11 +1695,13 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         op->args[pi++] = temp_arg(ret);
         break;
     case 2:
+    case 4:
         tcg_debug_assert(ret != NULL);
-        tcg_debug_assert(ret->base_type == ret->type + 1);
+        tcg_debug_assert(ret->base_type == ret->type + ctz32(n));
         tcg_debug_assert(ret->temp_subindex == 0);
-        op->args[pi++] = temp_arg(ret);
-        op->args[pi++] = temp_arg(ret + 1);
+        for (i = 0; i < n; ++i) {
+            op->args[pi++] = temp_arg(ret + i);
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.34.1


