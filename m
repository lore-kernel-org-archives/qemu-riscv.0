Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ostyK-0001Wh-T9
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 17:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ostyJ-0001WD-5D; Wed, 09 Nov 2022 17:55:03 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ostyG-00074h-No; Wed, 09 Nov 2022 17:55:02 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so4360129pjh.1; 
 Wed, 09 Nov 2022 14:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jFkOUy8lCD/kbfS+P0+IU5rEJw0iz80Fw1Cf9zRP7i0=;
 b=gUAuiPZQ/RB6CjdWpn7BdkZ1jOHs3ClyooX+YcFCI4RbtS9Ml+U/TG37CbAvnKl2Qe
 D6MsoIXOMHI91GgtgxnOp19HXl/Tc2gppQ7skERMz5Pkku87At+vMhUvOczbs8beu2oQ
 tm/1ZUQBvKTQ83M/QvYC9xr7/6OkFeqrY1z8CMQ64226AeLfcv1gcb8FXVaNB3KHRb8n
 +bOlcJf2HrWctys2zBI0vhgo0aS9m8r1r0fvwxvGN+Y7Zk6UmRw75z5aHTc0SCxNiSWc
 h1oHOg41hOcMB8aJFmNRcMTvbJqnLjjyo9qSn+S0TZu4g+haot4Js4drJguG1Ei7/uIH
 fncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFkOUy8lCD/kbfS+P0+IU5rEJw0iz80Fw1Cf9zRP7i0=;
 b=ljnC85uR9VPVuxrxUok/jg8Up2A7n1xWT3bxDsn8jseRiyn+YcX6LNOf4vxkwOjtry
 gIL1IAqvt2bGbvPGeEhaLJTznYUH6dQMwC+uWHCSgWq9H0yUH1SSHnL+QRWPeGc3ynjq
 pWupvU2wOGPMdvKLP/jXnmn4jJOWdCOVE63wrqtwYY7K+xbTMR+mdD7sNXWd4F9AQ33U
 rAQS87W3yUOdNIWdN9Ud4dKVCYqzWWjNXr8NP1cLpGWFe66R7feEEct/zFvalLsWii9N
 yjOyRqFflga95mWubXDa9tGSokHwqIVluBPHx3sC2UI9XvCZUq0vM5j4sIRe0b+Uu1w0
 pqlQ==
X-Gm-Message-State: ACrzQf2dWP2f47sqtj8asOFDWuJuib5ENFWlCHsQd+k/+Obt9bSYfsIQ
 kdKiTqPdXSq243I6eJ5/xM97h+EPd012ovzUqm0=
X-Google-Smtp-Source: AMsMyM4glnlm4nVRgfc6naH2I5nG6nvjSDmcHQwUod8GQJugUQ91JzPPys5SQvWGNZkKsAsEQjLrqQFAZuVORaXUpW0=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr57116941pll.149.1668034498518; Wed, 09
 Nov 2022 14:54:58 -0800 (PST)
MIME-Version: 1.0
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-4-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221013062946.7530-4-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 08:54:32 +1000
Message-ID: <CAKmqyKNmdGvQ7J6KbYcNp3E2N--Hs33egmFw3=Xo85mp6AV_FA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] target/riscv: Enable native debug itrigger
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, sergey.matyukevich@syntacore.com, 
 vladimir.isaev@syntacore.com, anatoly.parshintsev@syntacore.com, 
 philipp.tomsich@vrull.eu, zhiwei_liu@c-sky.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 09 Nov 2022 22:55:03 -0000

On Thu, Oct 13, 2022 at 4:38 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> When QEMU is not in icount mode, execute instruction one by one. The
> tdata1 can be read directly.
>
> When QEMU is in icount mode, use a timer to simulate the itrigger. The
> tdata1 may be not right because of lazy update of count in tdata1. Thus,
> We should pack the adjusted count into tdata1 before read it back.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/debug.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 5ff70430a1..db7745d4a3 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -626,10 +626,80 @@ void riscv_itrigger_update_priv(CPURISCVState *env)
>      riscv_itrigger_update_count(env);
>  }
>
> +static target_ulong itrigger_validate(CPURISCVState *env,
> +                                      target_ulong ctrl)
> +{
> +    target_ulong val;
> +
> +    /* validate the generic part first */
> +    val = tdata1_validate(env, ctrl, TRIGGER_TYPE_INST_CNT);
> +
> +    /* validate unimplemented (always zero) bits */
> +    warn_always_zero_bit(ctrl, ITRIGGER_ACTION, "action");
> +    warn_always_zero_bit(ctrl, ITRIGGER_HIT, "hit");
> +    warn_always_zero_bit(ctrl, ITRIGGER_PENDING, "pending");
> +
> +    /* keep the mode and attribute bits */
> +    val |= ctrl & (ITRIGGER_VU | ITRIGGER_VS | ITRIGGER_U | ITRIGGER_S |
> +                   ITRIGGER_M | ITRIGGER_COUNT);
> +
> +    return val;
> +}
> +
> +static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
> +                               int tdata_index, target_ulong val)
> +{
> +    target_ulong new_val;
> +
> +    switch (tdata_index) {
> +    case TDATA1:
> +        /* set timer for icount */
> +        new_val = itrigger_validate(env, val);
> +        if (new_val != env->tdata1[index]) {
> +            env->tdata1[index] = new_val;
> +            if (icount_enabled()) {
> +                env->last_icount = icount_get_raw();
> +                /* set the count to timer */
> +                timer_mod(env->itrigger_timer[index],
> +                          env->last_icount + itrigger_get_count(env, index));
> +            }
> +        }
> +        break;
> +    case TDATA2:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "tdata2 is not supported for icount trigger\n");
> +        break;
> +    case TDATA3:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "tdata3 is not supported for icount trigger\n");
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return;
> +}
> +
> +static int itrigger_get_adjust_count(CPURISCVState *env)
> +{
> +    int count = itrigger_get_count(env, env->trigger_cur), executed;
> +    if ((count != 0) && check_itrigger_priv(env, env->trigger_cur)) {
> +        executed = icount_get_raw() - env->last_icount;
> +        count += executed;
> +    }
> +    return count;
> +}
> +
>  target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>  {
> +    int trigger_type;
>      switch (tdata_index) {
>      case TDATA1:
> +        trigger_type = extract_trigger_type(env, env->tdata1[env->trigger_cur]);
> +        if ((trigger_type == TRIGGER_TYPE_INST_CNT) && icount_enabled()) {
> +            return deposit64(env->tdata1[env->trigger_cur], 10, 14,
> +                             itrigger_get_adjust_count(env));
> +        }
>          return env->tdata1[env->trigger_cur];
>      case TDATA2:
>          return env->tdata2[env->trigger_cur];
> @@ -658,6 +728,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
>          type6_reg_write(env, env->trigger_cur, tdata_index, val);
>          break;
>      case TRIGGER_TYPE_INST_CNT:
> +        itrigger_reg_write(env, env->trigger_cur, tdata_index, val);
> +        break;
>      case TRIGGER_TYPE_INT:
>      case TRIGGER_TYPE_EXCP:
>      case TRIGGER_TYPE_EXT_SRC:
> --
> 2.17.1
>
>

