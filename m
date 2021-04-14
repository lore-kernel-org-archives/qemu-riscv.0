Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWa3y-0003NS-HI
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 03:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWa3x-0003MD-6y; Wed, 14 Apr 2021 03:35:49 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWa3u-0003LL-LK; Wed, 14 Apr 2021 03:35:48 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x76so11084804ybe.5;
 Wed, 14 Apr 2021 00:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0IVO033htkAs+SD00yK0wtggY2PFYz8zuQtYsOSG430=;
 b=aCDQXiUKtBTFh7ELsl1XwPqVJOsgZcYbZ3VNqLIUAG2OoQZWT29O5iL7DCytOGBjbU
 +2pSBk0e2sr20c42D3rREn60/affNtjrL4MEjqxW2QdNaorlkERjp+dWB3XwEPYY/aqv
 rHCTts52ZRxcJHw5CGskT03ecBFA/0AQUgPKoA1rBiBjnoJVT7td10T8Y/1JUdfjCdzj
 n5rP9PjwqdjhQYjuQg1pybmBHlirQazhXO00dgP44UT/JNnxFvsnvcBksi2LgcmQ/1my
 wjfKraOYUzQdd26NOak9aA+L8hMsjdt6CWSGOZQM5B59krITPiwp2X813lSoGuWvhk+I
 mfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0IVO033htkAs+SD00yK0wtggY2PFYz8zuQtYsOSG430=;
 b=MxCIoyNWP5i/LFqNI3o+/tU0iReQzXYCvB34aEjnKibOtggFK7m66kue9Hi8pY8aze
 9/0BDqNBdDMJcm1Xpx1ZvxPyhwVJxMtW5F26beq85mg0EnmBhX6v0Ap80Yl1hflbXKT+
 /Z/A1i3d7Ur3QPgFdZthVCGnbExlJw/8LLVYg+CHsCeO8wGInfRqVKVxh0nJLwVP55pY
 YZTClRmbIF/kvGUWvrIs/9UaIz12zyHiXx3o8JxDQaAST/kKVTugYRmGn6u4qEX/lE6Z
 nUercFgwTMRS5+zG4KwwXgeDXX6YWmMZ/iqPo3fmGfpRh0PAxqwL/TSDnv2PBkIW++Vb
 FMzg==
X-Gm-Message-State: AOAM532in2xEWUIiMHokPXVV0ATX9B50w3oz6OggITgdCcDkcluzLKA7
 GE5Ts+vpXQoWOybYk3bto7D3p4Rks7oVScs26Ew=
X-Google-Smtp-Source: ABdhPJzqODaesbhQWToIJwGOJWjKXMJhf/Ycuxstw3hJuuEht7GQC74j+ue1AaVoZGeiwjY5BXveqroAGxlY5EyUp+0=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr11548823ybi.306.1618385743951; 
 Wed, 14 Apr 2021 00:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618281655.git.alistair.francis@wdc.com>
 <616cef68b75ec06b77847203efaca16f7efaaf18.1618281655.git.alistair.francis@wdc.com>
In-Reply-To: <616cef68b75ec06b77847203efaca16f7efaaf18.1618281655.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 15:35:32 +0800
Message-ID: <CAEUhbmWPqHLGjXTgojg4r8jn9spanWJbLBJci_s0taRpAbLZHQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 07:35:49 -0000

Hi Alistair,

On Tue, Apr 13, 2021 at 10:42 AM Alistair Francis
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
>  target/riscv/pmp.c | 164 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 152 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index e35988eec2..00f91d074f 100644
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
> +                /* shared region and not adding X bit */
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
> @@ -217,6 +248,32 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>  {
>      bool ret;
>
> +    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +        if (MSECCFG_MMWP_ISSET(env)) {
> +            /*
> +             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> +             * so we default to deny all, even for M-mode.
> +             */
> +            *allowed_privs = 0;
> +            return false;
> +        } else if (MSECCFG_MML_ISSET(env)) {
> +            /*
> +             * The Machine Mode Lockdown (mseccfg.MML) bit is set
> +             * so we can only execute code in M-mode with an applicable
> +             * rule. Other modes are disabled.
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
> +    }
> +
>      if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
>          /*
>           * Privileged spec v1.10 states if HW doesn't implement any PMP entry
> @@ -294,13 +351,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
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
> @@ -328,10 +466,12 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
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
> +                          "ignoring pmpcfg write - PMP config is locked\n");

I think the original log message was for checking register address for
RV64, and should still retain. We should add another branch with a
different log message for the new ePMP check.

> +            return;
> +        }

Regards,
Bin

