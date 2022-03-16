Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUcF6-00070X-0c
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 18:35:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUcF4-000703-3v; Wed, 16 Mar 2022 18:35:42 -0400
Received: from [2607:f8b0:4864:20::132] (port=46761
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUcEy-0008MD-QX; Wed, 16 Mar 2022 18:35:40 -0400
Received: by mail-il1-x132.google.com with SMTP id l13so2567502iln.13;
 Wed, 16 Mar 2022 15:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d7WXv54AyByb2CciSRxG2xpkdSmvSB16DmufbdzTq5o=;
 b=BofrKHb+7qmCtQNxiiU5++sam1PbSxyIFAr8wp9yg9eQb4oYb8+M3zHUy4w/0UoQZ7
 yUTT39UfD4x3KQnCyj0Gk9m84Rl2jzlhQONxynA2TBHZk6XZFp5Som6FpDxf7qxWdxX/
 YPxt1g0wbtjmxRooM/gYo1jr3PKeyHIm3yuw2sVpaSrofbNjpSE7GG6ra5MKT0j6XKxG
 fBY/gaLdSb0/IvIO7GdbPeP/EkM1NSXQh8+bhomLjia+BGf9d3bRl6RmvagGLcf+etex
 M1Pyc4meP1xdJBaowbWV03gWiSVp0EUnfCyqRJS4owtUlfZc3HJT+o7QhBKNZp+F0rQN
 ZN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d7WXv54AyByb2CciSRxG2xpkdSmvSB16DmufbdzTq5o=;
 b=NhVkJX48SJnjbFWlO4LIUy2qQrJ3LM5cYAZR4Y2yWPcmyq+6rw271WXPYgzVQovkdy
 ofaL29eIQO/oPgPiwntmFojtIflxQ9y6Y9lZCY/qMRX2LaTM3Uzj7Wzd36Xkiy/AHvzz
 O4lQLwYlV7+ZE7j1GhSY1/hJpYBZetthEo3qG5uJWp+w9TyTg12WqhsIk62LLzm1pTLB
 WpZVEd8kAB2MdaKjkxoMTMmeNmKOLD/kz2ngSYMJah+J+fC6B4PcVHgSG6yzYa7eQyU3
 g95jTsKZGWzGxWmQZNHJkT37nN8oYpyOK8jAqaICAKs9ZXpyBClh1uST9ZQyhWtIZgdQ
 /+TA==
X-Gm-Message-State: AOAM533hIyp9ymjmexLd3vCUdeX+GVEssoKLE2h3Q3JYjv16h9mn8AO+
 meQ36xPcAZfWyCcK6o3sToE2EcprlkMPGegIm9k=
X-Google-Smtp-Source: ABdhPJzOpqlI8w5CO2krulOSH2cw7vTKXWSbESd8iq7lRTf4tgXpFWjdye9SxKxYlj1IL92xzjrHoN96AoefIq21pSI=
X-Received: by 2002:a05:6e02:154c:b0:2c6:4ffa:57ec with SMTP id
 j12-20020a056e02154c00b002c64ffa57ecmr683007ilu.55.1647470135055; Wed, 16 Mar
 2022 15:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220311094601.30440-1-liweiwei@iscas.ac.cn>
 <CAEUhbmX7wBzhvojSioQnB=T-DDuq9FX7UTPdvtR=oXHDm5Ra4A@mail.gmail.com>
 <769fe78f-e4c0-83c1-d5fc-65fbf40bb5ff@iscas.ac.cn>
In-Reply-To: <769fe78f-e4c0-83c1-d5fc-65fbf40bb5ff@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Mar 2022 08:35:08 +1000
Message-ID: <CAKmqyKMpWFo5-=XSTBy_B9aTqDsw6-uxWfe3RwNnKUCKXQtjeQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: write back unmodified value for
 csrrc/csrrs with rs1 is not x0 but holding zero
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Mar 2022 22:35:42 -0000

On Thu, Mar 17, 2022 at 1:13 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/16 =E4=B8=8B=E5=8D=889:07, Bin Meng =E5=86=99=E9=81=93:
> > On Fri, Mar 11, 2022 at 5:46 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >> For csrrs and csrrc, if rs1 specifies a register other than x0, holdin=
g
> >> a zero value, the instruction will still attempt to write the unmodifi=
ed
> >> value back to the csr and will cause side effects
> >>
> >> v2:
> >> * change to explictly pass "bool write_op" argument in riscv_csrrw*, d=
o
> >>    write permission check and write operation depend on it
> >> * extend riscv_csr_predicate_fn to pass "write_op" argument which will
> >>    be checked by seed csr or other future "write-only" csr
> > The changelog should be put below ---
> >
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> ---
> >>   target/riscv/cpu.c       |   3 +-
> >>   target/riscv/cpu.h       |  15 +++---
> >>   target/riscv/csr.c       | 101 +++++++++++++++++++++----------------=
--
> >>   target/riscv/gdbstub.c   |  15 +++---
> >>   target/riscv/op_helper.c |  12 ++---
> >>   5 files changed, 79 insertions(+), 67 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index ddda4906ff..76ad9bffac 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -314,7 +314,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FIL=
E *f, int flags)
> >>           for (int i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> >>               int csrno =3D dump_csrs[i];
> >>               target_ulong val =3D 0;
> >> -            RISCVException res =3D riscv_csrrw_debug(env, csrno, &val=
, 0, 0);
> >> +            RISCVException res =3D riscv_csrrw_debug(env, csrno, &val=
, 0, 0,
> >> +                                                   false);
> >>
> >>               /*
> >>                * Rely on the smode, hmode, etc, predicates within csr.=
c
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 9ba05042ed..971d193d61 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -610,27 +610,29 @@ void riscv_cpu_update_mask(CPURISCVState *env);
> >>
> >>   RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
> >>                              target_ulong *ret_value,
> >> -                           target_ulong new_value, target_ulong write=
_mask);
> >> +                           target_ulong new_value, target_ulong write=
_mask,
> >> +                           bool write_op);
> >>   RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
> >>                                    target_ulong *ret_value,
> >>                                    target_ulong new_value,
> >> -                                 target_ulong write_mask);
> >> +                                 target_ulong write_mask, bool write_=
op);
> >>
> >>   static inline void riscv_csr_write(CPURISCVState *env, int csrno,
> >>                                      target_ulong val)
> >>   {
> >> -    riscv_csrrw(env, csrno, NULL, val, MAKE_64BIT_MASK(0, TARGET_LONG=
_BITS));
> >> +    riscv_csrrw(env, csrno, NULL, val, MAKE_64BIT_MASK(0, TARGET_LONG=
_BITS),
> >> +                true);
> >>   }
> >>
> >>   static inline target_ulong riscv_csr_read(CPURISCVState *env, int cs=
rno)
> >>   {
> >>       target_ulong val =3D 0;
> >> -    riscv_csrrw(env, csrno, &val, 0, 0);
> >> +    riscv_csrrw(env, csrno, &val, 0, 0, false);
> >>       return val;
> >>   }
> >>
> >>   typedef RISCVException (*riscv_csr_predicate_fn)(CPURISCVState *env,
> >> -                                                 int csrno);
> >> +                                                 int csrno, bool writ=
e_op);
> >>   typedef RISCVException (*riscv_csr_read_fn)(CPURISCVState *env, int =
csrno,
> >>                                               target_ulong *ret_value)=
;
> >>   typedef RISCVException (*riscv_csr_write_fn)(CPURISCVState *env, int=
 csrno,
> >> @@ -642,7 +644,8 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCV=
State *env, int csrno,
> >>
> >>   RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
> >>                                   Int128 *ret_value,
> >> -                                Int128 new_value, Int128 write_mask);
> >> +                                Int128 new_value, Int128 write_mask,
> >> +                                bool write_op);
> >>
> >>   typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, i=
nt csrno,
> >>                                                  Int128 *ret_value);
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index aea82dff4a..1907481fb1 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -36,7 +36,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operatio=
ns *ops)
> >>   }
> >>
> >>   /* Predicates */
> >> -static RISCVException fs(CPURISCVState *env, int csrno)
> >> +static RISCVException fs(CPURISCVState *env, int csrno, bool write_op=
)
> >>   {
> >>   #if !defined(CONFIG_USER_ONLY)
> >>       if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
> >> @@ -47,7 +47,7 @@ static RISCVException fs(CPURISCVState *env, int csr=
no)
> >>       return RISCV_EXCP_NONE;
> >>   }
> >>
> >> -static RISCVException vs(CPURISCVState *env, int csrno)
> >> +static RISCVException vs(CPURISCVState *env, int csrno, bool write_op=
)
> >>   {
> >>       CPUState *cs =3D env_cpu(env);
> >>       RISCVCPU *cpu =3D RISCV_CPU(cs);
> >> @@ -64,7 +64,7 @@ static RISCVException vs(CPURISCVState *env, int csr=
no)
> >>       return RISCV_EXCP_ILLEGAL_INST;
> >>   }
> >>
> >> -static RISCVException ctr(CPURISCVState *env, int csrno)
> >> +static RISCVException ctr(CPURISCVState *env, int csrno, bool write_o=
p)
> >>   {
> >>   #if !defined(CONFIG_USER_ONLY)
> >>       CPUState *cs =3D env_cpu(env);
> >> @@ -135,50 +135,50 @@ static RISCVException ctr(CPURISCVState *env, in=
t csrno)
> >>       return RISCV_EXCP_NONE;
> >>   }
> >>
> >> -static RISCVException ctr32(CPURISCVState *env, int csrno)
> >> +static RISCVException ctr32(CPURISCVState *env, int csrno, bool write=
_op)
> >>   {
> >>       if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return ctr(env, csrno);
> >> +    return ctr(env, csrno, write_op);
> >>   }
> >>
> >>   #if !defined(CONFIG_USER_ONLY)
> >> -static RISCVException any(CPURISCVState *env, int csrno)
> >> +static RISCVException any(CPURISCVState *env, int csrno, bool write_o=
p)
> >>   {
> >>       return RISCV_EXCP_NONE;
> >>   }
> >>
> >> -static RISCVException any32(CPURISCVState *env, int csrno)
> >> +static RISCVException any32(CPURISCVState *env, int csrno, bool write=
_op)
> >>   {
> >>       if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return any(env, csrno);
> >> +    return any(env, csrno, write_op);
> >>
> >>   }
> >>
> >> -static int aia_any(CPURISCVState *env, int csrno)
> >> +static int aia_any(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return any(env, csrno);
> >> +    return any(env, csrno, write_op);
> >>   }
> >>
> >> -static int aia_any32(CPURISCVState *env, int csrno)
> >> +static int aia_any32(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return any32(env, csrno);
> >> +    return any32(env, csrno, write_op);
> >>   }
> >>
> >> -static RISCVException smode(CPURISCVState *env, int csrno)
> >> +static RISCVException smode(CPURISCVState *env, int csrno, bool write=
_op)
> >>   {
> >>       if (riscv_has_ext(env, RVS)) {
> >>           return RISCV_EXCP_NONE;
> >> @@ -187,34 +187,34 @@ static RISCVException smode(CPURISCVState *env, =
int csrno)
> >>       return RISCV_EXCP_ILLEGAL_INST;
> >>   }
> >>
> >> -static int smode32(CPURISCVState *env, int csrno)
> >> +static int smode32(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return smode(env, csrno);
> >> +    return smode(env, csrno, write_op);
> >>   }
> >>
> >> -static int aia_smode(CPURISCVState *env, int csrno)
> >> +static int aia_smode(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return smode(env, csrno);
> >> +    return smode(env, csrno, write_op);
> >>   }
> >>
> >> -static int aia_smode32(CPURISCVState *env, int csrno)
> >> +static int aia_smode32(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return smode32(env, csrno);
> >> +    return smode32(env, csrno, write_op);
> >>   }
> >>
> >> -static RISCVException hmode(CPURISCVState *env, int csrno)
> >> +static RISCVException hmode(CPURISCVState *env, int csrno, bool write=
_op)
> >>   {
> >>       if (riscv_has_ext(env, RVS) &&
> >>           riscv_has_ext(env, RVH)) {
> >> @@ -230,7 +230,7 @@ static RISCVException hmode(CPURISCVState *env, in=
t csrno)
> >>       return RISCV_EXCP_ILLEGAL_INST;
> >>   }
> >>
> >> -static RISCVException hmode32(CPURISCVState *env, int csrno)
> >> +static RISCVException hmode32(CPURISCVState *env, int csrno, bool wri=
te_op)
> >>   {
> >>       if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
> >>           if (!riscv_cpu_virt_enabled(env)) {
> >> @@ -240,12 +240,13 @@ static RISCVException hmode32(CPURISCVState *env=
, int csrno)
> >>           }
> >>       }
> >>
> >> -    return hmode(env, csrno);
> >> +    return hmode(env, csrno, write_op);
> >>
> >>   }
> >>
> >>   /* Checks if PointerMasking registers could be accessed */
> >> -static RISCVException pointer_masking(CPURISCVState *env, int csrno)
> >> +static RISCVException pointer_masking(CPURISCVState *env, int csrno,
> >> +                                      bool write_op)
> >>   {
> >>       /* Check if j-ext is present */
> >>       if (riscv_has_ext(env, RVJ)) {
> >> @@ -254,25 +255,25 @@ static RISCVException pointer_masking(CPURISCVSt=
ate *env, int csrno)
> >>       return RISCV_EXCP_ILLEGAL_INST;
> >>   }
> >>
> >> -static int aia_hmode(CPURISCVState *env, int csrno)
> >> +static int aia_hmode(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>        }
> >>
> >> -     return hmode(env, csrno);
> >> +     return hmode(env, csrno, write_op);
> >>   }
> >>
> >> -static int aia_hmode32(CPURISCVState *env, int csrno)
> >> +static int aia_hmode32(CPURISCVState *env, int csrno, bool write_op)
> >>   {
> >>       if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return hmode32(env, csrno);
> >> +    return hmode32(env, csrno, write_op);
> >>   }
> >>
> >> -static RISCVException pmp(CPURISCVState *env, int csrno)
> >> +static RISCVException pmp(CPURISCVState *env, int csrno, bool write_o=
p)
> >>   {
> >>       if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> >>           return RISCV_EXCP_NONE;
> >> @@ -281,7 +282,7 @@ static RISCVException pmp(CPURISCVState *env, int =
csrno)
> >>       return RISCV_EXCP_ILLEGAL_INST;
> >>   }
> >>
> >> -static RISCVException epmp(CPURISCVState *env, int csrno)
> >> +static RISCVException epmp(CPURISCVState *env, int csrno, bool write_=
op)
> >>   {
> >>       if (env->priv =3D=3D PRV_M && riscv_feature(env, RISCV_FEATURE_E=
PMP)) {
> >>           return RISCV_EXCP_NONE;
> >> @@ -2873,7 +2874,8 @@ static RISCVException write_upmbase(CPURISCVStat=
e *env, int csrno,
> >>   static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
> >>                                                  int csrno,
> >>                                                  bool write_mask,
> >> -                                               RISCVCPU *cpu)
> >> +                                               RISCVCPU *cpu,
> >> +                                               bool write_op)
> >>   {
> >>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check =
fails */
> >>       int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
> >> @@ -2895,7 +2897,7 @@ static inline RISCVException riscv_csrrw_check(C=
PURISCVState *env,
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>   #endif
> >> -    if (write_mask && read_only) {
> >> +    if (write_op && read_only) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> @@ -2909,13 +2911,13 @@ static inline RISCVException riscv_csrrw_check=
(CPURISCVState *env,
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> -    return csr_ops[csrno].predicate(env, csrno);
> >> +    return csr_ops[csrno].predicate(env, csrno, write_op);
> >>   }
> >>
> >>   static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno=
,
> >>                                          target_ulong *ret_value,
> >>                                          target_ulong new_value,
> >> -                                       target_ulong write_mask)
> >> +                                       target_ulong write_mask, bool =
write_op)
> >>   {
> >>       RISCVException ret;
> >>       target_ulong old_value;
> >> @@ -2935,8 +2937,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVS=
tate *env, int csrno,
> >>           return ret;
> >>       }
> >>
> >> -    /* write value if writable and write mask set, otherwise drop wri=
tes */
> >> -    if (write_mask) {
> >> +    /* write value if writable and write_op set, otherwise drop write=
s */
> >> +    if (write_op) {
> >>           new_value =3D (old_value & ~write_mask) | (new_value & write=
_mask);
> >>           if (csr_ops[csrno].write) {
> >>               ret =3D csr_ops[csrno].write(env, csrno, new_value);
> >> @@ -2956,22 +2958,25 @@ static RISCVException riscv_csrrw_do64(CPURISC=
VState *env, int csrno,
> >>
> >>   RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
> >>                              target_ulong *ret_value,
> >> -                           target_ulong new_value, target_ulong write=
_mask)
> >> +                           target_ulong new_value, target_ulong write=
_mask,
> >> +                           bool write_op)
> >>   {
> >>       RISCVCPU *cpu =3D env_archcpu(env);
> >>
> >> -    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask, =
cpu);
> >> +    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask, =
cpu,
> >> +                                           write_op);
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           return ret;
> >>       }
> >>
> >> -    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_m=
ask);
> >> +    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_m=
ask,
> >> +                            write_op);
> >>   }
> >>
> >>   static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrn=
o,
> >>                                           Int128 *ret_value,
> >>                                           Int128 new_value,
> >> -                                        Int128 write_mask)
> >> +                                        Int128 write_mask, bool write=
_op)
> >>   {
> >>       RISCVException ret;
> >>       Int128 old_value;
> >> @@ -2982,8 +2987,8 @@ static RISCVException riscv_csrrw_do128(CPURISCV=
State *env, int csrno,
> >>           return ret;
> >>       }
> >>
> >> -    /* write value if writable and write mask set, otherwise drop wri=
tes */
> >> -    if (int128_nz(write_mask)) {
> >> +    /* write value if writable and write_op set, otherwise drop write=
s */
> >> +    if (write_op) {
> >>           new_value =3D int128_or(int128_and(old_value, int128_not(wri=
te_mask)),
> >>                                 int128_and(new_value, write_mask));
> >>           if (csr_ops[csrno].write128) {
> >> @@ -3010,18 +3015,20 @@ static RISCVException riscv_csrrw_do128(CPURIS=
CVState *env, int csrno,
> >>
> >>   RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
> >>                                   Int128 *ret_value,
> >> -                                Int128 new_value, Int128 write_mask)
> >> +                                Int128 new_value, Int128 write_mask,
> >> +                                bool write_op)
> >>   {
> >>       RISCVException ret;
> >>       RISCVCPU *cpu =3D env_archcpu(env);
> >>
> >> -    ret =3D riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu)=
;
> >> +    ret =3D riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu,=
 write_op);
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           return ret;
> >>       }
> >>
> >>       if (csr_ops[csrno].read128) {
> >> -        return riscv_csrrw_do128(env, csrno, ret_value, new_value, wr=
ite_mask);
> >> +        return riscv_csrrw_do128(env, csrno, ret_value, new_value, wr=
ite_mask,
> >> +                                 write_op);
> >>       }
> >>
> >>       /*
> >> @@ -3033,7 +3040,7 @@ RISCVException riscv_csrrw_i128(CPURISCVState *e=
nv, int csrno,
> >>       target_ulong old_value;
> >>       ret =3D riscv_csrrw_do64(env, csrno, &old_value,
> >>                              int128_getlo(new_value),
> >> -                           int128_getlo(write_mask));
> >> +                           int128_getlo(write_mask), write_op);
> >>       if (ret =3D=3D RISCV_EXCP_NONE && ret_value) {
> >>           *ret_value =3D int128_make64(old_value);
> >>       }
> >> @@ -3047,13 +3054,13 @@ RISCVException riscv_csrrw_i128(CPURISCVState =
*env, int csrno,
> >>   RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
> >>                                    target_ulong *ret_value,
> >>                                    target_ulong new_value,
> >> -                                 target_ulong write_mask)
> >> +                                 target_ulong write_mask, bool write_=
op)
> >>   {
> >>       RISCVException ret;
> >>   #if !defined(CONFIG_USER_ONLY)
> >>       env->debugger =3D true;
> >>   #endif
> >> -    ret =3D riscv_csrrw(env, csrno, ret_value, new_value, write_mask)=
;
> >> +    ret =3D riscv_csrrw(env, csrno, ret_value, new_value, write_mask,=
 write_op);
> >>   #if !defined(CONFIG_USER_ONLY)
> >>       env->debugger =3D false;
> >>   #endif
> >> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> >> index 9ed049c29e..5e37ea12cb 100644
> >> --- a/target/riscv/gdbstub.c
> >> +++ b/target/riscv/gdbstub.c
> >> @@ -124,7 +124,7 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, G=
ByteArray *buf, int n)
> >>            * This also works for CSR_FRM and CSR_FCSR.
> >>            */
> >>           result =3D riscv_csrrw_debug(env, n - 32, &val,
> >> -                                   0, 0);
> >> +                                   0, 0, false);
> >>           if (result =3D=3D RISCV_EXCP_NONE) {
> >>               return gdb_get_regl(buf, val);
> >>           }
> >> @@ -147,7 +147,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, u=
int8_t *mem_buf, int n)
> >>            * This also works for CSR_FRM and CSR_FCSR.
> >>            */
> >>           result =3D riscv_csrrw_debug(env, n - 32, NULL,
> >> -                                   val, -1);
> >> +                                   val, -1, true);
> >>           if (result =3D=3D RISCV_EXCP_NONE) {
> >>               return sizeof(target_ulong);
> >>           }
> >> @@ -209,7 +209,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env=
, GByteArray *buf, int n)
> >>       }
> >>
> >>       target_ulong val =3D 0;
> >> -    int result =3D riscv_csrrw_debug(env, csrno, &val, 0, 0);
> >> +    int result =3D riscv_csrrw_debug(env, csrno, &val, 0, 0, false);
> >>
> >>       if (result =3D=3D 0) {
> >>           return gdb_get_regl(buf, val);
> >> @@ -236,7 +236,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env=
, uint8_t *mem_buf, int n)
> >>       }
> >>
> >>       target_ulong val =3D ldtul_p(mem_buf);
> >> -    int result =3D riscv_csrrw_debug(env, csrno, NULL, val, -1);
> >> +    int result =3D riscv_csrrw_debug(env, csrno, NULL, val, -1, true)=
;
> >>
> >>       if (result =3D=3D 0) {
> >>           return sizeof(target_ulong);
> >> @@ -251,7 +251,7 @@ static int riscv_gdb_get_csr(CPURISCVState *env, G=
ByteArray *buf, int n)
> >>           target_ulong val =3D 0;
> >>           int result;
> >>
> >> -        result =3D riscv_csrrw_debug(env, n, &val, 0, 0);
> >> +        result =3D riscv_csrrw_debug(env, n, &val, 0, 0, false);
> >>           if (result =3D=3D RISCV_EXCP_NONE) {
> >>               return gdb_get_regl(buf, val);
> >>           }
> >> @@ -265,7 +265,7 @@ static int riscv_gdb_set_csr(CPURISCVState *env, u=
int8_t *mem_buf, int n)
> >>           target_ulong val =3D ldtul_p(mem_buf);
> >>           int result;
> >>
> >> -        result =3D riscv_csrrw_debug(env, n, NULL, val, -1);
> >> +        result =3D riscv_csrrw_debug(env, n, NULL, val, -1, true);
> >>           if (result =3D=3D RISCV_EXCP_NONE) {
> >>               return sizeof(target_ulong);
> >>           }
> >> @@ -319,7 +319,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs,=
 int base_reg)
> >>
> >>       for (i =3D 0; i < CSR_TABLE_SIZE; i++) {
> >>           predicate =3D csr_ops[i].predicate;
> >> -        if (predicate && (predicate(env, i) =3D=3D RISCV_EXCP_NONE)) =
{
> >> +        if (predicate && ((predicate(env, i, false) =3D=3D RISCV_EXCP=
_NONE) ||
> >> +                          (predicate(env, i, true) =3D=3D RISCV_EXCP_=
NONE))) {
> >>               if (csr_ops[i].name) {
> >>                   g_string_append_printf(s, "<reg name=3D\"%s\"", csr_=
ops[i].name);
> >>               } else {
> >> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> >> index 1a75ba11e6..e0d708091e 100644
> >> --- a/target/riscv/op_helper.c
> >> +++ b/target/riscv/op_helper.c
> >> @@ -40,7 +40,7 @@ void helper_raise_exception(CPURISCVState *env, uint=
32_t exception)
> >>   target_ulong helper_csrr(CPURISCVState *env, int csr)
> >>   {
> >>       target_ulong val =3D 0;
> >> -    RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, 0);
> >> +    RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, 0, false);
> >>
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           riscv_raise_exception(env, ret, GETPC());
> >> @@ -51,7 +51,7 @@ target_ulong helper_csrr(CPURISCVState *env, int csr=
)
> >>   void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
> >>   {
> >>       target_ulong mask =3D env->xl =3D=3D MXL_RV32 ? UINT32_MAX : (ta=
rget_ulong)-1;
> >> -    RISCVException ret =3D riscv_csrrw(env, csr, NULL, src, mask);
> >> +    RISCVException ret =3D riscv_csrrw(env, csr, NULL, src, mask, tru=
e);
> >>
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           riscv_raise_exception(env, ret, GETPC());
> >> @@ -62,7 +62,7 @@ target_ulong helper_csrrw(CPURISCVState *env, int cs=
r,
> >>                             target_ulong src, target_ulong write_mask)
> >>   {
> >>       target_ulong val =3D 0;
> >> -    RISCVException ret =3D riscv_csrrw(env, csr, &val, src, write_mas=
k);
> >> +    RISCVException ret =3D riscv_csrrw(env, csr, &val, src, write_mas=
k, true);
> >>
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           riscv_raise_exception(env, ret, GETPC());
> >> @@ -75,7 +75,7 @@ target_ulong helper_csrr_i128(CPURISCVState *env, in=
t csr)
> >>       Int128 rv =3D int128_zero();
> >>       RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
> >>                                             int128_zero(),
> >> -                                          int128_zero());
> >> +                                          int128_zero(), false);
> >>
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           riscv_raise_exception(env, ret, GETPC());
> >> @@ -90,7 +90,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
> >>   {
> >>       RISCVException ret =3D riscv_csrrw_i128(env, csr, NULL,
> >>                                             int128_make128(srcl, srch)=
,
> >> -                                          UINT128_MAX);
> >> +                                          UINT128_MAX, true);
> >>
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           riscv_raise_exception(env, ret, GETPC());
> >> @@ -104,7 +104,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *env,=
 int csr,
> >>       Int128 rv =3D int128_zero();
> >>       RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
> >>                                             int128_make128(srcl, srch)=
,
> >> -                                          int128_make128(maskl, maskh=
));
> >> +                                          int128_make128(maskl, maskh=
), true);
> >>
> >>       if (ret !=3D RISCV_EXCP_NONE) {
> >>           riscv_raise_exception(env, ret, GETPC());
> > I am afraid the adding of "bool write_op" argument was done on many
> > functions, some of which do not look good to me, e.g.: predicate
> > funcs. v1 is much better.*>
> Yeah, I agree adding  argument to predicate is not a good idea. However
> it seems that the csr(like seed)
>
> itself cannot  distinguish whether it's to be written or not except
> these two ways(in v1 and v2).
>
> Or we can take seed CSR as a special case  in riscv_csrrw_check since no
> other csr will limit itself
>
> to be accessed only with read-write instruction currently.
>
> >
> > Or maybe, is that possible we do something in trans_csrrs() instead?

That might be a better option. Unless there are other CSRs we expect
to do this I think trans_csrr*() is probably the place to have this,
similar to the `rd =3D=3D 0` case.

It could also go in helper_csrr() which would just be a simple if check.

Alistair

>
> The read and write operation in trans_csr*  have been truely
> distinguished in original code:
>
> all the read operation will go to  the helper_csrr,  write to
> helper_csrrw, read/write to helper_csrrw.
>
> However, they all go to the same progress  riscv_csrrw* in the helper
> with different arguments.
>
> Regards,
>
> Weiwei Li
>
> >
> > Regards,
> > Bin
>
>
>
>
>

