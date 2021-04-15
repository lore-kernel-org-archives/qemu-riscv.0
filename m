Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWtRf-0005xu-4r
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 00:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtRe-0005wd-1K; Thu, 15 Apr 2021 00:17:34 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWtRb-0002uW-SF; Thu, 15 Apr 2021 00:17:33 -0400
Received: by mail-io1-xd33.google.com with SMTP id p8so1525383iol.11;
 Wed, 14 Apr 2021 21:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=djs7x6dJqj53t2sbEOoQZH+WgUI363+nwuOPFtr3pZk=;
 b=Lp5gg1Z7c8vS7EuNu1GXHsKESi9eNAZHnmjjxritO8f33om2o/aKtlSQ0U7FULMOXR
 78g9BSjnr+0oi8bMKmJK//YUYtN2I/wswCbcJzeMH/gyU8hCNXNDl//NS9t+S47qg/Yt
 i+xa/cTrBLZcqTwWirzKm5ZDohoH8ltOVXZqzW62VO/VA7AcK4rGgc2VUTOP4MdGGfs0
 q8VKuCphQHF71B5+tBseDNm/W/ESP2UdHoqtU1psYeO55fTgoYM9yb/LAxdoE/SbiVu0
 mGjgYkow/Q7Vbc3BlB17NnZy5A0zRuW5lYdxzpBn5pjyjqlu34Yb8lMZYTZjlqLajKj6
 S7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=djs7x6dJqj53t2sbEOoQZH+WgUI363+nwuOPFtr3pZk=;
 b=pshXRKTVwvNRVC/KaEn+jBwoRUw15KF+pDQ4F6J6PROn1udghjXZv7Xt5MuaMod4Gh
 16uDNCoeSrt+6BUsD4cq2EvRuRLdJJio7UQATZFVdsb3exFP4Hbmmi0x+8ks05WScoGo
 DcWFKbXaKwxzqnt/RvOmA9AHOyfyhkxiLjU/5Sk6zXaLg96uVwS9GKPkfGNZqYtiHGS3
 dBGDC3Zu6vjWyWxOaB3Nb9M1/KQGgCsZnqTxxTdVI+MbN8lntEy6+uoDqD9/+dh5DjQG
 z0soUklZIPMU+rmDm5xQOaCUB6o7Zfy5gWR/uNDRt/HTNpgDiVH8trUcJMXcc0Bu1moc
 DxKQ==
X-Gm-Message-State: AOAM531yH4P0ClHMfT5fNp7kn0CN7ttlVIyQ7yQShyNSn0CSYWYEw2go
 JFGxD8K9WCbGA3L+dPHZEkQ3Uulmoj4N/bYuUjo=
X-Google-Smtp-Source: ABdhPJyUDrSyAk/MVjEqm6CLkGRxOVyJLj1k7PTvhPhAKGU0pG5XV1Sbj6skoBKG6TawfE6Wlc+tZ5B+A+1qSTzR35E=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr1120081ion.176.1618460250309; 
 Wed, 14 Apr 2021 21:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618281655.git.alistair.francis@wdc.com>
 <616cef68b75ec06b77847203efaca16f7efaaf18.1618281655.git.alistair.francis@wdc.com>
 <CAEUhbmWPqHLGjXTgojg4r8jn9spanWJbLBJci_s0taRpAbLZHQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWPqHLGjXTgojg4r8jn9spanWJbLBJci_s0taRpAbLZHQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 14:17:03 +1000
Message-ID: <CAKmqyKPuXJyqWWMLbMGrj4TUMdwQOPFWD_pcxQo_pzu4EgqnYw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Thu, 15 Apr 2021 04:17:34 -0000

On Wed, Apr 14, 2021 at 5:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Tue, Apr 13, 2021 at 10:42 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > From: Hou Weiying <weiying_hou@outlook.com>
> >
> > This commit adds support for ePMP v0.9.1.
> >
> > The ePMP spec can be found in:
> > https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
> >
> > Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> > Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> > Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> > Message-Id: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> > [ Changes by AF:
> >  - Rebase on master
> >  - Update to latest spec
> >  - Use a switch case to handle ePMP MML permissions
> >  - Fix a few bugs
> > ]
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/pmp.c | 164 +++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 152 insertions(+), 12 deletions(-)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index e35988eec2..00f91d074f 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -90,11 +90,42 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
> >  static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
> >  {
> >      if (pmp_index < MAX_RISCV_PMPS) {
> > -        if (!pmp_is_locked(env, pmp_index)) {
> > -            env->pmp_state.pmp[pmp_index].cfg_reg = val;
> > -            pmp_update_rule(env, pmp_index);
> > +        bool locked = true;
> > +
> > +        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> > +            /* mseccfg.RLB is set */
> > +            if (MSECCFG_RLB_ISSET(env)) {
> > +                locked = false;
> > +            }
> > +
> > +            /* mseccfg.MML is not set */
> > +            if (!MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)) {
> > +                locked = false;
> > +            }
> > +
> > +            /* mseccfg.MML is set */
> > +            if (MSECCFG_MML_ISSET(env)) {
> > +                /* not adding execute bit */
> > +                if ((val & PMP_LOCK) != 0 && (val & PMP_EXEC) != PMP_EXEC) {
> > +                    locked = false;
> > +                }
> > +                /* shared region and not adding X bit */
> > +                if ((val & PMP_LOCK) != PMP_LOCK &&
> > +                    (val & 0x7) != (PMP_WRITE | PMP_EXEC)) {
> > +                    locked = false;
> > +                }
> > +            }
> >          } else {
> > +            if (!pmp_is_locked(env, pmp_index)) {
> > +                locked = false;
> > +            }
> > +        }
> > +
> > +        if (locked) {
> >              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
> > +        } else {
> > +            env->pmp_state.pmp[pmp_index].cfg_reg = val;
> > +            pmp_update_rule(env, pmp_index);
> >          }
> >      } else {
> >          qemu_log_mask(LOG_GUEST_ERROR,
> > @@ -217,6 +248,32 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
> >  {
> >      bool ret;
> >
> > +    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> > +        if (MSECCFG_MMWP_ISSET(env)) {
> > +            /*
> > +             * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> > +             * so we default to deny all, even for M-mode.
> > +             */
> > +            *allowed_privs = 0;
> > +            return false;
> > +        } else if (MSECCFG_MML_ISSET(env)) {
> > +            /*
> > +             * The Machine Mode Lockdown (mseccfg.MML) bit is set
> > +             * so we can only execute code in M-mode with an applicable
> > +             * rule. Other modes are disabled.
> > +             */
> > +            if (mode == PRV_M && !(privs & PMP_EXEC)) {
> > +                ret = true;
> > +                *allowed_privs = PMP_READ | PMP_WRITE;
> > +            } else {
> > +                ret = false;
> > +                *allowed_privs = 0;
> > +            }
> > +
> > +            return ret;
> > +        }
> > +    }
> > +
> >      if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
> >          /*
> >           * Privileged spec v1.10 states if HW doesn't implement any PMP entry
> > @@ -294,13 +351,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> >              pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
> >
> >          /*
> > -         * If the PMP entry is not off and the address is in range, do the priv
> > -         * check
> > +         * Convert the PMP permissions to match the truth table in the
> > +         * ePMP spec.
> >           */
> > +        const uint8_t epmp_operation =
> > +            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> > +            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> > +            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> > +            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
> > +
> >          if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> > -            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> > -            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> > -                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> > +            /*
> > +             * If the PMP entry is not off and the address is in range,
> > +             * do the priv check
> > +             */
> > +            if (!MSECCFG_MML_ISSET(env)) {
> > +                /*
> > +                 * If mseccfg.MML Bit is not set, do pmp priv check
> > +                 * This will always apply to regular PMP.
> > +                 */
> > +                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> > +                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> > +                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> > +                }
> > +            } else {
> > +                /*
> > +                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
> > +                 */
> > +                if (mode == PRV_M) {
> > +                    switch (epmp_operation) {
> > +                    case 0:
> > +                    case 1:
> > +                    case 4:
> > +                    case 5:
> > +                    case 6:
> > +                    case 7:
> > +                    case 8:
> > +                        *allowed_privs = 0;
> > +                        break;
> > +                    case 2:
> > +                    case 3:
> > +                    case 14:
> > +                        *allowed_privs = PMP_READ | PMP_WRITE;
> > +                        break;
> > +                    case 9:
> > +                    case 10:
> > +                        *allowed_privs = PMP_EXEC;
> > +                        break;
> > +                    case 11:
> > +                    case 13:
> > +                        *allowed_privs = PMP_READ | PMP_EXEC;
> > +                        break;
> > +                    case 12:
> > +                    case 15:
> > +                        *allowed_privs = PMP_READ;
> > +                        break;
> > +                    }
> > +                } else {
> > +                    switch (epmp_operation) {
> > +                    case 0:
> > +                    case 8:
> > +                    case 9:
> > +                    case 12:
> > +                    case 13:
> > +                    case 14:
> > +                        *allowed_privs = 0;
> > +                        break;
> > +                    case 1:
> > +                    case 10:
> > +                    case 11:
> > +                        *allowed_privs = PMP_EXEC;
> > +                        break;
> > +                    case 2:
> > +                    case 4:
> > +                    case 15:
> > +                        *allowed_privs = PMP_READ;
> > +                        break;
> > +                    case 3:
> > +                    case 6:
> > +                        *allowed_privs = PMP_READ | PMP_WRITE;
> > +                        break;
> > +                    case 5:
> > +                        *allowed_privs = PMP_READ | PMP_EXEC;
> > +                        break;
> > +                    case 7:
> > +                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> > +                        break;
> > +                    }
> > +                }
> >              }
> >
> >              ret = ((privs & *allowed_privs) == privs);
> > @@ -328,10 +466,12 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
> >
> >      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
> >
> > -    if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> > -        qemu_log_mask(LOG_GUEST_ERROR,
> > -                      "ignoring pmpcfg write - incorrect address\n");
> > -        return;
> > +    if (!riscv_feature(env, RISCV_FEATURE_EPMP) || !MSECCFG_RLB_ISSET(env)) {
> > +        if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "ignoring pmpcfg write - PMP config is locked\n");
>
> I think the original log message was for checking register address for
> RV64, and should still retain. We should add another branch with a
> different log message for the new ePMP check.

This whole change is actually wrong. I have removed this entire chunk.

Alistair

>
> > +            return;
> > +        }
>
> Regards,
> Bin

