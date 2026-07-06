Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492D5C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 06:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgcak-00053U-Oy; Mon, 06 Jul 2026 02:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wgcag-00050u-O3
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 02:14:02 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wgcaf-0007nY-4n
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 02:14:02 -0400
Received: by mail-pj1-x1042.google.com with SMTP id
 98e67ed59e1d1-37defb2f231so1688811a91.2
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783318440; x=1783923240; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LC4i6Rn70QJclSXE79Emy/z1KOJHaUpm3Xya2Fn3rzg=;
 b=E2bGXFed6GGpCQGkuljAAwhzOvxwlDSsh6FhTtJ/BdzhoA1aMdNmSpd3aq7mPiyF5L
 5D/Yv0P9+RFKy+7KjGqCNlfFmdnDXYsRbv+ShfDUWyh0ZvjvF1Q0xCqRPlKclJWzlwO8
 +4gLQj/pY2eUzIWkObcBubYKNULjzcSHBzuCKiCn/t8QHu+MLtDVJpOCnLqMk6tmhpMI
 seEKVL5OZOgilcHf07lt4hJBElV4cODw9NyXcg86VxZRWPYXF7Ba2X0G8Mk+zyaHOd6z
 eu6aYqLgnYnBPyefvnagWiNCYxDIuGdeH9RdU1OPAD15bHa0Ccxm88PSzKz8O3eqvx/N
 XCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783318440; x=1783923240;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LC4i6Rn70QJclSXE79Emy/z1KOJHaUpm3Xya2Fn3rzg=;
 b=BmCj7lfTmB23GBi6gCaxOFrgPylvGwqF3N2ahVJHZ1bJyhlM3l4W5ml6bWNSNyx1Il
 1XkcdKcDTvaeX8+zy7mwlpAhrJxtkb6nhaDmezcDrwYxSX/HE0/1kSE11rFb+R+JwJ97
 pUvzT015vtU8fU0/Exri7RjjdiohGk/rzahQ2La8rA21MzQ4Cx4oLjwRANBXfp25PvJy
 T8h4vMBhFo3PC5796CCRQROBz1broiDTO1GQXLm0+kSWC1fFeP5FgZSmRvqZWpUSv57/
 j8/PRYa2EAVq1y9dma2iCSnoT9OfbaCbtUwnyERK2Gl1k9yt5l0tFVqPPhhtX/wD4CES
 4fGA==
X-Gm-Message-State: AOJu0YwElpnur5Ttc5lejq/TSZh1yY4XJgrv2PT8dVDD+AK+NpDYKach
 IMtFbD6dVb0Jlqf6mkvDyMpC5kuLyLt5vOKrM8NqiJL8cGrWqw7KlQQb
X-Gm-Gg: AfdE7cnoE53ix1zpkfWNPD7WENvSi6lD+C1+r16iCnPBb/6cE0QEbl4u6+xyMeDcVJp
 kP64mLTwh6qm25SJa4cInk1pNHZ3Vpv16OlKjwxIrc+1cboxyAuuOsAomWlh8jsqS88CjxPd0vE
 ksYSnGcTiwWiDlirsne5byrEDIPxJN/PYROuJu1wb65Ip/YuuSZhveLqZ/MjzbBFoLVw1K6JgSH
 QKZNP2jJ04H+yVV0Z6lOfHh183RPe8VliRmE2GqQG9eYLMgUCbN96AioGDaiLt7F+7xkp8FU0Lg
 EFH20BS3+12QRdtlC+kPmo8wnCkP5bDY6DQoRU/BAr3hzytk6w/+sOSDR4pbm2JYNm41IuVHjQ1
 dZx2//31WapKjkiPGUIOlTOdsw0ChxQ/OQEI86Crwpyhuft6LsSP6z2gDyV0gwO660CayhnpLxn
 N4C0ODBEyBz438jdAigdfE0QLU4023OvzXoOgZ+1Am41gj5ZMzEHMZSrxtUnQ=
X-Received: by 2002:a17:90a:e7c4:b0:37c:607b:2cd9 with SMTP id
 98e67ed59e1d1-3825c4072c0mr8284677a91.0.1783318439656; 
 Sun, 05 Jul 2026 23:13:59 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30f376bf710sm29185120eec.6.2026.07.05.23.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 23:13:59 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:13:56 +0800
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
Subject: Re: [RFC PATCH 03/25] target/riscv/debug: Implement permissive type
 unavailable trigger
Message-ID: <aktHmmmRu6cb_Jav@ChaodeMacBook-Pro.local>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114044701.1173347-4-npiggin@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pj1-x1042.google.com
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

On Wed, Jan 14, 2026 at 02:46:36PM +0800, Nicholas Piggin wrote:
> When a trigger type is "disabled", tdata2 and tdata3 must accept values
> that are valid for some supported trigger type. Additionally, writing 0
> to tdata1 must result in the type becoming "disabled". This is important
> for the prescribed sequences for updating triggers.
> 
> Implement write tdata=0 -> disabled behaviour and permissive accepting
> of tdata2/3 values in disabled state. This implementation could be
> improved by checking tdata2/3 values against supported trigger types,
> but it is good enough to be usable by software.
> 
> From the RISC-V Debug Specification for tdata1:
> 
>   Writing 0 to this register must result in a trigger that is disabled.
>   If this trigger supports multiple types, then the hardware should
>   disable it by changing type to 15.
> 
> and, when type=15:
> 
>   This trigger is disabled. In this state, tdata2 and tdata3 can be
>   written with any value that is supported for any of the types this
>   trigger implements.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  target/riscv/debug.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 2190c25f23..c92bd9860e 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -827,6 +827,28 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>      }
>  }
>  
> +static void anytype_reg_write(CPURISCVState *env, target_ulong index,
> +                              int tdata_index, target_ulong val)
> +{
> +    /*
> +     * This should check the value is valid for at least one of the supported
> +     * trigger types.
> +     */
> +    switch (tdata_index) {
> +    case TDATA1:
> +        env->tdata1[env->trigger_cur] = val;
> +        break;
> +    case TDATA2:
> +        env->tdata2[env->trigger_cur] = val;
> +        break;
> +    case TDATA3:
> +        env->tdata3[env->trigger_cur] = val;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static int itrigger_get_adjust_count(CPURISCVState *env)
>  {
>      int count = itrigger_get_count(env, env->trigger_cur), executed;
> @@ -883,6 +905,10 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>      }
>  
>      if (tdata_index == TDATA1) {
> +        if (val == 0) {
> +            /* special case, writing 0 results in disabled trigger */
> +            val = build_tdata1(env, TRIGGER_TYPE_UNAVAIL, 0, 0);
> +        }
>          trigger_type = extract_trigger_type(env, val);
>      }
>  
> @@ -897,6 +923,9 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>          itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
>          check_itrigger = true;
>          break;
> +    case TRIGGER_TYPE_UNAVAIL:
> +        anytype_reg_write(env, env->trigger_cur, tdata_index, val);
> +        break;
>      case TRIGGER_TYPE_INT:
>      case TRIGGER_TYPE_EXCP:
>      case TRIGGER_TYPE_EXT_SRC:
> @@ -904,7 +933,6 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>                        trigger_type);
>          break;
>      case TRIGGER_TYPE_NO_EXIST:
> -    case TRIGGER_TYPE_UNAVAIL:
>          qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
>                        trigger_type);
>          break;
> -- 
> 2.51.0
> 
> 

