Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4094C3DA7F
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 20:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbn0H-0006bs-PB; Wed, 07 Aug 2024 16:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbn07-0005yG-I9
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 16:11:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbn05-0004lR-9C
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 16:11:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1fc66fc35f2so9975395ad.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 13:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723061471; x=1723666271;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QLZ4lqFvU7reyKI+X8vObsnSzIH8RciqwfuuOFHsOr4=;
 b=AEeZpaHX+dcn+st6gFL45gdKsoakmJpVvfehmC+1/9NWdvRqeD5UuNgS9piOhCJrLn
 nwHpqpDrJw9gVx7aJqBFaSm1TN9F16bmK+4TDzxxE/Gof3JYns52Fh0daWfb4BY1iEgV
 BaDwoVdGsGSIiTjNw+bE03UV3uG9Xj+vVPYo/4E7sf+2eRHx31X8+KH41H72Nzz/LyqI
 nRmImQ9u+zP4qe+cHPrzStzzVMXlBN/3JZr9mGV+/lOT/6ULba25inKtB5s6Vzn40hXW
 nraCzPMjdPmNmWkQVfDuvGUjurL2cGmaKkMc94BQ5cV7hJRsv8uobofKO3Y0F4//F1uT
 btvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723061471; x=1723666271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLZ4lqFvU7reyKI+X8vObsnSzIH8RciqwfuuOFHsOr4=;
 b=Ba94OJxBjKJsPAtpBo/wf2LZ6hUuU8k1554t0qUEnGx96ClsWuAyZzo9/ILtubmXEI
 e1CttBmSHeXVi8fgE8dl5ekMEAqLVrG3xvesSM/Dw05XRm01OY+D3w6xhY421fOQnOpS
 p4jvUUfeVtryBZAd4ApuvQP6CIV808UMh78xilfngYhUjKrUy7d7wSKphZmGRmIFU1mx
 IeaFDzYTpkedpZSohTp3KesWv2FBX1scB/e+Inn8dCpJVfAMdtIeAVaaX8+As+CcYteZ
 unOn90TBUcKcW5hbzDq9dfOi8lJwLZuciTlkelU5RA8E/TeUo8DiDMcPW+M1pkdL4tNU
 E5cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp2ldGCYP+K5t/mG3RLInIKHOlDV3RSmpKH0uZxttFXlbkW6a1YaTUgsn38lXhMp1wdrHY2RGMmXxB@nongnu.org
X-Gm-Message-State: AOJu0YyHjivJBc3Z7AB/6PK3Ag3Beckn5/3T2tnMrejM7h3JF31pBIhe
 aqbeVImiTku3DrofR4s7LPG/qC09+Bz/g+5QnH0dHoxFyxkzG6hC1uMZxulh42M=
X-Google-Smtp-Source: AGHT+IGcfzcVo/XmFCBzf9lssLxruTN5ELIW7HXg6MPk9QrBX65dUuMKEzhQLMV2xOMHg1IIhCscvw==
X-Received: by 2002:a17:902:e752:b0:1f9:e2c0:d962 with SMTP id
 d9443c01a7336-2008556d389mr45155155ad.31.1723061471367; 
 Wed, 07 Aug 2024 13:11:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff592ad853sm110444645ad.280.2024.08.07.13.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 13:11:11 -0700 (PDT)
Date: Wed, 7 Aug 2024 13:11:09 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Jim Shu <jim.shu@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v3 04/20] target/riscv: save and restore elp state on
 priv transitions
Message-ID: <ZrPU3fwHGV8l0gDT@debug.ba.rivosinc.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-5-debug@rivosinc.com>
 <e2d6dfe2-0c99-4caa-bba9-ce9b1225d0c4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e2d6dfe2-0c99-4caa-bba9-ce9b1225d0c4@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Aug 07, 2024 at 11:06:49AM +1000, Richard Henderson wrote:
>On 8/7/24 10:06, Deepak Gupta wrote:
>>elp state is recorded in *status on trap entry (less privilege to higher
>>privilege) and restored in elp from *status on trap exit (higher to less
>>privilege).
>>
>>Additionally this patch introduces a forward cfi helper function to
>>determine if current privilege has forward cfi is enabled or not based on
>>*envcfg (for U, VU, S, VU, HS) or mseccfg csr (for M). For qemu-user, a
>>new field `ufcfien` is introduced which is by default set to false and
>>helper function returns value deposited in `ufcfien` for qemu-user.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>Co-developed-by: Jim Shu <jim.shu@sifive.com>
>>Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
>>---
>>  target/riscv/cpu.c        |  5 ++++
>>  target/riscv/cpu.h        |  2 ++
>>  target/riscv/cpu_helper.c | 58 +++++++++++++++++++++++++++++++++++++++
>>  target/riscv/op_helper.c  | 18 ++++++++++++
>>  4 files changed, 83 insertions(+)
>>
>>diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>index 82fa85a8d6..e1526c7ab5 100644
>>--- a/target/riscv/cpu.c
>>+++ b/target/riscv/cpu.c
>>@@ -1022,6 +1022,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>      env->load_res = -1;
>>      set_default_nan_mode(1, &env->fp_status);
>>+#ifdef CONFIG_USER_ONLY
>>+    /* qemu-user for riscv, fcfi is off by default */
>>+    env->ufcfien = false;
>>+#endif
>>+
>>  #ifndef CONFIG_USER_ONLY
>>      if (cpu->cfg.debug) {
>>          riscv_trigger_reset_hold(env);
>>diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>index ae436a3179..8c7841fc08 100644
>>--- a/target/riscv/cpu.h
>>+++ b/target/riscv/cpu.h
>>@@ -226,6 +226,7 @@ struct CPUArchState {
>>      cfi_elp      elp;
>>  #ifdef CONFIG_USER_ONLY
>>      uint32_t elf_flags;
>>+    bool ufcfien;
>>  #endif
>>  #ifndef CONFIG_USER_ONLY
>>@@ -530,6 +531,7 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
>>  bool riscv_cpu_vector_enabled(CPURISCVState *env);
>>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
>>  int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
>>+bool cpu_get_fcfien(CPURISCVState *env);
>>  G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>>                                                 MMUAccessType access_type,
>>                                                 int mmu_idx, uintptr_t retaddr);
>>diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>index 6709622dd3..8c69c55576 100644
>>--- a/target/riscv/cpu_helper.c
>>+++ b/target/riscv/cpu_helper.c
>>@@ -33,6 +33,7 @@
>>  #include "cpu_bits.h"
>>  #include "debug.h"
>>  #include "tcg/oversized-guest.h"
>>+#include "pmp.h"
>>  int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
>>  {
>>@@ -63,6 +64,35 @@ int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
>>  #endif
>>  }
>>+bool cpu_get_fcfien(CPURISCVState *env)
>>+{
>>+#ifdef CONFIG_USER_ONLY
>>+    return env->ufcfien;
>>+#else
>>+    /* no cfi extension, return false */
>>+    if (!env_archcpu(env)->cfg.ext_zicfilp) {
>>+        return false;
>>+    }
>
>Keep extension check common between user/system.
>Recall that you can choose -cpu from user as well.

Ack. will put a check (for both extensions)

Side note: ufcfien (or ubcfien) will get set only via syscall prctls which does
check for extension.

>
>>+    /*
>>+     * Interrupt/exception/trap delivery is asynchronous event and as per
>>+     * Zisslpcfi spec CPU should clear up the ELP state. If cfi extension is
>>+     * available, clear ELP state.
>>+     */
>>+
>>+    if (cpu->cfg.ext_zicfilp) {
>>+        env->elp = NO_LP_EXPECTED;
>>+    }
>
>If extension is not available, elp isn't a thing.
>You can just as easily make the store unconditional and save the test.

Yes noted. make sense.

>
>>
>>+    /*
>>+     * If forward cfi enabled for new priv, restore elp status
>>+     * and clear spelp in mstatus
>>+     */
>>+    if (cpu_get_fcfien(env)) {
>>+        env->elp = get_field(env->mstatus, MSTATUS_SPELP);
>>+        env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, 0);
>>+    }
>
>The spec is perhaps poorly written here.  I read
>
>  ... if xPP holds the value y, then ELP is set to the value of xPELP if yLPE is 1;
>  otherwise, it is set to NO_LP_EXPECTED; xPELP is set to NO_LP_EXPECTED.
>
>as xPELP always being cleared, regardless of yLPE.

Yes that's what code above is also doing. restore elp status from SPELP field and clear
it at SPELP.

On `mret` same logic but for MPELP bitposition.

>
>
>r~

