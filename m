Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1SLS-0000ZO-BP
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 08:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1SLQ-0000UP-Fm; Wed, 15 Jun 2022 08:42:00 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1SLO-0004CG-QF; Wed, 15 Jun 2022 08:42:00 -0400
Received: by mail-qt1-x82b.google.com with SMTP id k18so8020714qtm.9;
 Wed, 15 Jun 2022 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1kTb++hblPqj+QKqKxTz7xHVqnxYGPonUeqmO3XIhk=;
 b=KxjIlCJhqSghVwfHqvHFH0k1FLT+oAwYGxJd+x2b50boS0VAMYEkG8H4U5VVf+pGF2
 hqTG7H7/8t2ixrGJHTNEq4DyoqtJ9d1dfiT78FZfwEchtGQSSn5HEQBe3TcOsIvPT4Lw
 WDxYyDUhVQyggMRfDxvuC3Sj3DfEYYiGcnnUqRoxSu5DN9gVt3Q3Y7IS8410kFWSdKSg
 X5rLA/2EvxlV6a8eEumWn3/0K4kN3za6qrramDKN3aKY2WywQelgzgTfkGST24rpxvSr
 K5Qv4SEGs7Vxjn6s1+X31pnkK/F0fMbxtNRbQA3NuUnAuk/Y9Sq/BMKkXcAXyzkd9GXU
 lIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1kTb++hblPqj+QKqKxTz7xHVqnxYGPonUeqmO3XIhk=;
 b=SNn+Wo9L47ZPIhFxuBJbqHKLMQYcU+SiLXPm5YMIKVSjknN+YnPdRYmU33iYOFWfI8
 +nE/uIPkqPGk91XeACPvALQEiWhEsR9I4LUYXVtv437Hd4b1v5JYqu9DTFT+0ucYj96s
 d5JZMiH6e85M/5R7oAj+HegJclU8mRpp53c09A1qO85MuuvH3dNFDbmuHIQ0tH0gmaay
 6hd2ucl8TqTiT2jRSgLFgIJ5dqLrFckat3nLlxxByC48s/SLTH/zqqhHo9gimt/W6WIW
 +TWyJ61i2r1P7vKrQVHs5GY2/2LHx82iB9UHDrTicQ08tjejXQrrgJoZwTJLoF7+579a
 niVQ==
X-Gm-Message-State: AOAM532KcQjAcEUJZYn2ZBUX2Fu3sBQkgL7HMMKZ6qBxmitRzlq9Qs4f
 Ms3tRQ36HpJUCBT8PG1ZFbZJlyZXNl5mANJ5X78=
X-Google-Smtp-Source: ABdhPJzXgQUHn1awOkcuuaQBvVlsTsncocWPuD6VYEM+oR7y+7d3Awpgxo0laSMDo9a09JjA8Un/WJ6XcdU+PxnOYMA=
X-Received: by 2002:a05:622a:353:b0:304:fdcd:b9b9 with SMTP id
 r19-20020a05622a035300b00304fdcdb9b9mr8472798qtw.276.1655296917136; Wed, 15
 Jun 2022 05:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-7-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-7-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 20:41:45 +0800
Message-ID: <CAEUhbmWv7OFzSeXQoPX1w=5LDtOP-sWHDzxuhqg5VHWbeQDnEQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] target/riscv: debug: Create common trigger actions
 function
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 12:42:00 -0000

On Fri, Jun 10, 2022 at 1:21 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Trigger actions are shared among all triggers. Extract to a common
> function.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/debug.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
>  target/riscv/debug.h | 13 +++++++++++
>  2 files changed, 66 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 1668b8abda..ab23566113 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -91,6 +91,35 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
>      return extract_trigger_type(env, env->tdata1[trigger_index]);
>  }
>
> +static trigger_action_t get_trigger_action(CPURISCVState *env,
> +                                           target_ulong trigger_index)
> +{
> +    target_ulong tdata1 = env->tdata1[trigger_index];
> +    int trigger_type = get_trigger_type(env, trigger_index);
> +    trigger_action_t action = DBG_ACTION_NONE;
> +
> +    switch (trigger_type) {
> +    case TRIGGER_TYPE_AD_MATCH:
> +        action = (tdata1 & TYPE2_ACTION) >> 12;
> +        break;
> +    case TRIGGER_TYPE_INST_CNT:
> +    case TRIGGER_TYPE_INT:
> +    case TRIGGER_TYPE_EXCP:
> +    case TRIGGER_TYPE_AD_MATCH6:
> +    case TRIGGER_TYPE_EXT_SRC:
> +        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
> +                      trigger_type);
> +        break;
> +    case TRIGGER_TYPE_NO_EXIST:
> +    case TRIGGER_TYPE_UNAVAIL:
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return action;
> +}
> +
>  static inline target_ulong build_tdata1(CPURISCVState *env,
>                                          trigger_type_t type,
>                                          bool dmode, target_ulong data)
> @@ -181,6 +210,28 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
>      }
>  }
>
> +static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
> +{
> +    trigger_action_t action = get_trigger_action(env, trigger_index);
> +
> +    switch (action) {
> +    case DBG_ACTION_BP:
> +        riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +        break;
> +    case DBG_ACTION_DBG_MODE:
> +    case DBG_ACTION_TRACE0:
> +    case DBG_ACTION_TRACE1:
> +    case DBG_ACTION_TRACE2:
> +    case DBG_ACTION_TRACE3:
> +    case DBG_ACTION_EXT_DBG0:
> +    case DBG_ACTION_EXT_DBG1:
> +        qemu_log_mask(LOG_UNIMP, "action: %d is not supported\n", action);
> +        break;

case DBG_ACTION_NONE should be added here as get_trigger_action() may
return such value

> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  /* type 2 trigger */
>
>  static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
> @@ -381,11 +432,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>      if (cs->watchpoint_hit) {
>          if (cs->watchpoint_hit->flags & BP_CPU) {
>              cs->watchpoint_hit = NULL;
> -            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +            do_trigger_action(env, DBG_ACTION_BP);
>          }
>      } else {
>          if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
> -            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
> +            do_trigger_action(env, DBG_ACTION_BP);
>          }
>      }
>  }
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 9f69c64591..0e4859cf74 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -44,6 +44,19 @@ typedef enum {
>      TRIGGER_TYPE_NUM
>  } trigger_type_t;
>
> +/* actions */
> +typedef enum {
> +    DBG_ACTION_NONE = -1,           /* sentinel value */
> +    DBG_ACTION_BP = 0,
> +    DBG_ACTION_DBG_MODE,
> +    DBG_ACTION_TRACE0,
> +    DBG_ACTION_TRACE1,
> +    DBG_ACTION_TRACE2,
> +    DBG_ACTION_TRACE3,
> +    DBG_ACTION_EXT_DBG0 = 8,
> +    DBG_ACTION_EXT_DBG1
> +} trigger_action_t;
> +
>  /* tdata1 field masks */
>
>  #define RV32_TYPE(t)    ((uint32_t)(t) << 28)

Regards,
Bin

