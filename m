Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9XiE-00084Q-Ew
	for mharc-qemu-riscv@gnu.org; Tue, 09 Feb 2021 13:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9Xi9-0007xB-PA; Tue, 09 Feb 2021 13:26:05 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:37944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9Xi7-0007C6-Fs; Tue, 09 Feb 2021 13:26:05 -0500
Received: by mail-io1-xd35.google.com with SMTP id f6so19830689ioz.5;
 Tue, 09 Feb 2021 10:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsQwNsZ+5CAujTltISM8JCX1eRo60pQoaIPULqlU6Lc=;
 b=VTUP/jHI3l2ioEnP25ou8nOfgRzbutrkOXj9X7oDISw8ezWCqG1jOlK/7awa0Wj7GJ
 4Tt+Ku1CmBMmA4+It8kH3wbJk1T/1fn6XnkxFLC97NdxqcUN//dfxLk+5OuYiU6WFFB3
 jU1j4qE55bw5bcfKv6YvAdDFb7Xb6nhKwXqJnGH8zk3N9C+JSw8EoJ0tGG14pXOz8uaf
 8OH+4ymesCFkm/3p1z+isE5qWc729yfcJUFcQEkWbV9e4fL9qFsN+VUEbn/7bphyijr8
 p7iU2JJu+wNWWaU9hXL7z3leoDZEdZO2r3Nb8vAxwmqEHzAQVXRqrZXNKfludQtbetYW
 WX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsQwNsZ+5CAujTltISM8JCX1eRo60pQoaIPULqlU6Lc=;
 b=rb4Jiq620+0b9Mj0bV/wwRVRTjc9+MP+zjObmHMzsHcNhSTJ4QjNkPF6MQYdJjbtkT
 /pHCsDzz8KVG89P/E2jWtHRYZRMtk9D+vhXq2AYBaVqv4SaVCSonUafD1hKP0Cn/Glih
 i8b4wPgXTkHYXbeQodN+wIYHjf23VEWAQJ2QugbF19d5TTh24CA+ptG8kDDM+7c9gSGm
 TcjkEAd2jaluhsJrFBNZPB3X/D28zWqZUPDNOVa5nfe0vfQgLSeNtIw35S4vz04c1MLY
 XYhPNyXE2ET6H5fJA6TEeWAizK4OmMHoOe+seZTks4LZ+H+tyw6JHyIygvxKUsdi5dhv
 rNZw==
X-Gm-Message-State: AOAM532R1P5YJ/lumq0Bef72WOEQTa/nNb1iNXT1NnhbAhpqCo1CJ7rm
 EYu9RM16QEyApz/jTT+M3QXbGx5YgtgU375My38=
X-Google-Smtp-Source: ABdhPJx6l75LUHMgvAZa7q+OtOu8Vbz1pmdhN3AcpgKrPmAo0nirByu+2CLwjsFgaIhABK1TDfQ59UDNk35Z28QN8uc=
X-Received: by 2002:a05:6638:3c8:: with SMTP id
 r8mr23425018jaq.135.1612895161971; 
 Tue, 09 Feb 2021 10:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20200811002325.46056-1-weiying_hou@outlook.com>
 <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Feb 2021 10:25:28 -0800
Message-ID: <CAKmqyKO7djD7eGWYaDsNxoSpyfk1ZVhL2osh2fcrLoqh9WhTkw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 09 Feb 2021 18:26:06 -0000

On Mon, Aug 10, 2020 at 5:24 PM Hou Weiying <weiying_hou@outlook.com> wrote:
>
> The ePMP can be found in:
> https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8/edit#heading=h.9wsr1lnxtwe2
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>

Thanks for the patch!

I haven't forgotten about this. I have been hoping that the CSR
addresses would be finalised so then this can be merged. Unfortunately
that still hasn't happened!

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

These can just be single line comments instead of three.

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

This fails to compile as the `target_ulong mseccfg` variable has not
been added in this patch.

Alistair

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

