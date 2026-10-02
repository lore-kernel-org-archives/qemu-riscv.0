Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732C0CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:06:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xChb7-0008VK-4r; Fri, 02 Oct 2026 14:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChSb-0006OI-Np
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:54:30 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChSU-0007sA-Ir
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:54:13 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-1460bcc512eso4887420c88.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963649; x=1791568449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yKl9yArNq3w173PSahK6ICbfpEDWkJ6jn3RpCMJdn7U=;
 b=f7Wb45arpAD5m4bYFQjl3p90IWp83VfJi8BlSXC5fW14dBTsT6+uscBDddcBSIQPs5
 +60zb0vv4fod/fPgObr5iVAJYRXA1h1ynimj35werdAKiAOImehutw7OwR/BUv8Z1rUG
 acvYddCwwcrVmrtyVtuAgIBbiY2JNBAStN1LlyW55vQVUAg9GvFNSbm0MDOaZNd0Z4Cv
 dmZWXfKBQcWwG+PE9ttFoxdjrnxrJogKJPI/qmk0hsukZhdNx4etQGEsQrirH7uOa6b0
 PMsYHjUY67/3avD5Cv70b/oJDuo92hZodMtvpa8js23Y4ZEg1FELImN5XQ3SLQd6YBYa
 bYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963649; x=1791568449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yKl9yArNq3w173PSahK6ICbfpEDWkJ6jn3RpCMJdn7U=;
 b=jhl7VIz8npjHWh3n0t+yywNhT5/qI/Xlo9D4lPCoypQW6ubtXmNseD17fzrVDRgW5Z
 9cEz2JCorLN+KreQNMFhTkj45x0JR5aOLLiU9IHdgzEV+gWbRm6nFqannXzHsjbzf6oY
 3oD+BBrQQHT70qqtr8u3AeuLTiqK0bDJi01jM3PRiTDnm/bHN+QpL5GpdyrZBv5w0y/H
 ZjNRRcp2sUtRAs+1eZLg0/2ZeTiJaj855TDxXMuR7lBb4b+U9X+GuKma/r3Lc6KWbgmJ
 bBOWHxbSoF1rKmFqxqQ8VVHdMTzLT15GdtlIR4wxwT3T4P2rTlXLL8lCVS/qChW+VUlT
 0YHg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxQOpJzzLxbCgCzBD3g+onqJ9Q+pd90p8Pj2jQ10m5EO5WrwXSZns/NWLB4D74K5JHrsRgGXP9HO6Rz@nongnu.org
X-Gm-Message-State: AFq9FYLA/4bZLRMUNKy6N6yj+bhrFcyxFoCa+O1hoyLeGOK9Sof1Ap/c
 d/MhdppIO5FPo89W5Xnz9Fl+9OjT9McS0CJziDODgMo35v9BQqGHW6Nu
X-Gm-Gg: AYBFou2zwpex/FBF1byTs5nDcMz7WbkNogCiQuzbee4JOQ2cYpFD5ek7EvU3Wl3G0Qb
 aCTvj3DiHsCjQoMxzCOoFmISjs3DeoMVUz5AqJOWKw+C+6us614vsPQHPtcaGQFa6yds4zDsGKG
 IbqAvx0u07q5hcENgAKCQQEq0FSU/4Y+fgTCSPQ6a0AqN0tFCDi8mUMaHzczCPMHAXtGc4qjzVu
 jWqG44DOUR9/F/8KjyHtZJaX/VbeIPmsxM4woaQL9c4JZwcrD43Xa29dnvC+tgL0UFh7AvE/znR
 kfaglQmwRQ17smrEawAVG/wdYmktGWO/LfC/JT9cPE5qeVRxp+ai5Z5UpiD7nzr+iJ20zc+RbvA
 ttIt7zypJXt1FrS62qp8TLODDBwRDGa67fJS/KDLDNFxtppQiA2dFmwGuSoa1y1Oboz0oDw3VuV
 oOgFtM/qdlzj6pdPRXDuHIcH1xO6M/nI2CQNc4bB3DL8eisqrI7nM9GKUUwNuezLVAyRdF4ppQW
 HWIHWv3Nq4/CMTGpC150Iu4p80BTQ6S
X-Received: by 2002:a05:7301:4547:b0:33b:e75b:cc42 with SMTP id
 5a478bee46e88-34f150c2f6amr3129500eec.19.1790963649062; 
 Fri, 02 Oct 2026 10:54:09 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:54:08 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 26/27] target/ppc: reuse the error-aware NIP exception path
Date: Sat,  3 Oct 2026 01:50:34 +0800
Message-ID: <20261002175037.1747-27-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Route gen_exception_nip() through gen_exception_err_nip() with a zero
error code, reusing its NIP update and exception-generation path.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/ppc/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 467b8f3d4ec..f1a7039a325 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -330,12 +330,7 @@ static inline void gen_exception_err(DisasContext *ctx, uint32_t excp,
 static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
                               target_ulong nip)
 {
-    TCGv_i32 t0;
-
-    gen_update_nip(ctx, nip);
-    t0 = tcg_constant_i32(excp);
-    gen_helper_raise_exception(tcg_env, t0);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_exception_err_nip(ctx, excp, 0, nip);
 }
 
 static inline void gen_exception(DisasContext *ctx, uint32_t excp)
-- 
2.52.0.windows.1


