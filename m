Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSVUQ-0001sz-7T
	for mharc-qemu-riscv@gnu.org; Thu, 10 Mar 2022 21:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSVUN-0001s9-UP; Thu, 10 Mar 2022 21:58:48 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=37669
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSVUM-0003TB-3A; Thu, 10 Mar 2022 21:58:47 -0500
Received: by mail-io1-xd2b.google.com with SMTP id c23so8772714ioi.4;
 Thu, 10 Mar 2022 18:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7M9tkwr5Q2awQPjcN6ksvJ3f7TdEZ6MisTpSkWiRtMQ=;
 b=lQ3yWQZ6r75p8ObkH1DS7Ef/L0QXusgYDnW/aXNBNQYwGw+8aHC6Ti2ewo9PH0Ektw
 zEUGfQ6glNRWVJIS6GTB7gEkqOUowFhgyt0N0T3z9ecAH9mJToj56qmCcejiMQD38mi5
 K5PrM82KTqNyJ99aI0NZ7f6D994vdeySZDStm6LtmI3RLwxiqENZWC+KTozsY1nOmdGr
 HO0uapVi8AmO4OUbSopI/9yVJYEzdJVTrjzd/h0jcyqdeU05fPedRfwKucxE6oK3MvSm
 rU5PJ1d15+duoRP7SiT3JK/xmanKBVT8oyet2DCgn+NupzGpOh6EQmuq923SO53ZU1fu
 8yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7M9tkwr5Q2awQPjcN6ksvJ3f7TdEZ6MisTpSkWiRtMQ=;
 b=eLjqm5iBlpXP1W/wk/BEvcLN6hDIVwGY0yxZ/M0B25Q27NKPTBS/JZklxhpkRcAJfN
 zHhrS5jMhmcjemKsFD0Vac4S32R2MdDpgCbKeB9NsKKWBF8e37EwDjlbdmGuUhL97gqz
 MkFArBcbJO+clqExrwqCj9FobvrLZOABh9Yq+dlxE7IxKyw9qWtH7hyvVfFqUb2KfoQh
 BX+rY1mdbQzCdKGg5f/BsttoYnbAgz6Conkhqdv3bsbsL6b9vtjGYiKLdtj+ZjvbxZL5
 FkIRGllwEefSQeYPL2TsHhUBAkNWiIvg5botJF8rtqW8q1a+OxN5oHvVndQbHUu3wFMH
 Xw3g==
X-Gm-Message-State: AOAM532H/XEIYqgoV1O1OJxA8XeZ3kNJjfGs/psSD/B3ilYAbelylXbz
 hpyVqjmKECYUHvN89IOAb/JXXtDQjajdy2M5mX4=
X-Google-Smtp-Source: ABdhPJyibsnDTarar/LVjBgFQRI10Kzk2ktY3wXsMh320EZlTUMMU6eBChEjNCysE8iah8WKaaGLpqfigchNOJscxJQ=
X-Received: by 2002:a02:3f09:0:b0:307:f175:e7bd with SMTP id
 d9-20020a023f09000000b00307f175e7bdmr6649996jaa.21.1646967524635; Thu, 10 Mar
 2022 18:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20220302122946.29635-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220302122946.29635-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 12:58:18 +1000
Message-ID: <CAKmqyKOgJA49Mc4H=WFN+soxaFKtJc+d+nviKiro7eCdMg7hcA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: write back unmodified value for csrrc/csrrs
 with rs1 is not x0 but holding zero
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Fri, 11 Mar 2022 02:58:48 -0000

On Wed, Mar 2, 2022 at 11:50 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>      For csrrs and csrrc, if rs1 specifies a register other than x0, holding
>      a zero value, the instruction will still attempt to write the unmodified
>      value back to the csr and will cause side effects
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/csr.c       | 46 ++++++++++++++++++++++++++++------------
>  target/riscv/op_helper.c |  7 +++++-
>  2 files changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index aea82dff4a..f4774ca07b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2872,7 +2872,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>
>  static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>                                                 int csrno,
> -                                               bool write_mask,
> +                                               bool write_csr,
>                                                 RISCVCPU *cpu)
>  {
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
> @@ -2895,7 +2895,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> -    if (write_mask && read_only) {
> +    if (write_csr && read_only) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -2915,7 +2915,8 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>  static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>                                         target_ulong *ret_value,
>                                         target_ulong new_value,
> -                                       target_ulong write_mask)
> +                                       target_ulong write_mask,
> +                                       bool write_csr)
>  {
>      RISCVException ret;
>      target_ulong old_value;
> @@ -2935,8 +2936,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>          return ret;
>      }
>
> -    /* write value if writable and write mask set, otherwise drop writes */
> -    if (write_mask) {
> +    /* write value if needed, otherwise drop writes */
> +    if (write_csr) {
>          new_value = (old_value & ~write_mask) | (new_value & write_mask);
>          if (csr_ops[csrno].write) {
>              ret = csr_ops[csrno].write(env, csrno, new_value);
> @@ -2960,18 +2961,27 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>  {
>      RISCVCPU *cpu = env_archcpu(env);
>
> -    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
> +    /*
> +     * write value when write_mask is set or rs1 is not x0 but holding zero
> +     * value for csrrc(new_value is zero) and csrrs(new_value is all-ones)

I don't understand this. Won't write_mask also be zero and when reading?

Alistair

> +     */
> +    bool write_csr = write_mask || ((write_mask == 0) &&
> +                                    ((new_value == 0) ||
> +                                     (new_value == (target_ulong)-1)));
> +
> +    RISCVException ret = riscv_csrrw_check(env, csrno, write_csr, cpu);
>      if (ret != RISCV_EXCP_NONE) {
>          return ret;
>      }
>
> -    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask);
> +    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask,
> +                            write_csr);
>  }
>
>  static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
>                                          Int128 *ret_value,
>                                          Int128 new_value,
> -                                        Int128 write_mask)
> +                                        Int128 write_mask, bool write_csr)
>  {
>      RISCVException ret;
>      Int128 old_value;
> @@ -2982,8 +2992,8 @@ static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
>          return ret;
>      }
>
> -    /* write value if writable and write mask set, otherwise drop writes */
> -    if (int128_nz(write_mask)) {
> +    /* write value if needed, otherwise drop writes */
> +    if (write_csr) {
>          new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
>                                int128_and(new_value, write_mask));
>          if (csr_ops[csrno].write128) {
> @@ -3015,13 +3025,22 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
>      RISCVException ret;
>      RISCVCPU *cpu = env_archcpu(env);
>
> -    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
> +    /*
> +     * write value when write_mask is set or rs1 is not x0 but holding zero
> +     * value for csrrc(new_value is zero) and csrrs(new_value is all-ones)
> +     */
> +    bool write_csr = write_mask || ((write_mask == 0) &&
> +                                    ((new_value == 0) ||
> +                                     (new_value == UINT128_MAX)));
> +
> +    ret = riscv_csrrw_check(env, csrno, write_csr, cpu);
>      if (ret != RISCV_EXCP_NONE) {
>          return ret;
>      }
>
>      if (csr_ops[csrno].read128) {
> -        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask);
> +        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask,
> +                                 write_csr);
>      }
>
>      /*
> @@ -3033,7 +3052,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
>      target_ulong old_value;
>      ret = riscv_csrrw_do64(env, csrno, &old_value,
>                             int128_getlo(new_value),
> -                           int128_getlo(write_mask));
> +                           int128_getlo(write_mask),
> +                           write_csr);
>      if (ret == RISCV_EXCP_NONE && ret_value) {
>          *ret_value = int128_make64(old_value);
>      }
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1a75ba11e6..b2ad465533 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -40,7 +40,12 @@ void helper_raise_exception(CPURISCVState *env, uint32_t exception)
>  target_ulong helper_csrr(CPURISCVState *env, int csr)
>  {
>      target_ulong val = 0;
> -    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
> +
> +    /*
> +     * new_value here should be none-zero or none-all-ones here to
> +     * distinguish with csrrc/csrrs with rs1 is not x0 but holding zero value
> +     */
> +    RISCVException ret = riscv_csrrw(env, csr, &val, 1, 0);
>
>      if (ret != RISCV_EXCP_NONE) {
>          riscv_raise_exception(env, ret, GETPC());
> --
> 2.17.1
>
>

