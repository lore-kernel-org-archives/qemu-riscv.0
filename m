Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uy-0005w7-Aj
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0ur-0005vT-Ef
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:39 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0up-0005DC-Ik
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:36 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1442977d77dso20353014fac.6
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXkj3LSF2mwteCaRWsXssPJp8JvDz49yzHgT9YAPVrc=;
 b=AKyXHQ4bOCXj+mQcgZMiCz8w/yqzVqUUVmANWoI+AsBPXQyX0NtJZW9tEVN3VVL+Jz
 XIpovRptfqX/qYpc4hoY29rsMyHzuGEx1ijiom1U6PAmFAh1uDccUwaEzCFzy96oIw9U
 5q9PmK0gFCMrwaAXqpU/Hd2qsVV389sjz1dcO2tfvUbWJXl9KZRdJdtR5RH0sEjaBuDU
 sF68SS4IMPVirPwi5bLV6ClNiQuLF2LbCjEH5B2Pi7zKiQZZoSluxmVUsCbb1J4hbpw2
 agj9ZIdAPl4/adXvO8vyFS1NiVC+FTX1VNLtqKLA3HER6IwKEmhiSzI6Tv4/yAS3d+Ob
 YwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXkj3LSF2mwteCaRWsXssPJp8JvDz49yzHgT9YAPVrc=;
 b=UeKbWMeAX3LG6HpiqGPM+zCI1pd6WBFq/tRUWs46XEitFaYKFGIAL8jfv+p631YIqE
 p+ryf5jJKeUrwnDsXqn3dEExLMLhuYfKVplZu2c8aqxWbONPgbaPAhuIecRQ566M+xDg
 EHBgU1sZ+Ym2y07V1mtnbZxqDurPYxNudiAAV8nPnGBlaTQmtPOREVURSBskAPhbVmPH
 UOcH16h5J3yNzePkVBANTYaGPMhtEZBHHlFuT1uFHNwQQhe0gLYu7TSAnqf1yCZ/Nkv8
 pw5RVEDn0ECNhsQt6CNJajyBGcofpKLa8PT25lt+Od1+rkiuMb01bDXndgL2gIHmafKd
 W0zg==
X-Gm-Message-State: AO0yUKXmbRPoO2Xsq9rtQ5yEC8x+eLG012U/e+ACy8BfzakyakbH6kNe
 tk6ZUlXJlxH/fZQuN9vnLQreqA==
X-Google-Smtp-Source: AK7set/5r883H4E75KfMm/iLyJhbDP+7sn6HA+kM5o2lFVxvdz37TlLhKCC9DLI71iRDthUNxualug==
X-Received: by 2002:a05:6870:b6a5:b0:163:51eb:b577 with SMTP id
 cy37-20020a056870b6a500b0016351ebb577mr2122369oab.46.1676402674311; 
 Tue, 14 Feb 2023 11:24:34 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:33 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 11/11] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Tue, 14 Feb 2023 16:23:56 -0300
Message-Id: <20230214192356.319991-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:39 -0000

The attribute is no longer used since we can retrieve all the enabled
features in the hart by using cpu->cfg instead.

Remove env->feature, riscv_feature() and riscv_set_feature(). We also
need to bump vmstate_riscv_cpu version_id and minimal_version_id since
'features' is no longer being migrated.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
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


