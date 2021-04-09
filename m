Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUihe-0004qx-6j
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 00:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUihc-0004qY-Dl; Fri, 09 Apr 2021 00:25:04 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUihX-0001hV-CZ; Fri, 09 Apr 2021 00:25:04 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id l9so5225729ybm.0;
 Thu, 08 Apr 2021 21:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BIfiJCSi9R5qtBqakVa5iseFQy6wq0RnJTqiD/E49eE=;
 b=IFPG7Wb0QXYCVqc7Copez47n4foOh2YRuZcqEm46aXCclbIZ7Tb9rARoLMDhhEeIZS
 kLhLcBeNxSyZ7b1H7Hd7AOM4MHCgSXn8Vl4EBNZXX12oluPOCdOMYu2VYGQEgsoa4+lo
 DNq2Vcig5h5Y48+/v1cm4jO8UrXKhZlVWCrggqIbv12DiMEswIKgFjVebKTcMr1QfB6k
 1G3y4inMBZy04C6xwyQUOJym4cbRnqeXwfdVsDlUHCKUxKZb8heWo7N9JOtasA9jl6sl
 QxQphH4AWDKZQkRbqNpbO/ww55lrKnUYkYSzRjbPyHRzy8PZD72vCKldna7DIyABsSyi
 FJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIfiJCSi9R5qtBqakVa5iseFQy6wq0RnJTqiD/E49eE=;
 b=sRODnu1IoWyzNhLcZvKZLwU2xU9NTWknNsdJwuUAfM/+oR5qCtLmoDgRz0ge2OttEZ
 pALmFaP95Z8rVmQq048UTr42PGlGfqOBOfhy/IwCODgYxQDYBVQRPHDGSMDNgA4BRQic
 aR2o85G5znMToVWf00Hm7uPp6T5EGVTvklQabFBrwAKsHDoeGc18c93rb1ljSO/9kO9Z
 XDGCUIHnj0lYRtLxLwnyaKWh6kWbqzr38LddtoriY3vEe2dYUwzsjRXmaqcFzd84s92Y
 n7H3/NS5ICWB0rbg6l9AYzfCyYLQTCswC+8GI2nFkEqtrZteuu/zno3rp3nz65hEACVI
 +cYg==
X-Gm-Message-State: AOAM532yrIqjFpbWp+3oIFyGU+WgQByOXJXE5FITPKnelyAldPKtSDWy
 9rqW/POWJGBywze6mEhH7EsPHw6ZX1JX5duNXEc=
X-Google-Smtp-Source: ABdhPJz6JxmnMbcArHaICUGJcKM2H8WaQsrX4NIC51Q4dT8KW0t7t278ZL5kcWidrIzxoQRNrTx3uOvYPjPzdN2fl3Q=
X-Received: by 2002:a25:3f07:: with SMTP id m7mr14414816yba.314.1617942297596; 
 Thu, 08 Apr 2021 21:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <3d2dbabe5d5e25c1c88b9fda0bbdd5f154b2993e.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <3d2dbabe5d5e25c1c88b9fda0bbdd5f154b2993e.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 9 Apr 2021 12:24:44 +0800
Message-ID: <CAEUhbmW-hpc2yuDJrrTCjtF_M5PmzNpX2CBZspjCdWvSAQpoRQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Apr 2021 04:25:04 -0000

On Fri, Apr 2, 2021 at 8:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> This commit adds support for ePMP v0.9.1.
>
> The ePMP spec can be found in:
> https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Message-Id: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> [ Changes by AF:
>  - Rebase on master
>  - Update to latest spec
>  - Use a switch case to handle ePMP MML permissions
>  - Fix a few bugs
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 165 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 153 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 1d071b044b..3794c808e8 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -90,11 +90,42 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
>  static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>  {
>      if (pmp_index < MAX_RISCV_PMPS) {
> -        if (!pmp_is_locked(env, pmp_index)) {
> -            env->pmp_state.pmp[pmp_index].cfg_reg = val;
> -            pmp_update_rule(env, pmp_index);
> +        bool locked = true;
> +
> +        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +            /* mseccfg.RLB is set */
> +            if (MSECCFG_RLB_ISSET(env)) {
> +                locked = false;
> +            }
> +
> +            /* mseccfg.MML is not set */
> +            if (!MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
> +                locked = false;
> +            }
> +
> +            /* mseccfg.MML is set */
> +            if (MSECCFG_MML_ISSET(env)) {
> +                /* not adding execute bit */
> +                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
> +                    locked = false;
> +                }
> +                 /* shared region and not adding X bit*/

nits: /* is not aligned, and a space is needed before */

> +                if ((val & PMP_LOCK) != PMP_LOCK &&
> +                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
> +                    locked = false;
> +                }
> +            }
>          } else {
> +            if (!pmp_is_locked(env, pmp_index)) {
> +                locked = false;
> +            }
> +        }
> +
> +        if (locked) {
>              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
> +        } else {
> +            env->pmp_state.pmp[pmp_index].cfg_reg = val;
> +            pmp_update_rule(env, pmp_index);
>          }
>      } else {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -217,6 +248,33 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>  {
>      bool ret;
>
> +    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +        if (MSECCFG_MMWP_ISSET(env)) {
> +            /*
> +             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> +             * so we default to deny all, even for M mode.

nits: M-mode

> +             */
> +            *allowed_privs = 0;
> +            return false;
> +        } else if (MSECCFG_MML_ISSET(env)) {
> +            /*
> +             * The Machine Mode Lockdown (mseccfg.MML) bit is set
> +             * so we can only execute code in M mode with an applicable

nits: M-mode

> +             * rule.
> +             * Other modes are disabled.

nits: this line can be put in the same line of "rule."

> +             */
> +            if (mode == PRV_M && !(privs & PMP_EXEC)) {
> +                ret = true;
> +                *allowed_privs = PMP_READ | PMP_WRITE;
> +            } else {
> +                ret = false;
> +                *allowed_privs = 0;
> +            }
> +
> +            return ret;
> +        }

If I understand the spec correctly, I think we are missing a branch to
handle MML unset case, in which RWX is allowed in M-mode.

> +    }
> +
>      if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
>          /*
>           * Privileged spec v1.10 states if HW doesn't implement any PMP entry
> @@ -294,13 +352,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>              pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>
>          /*
> -         * If the PMP entry is not off and the address is in range, do the priv
> -         * check
> +         * Convert the PMP permissions to match the truth table in the
> +         * ePMP spec.
>           */
> +        const uint8_t epmp_operation =
> +            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> +            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> +            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> +            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
> +
>          if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> -            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> -            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> -                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +            /*
> +             * If the PMP entry is not off and the address is in range,
> +             * do the priv check
> +             */
> +            if (!MSECCFG_MML_ISSET(env)) {
> +                /*
> +                 * If mseccfg.MML Bit is not set, do pmp priv check
> +                 * This will always apply to regular PMP.
> +                 */
> +                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> +                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +                }
> +            } else {
> +                /*
> +                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
> +                 */
> +                if (mode == PRV_M) {
> +                    switch (epmp_operation) {
> +                    case 0:
> +                    case 1:
> +                    case 4:
> +                    case 5:
> +                    case 6:
> +                    case 7:
> +                    case 8:
> +                        *allowed_privs = 0;
> +                        break;
> +                    case 2:
> +                    case 3:
> +                    case 14:
> +                        *allowed_privs = PMP_READ | PMP_WRITE;
> +                        break;
> +                    case 9:
> +                    case 10:
> +                        *allowed_privs = PMP_EXEC;
> +                        break;
> +                    case 11:
> +                    case 13:
> +                        *allowed_privs = PMP_READ | PMP_EXEC;
> +                        break;
> +                    case 12:
> +                    case 15:
> +                        *allowed_privs = PMP_READ;
> +                        break;
> +                    }
> +                } else {
> +                    switch (epmp_operation) {
> +                    case 0:
> +                    case 8:
> +                    case 9:
> +                    case 12:
> +                    case 13:
> +                    case 14:
> +                        *allowed_privs = 0;
> +                        break;
> +                    case 1:
> +                    case 10:
> +                    case 11:
> +                        *allowed_privs = PMP_EXEC;
> +                        break;
> +                    case 2:
> +                    case 4:
> +                    case 15:
> +                        *allowed_privs = PMP_READ;
> +                        break;
> +                    case 3:
> +                    case 6:
> +                        *allowed_privs = PMP_READ | PMP_WRITE;
> +                        break;
> +                    case 5:
> +                        *allowed_privs = PMP_READ | PMP_EXEC;
> +                        break;
> +                    case 7:
> +                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                        break;
> +                    }
> +                }
>              }
>
>              ret = ((privs & *allowed_privs) == privs);
> @@ -328,10 +467,12 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>
>      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>
> -    if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "ignoring pmpcfg write - incorrect address\n");
> -        return;
> +    if (!riscv_feature(env, RISCV_FEATURE_EPMP) || !MSECCFG_RLB_ISSET(env)) {
> +        if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "ignoring pmpcfg write - incorrect address\n");

If ePMP RLB is off, this log message is inaccurate and misleading.

> +            return;
> +        }
>      }
>
>      for (i = 0; i < sizeof(target_ulong); i++) {
> --

Regards,
Bin

