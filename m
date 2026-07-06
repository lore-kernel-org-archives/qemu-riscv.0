Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D7C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 06:14:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgcaG-0004mR-JS; Mon, 06 Jul 2026 02:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wgcaB-0004kh-U9
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 02:13:32 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wgcaA-0007lZ-74
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 02:13:31 -0400
Received: by mail-pj1-x1044.google.com with SMTP id
 98e67ed59e1d1-36b9d265355so1817495a91.2
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 23:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783318409; x=1783923209; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vq0w1E+1RJuXVhbPh5o40ncgrvOoL/BDcPSl1NkuUu4=;
 b=BFH6YGesKY31z2N4jrfd4DTEuI+mlcgM+XJdpcxb5bphKd4ADSeMGjx8ZMcQ2vPA4X
 tazfqB7scYrZTchbRRYMP/oh17MeZA9p/aEgL7FDcK1z51scYayIKjRVXiVF9tGOpgW5
 aqXvYiDoHqcLJ7MFUN/AubndXgKR3IgbJOYFvcRkXx8lTmrEiFlrbrd6EVljr+jkx6hw
 v8cIInSACkU5uAiEwGyYFBHEgcCY+UpEOgUsHkimv9LlertjdoGP4Fu+4K5GrTIVSM/k
 qN7bIc6hTL3NnekREpOJh6F6M38FeZmWQ0l5stJTzws8NT943VfPIiRm25vTI4HfzhW+
 LC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783318409; x=1783923209;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vq0w1E+1RJuXVhbPh5o40ncgrvOoL/BDcPSl1NkuUu4=;
 b=hxYqSHsehs0HjSYm5oGubH7WQxdx7v3XCb1LEjHZus06Nx04W6CE0xuVUT+4OiQg4p
 h7awwnCOlA1w4A4nUTs82CPGICWMdSP0SFrhGXJGvm35rTh20v/LDYLUFNlwKlGctiUv
 +pb9fcbk5sDusYq/8VGUBAprtoF0Iw2JPcHnsbZF4z2hJB9doHiElb5EyA8l1dO5ZSkP
 NJdcgt2evGJzxS2m/iJeBIUrMjrb2xtaRCv2fnCn+PGnCF2HP9dIANlKNtvlwqhUOvGH
 H7VdQjBaj/31VjU2xhv1CDtUC/BhQYwscw4Zd/iYO24fk5qh+wtXq7lMMfDAMoPkzYoq
 M8eg==
X-Gm-Message-State: AOJu0Yw3jncqWfTrdMs/wSUVgn7c05cC+gSf2HbeaxOXa8VD5JQUJfY8
 dVyOepHDd/nielbgc8y85DF37xEllIBo38K4Q2YkZJM/xeWcQN7iOSoM
X-Gm-Gg: AfdE7ckVTuTkYMtJZfc0G3U8YRKhJSJ5+TwWf1wyWpbL03RT89XW7mcelfIZ631DjRh
 PEJPSHH1tU7u47aV/+V+AHNNKDXF8puJ+rj/pkb1j3T/NkuvcQqo8PkZcwwN7seTfnE/IzQoSIN
 eUyiBDPQ+USQTWau5/R3v2mTv/L9niNdJHIoxp3na67mDHK3TdhfURBlINwVGuwWRD0wlmWoS5C
 u+hVaFoR+d2PeUe6OYPgOTOTP+XaTMTz1zwMf6fSzJ6XoK4D72VAHUS3X8lfPcHgHIPzux3os4h
 sO1EilBDLC+gst8c3N6fKD96Tv9TeCmoFeP+2nauWVkFxkr0naGlJ4mMXa2xCks6vcYViaFQR56
 5M5t4D8XDE6DPhv2GbG4R3RZp+PKprvmulUUGSQzgi3ILXYmT6W7DZmxTjlEJdvh5b5kKyeOBdz
 W0UYhwqhGIAXukwQH5aGIya9xkqoX4HwpGa8Dl6JIscaaZN+fH
X-Received: by 2002:a17:90b:3f46:b0:382:1a6f:ba3b with SMTP id
 98e67ed59e1d1-382803b65f9mr8777679a91.5.1783318408439; 
 Sun, 05 Jul 2026 23:13:28 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30f0bc2e119sm49261940eec.28.2026.07.05.23.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 23:13:27 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:13:24 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, 
 Alvin Chang <alvinga@andestech.com>, Yu-Ming Chang <yumin686@andestech.com>, 
 Joel Stanley <joel@jms.id.au>
Subject: Re: [RFC PATCH 02/25] target/riscv/debug: Handle changing trigger
 types
Message-ID: <aktHeE11h_RXWQ29@ChaodeMacBook-Pro.local>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114044701.1173347-3-npiggin@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pj1-x1044.google.com
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

On Wed, Jan 14, 2026 at 02:46:35PM +0800, Nicholas Piggin wrote:
> Updating debug registers will first remove the existing TCG breakpoint /
> watchpoint, then adds it back with new values.
> 
> Writing TDATA1 with a value that changes the trigger type attempts to
> remove the facility for the new trigger type rather than the existing
> one. That is, it will not remove a breakpoint if the type is changed to
> a non-breakpoint type.
> 
> Fix this by removing based on the old trigger type, then inserting based
> on the new type.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  target/riscv/debug.c | 64 +++++++++++++++++++++++---------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 4273ab7a8d..2190c25f23 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -528,23 +528,12 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
>  static void type2_reg_write(CPURISCVState *env, target_ulong index,
>                              int tdata_index, target_ulong val)
>  {
> -    target_ulong new_val;
> -
>      switch (tdata_index) {
>      case TDATA1:
> -        new_val = type2_mcontrol_validate(env, val);
> -        if (new_val != env->tdata1[index]) {
> -            env->tdata1[index] = new_val;
> -            type2_breakpoint_remove(env, index);
> -            type2_breakpoint_insert(env, index);
> -        }
> +        env->tdata1[index] = type2_mcontrol_validate(env, val);
>          break;
>      case TDATA2:
> -        if (val != env->tdata2[index]) {
> -            env->tdata2[index] = val;
> -            type2_breakpoint_remove(env, index);
> -            type2_breakpoint_insert(env, index);
> -        }
> +        env->tdata2[index] = val;
>          break;
>      case TDATA3:
>          env->tdata3[index] = textra_validate(env, val);
> @@ -552,6 +541,8 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
>      default:
>          g_assert_not_reached();
>      }
> +
> +    type2_breakpoint_insert(env, index);
>  }
>  
>  /* type 6 trigger */
> @@ -642,23 +633,12 @@ static void type6_breakpoint_remove(CPURISCVState *env, target_ulong index)
>  static void type6_reg_write(CPURISCVState *env, target_ulong index,
>                              int tdata_index, target_ulong val)
>  {
> -    target_ulong new_val;
> -
>      switch (tdata_index) {
>      case TDATA1:
> -        new_val = type6_mcontrol6_validate(env, val);
> -        if (new_val != env->tdata1[index]) {
> -            env->tdata1[index] = new_val;
> -            type6_breakpoint_remove(env, index);
> -            type6_breakpoint_insert(env, index);
> -        }
> +        env->tdata1[index] = type6_mcontrol6_validate(env, val);
>          break;
>      case TDATA2:
> -        if (val != env->tdata2[index]) {
> -            env->tdata2[index] = val;
> -            type6_breakpoint_remove(env, index);
> -            type6_breakpoint_insert(env, index);
> -        }
> +        env->tdata2[index] = val;
>          break;
>      case TDATA3:
>          env->tdata3[index] = textra_validate(env, val);
> @@ -666,6 +646,7 @@ static void type6_reg_write(CPURISCVState *env, target_ulong index,
>      default:
>          g_assert_not_reached();
>      }
> +    type6_breakpoint_insert(env, index);
>  }
>  
>  /* icount trigger type */
> @@ -831,8 +812,6 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>                  /* set the count to timer */
>                  timer_mod(env->itrigger_timer[index],
>                            env->last_icount + itrigger_get_count(env, index));
> -            } else {
> -                env->itrigger_enabled = riscv_itrigger_enabled(env);
>              }
>          }
>          break;
> @@ -881,12 +860,30 @@ target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>  
>  void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>  {
> -    int trigger_type;
> +    int trigger_type = get_trigger_type(env, env->trigger_cur);
> +    bool check_itrigger = false;
> +
> +    switch (trigger_type) {
> +    case TRIGGER_TYPE_AD_MATCH:
> +        type2_breakpoint_remove(env, env->trigger_cur);
> +        break;
> +    case TRIGGER_TYPE_AD_MATCH6:
> +        type6_breakpoint_remove(env, env->trigger_cur);
> +        break;
> +    case TRIGGER_TYPE_INST_CNT:
> +        /*
> +         * itrigger_enabled is the union of all enabled icount triggers,
> +         * so it's easiest to recheck all if any have changed (removed or
> +         * added or modified).
> +         */
> +        check_itrigger = true;
> +        break;
> +    default:
> +        break;
> +    }
>  
>      if (tdata_index == TDATA1) {
>          trigger_type = extract_trigger_type(env, val);
> -    } else {
> -        trigger_type = get_trigger_type(env, env->trigger_cur);
>      }
>  
>      switch (trigger_type) {
> @@ -898,6 +895,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>          break;
>      case TRIGGER_TYPE_INST_CNT:
>          itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
> +        check_itrigger = true;
>          break;
>      case TRIGGER_TYPE_INT:
>      case TRIGGER_TYPE_EXCP:
> @@ -913,6 +911,10 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>      default:
>          g_assert_not_reached();
>      }
> +
> +    if (check_itrigger && !icount_enabled()) {
> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
> +    }
>  }
>  
>  target_ulong tinfo_csr_read(CPURISCVState *env)
> -- 
> 2.51.0
> 
> 

