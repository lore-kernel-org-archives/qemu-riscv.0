Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAnFd-0003qm-NZ
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 02:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAnFb-0003qV-D5; Mon, 11 Jul 2022 02:50:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oAnFQ-00067P-Ul; Mon, 11 Jul 2022 02:50:35 -0400
Received: by mail-pj1-x102e.google.com with SMTP id p9so4044422pjd.3;
 Sun, 10 Jul 2022 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDmqxek1xl+i255mF2BTteFiBqfyYI0IZvaDjT1G1pc=;
 b=p852Rd1iHonfYd8kWBebB4Kx2SijNRXkRoL+dRz/scAkwaaD70lzaOpXkFeyHiA7Ls
 xFMe9CbVVJSgvw4YL4zVsDfoA41Ji/lZrECiyaPL18XvP30E/dINhydP4TYLGke/GAbo
 Fqx/DhaAgq8xLTJSBKnksT2R/5LQ501mDQ50DsmbARBJbpatK1mNCefpBR3/nSntK6y5
 VLIFcd7eGpegzyISIs+qQIFZEXM9cMVBjh0mqjal112zoTT5EWmhAg3oYdxaWBhdT509
 fIYiiQEcNMYFj69ive5E38T4K/guou2L8anjzVWsRTxiO7LKLHYbbn0ZqYtYdHf5DEQH
 gzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDmqxek1xl+i255mF2BTteFiBqfyYI0IZvaDjT1G1pc=;
 b=e/jTWwM46Q7V5Civz3zWul3VdVXl+eRpK/UWIS4yqRDAw8MjmUkzFja8k9ucn2lX9P
 an48vg5gfgAlajL2/dQqAbyE50iLZAcRuG2VevVS0rF7+VQ1orzclbu7iTaGuweaLo71
 n4IJqF+Zk+tcbTKtOJxz0Eu3/Vi3u2T3fJ7mFBrWzbxHYLKyskN/vmyOWumpNMZfne6h
 ijM2uFAC7aelI5njeIZXK5x9cPEgCPAzkWgF75FW+zGxPTFLMTDIlJEIxjSFFoQPr+Lj
 qL66pnwBYFdpxY+Ac7m98GULGFw+x9v889X383PwclFCLoYQqjOXz3xrFnumXYWL35zc
 dnGw==
X-Gm-Message-State: AJIora+tnlwJ4Im8WP1qBMsZ2WZorrOSK8v7W31c2YMXLwXdgrSLEDRg
 PM7Vp/axWn6d+R5DOZk/ClAqIuXfVKoNrHlMyaI=
X-Google-Smtp-Source: AGRyM1tqG+mG0B/bKVtx6KtXHiM+VVkCxN6aH9EbbkROO3qOJ9Kq0uS4EWvD5YEd4qZFL0VhkzHsZkW5loiN9RloQW0=
X-Received: by 2002:a17:90a:e611:b0:1ef:92b6:d31 with SMTP id
 j17-20020a17090ae61100b001ef92b60d31mr15946892pjy.166.1657522223285; Sun, 10
 Jul 2022 23:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710082400.29224-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jul 2022 16:49:56 +1000
Message-ID: <CAKmqyKPGApGfsjL9hTZt8qS5Qq-kSKAOLhdhVo=mshDD+HMdcg@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/riscv: simplify the check in hmode to resue
 the check in riscv_csrrw_check
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jul 2022 06:50:35 -0000

On Sun, Jul 10, 2022 at 6:30 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Just add 1 to the effective privledge level when in HS mode, then reuse the check
> 'effective_priv < csr_priv' in riscv_csrrw_check to replace the privilege level
> related check in hmode. Then, hmode will only check whether H extension is supported.
>
> when accessing Hypervior CSRs:
>    1) if access from M privilege level, the check of 'effective_priv < csr_priv'
> passes, returns hmode(...) which will return RISCV_EXCP_ILLEGAL_INST when H
> extension is not supported and return RISCV_EXCP_NONE otherwise.
>    2) if access from HS privilege level, effective_priv will add 1, the check
> passes too, also returns hmode(...) too.
>    3) if access from VS/VU privilege level, the check fails, and returns
> RISCV_EXCP_VIRT_INSTRUCTION_FAULT
>    4) if access from U privilege level, the check fails, and returns
> RISCV_EXCP_ILLEGAL_INST
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 975007f1ac..2b3ed94366 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -312,13 +312,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
>      if (riscv_has_ext(env, RVH)) {
> -        /* Hypervisor extension is supported */
> -        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            env->priv == PRV_M) {
> -            return RISCV_EXCP_NONE;
> -        } else {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> +        return RISCV_EXCP_NONE;
>      }
>
>      return RISCV_EXCP_ILLEGAL_INST;
> @@ -3280,13 +3274,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>  #if !defined(CONFIG_USER_ONLY)
>      int csr_priv, effective_priv = env->priv;
>
> -    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
> +    if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
> +        !riscv_cpu_virt_enabled(env)) {
>          /*
> -         * We are in either HS or VS mode.
> -         * Add 1 to the effective privledge level to allow us to access the
> -         * Hypervisor CSRs. The `hmode` predicate will determine if access
> -         * should be allowed(HS) or if a virtual instruction exception should be
> -         * raised(VS).
> +         * We are in HS mode. Add 1 to the effective privledge level to
> +         * allow us to access the Hypervisor CSRs.
>           */
>          effective_priv++;
>      }
> --
> 2.17.1
>
>

