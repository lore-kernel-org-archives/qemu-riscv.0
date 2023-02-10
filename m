Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTaO-0005XK-Si
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaN-0005VM-2y
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:37:07 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaL-0007WD-FQ
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:37:06 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15f97c478a8so6601887fac.13
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8GWl7vdD19sycXjiHuVr1TwIKANnQUDm1vcaIAn7IQ=;
 b=LJKe0jfDufr7SAIc60Vb/VyIJHM9TOvGJ2YEEYHlI09N0Ew4b1oJgA2y163PGaelSj
 IrfYfMB/RzG8LfuQeeciq4OdMoa2Zsvhf9BnkKlgr9fns1UUW8iSJNODk2kCPsokqdez
 yyjrJaGJPIhLY70hAyVD8e4TSuGmr0iOwBz2Y6M7rVQYqsjLy6oidZlhCHwIJh96BFpt
 BWMkQtTqZ3QAcA7juoAVAgJuQq1JDzbi2TPH/yV6aXvUM6R37JYXKkO+/SNLTxr3Zw9P
 8+Nc0uAhMdrGDld37DtnUIIwZTg8KK4hLGQMb/5hiZfQdN26sv1V+QULosanWYgZd3cL
 479w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8GWl7vdD19sycXjiHuVr1TwIKANnQUDm1vcaIAn7IQ=;
 b=Xpd6GF9XEewtiNPJdYqNu2blH3nQNMNzBqWnE0R/ZlXDJnBKIYssStUririd3SrX/c
 t7B3UC6oqDjji+BnWmSbf6r5MDyq715T2R+CB/HDBvkKdRPsy9MOiZYz9nRqRkoDZIbF
 qXr0dAhOyadgsVhvo4P8tijGQWY1jHwh22U4066jdBpTlAhAlNOBhfvM1bW4C5GJJx03
 VI8p/UObe5MVa/Jnmdt9HBoTNYxyjLnBS9InB4GYsWaOAKuwNucUvY9QtsUTsvgwUPWv
 RY83KyKyxYQua/QSZRW2NHgdOG18iqEHUQmY2MushPVUfjQhcaJeRDD6B9C+6oBq+FgV
 tc6A==
X-Gm-Message-State: AO0yUKVg/5Ox7nZCSrQuUiLAraZ5XhZNA8taANQuxO5Y6RybHxM1pEGi
 5hkBZnFKItvCiSUHsWnx0NJdaq0pGd3AaTVC
X-Google-Smtp-Source: AK7set85mYGuDP7XKTHKkTyiiV3Nk9u9Wv1zZesY2wrUg6dl39YmOK1kuwhGP+NHJATnB4lz90tyVA==
X-Received: by 2002:a05:6870:b003:b0:163:2090:7c0d with SMTP id
 y3-20020a056870b00300b0016320907c0dmr7099777oae.7.1676036224918; 
 Fri, 10 Feb 2023 05:37:04 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:37:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 11/11] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Fri, 10 Feb 2023 10:36:35 -0300
Message-Id: <20230210133635.589647-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 10 Feb 2023 13:37:07 -0000

The attribute is no longer used since we can retrieve all the enabled
features in the hart by using cpu->cfg instead.

Remove env->feature, riscv_feature() and riscv_set_feature(). We also
need to bump vmstate_riscv_cpu version_id and minimal_version_id since
'features' is no longer being migrated.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h     | 12 ------------
 target/riscv/machine.c |  5 ++---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 83a9fa38d9..6290c6d357 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,8 +173,6 @@ struct CPUArchState {
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
 
-    uint32_t features;
-
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
@@ -525,16 +523,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
     return (env->misa_ext & ext) != 0;
 }
 
-static inline bool riscv_feature(CPURISCVState *env, int feature)
-{
-    return env->features & (1ULL << feature);
-}
-
-static inline void riscv_set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 67e9e56853..9c455931d8 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 6,
-    .minimum_version_id = 6,
+    .version_id = 7,
+    .minimum_version_id = 7,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -351,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_ext, RISCVCPU),
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
-        VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
-- 
2.39.1


