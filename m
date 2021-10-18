Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLah-0006Tr-F0
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLaf-0006Pf-57; Mon, 18 Oct 2021 01:53:41 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLab-0005cb-6b; Mon, 18 Oct 2021 01:53:40 -0400
Received: by mail-io1-xd2b.google.com with SMTP id d125so14872830iof.5;
 Sun, 17 Oct 2021 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0OFFeNJ4rnmy+9UwQ4zNTU7uAVCfhDPNQ7uFinAx/s=;
 b=N72wFQp4K0t90de1/YvXSgHDCq+fAxaOqdjzY8h/NIWtKuelDKPoV47k660Fa6dJXD
 3DdZpElqADEznrkxflFcyGgXJC/rg4NHzE4Jl3WDbDgTKLHEYcjwym4FLymgourtktZV
 kM8hzS2fZz3uXgUod22RYnBPuzohjypDBOJqWkgMtnRSiqfNydxF0hCbq5hZm2Y2ddR7
 YRwriz4iHHjPOdLTrTjXKY3Vs4SGWoT/fgMj9jDN8eQp2SyogTOTadu3haTebioSrGpa
 IHrNJ5AKbM5/xsCGTEW+zKz3Z4FD4IYoI1nGu9wvCGH2Ljt0zh6SKmHd3GKbD+nIHDCk
 ReVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0OFFeNJ4rnmy+9UwQ4zNTU7uAVCfhDPNQ7uFinAx/s=;
 b=3vQDozzrvufFYPt04mHLS8hwd4lWxizW06OtG2DMn3JCdwKMztgtaWpUrhxcdSuFw7
 jrU9zyiu63TxvaCI5D3nOQD64n1rLhTe61kyrf4vSOG7mtPDEkkX1w+P4lXIiN4rvojh
 cpAROz/CwA1h3O5erzWfCg41SZztchKGPjGSPInZYhNi/aW3T/6L4HmwHtCds/TYHOXo
 ZuYJfQvsfZxIFpctmdU+hy65ht5u0JlXClojLl7QTvyGCx+SbrG5QaDGCXgCjUk+ArU8
 Cszyoft27saiTfenu4H5Upl787l+SExkJTQOqpsGmcwHxDol5f1504v572uIYG8c8eF5
 EgsQ==
X-Gm-Message-State: AOAM532VcO2q3pIEg2GIZ8XWQ7y/deQ61+JoNICaQg0TKT0jiJv34cSK
 7g4nhp84fMh0p+NAiz4hTyutCDdyEo84BNjuSi3+VPVthhcIPg==
X-Google-Smtp-Source: ABdhPJxYVKFlp6lhP/i70jmOCGZ8SxIeafgF7EuCJeQaKQuViWuOYd/6n69mnQnITYPNwEoOJAIFzghptZhMXHY8TvM=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr12523632iow.91.1634536415825; 
 Sun, 17 Oct 2021 22:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-39-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-39-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 15:53:10 +1000
Message-ID: <CAKmqyKNASdY3keVmqPHcAVHUkc8jg5_AAO_GW+6-2RwwFUnPEQ@mail.gmail.com>
Subject: Re: [PATCH v8 31/78] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:53:41 -0000

On Fri, Oct 15, 2021 at 6:06 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              | 6 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
>  target/riscv/vector_helper.c            | 4 ----
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4df2aa9cddc..d139c0aade7 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -629,9 +629,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
>  vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
>  vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
>  vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
> -vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
> -vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
> -vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
> +vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
> +vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
> +vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
>  viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
>  vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
>  vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5376adca60c..538a32a605a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2730,7 +2730,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
>  #define GEN_M_TRANS(NAME)                                          \
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
> -    if (vext_check_isa_ill(s)) {                                   \
> +    if (require_rvv(s) &&                                          \
> +        vext_check_isa_ill(s) &&                                   \
> +        require_vm(a->vm, a->rd) &&                                \
> +        (a->rd != a->rs2)) {                                       \
>          uint32_t data = 0;                                         \
>          gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
>          TCGLabel *over = gen_new_label();                          \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f97783acf05..b0dc971a860 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4260,7 +4260,6 @@ enum set_mask_type {
>  static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>                     uint32_t desc, enum set_mask_type type)
>  {
> -    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
>      int i;
> @@ -4290,9 +4289,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>              }
>          }
>      }
> -    for (; i < vlmax; i++) {
> -        vext_set_elem_mask(vd, i, 0);
> -    }
>  }
>
>  void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
> --
> 2.25.1
>
>

