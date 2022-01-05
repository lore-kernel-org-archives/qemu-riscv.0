Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5E7T-0006Qr-MW
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:46:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5E7R-0006JW-FJ; Wed, 05 Jan 2022 16:46:53 -0500
Received: from [2607:f8b0:4864:20::d34] (port=34705
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5E7N-00070X-J5; Wed, 05 Jan 2022 16:46:53 -0500
Received: by mail-io1-xd34.google.com with SMTP id e128so805156iof.1;
 Wed, 05 Jan 2022 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPbwE9lwiJDySNWFfaJNy7P7zChfAc3AdqXJXQIDvCQ=;
 b=e/bm/V30eGpba8aCs0rWafDS2zoSWCqdPhvo7CTvONvzIz17ZZLH3/ajltdA/K+2qx
 qfnloslepszvWGaO7QYmRLl83TBp2Ki8SlNJaepa2iXzo/Z42BV8q8+Imk4svwukDOnV
 jL28Lz2Mdv3dEOQpmNhc/1U4+3ZK53Wn1+Cn3glcL4Rzt3jt/nh40aAlbah5nmLuFL9R
 dcZmYS58y894HD1N31wVgv+ebKsRQC7ot0z0SeLYjWCpk0W+jFNmfNUFa2P+cGnhSrNt
 bOFlLtsDRYxLr3oeNqcf0OJ80miIJJLHFY6oMrAXtNEYqywMgzxBLGUKTazfGS8fzKnK
 lc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPbwE9lwiJDySNWFfaJNy7P7zChfAc3AdqXJXQIDvCQ=;
 b=aCDVXvYKAqd16NEAK6EosHhrzr9ev8aKx07/qXEImQB64NKh3w/lGWLmiwFegJ9+Ry
 OmGNSNt2G0Ieu/hwqecQA2P/wx8CWAu+zlk/TwoqE+hMCI8mwdvoKU9huQZphEqYolco
 NDcqqBBHpMGQlTgDyceO2sRtShpK4vxeNHOK0su5lUHzmronF5dcpHackrfn7GKOAb9i
 xCX5S0Xn1PpYJrKRHoINQ+RncSw1QiT9ZDvC1Yu1SguooOByPiYS5bvbK22wCIwvdpE4
 0uOgHzgon05zHKgCPo4BRImso/GW+liNSw+AvpcH6TjTFtSyv525pwfasblzK9W1Xpuz
 2iMQ==
X-Gm-Message-State: AOAM532APCl7JljmedoaEFo1Ckjh3LUvFvpeJ5/RLAEmRiB2LQK/ilC4
 WfflIAfzQQCeuwMzYe9ZMN+teAIkSxEpVVEfDMzS3Zbu7xgHFQMZ
X-Google-Smtp-Source: ABdhPJxh6n2IQEUvhvCqcygPOwy12CcrO2mFhidP5k2fWG++rS8+9hFwBAuEEUrihcyZju+RiTIuMIG59aUxuT2Fk+0=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr26569296iov.187.1641419205895; 
 Wed, 05 Jan 2022 13:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20220105022247.21131-1-frank.chang@sifive.com>
 <20220105022247.21131-3-frank.chang@sifive.com>
In-Reply-To: <20220105022247.21131-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 07:46:19 +1000
Message-ID: <CAKmqyKME8+jeYxeu4fc4EARBavSBbJ4sEvGo+ArMOag74WGfCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: rvv-1.0: Call the correct RVF/RVD
 check function for widening fp/int type-convert insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 21:46:53 -0000

On Wed, Jan 5, 2022 at 12:25 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> vfwcvt.xu.f.v, vfwcvt.x.f.v, vfwcvt.rtz.xu.f.v and vfwcvt.rtz.x.f.v
> convert single-width floating-point to double-width integer.
> Therefore, should use require_rvf() to check whether RVF/RVD is enabled.
>
> vfwcvt.f.xu.v, vfwcvt.f.x.v convert single-width integer to double-width
> floating-point, and vfwcvt.f.f.v convert double-width floating-point to
> single-width floating-point. Therefore, should use require_scale_rvf() to
> check whether RVF/RVD is enabled.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 34 ++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8d92243f2b..f1b44ccad2 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2613,16 +2613,27 @@ GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, RISCV_FRM_RTZ)
>  static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
>  {
>      return require_rvv(s) &&
> -           require_scale_rvf(s) &&
> -           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_ds(s, a->rd, a->rs2, a->vm);
>  }
>
> -#define GEN_OPFV_WIDEN_TRANS(NAME, HELPER, FRM)                    \
> +static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
> +{
> +    return opfv_widen_check(s, a) &&
> +           require_rvf(s);
> +}
> +
> +static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
> +{
> +    return opfv_widen_check(s, a) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8);
> +}
> +
> +#define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
> -    if (opfv_widen_check(s, a)) {                                  \
> +    if (CHECK(s, a)) {                                             \
>          if (FRM != RISCV_FRM_DYN) {                                \
>              gen_set_rm(s, RISCV_FRM_DYN);                          \
>          }                                                          \
> @@ -2649,12 +2660,17 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>      return false;                                                  \
>  }
>
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_DYN)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, vfwcvt_x_f_v, RISCV_FRM_DYN)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, vfwcvt_f_f_v, RISCV_FRM_DYN)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, opxfv_widen_check, vfwcvt_xu_f_v,
> +                     RISCV_FRM_DYN)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, opxfv_widen_check, vfwcvt_x_f_v,
> +                     RISCV_FRM_DYN)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, opffv_widen_check, vfwcvt_f_f_v,
> +                     RISCV_FRM_DYN)
>  /* Reuse the helper functions from vfwcvt.xu.f.v and vfwcvt.x.f.v */
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_RTZ)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, vfwcvt_x_f_v, RISCV_FRM_RTZ)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, opxfv_widen_check, vfwcvt_xu_f_v,
> +                     RISCV_FRM_RTZ)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, opxfv_widen_check, vfwcvt_x_f_v,
> +                     RISCV_FRM_RTZ)
>
>  static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
>  {
> --
> 2.31.1
>
>

