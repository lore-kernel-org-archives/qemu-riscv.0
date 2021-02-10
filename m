Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9vwz-00055z-Fv
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 15:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9vwx-00055e-I8; Wed, 10 Feb 2021 15:18:59 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:46304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9vwu-0008Up-Bg; Wed, 10 Feb 2021 15:18:59 -0500
Received: by mail-il1-x133.google.com with SMTP id m20so3039041ilj.13;
 Wed, 10 Feb 2021 12:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hL52ZjdEu4bMy8dDT5rrxbzRtJDWgu57kSwSKCrpLps=;
 b=VVRmeDPHdWg747i01x7hJaHx+dccDXlJSuvk6ODDYA7yO3JAv+FkB3WINIz67Oe+jv
 pJUwSg0Jb30H94MqebGP3FNSF1GArJj9OXO7qVJHcMUK/Paa5WDvuiRbYWaIKpy+ADsw
 oS03rEeB3zxzuIq0wQXTbOIjzkgqSxRPM5bxOp2/JG3hKYzZJiL++pgAlehhX+wzd0Ox
 ev6wPHN9wCbM8Ohe/4hblY37NL1FXgXLH42ZODtDEvPdst7RI2igrLgLAkPW+ngNBNi1
 LLEsIX9MjOXSkh4psFP3ak7VDE0Zr3FulYqrD/2pi8CkZ6MYEiINCHMV4bGBWY++bBNe
 b4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hL52ZjdEu4bMy8dDT5rrxbzRtJDWgu57kSwSKCrpLps=;
 b=tkvY7TFWR5BBR0DNmEm2zDOnYkSkeg36zxSdj9MEM5Q9ZWly6wZmcr5G1Kzf+gubNC
 o5cC0CL4NIekLX8GHaTBrv+gcV0/ImDdfgUOIoGGZ2SjyCyGzOo65sKkrkZAps4h6t8Q
 Jnb7ltej8tbLFDjrZXp6u1hrdAJlnd0g+f12VlyWRJEi288WGSieoTAWVs6k1U1Z6Z0W
 Zcnwmsmv9KOa56JFpazluBByPoBJQAj1yQlkq66q/UkSv4iIc4BjEhGH+7wfs2VAuvV5
 AStoBEl5hSvQlaozW9WJEIcmiXurstkbWMU1hTh+UCl+i4T4LN9pKA7wuAO/XlhqoH/G
 NxrQ==
X-Gm-Message-State: AOAM531rZoz1zqpK6XYlXiVLvKHK9WpXooRwXJTZNwjbDjwPJGGDZ5Ya
 K4ENfStrRZe8o+vpPg/LoPmz5kPNXlNJdcLg//s=
X-Google-Smtp-Source: ABdhPJxJEroAK2OeOjDncBavXYHzDcDvBzBjwGrOeSju/hBVSakPJQuVebs9P83iaxdsbJfioVwUYETZ52S1tCz36gs=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr2630194ild.267.1612988334271; 
 Wed, 10 Feb 2021 12:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20200811002325.46056-1-weiying_hou@outlook.com>
 <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Feb 2021 12:18:18 -0800
Message-ID: <CAKmqyKN21OCw_Y=ZrBOWKYcGVJ8fy4o0LzK5MSLr8y27OesV8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Implementation of enhanced PMP(ePMP) support
To: Hou Weiying <weiying_hou@outlook.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Myriad-Dreamin <camiyoru@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
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
X-List-Received-Date: Wed, 10 Feb 2021 20:18:59 -0000

On Mon, Aug 10, 2020 at 5:24 PM Hou Weiying <weiying_hou@outlook.com> wrote:
>
> The ePMP can be found in:
> https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8/edit#heading=h.9wsr1lnxtwe2
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> ---
>  target/riscv/pmp.c        | 134 ++++++++++++++++++++++++++++++++++----
>  target/riscv/pmp.h        |  12 ++++
>  target/riscv/trace-events |   4 ++
>  3 files changed, 138 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 2a2b9f5363..b1fa703aff 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -34,6 +34,26 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>  static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
>  static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
>
> +static char mode_to_char(int mode)
> +{
> +    char ret = 0;
> +    switch (mode) {
> +    case PRV_U:
> +        ret = 'u';
> +        break;
> +    case PRV_S:
> +        ret = 's';
> +        break;
> +    case PRV_H:
> +        ret = 'h';
> +        break;
> +    case PRV_M:
> +        ret = 'm';
> +        break;
> +    }
> +    return ret;
> +}
> +
>  /*
>   * Accessor method to extract address matching type 'a field' from cfg reg
>   */
> @@ -99,7 +119,28 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
>  static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>  {
>      if (pmp_index < MAX_RISCV_PMPS) {
> -        if (!pmp_is_locked(env, pmp_index)) {
> +        /*
> +         * mseccfg.RLB is set
> +         */
> +        if (MSECCFG_RLB_ISSET(env) ||
> +            /*
> +             * mseccfg.MML is set
> +             */
> +            (MSECCFG_MML_ISSET(env) &&
> +            /*
> +             * m model and not adding X bit
> +             */
> +            (((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) ||
> +             /*
> +              * shared region and not adding X bit
> +              */
> +            ((val & PMP_LOCK) != PMP_LOCK &&
> +            (val & 0x7) != (PMP_WRITE | PMP_EXEC)))) ||
> +            /*
> +             * mseccfg.MML is not set
> +             */
> +            (!MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index))
> +        ){
>              env->pmp_state.pmp[pmp_index].cfg_reg = val;
>              pmp_update_rule(env, pmp_index);
>          } else {
> @@ -230,6 +271,18 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>
>      /* Short cut if no rules */
>      if (0 == pmp_get_num_rules(env)) {
> +        if (MSECCFG_MMWP_ISSET(env)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "pmp violation - %c mode access denied\n",
> +                          mode_to_char(mode));
> +            return false;
> +        }
> +        if (MSECCFG_MML_ISSET(env) && (mode != PRV_M || (privs & PMP_EXEC))) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "pmp violation - %c mode access denied\n",
> +                          mode_to_char(mode));
> +            return false;
> +        }
>          return true;
>      }
>
> @@ -265,16 +318,65 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>          const uint8_t a_field =
>              pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>
> -        /*
> -         * If the PMP entry is not off and the address is in range, do the priv
> -         * check
> -         */
>          if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> -            allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> -            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> -                allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +            /*
> +             * If the PMP entry is not off and the address is in range,
> +             * do the priv check
> +             */
> +            if (!MSECCFG_MML_ISSET(env)) {
> +                /*
> +                 * If mseccfg.MML Bit is not set, do pmp priv check
> +                 */
> +                allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> +                    allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> +                }
> +            } else {
> +                /*
> +                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
> +                 */
> +                if (env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) {
> +                    /*
> +                     * Shared Region
> +                     */
> +                    if ((env->pmp_state.pmp[i].cfg_reg &
> +                    (PMP_READ | PMP_WRITE)) == PMP_WRITE) {
> +                        allowed_privs = PMP_EXEC | ((mode == PRV_M &&
> +                        (env->pmp_state.pmp[i].cfg_reg & PMP_EXEC)) ?
> +                        PMP_READ : 0);
> +                    } else {
> +                        allowed_privs = env->pmp_state.pmp[i].cfg_reg &
> +                        (PMP_READ | PMP_WRITE | PMP_EXEC);
> +
> +                        if (mode != PRV_M && allowed_privs) {
> +                            qemu_log_mask(LOG_GUEST_ERROR,
> +                                "pmp violation - %c mode access denied\n",
> +                                mode_to_char(mode));
> +                            ret = 0;
> +                            break;
> +                        }
> +                    }
> +                } else {
> +                    /*
> +                     * Shared Region
> +                     */
> +                    if ((env->pmp_state.pmp[i].cfg_reg &
> +                        (PMP_READ | PMP_WRITE)) == PMP_WRITE) {
> +                        allowed_privs = PMP_READ | ((mode == PRV_M ||
> +                        (env->pmp_state.pmp[i].cfg_reg & PMP_EXEC)) ?
> +                        PMP_WRITE : 0);
> +                    } else {
> +                        allowed_privs = env->pmp_state.pmp[i].cfg_reg &
> +                        (PMP_READ | PMP_WRITE | PMP_EXEC);
> +                        if (mode == PRV_M && allowed_privs) {
> +                            qemu_log_mask(LOG_GUEST_ERROR,
> +                                    "pmp violation - m mode access denied\n");
> +                            ret = 0;
> +                            break;

This is really hard to follow, I had a lot of trouble wrapping my head
around this and I'm still not sure it's correct.

I feel that a switch satement here would be easier. The spec has a
nice table of all the possible options, for example something like
this:

                if (mode == PRV_M) {
                    switch (epmp_operation) {
                    case 0:
                    case 1:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                        allowed_privs = 0;
                        break;
                    case 2:
                    case 3:
                    case 14:
                        allowed_privs = PMP_READ | PMP_WRITE;
                        break;
                    case 9:
                    case 10:
                        allowed_privs = PMP_EXEC;
                        break;
                    case 11:
                    case 13:
                        allowed_privs = PMP_READ | PMP_EXEC;
                        break;
                    case 12:
                    case 15:
                        allowed_privs = PMP_READ;
                        break;
                    }
                } else {
                    switch (epmp_operation) {
                    case 0:
                    case 8:
                    case 9:
                    case 12:
                    case 13:
                    case 14:
                        allowed_privs = 0;
                        break;
                    case 1:
                    case 10:
                    case 11:
                        allowed_privs = PMP_EXEC;
                        break;
                    case 2:
                    case 4:
                    case 15:
                        allowed_privs = PMP_READ;
                        break;
                    case 3:
                    case 6:
                        allowed_privs = PMP_READ | PMP_WRITE;
                        break;
                    case 5:
                        allowed_privs = PMP_READ | PMP_EXEC;
                        break;
                    case 7:
                        allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
                        break;
                    }
                }

It's a little more verbose, but it should still be fairly quick to compute.

If you want to keep the logic that's also fine, I just think it needs
some simplifiation. Maybe assign read, write, exec variables and just
compare them?

bool read = env->pmp_state.pmp[i].cfg_reg & PMP_READ;
bool write = env->pmp_state.pmp[i].cfg_reg & PMP_WRITE;
bool exec = env->pmp_state.pmp[i].cfg_reg & PMP_EXEC;

Then

if ((env->pmp_state.pmp[i].cfg_reg & (PMP_READ | PMP_WRITE)) == PMP_WRITE) {

becomes

if (write && !read) {

Alistair

> +                        }
> +                    }
> +                }
>              }
> -
>              if ((privs & allowed_privs) == privs) {
>                  ret = 1;
>                  break;
> @@ -288,15 +390,23 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      /* No rule matched */
>      if (ret == -1) {
>          if (mode == PRV_M) {
> -            ret = 1; /* Privileged spec v1.10 states if no PMP entry matches an
> -                      * M-Mode access, the access succeeds */
> +            ret = !MSECCFG_MMWP_ISSET(env); /* PMP Enhancements */
> +            if (MSECCFG_MML_ISSET(env) && (privs & PMP_EXEC)) {
> +                ret = 0;
> +            }
>          } else {
>              ret = 0; /* Other modes are not allowed to succeed if they don't
>                        * match a rule, but there are rules.  We've checked for
>                        * no rule earlier in this function. */
>          }
>      }
> -
> +    if (ret) {
> +        trace_pmp_hart_has_privs_pass_match(
> +            env->mhartid, addr, size, privs, mode);
> +    } else {
> +        trace_pmp_hart_has_privs_violation(
> +            env->mhartid, addr, size, privs, mode);
> +    }
>      return ret == 1 ? true : false;
>  }
>
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 8e19793132..7db2069204 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -36,6 +36,12 @@ typedef enum {
>      PMP_AMATCH_NAPOT /* Naturally aligned power-of-two region */
>  } pmp_am_t;
>
> +typedef enum {
> +    MSECCFG_MML  = 1 << 0,
> +    MSECCFG_MMWP = 1 << 1,
> +    MSECCFG_RLB  = 1 << 2
> +} mseccfg_field_t;
> +
>  typedef struct {
>      target_ulong addr_reg;
>      uint8_t  cfg_reg;
> @@ -58,7 +64,13 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index);
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>      target_ulong val);
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
> +void mseccfg_csr_write(CPURISCVState *env, target_ulong val);
> +target_ulong mseccfg_csr_read(CPURISCVState *env);
>  bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>      target_ulong size, pmp_priv_t priv, target_ulong mode);
>
> +#define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
> +#define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
> +#define MSECCFG_RLB_ISSET(env) get_field(env->mseccfg, MSECCFG_RLB)
> +
>  #endif
> diff --git a/target/riscv/trace-events b/target/riscv/trace-events
> index 4b6c652ae9..4f877f90f7 100644
> --- a/target/riscv/trace-events
> +++ b/target/riscv/trace-events
> @@ -6,3 +6,7 @@ pmpcfg_csr_read(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRI
>  pmpcfg_csr_write(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRIu64 ": write reg%" PRIu32", val: 0x%" PRIx64
>  pmpaddr_csr_read(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": read addr%" PRIu32", val: 0x%" PRIx64
>  pmpaddr_csr_write(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": write addr%" PRIu32", val: 0x%" PRIx64
> +mseccfg_csr_read(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": read mseccfg, val: 0x%" PRIx64
> +mseccfg_csr_write(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": write mseccfg, val: 0x%" PRIx64
> +pmp_hart_has_privs_pass_match(uint64_t mhartid, uint64_t addr, uint64_t size, uint64_t privs, uint64_t mode) "hart %"PRId64 "pass PMP 0 match addr:%"PRIu64" size:%"PRIu64 "privs: %"PRIu64 "mode: %"PRIu64
> +pmp_hart_has_privs_violation(uint64_t mhartid, uint64_t addr, uint64_t size, uint64_t privs, uint64_t mode) "hart %"PRId64 "pass PMP 0 match addr:%"PRIu64" size:%"PRIu64 "privs: %"PRIu64 "mode: %"PRIu64
> --
> 2.20.1
>
>

