Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wIk-0004vH-E1
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wIf-0004rX-4T; Tue, 19 Jan 2021 14:04:21 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:40972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wIZ-0005go-LE; Tue, 19 Jan 2021 14:04:20 -0500
Received: by mail-io1-xd34.google.com with SMTP id q1so41810420ion.8;
 Tue, 19 Jan 2021 11:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fDwQbCV88INCUmrMKOa8Gh781HOFpXF42hXDa1NgXbg=;
 b=tdE+iXuIVPBzqeNFWfwMAephwMPdDbLFWcHmNIqsaQCzPhK4v//5WobdZsPs1q+vJG
 vrb72HPFAQI6kYpV8fMeUqOypDAvJiTFCgS2AEHTQ8urrkURVk7EtpCzy0oT2dKn7WAY
 4gcqjKhQzzmahIuSCVwsf5ZkIYt7yutJRCnb4QYA61P7r0wRwr1OEOOMZ64evjJpTlzf
 6MPYWw9BN82LLMz0hiCh5RsO01TR1UN6QGcUIUETdjeElmivqMG+Z/UrdlqF8sVgBQWI
 dFioUfgZWrI+hPeGdBBwsCgCfTZ/b42lzxVNK/V8TCah7qJefpppN8XZwiezBiwdgR7/
 5gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fDwQbCV88INCUmrMKOa8Gh781HOFpXF42hXDa1NgXbg=;
 b=mccHsEfz8GTvKx8iw+uB2kE64vQKcsv1HEoQblbsbJpsBuWIkKTyQmJq9uOlZM5Sze
 9hPNGIET5trnQ45Sj0a94LEwv92r0CJfNZ6ZECVrTtE4AUiMYfmqjWCucfHlPI+8vdcG
 CE5tKzPemIX5Z0rzsza1l0VVBg9q9tJzXf/kfcuIWyYxYuoUPHNyKYNImDKGm/IRfk9g
 EmF8Fr3sHFyXiPdiz6KhFu/nE6BhKzsvywimX8Ad4fzyGtHcrbEkYvUKGgcilP+BIRaP
 qP6bAJAPUxaEe5FjiGiIrWwjKrO5Y4B1jKNSF2nrnkutRxfnMG8pkKHq1pzsKKX3nmHc
 zCFw==
X-Gm-Message-State: AOAM530eznKGnM6nA3afbOHo0qEmx0e/KG7zYhhDYalG8XoZI+6oirvN
 +yRlJFPwPCy952OhDD6snv+QskImVcgsQoWtsYc=
X-Google-Smtp-Source: ABdhPJxxXPEdYYBKd9fNCqZxFRBLVdsQqX/a+jV8QLwNZyXi6ykYzJeNR/oIyBOusbmx7SLUDS+fMB4mNUQSq13Zcxk=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr4672302ild.267.1611083053170; 
 Tue, 19 Jan 2021 11:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-19-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-19-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 11:03:46 -0800
Message-ID: <CAKmqyKMzRYy_cFK7QzBQYvzB5ZOQ4O1Z4eSAVbV7cKcvbb6kkw@mail.gmail.com>
Subject: Re: [PATCH v6 18/72] target/riscv: rvv-1.0: stride load and store
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 19:04:22 -0000

On Tue, Jan 12, 2021 at 2:10 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 129 +++-----------
>  target/riscv/insn32.decode              |  43 +++--
>  target/riscv/insn_trans/trans_rvv.c.inc | 227 +++++++++++-------------
>  target/riscv/vector_helper.c            | 190 ++++++--------------
>  4 files changed, 194 insertions(+), 395 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index e3f3f41e891..ab865f4919f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -79,111 +79,30 @@ DEF_HELPER_2(hyp_hlvx_wu, tl, env, tl)
>
>  /* Vector functions */
>  DEF_HELPER_3(vsetvl, tl, env, tl, tl)
> -DEF_HELPER_5(vlb_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_b_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlb_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlh_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlh_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlh_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlh_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlh_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlh_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlw_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlw_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlw_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlw_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_b_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vle_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_b_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlbu_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhu_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhu_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhu_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhu_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhu_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlhu_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwu_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwu_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwu_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vlwu_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_b_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsb_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsh_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsh_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsh_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsh_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsh_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsh_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsw_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsw_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsw_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vsw_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_b, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_b_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_h, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_h_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_w, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_w_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_d, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_5(vse_v_d_mask, void, ptr, ptr, tl, env, i32)
> -DEF_HELPER_6(vlsb_v_b, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsb_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsb_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsb_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsh_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsh_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsh_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsw_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsw_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlse_v_b, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlse_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlse_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlse_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsbu_v_b, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsbu_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsbu_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlsbu_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlshu_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlshu_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlshu_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlswu_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlswu_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssb_v_b, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssb_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssb_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssb_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssh_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssh_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssh_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssw_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vssw_v_d, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vsse_v_b, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vsse_v_h, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vsse_v_w, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vsse_v_d, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_5(vle8_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle16_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle32_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle64_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle8_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle16_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle32_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vle64_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse8_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse16_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse32_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse64_v, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
> +DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vlse64_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse16_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse32_v, void, ptr, ptr, tl, tl, env, i32)
> +DEF_HELPER_6(vsse64_v, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vlxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vlxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vlxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 84080dd18ca..63811c0bd19 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -240,13 +240,26 @@ hfence_vvma 0010001  .....  ..... 000 00000 1110011=
 @hfence_vvma
>  # *** RV32V Extension ***
>
>  # *** Vector loads and stores are encoded within LOADFP/STORE-FP ***
> -vlb_v      ... 100 . 00000 ..... 000 ..... 0000111 @r2_nfvm
> -vlh_v      ... 100 . 00000 ..... 101 ..... 0000111 @r2_nfvm
> -vlw_v      ... 100 . 00000 ..... 110 ..... 0000111 @r2_nfvm
> -vle_v      ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
> -vlbu_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
> -vlhu_v     ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
> -vlwu_v     ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
> +# Vector unit-stride load/store insns.
> +vle8_v     ... 000 . 00000 ..... 000 ..... 0000111 @r2_nfvm
> +vle16_v    ... 000 . 00000 ..... 101 ..... 0000111 @r2_nfvm
> +vle32_v    ... 000 . 00000 ..... 110 ..... 0000111 @r2_nfvm
> +vle64_v    ... 000 . 00000 ..... 111 ..... 0000111 @r2_nfvm
> +vse8_v     ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
> +vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
> +vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
> +vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
> +
> +# Vector strided insns.
> +vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
> +vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
> +vlse32_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
> +vlse64_v    ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
> +vsse8_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
> +vsse16_v    ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
> +vsse32_v    ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
> +vsse64_v    ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
> +
>  vlbff_v    ... 100 . 10000 ..... 000 ..... 0000111 @r2_nfvm
>  vlhff_v    ... 100 . 10000 ..... 101 ..... 0000111 @r2_nfvm
>  vlwff_v    ... 100 . 10000 ..... 110 ..... 0000111 @r2_nfvm
> @@ -254,22 +267,6 @@ vleff_v    ... 000 . 10000 ..... 111 ..... 0000111 @=
r2_nfvm
>  vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 @r2_nfvm
>  vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
>  vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
> -vsb_v      ... 000 . 00000 ..... 000 ..... 0100111 @r2_nfvm
> -vsh_v      ... 000 . 00000 ..... 101 ..... 0100111 @r2_nfvm
> -vsw_v      ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
> -vse_v      ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
> -
> -vlsb_v     ... 110 . ..... ..... 000 ..... 0000111 @r_nfvm
> -vlsh_v     ... 110 . ..... ..... 101 ..... 0000111 @r_nfvm
> -vlsw_v     ... 110 . ..... ..... 110 ..... 0000111 @r_nfvm
> -vlse_v     ... 010 . ..... ..... 111 ..... 0000111 @r_nfvm
> -vlsbu_v    ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
> -vlshu_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
> -vlswu_v    ... 010 . ..... ..... 110 ..... 0000111 @r_nfvm
> -vssb_v     ... 010 . ..... ..... 000 ..... 0100111 @r_nfvm
> -vssh_v     ... 010 . ..... ..... 101 ..... 0100111 @r_nfvm
> -vssw_v     ... 010 . ..... ..... 110 ..... 0100111 @r_nfvm
> -vsse_v     ... 010 . ..... ..... 111 ..... 0100111 @r_nfvm
>
>  vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
>  vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index a3732e76e09..ec65ee65adb 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -188,9 +188,42 @@ static uint32_t vreg_ofs(DisasContext *s, int reg)
>  /* check functions */
>
>  /*
> - * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
> - * So RVV is also be checked in this function.
> + * Vector unit-stride, strided, unit-stride segment, strided segment
> + * store check function.
> + *
> + * Rules to be checked here:
> + *   1. EMUL must within the range: 1/8 <=3D EMUL <=3D 8. (Section 7.3)
> + *   2. Destination vector register number is multiples of EMUL.
> + *      (Section 3.3.2, 7.3)
> + *   3. The EMUL setting must be such that EMUL * NFIELDS =E2=89=A4 8. (=
Section 7.8)
> + *   4. Vector register numbers accessed by the segment load or store
> + *      cannot increment past 31. (Section 7.8)
> + */
> +static bool vext_check_store(DisasContext *s, int vd, int nf, uint8_t ee=
w)
> +{
> +    int8_t emul =3D eew - s->sew + s->lmul;
> +    return (emul >=3D -3 && emul <=3D 3) &&
> +            require_align(vd, emul) &&
> +            require_nf(vd, nf, emul);
> +}
> +
> +/*
> + * Vector unit-stride, strided, unit-stride segment, strided segment
> + * load check function.
> + *
> + * Rules to be checked here:
> + *   1. All rules applies to store instructions are applies
> + *      to load instructions.
> + *   2. Destination vector register group for a masked vector
> + *      instruction cannot overlap the source mask register (v0).
> + *      (Section 5.3)
>   */
> +static bool vext_check_load(DisasContext *s, int vd, int nf, int vm,
> +                            uint8_t eew)
> +{
> +    return vext_check_store(s, vd, nf, eew) && require_vm(vm, vd);
> +}
> +
>  static bool vext_check_isa_ill(DisasContext *s)
>  {
>      return !s->vill;
> @@ -437,13 +470,13 @@ static bool vext_check_isa_ill(DisasContext *s)
>  }
>
>  /* common translation macro */
> -#define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
> -static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
> -{                                                          \
> -    if (CHECK(s, a)) {                                     \
> -        return OP(s, a, SEQ);                              \
> -    }                                                      \
> -    return false;                                          \
> +#define GEN_VEXT_TRANS(NAME, EEW, ARGTYPE, OP, CHECK)        \
> +static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
> +{                                                            \
> +    if (CHECK(s, a, EEW)) {                                  \
> +        return OP(s, a, EEW);                                \
> +    }                                                        \
> +    return false;                                            \
>  }
>
>  /*
> @@ -493,44 +526,20 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1=
, uint32_t data,
>      return true;
>  }
>
> -static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
> +static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>  {
>      uint32_t data =3D 0;
>      gen_helper_ldst_us *fn;
> -    static gen_helper_ldst_us * const fns[2][7][4] =3D {
> +    static gen_helper_ldst_us * const fns[2][4] =3D {
>          /* masked unit stride load */
> -        { { gen_helper_vlb_v_b_mask,  gen_helper_vlb_v_h_mask,
> -            gen_helper_vlb_v_w_mask,  gen_helper_vlb_v_d_mask },
> -          { NULL,                     gen_helper_vlh_v_h_mask,
> -            gen_helper_vlh_v_w_mask,  gen_helper_vlh_v_d_mask },
> -          { NULL,                     NULL,
> -            gen_helper_vlw_v_w_mask,  gen_helper_vlw_v_d_mask },
> -          { gen_helper_vle_v_b_mask,  gen_helper_vle_v_h_mask,
> -            gen_helper_vle_v_w_mask,  gen_helper_vle_v_d_mask },
> -          { gen_helper_vlbu_v_b_mask, gen_helper_vlbu_v_h_mask,
> -            gen_helper_vlbu_v_w_mask, gen_helper_vlbu_v_d_mask },
> -          { NULL,                     gen_helper_vlhu_v_h_mask,
> -            gen_helper_vlhu_v_w_mask, gen_helper_vlhu_v_d_mask },
> -          { NULL,                     NULL,
> -            gen_helper_vlwu_v_w_mask, gen_helper_vlwu_v_d_mask } },
> +        { gen_helper_vle8_v_mask, gen_helper_vle16_v_mask,
> +          gen_helper_vle32_v_mask, gen_helper_vle64_v_mask },
>          /* unmasked unit stride load */
> -        { { gen_helper_vlb_v_b,  gen_helper_vlb_v_h,
> -            gen_helper_vlb_v_w,  gen_helper_vlb_v_d },
> -          { NULL,                gen_helper_vlh_v_h,
> -            gen_helper_vlh_v_w,  gen_helper_vlh_v_d },
> -          { NULL,                NULL,
> -            gen_helper_vlw_v_w,  gen_helper_vlw_v_d },
> -          { gen_helper_vle_v_b,  gen_helper_vle_v_h,
> -            gen_helper_vle_v_w,  gen_helper_vle_v_d },
> -          { gen_helper_vlbu_v_b, gen_helper_vlbu_v_h,
> -            gen_helper_vlbu_v_w, gen_helper_vlbu_v_d },
> -          { NULL,                gen_helper_vlhu_v_h,
> -            gen_helper_vlhu_v_w, gen_helper_vlhu_v_d },
> -          { NULL,                NULL,
> -            gen_helper_vlwu_v_w, gen_helper_vlwu_v_d } }
> +        { gen_helper_vle8_v, gen_helper_vle16_v,
> +          gen_helper_vle32_v, gen_helper_vle64_v }
>      };
>
> -    fn =3D  fns[a->vm][seq][s->sew];
> +    fn =3D  fns[a->vm][eew];
>      if (fn =3D=3D NULL) {
>          return false;
>      }
> @@ -541,48 +550,32 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a=
, uint8_t seq)
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
>
> -static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
> +static bool ld_us_check(DisasContext *s, arg_r2nfvm* a, uint8_t eew)
>  {
> -    return (vext_check_isa_ill(s) &&
> -            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_nf(s, a->nf));
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_load(s, a->rd, a->nf, a->vm, eew);
>  }
>
> -GEN_VEXT_TRANS(vlb_v, 0, r2nfvm, ld_us_op, ld_us_check)
> -GEN_VEXT_TRANS(vlh_v, 1, r2nfvm, ld_us_op, ld_us_check)
> -GEN_VEXT_TRANS(vlw_v, 2, r2nfvm, ld_us_op, ld_us_check)
> -GEN_VEXT_TRANS(vle_v, 3, r2nfvm, ld_us_op, ld_us_check)
> -GEN_VEXT_TRANS(vlbu_v, 4, r2nfvm, ld_us_op, ld_us_check)
> -GEN_VEXT_TRANS(vlhu_v, 5, r2nfvm, ld_us_op, ld_us_check)
> -GEN_VEXT_TRANS(vlwu_v, 6, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vle8_v,  MO_8,  r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vle16_v, MO_16, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vle32_v, MO_32, r2nfvm, ld_us_op, ld_us_check)
> +GEN_VEXT_TRANS(vle64_v, MO_64, r2nfvm, ld_us_op, ld_us_check)
>
> -static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
> +static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>  {
>      uint32_t data =3D 0;
>      gen_helper_ldst_us *fn;
> -    static gen_helper_ldst_us * const fns[2][4][4] =3D {
> -        /* masked unit stride load and store */
> -        { { gen_helper_vsb_v_b_mask,  gen_helper_vsb_v_h_mask,
> -            gen_helper_vsb_v_w_mask,  gen_helper_vsb_v_d_mask },
> -          { NULL,                     gen_helper_vsh_v_h_mask,
> -            gen_helper_vsh_v_w_mask,  gen_helper_vsh_v_d_mask },
> -          { NULL,                     NULL,
> -            gen_helper_vsw_v_w_mask,  gen_helper_vsw_v_d_mask },
> -          { gen_helper_vse_v_b_mask,  gen_helper_vse_v_h_mask,
> -            gen_helper_vse_v_w_mask,  gen_helper_vse_v_d_mask } },
> +    static gen_helper_ldst_us * const fns[2][4] =3D {
> +        /* masked unit stride store */
> +        { gen_helper_vse8_v_mask, gen_helper_vse16_v_mask,
> +          gen_helper_vse32_v_mask, gen_helper_vse64_v_mask },
>          /* unmasked unit stride store */
> -        { { gen_helper_vsb_v_b,  gen_helper_vsb_v_h,
> -            gen_helper_vsb_v_w,  gen_helper_vsb_v_d },
> -          { NULL,                gen_helper_vsh_v_h,
> -            gen_helper_vsh_v_w,  gen_helper_vsh_v_d },
> -          { NULL,                NULL,
> -            gen_helper_vsw_v_w,  gen_helper_vsw_v_d },
> -          { gen_helper_vse_v_b,  gen_helper_vse_v_h,
> -            gen_helper_vse_v_w,  gen_helper_vse_v_d } }
> +        { gen_helper_vse8_v, gen_helper_vse16_v,
> +          gen_helper_vse32_v, gen_helper_vse64_v }
>      };
>
> -    fn =3D  fns[a->vm][seq][s->sew];
> +    fn =3D  fns[a->vm][eew];
>      if (fn =3D=3D NULL) {
>          return false;
>      }
> @@ -593,17 +586,17 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a=
, uint8_t seq)
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>  }
>
> -static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
> +static bool st_us_check(DisasContext *s, arg_r2nfvm* a, uint8_t eew)
>  {
> -    return (vext_check_isa_ill(s) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_nf(s, a->nf));
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_store(s, a->rd, a->nf, eew);
>  }
>
> -GEN_VEXT_TRANS(vsb_v, 0, r2nfvm, st_us_op, st_us_check)
> -GEN_VEXT_TRANS(vsh_v, 1, r2nfvm, st_us_op, st_us_check)
> -GEN_VEXT_TRANS(vsw_v, 2, r2nfvm, st_us_op, st_us_check)
> -GEN_VEXT_TRANS(vse_v, 3, r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vse8_v,  MO_8,  r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
> +GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
>
>  /*
>   *** stride load and store
> @@ -647,28 +640,16 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t=
 rs1, uint32_t rs2,
>      return true;
>  }
>
> -static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>  {
>      uint32_t data =3D 0;
>      gen_helper_ldst_stride *fn;
> -    static gen_helper_ldst_stride * const fns[7][4] =3D {
> -        { gen_helper_vlsb_v_b,  gen_helper_vlsb_v_h,
> -          gen_helper_vlsb_v_w,  gen_helper_vlsb_v_d },
> -        { NULL,                 gen_helper_vlsh_v_h,
> -          gen_helper_vlsh_v_w,  gen_helper_vlsh_v_d },
> -        { NULL,                 NULL,
> -          gen_helper_vlsw_v_w,  gen_helper_vlsw_v_d },
> -        { gen_helper_vlse_v_b,  gen_helper_vlse_v_h,
> -          gen_helper_vlse_v_w,  gen_helper_vlse_v_d },
> -        { gen_helper_vlsbu_v_b, gen_helper_vlsbu_v_h,
> -          gen_helper_vlsbu_v_w, gen_helper_vlsbu_v_d },
> -        { NULL,                 gen_helper_vlshu_v_h,
> -          gen_helper_vlshu_v_w, gen_helper_vlshu_v_d },
> -        { NULL,                 NULL,
> -          gen_helper_vlswu_v_w, gen_helper_vlswu_v_d },
> +    static gen_helper_ldst_stride * const fns[4] =3D {
> +        gen_helper_vlse8_v, gen_helper_vlse16_v,
> +        gen_helper_vlse32_v, gen_helper_vlse64_v
>      };
>
> -    fn =3D  fns[seq][s->sew];
> +    fn =3D fns[eew];
>      if (fn =3D=3D NULL) {
>          return false;
>      }
> @@ -679,42 +660,32 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm=
 *a, uint8_t seq)
>      return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
> -static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
> +static bool ld_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
>  {
> -    return (vext_check_isa_ill(s) &&
> -            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_nf(s, a->nf));
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_load(s, a->rd, a->nf, a->vm, eew);
>  }
>
> -GEN_VEXT_TRANS(vlsb_v, 0, rnfvm, ld_stride_op, ld_stride_check)
> -GEN_VEXT_TRANS(vlsh_v, 1, rnfvm, ld_stride_op, ld_stride_check)
> -GEN_VEXT_TRANS(vlsw_v, 2, rnfvm, ld_stride_op, ld_stride_check)
> -GEN_VEXT_TRANS(vlse_v, 3, rnfvm, ld_stride_op, ld_stride_check)
> -GEN_VEXT_TRANS(vlsbu_v, 4, rnfvm, ld_stride_op, ld_stride_check)
> -GEN_VEXT_TRANS(vlshu_v, 5, rnfvm, ld_stride_op, ld_stride_check)
> -GEN_VEXT_TRANS(vlswu_v, 6, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse8_v,  MO_8,  rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse16_v, MO_16, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse32_v, MO_32, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse64_v, MO_64, rnfvm, ld_stride_op, ld_stride_check)
>
> -static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>  {
>      uint32_t data =3D 0;
>      gen_helper_ldst_stride *fn;
> -    static gen_helper_ldst_stride * const fns[4][4] =3D {
> +    static gen_helper_ldst_stride * const fns[4] =3D {
>          /* masked stride store */
> -        { gen_helper_vssb_v_b,  gen_helper_vssb_v_h,
> -          gen_helper_vssb_v_w,  gen_helper_vssb_v_d },
> -        { NULL,                 gen_helper_vssh_v_h,
> -          gen_helper_vssh_v_w,  gen_helper_vssh_v_d },
> -        { NULL,                 NULL,
> -          gen_helper_vssw_v_w,  gen_helper_vssw_v_d },
> -        { gen_helper_vsse_v_b,  gen_helper_vsse_v_h,
> -          gen_helper_vsse_v_w,  gen_helper_vsse_v_d }
> +        gen_helper_vsse8_v,  gen_helper_vsse16_v,
> +        gen_helper_vsse32_v,  gen_helper_vsse64_v
>      };
>
>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>      data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data =3D FIELD_DP32(data, VDATA, NF, a->nf);
> -    fn =3D  fns[seq][s->sew];
> +    fn =3D fns[eew];
>      if (fn =3D=3D NULL) {
>          return false;
>      }
> @@ -722,17 +693,17 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm=
 *a, uint8_t seq)
>      return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>  }
>
> -static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
> +static bool st_stride_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
>  {
> -    return (vext_check_isa_ill(s) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_nf(s, a->nf));
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_store(s, a->rd, a->nf, eew);
>  }
>
> -GEN_VEXT_TRANS(vssb_v, 0, rnfvm, st_stride_op, st_stride_check)
> -GEN_VEXT_TRANS(vssh_v, 1, rnfvm, st_stride_op, st_stride_check)
> -GEN_VEXT_TRANS(vssw_v, 2, rnfvm, st_stride_op, st_stride_check)
> -GEN_VEXT_TRANS(vsse_v, 3, rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vsse8_v,  MO_8,  rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vsse16_v, MO_16, rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vsse32_v, MO_32, rnfvm, st_stride_op, st_stride_check)
> +GEN_VEXT_TRANS(vsse64_v, MO_64, rnfvm, st_stride_op, st_stride_check)
>
>  /*
>   *** index load and store
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 61917d34ffe..7ce6d0fb50f 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -183,38 +183,18 @@ static inline int vext_elem_mask(void *v0, int inde=
x)
>  typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
>                                 uint32_t idx, void *vd, uintptr_t retaddr=
);
>
> -#define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)     \
> +#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
>  static void NAME(CPURISCVState *env, abi_ptr addr,         \
>                   uint32_t idx, void *vd, uintptr_t retaddr)\
>  {                                                          \
> -    MTYPE data;                                            \
>      ETYPE *cur =3D ((ETYPE *)vd + H(idx));                   \
> -    data =3D cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
> -    *cur =3D data;                                           \
> +    *cur =3D cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
>  }                                                          \
>
> -GEN_VEXT_LD_ELEM(ldb_b, int8_t,  int8_t,  H1, ldsb)
> -GEN_VEXT_LD_ELEM(ldb_h, int8_t,  int16_t, H2, ldsb)
> -GEN_VEXT_LD_ELEM(ldb_w, int8_t,  int32_t, H4, ldsb)
> -GEN_VEXT_LD_ELEM(ldb_d, int8_t,  int64_t, H8, ldsb)
> -GEN_VEXT_LD_ELEM(ldh_h, int16_t, int16_t, H2, ldsw)
> -GEN_VEXT_LD_ELEM(ldh_w, int16_t, int32_t, H4, ldsw)
> -GEN_VEXT_LD_ELEM(ldh_d, int16_t, int64_t, H8, ldsw)
> -GEN_VEXT_LD_ELEM(ldw_w, int32_t, int32_t, H4, ldl)
> -GEN_VEXT_LD_ELEM(ldw_d, int32_t, int64_t, H8, ldl)
> -GEN_VEXT_LD_ELEM(lde_b, int8_t,  int8_t,  H1, ldsb)
> -GEN_VEXT_LD_ELEM(lde_h, int16_t, int16_t, H2, ldsw)
> -GEN_VEXT_LD_ELEM(lde_w, int32_t, int32_t, H4, ldl)
> -GEN_VEXT_LD_ELEM(lde_d, int64_t, int64_t, H8, ldq)
> -GEN_VEXT_LD_ELEM(ldbu_b, uint8_t,  uint8_t,  H1, ldub)
> -GEN_VEXT_LD_ELEM(ldbu_h, uint8_t,  uint16_t, H2, ldub)
> -GEN_VEXT_LD_ELEM(ldbu_w, uint8_t,  uint32_t, H4, ldub)
> -GEN_VEXT_LD_ELEM(ldbu_d, uint8_t,  uint64_t, H8, ldub)
> -GEN_VEXT_LD_ELEM(ldhu_h, uint16_t, uint16_t, H2, lduw)
> -GEN_VEXT_LD_ELEM(ldhu_w, uint16_t, uint32_t, H4, lduw)
> -GEN_VEXT_LD_ELEM(ldhu_d, uint16_t, uint64_t, H8, lduw)
> -GEN_VEXT_LD_ELEM(ldwu_w, uint32_t, uint32_t, H4, ldl)
> -GEN_VEXT_LD_ELEM(ldwu_d, uint32_t, uint64_t, H8, ldl)
> +GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
> +GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
> +GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
> +GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
>
>  #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
>  static void NAME(CPURISCVState *env, abi_ptr addr,         \
> @@ -224,15 +204,6 @@ static void NAME(CPURISCVState *env, abi_ptr addr,  =
       \
>      cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
>  }
>
> -GEN_VEXT_ST_ELEM(stb_b, int8_t,  H1, stb)
> -GEN_VEXT_ST_ELEM(stb_h, int16_t, H2, stb)
> -GEN_VEXT_ST_ELEM(stb_w, int32_t, H4, stb)
> -GEN_VEXT_ST_ELEM(stb_d, int64_t, H8, stb)
> -GEN_VEXT_ST_ELEM(sth_h, int16_t, H2, stw)
> -GEN_VEXT_ST_ELEM(sth_w, int32_t, H4, stw)
> -GEN_VEXT_ST_ELEM(sth_d, int64_t, H8, stw)
> -GEN_VEXT_ST_ELEM(stw_w, int32_t, H4, stl)
> -GEN_VEXT_ST_ELEM(stw_d, int64_t, H8, stl)
>  GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
>  GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>  GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
> @@ -246,8 +217,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
>                   target_ulong stride, CPURISCVState *env,
>                   uint32_t desc, uint32_t vm,
>                   vext_ldst_elem_fn *ldst_elem,
> -                 uint32_t esz, uint32_t msz, uintptr_t ra,
> -                 MMUAccessType access_type)
> +                 uint32_t esz, uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf =3D vext_nf(desc);
> @@ -258,7 +228,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong bas=
e,
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        probe_pages(env, base + stride * i, nf * msz, ra, access_type);
> +        probe_pages(env, base + stride * i, nf * esz, ra, access_type);
>      }
>      /* do real access */
>      for (i =3D 0; i < env->vl; i++) {
> @@ -267,71 +237,42 @@ vext_ldst_stride(void *vd, void *v0, target_ulong b=
ase,
>              continue;
>          }
>          while (k < nf) {
> -            target_ulong addr =3D base + stride * i + k * msz;
> +            target_ulong addr =3D base + stride * i + k * esz;
>              ldst_elem(env, addr, i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
>  }
>
> -#define GEN_VEXT_LD_STRIDE(NAME, MTYPE, ETYPE, LOAD_FN)                 =
\
> +#define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        =
\
>  void HELPER(NAME)(void *vd, void * v0, target_ulong base,               =
\
>                    target_ulong stride, CPURISCVState *env,              =
\
>                    uint32_t desc)                                        =
\
>  {                                                                       =
\
>      uint32_t vm =3D vext_vm(desc);                                      =
  \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN,      =
\
> -                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
> -                     GETPC(), MMU_DATA_LOAD);                           =
\
> -}
> -
> -GEN_VEXT_LD_STRIDE(vlsb_v_b,  int8_t,   int8_t,   ldb_b)
> -GEN_VEXT_LD_STRIDE(vlsb_v_h,  int8_t,   int16_t,  ldb_h)
> -GEN_VEXT_LD_STRIDE(vlsb_v_w,  int8_t,   int32_t,  ldb_w)
> -GEN_VEXT_LD_STRIDE(vlsb_v_d,  int8_t,   int64_t,  ldb_d)
> -GEN_VEXT_LD_STRIDE(vlsh_v_h,  int16_t,  int16_t,  ldh_h)
> -GEN_VEXT_LD_STRIDE(vlsh_v_w,  int16_t,  int32_t,  ldh_w)
> -GEN_VEXT_LD_STRIDE(vlsh_v_d,  int16_t,  int64_t,  ldh_d)
> -GEN_VEXT_LD_STRIDE(vlsw_v_w,  int32_t,  int32_t,  ldw_w)
> -GEN_VEXT_LD_STRIDE(vlsw_v_d,  int32_t,  int64_t,  ldw_d)
> -GEN_VEXT_LD_STRIDE(vlse_v_b,  int8_t,   int8_t,   lde_b)
> -GEN_VEXT_LD_STRIDE(vlse_v_h,  int16_t,  int16_t,  lde_h)
> -GEN_VEXT_LD_STRIDE(vlse_v_w,  int32_t,  int32_t,  lde_w)
> -GEN_VEXT_LD_STRIDE(vlse_v_d,  int64_t,  int64_t,  lde_d)
> -GEN_VEXT_LD_STRIDE(vlsbu_v_b, uint8_t,  uint8_t,  ldbu_b)
> -GEN_VEXT_LD_STRIDE(vlsbu_v_h, uint8_t,  uint16_t, ldbu_h)
> -GEN_VEXT_LD_STRIDE(vlsbu_v_w, uint8_t,  uint32_t, ldbu_w)
> -GEN_VEXT_LD_STRIDE(vlsbu_v_d, uint8_t,  uint64_t, ldbu_d)
> -GEN_VEXT_LD_STRIDE(vlshu_v_h, uint16_t, uint16_t, ldhu_h)
> -GEN_VEXT_LD_STRIDE(vlshu_v_w, uint16_t, uint32_t, ldhu_w)
> -GEN_VEXT_LD_STRIDE(vlshu_v_d, uint16_t, uint64_t, ldhu_d)
> -GEN_VEXT_LD_STRIDE(vlswu_v_w, uint32_t, uint32_t, ldwu_w)
> -GEN_VEXT_LD_STRIDE(vlswu_v_d, uint32_t, uint64_t, ldwu_d)
> -
> -#define GEN_VEXT_ST_STRIDE(NAME, MTYPE, ETYPE, STORE_FN)                =
\
> +                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            =
\
> +}
> +
> +GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
> +GEN_VEXT_LD_STRIDE(vlse16_v, int16_t, lde_h)
> +GEN_VEXT_LD_STRIDE(vlse32_v, int32_t, lde_w)
> +GEN_VEXT_LD_STRIDE(vlse64_v, int64_t, lde_d)
> +
> +#define GEN_VEXT_ST_STRIDE(NAME, ETYPE, STORE_FN)                       =
\
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
>                    target_ulong stride, CPURISCVState *env,              =
\
>                    uint32_t desc)                                        =
\
>  {                                                                       =
\
>      uint32_t vm =3D vext_vm(desc);                                      =
  \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, vm, STORE_FN,     =
\
> -                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
> -                     GETPC(), MMU_DATA_STORE);                          =
\
> -}
> -
> -GEN_VEXT_ST_STRIDE(vssb_v_b, int8_t,  int8_t,  stb_b)
> -GEN_VEXT_ST_STRIDE(vssb_v_h, int8_t,  int16_t, stb_h)
> -GEN_VEXT_ST_STRIDE(vssb_v_w, int8_t,  int32_t, stb_w)
> -GEN_VEXT_ST_STRIDE(vssb_v_d, int8_t,  int64_t, stb_d)
> -GEN_VEXT_ST_STRIDE(vssh_v_h, int16_t, int16_t, sth_h)
> -GEN_VEXT_ST_STRIDE(vssh_v_w, int16_t, int32_t, sth_w)
> -GEN_VEXT_ST_STRIDE(vssh_v_d, int16_t, int64_t, sth_d)
> -GEN_VEXT_ST_STRIDE(vssw_v_w, int32_t, int32_t, stw_w)
> -GEN_VEXT_ST_STRIDE(vssw_v_d, int32_t, int64_t, stw_d)
> -GEN_VEXT_ST_STRIDE(vsse_v_b, int8_t,  int8_t,  ste_b)
> -GEN_VEXT_ST_STRIDE(vsse_v_h, int16_t, int16_t, ste_h)
> -GEN_VEXT_ST_STRIDE(vsse_v_w, int32_t, int32_t, ste_w)
> -GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_d)
> +                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           =
\
> +}
> +
> +GEN_VEXT_ST_STRIDE(vsse8_v,  int8_t,  ste_b)
> +GEN_VEXT_ST_STRIDE(vsse16_v, int16_t, ste_h)
> +GEN_VEXT_ST_STRIDE(vsse32_v, int32_t, ste_w)
> +GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
>
>  /*
>   *** unit-stride: access elements stored contiguously in memory
> @@ -340,20 +281,20 @@ GEN_VEXT_ST_STRIDE(vsse_v_d, int64_t, int64_t, ste_=
d)
>  /* unmasked unit-stride load and store operation*/
>  static void
>  vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t d=
esc,
> -             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t msz,
> -             uintptr_t ra, MMUAccessType access_type)
> +             vext_ldst_elem_fn *ldst_elem,
> +             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf =3D vext_nf(desc);
>      uint32_t vlmax =3D vext_maxsz(desc) / esz;
>
>      /* probe every access */
> -    probe_pages(env, base, env->vl * nf * msz, ra, access_type);
> +    probe_pages(env, base, env->vl * nf * esz, ra, access_type);
>      /* load bytes from guest memory */
>      for (i =3D 0; i < env->vl; i++) {
>          k =3D 0;
>          while (k < nf) {
> -            target_ulong addr =3D base + (i * nf + k) * msz;
> +            target_ulong addr =3D base + (i * nf + k) * esz;
>              ldst_elem(env, addr, i + k * vlmax, vd, ra);
>              k++;
>          }
> @@ -365,76 +306,47 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVS=
tate *env, uint32_t desc,
>   * stride =3D NF * sizeof (MTYPE)
>   */
>
> -#define GEN_VEXT_LD_US(NAME, MTYPE, ETYPE, LOAD_FN)                     =
\
> +#define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            =
\
>  void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
>                           CPURISCVState *env, uint32_t desc)             =
\
>  {                                                                       =
\
> -    uint32_t stride =3D vext_nf(desc) * sizeof(MTYPE);                  =
  \
> +    uint32_t stride =3D vext_nf(desc) * sizeof(ETYPE);                  =
  \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, false, LOAD_FN,   =
\
> -                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
> -                     GETPC(), MMU_DATA_LOAD);                           =
\
> +                     sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);            =
\
>  }                                                                       =
\
>                                                                          =
\
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
>                    CPURISCVState *env, uint32_t desc)                    =
\
>  {                                                                       =
\
>      vext_ldst_us(vd, base, env, desc, LOAD_FN,                          =
\
> -                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_LOAD); =
\
> -}
> -
> -GEN_VEXT_LD_US(vlb_v_b,  int8_t,   int8_t,   ldb_b)
> -GEN_VEXT_LD_US(vlb_v_h,  int8_t,   int16_t,  ldb_h)
> -GEN_VEXT_LD_US(vlb_v_w,  int8_t,   int32_t,  ldb_w)
> -GEN_VEXT_LD_US(vlb_v_d,  int8_t,   int64_t,  ldb_d)
> -GEN_VEXT_LD_US(vlh_v_h,  int16_t,  int16_t,  ldh_h)
> -GEN_VEXT_LD_US(vlh_v_w,  int16_t,  int32_t,  ldh_w)
> -GEN_VEXT_LD_US(vlh_v_d,  int16_t,  int64_t,  ldh_d)
> -GEN_VEXT_LD_US(vlw_v_w,  int32_t,  int32_t,  ldw_w)
> -GEN_VEXT_LD_US(vlw_v_d,  int32_t,  int64_t,  ldw_d)
> -GEN_VEXT_LD_US(vle_v_b,  int8_t,   int8_t,   lde_b)
> -GEN_VEXT_LD_US(vle_v_h,  int16_t,  int16_t,  lde_h)
> -GEN_VEXT_LD_US(vle_v_w,  int32_t,  int32_t,  lde_w)
> -GEN_VEXT_LD_US(vle_v_d,  int64_t,  int64_t,  lde_d)
> -GEN_VEXT_LD_US(vlbu_v_b, uint8_t,  uint8_t,  ldbu_b)
> -GEN_VEXT_LD_US(vlbu_v_h, uint8_t,  uint16_t, ldbu_h)
> -GEN_VEXT_LD_US(vlbu_v_w, uint8_t,  uint32_t, ldbu_w)
> -GEN_VEXT_LD_US(vlbu_v_d, uint8_t,  uint64_t, ldbu_d)
> -GEN_VEXT_LD_US(vlhu_v_h, uint16_t, uint16_t, ldhu_h)
> -GEN_VEXT_LD_US(vlhu_v_w, uint16_t, uint32_t, ldhu_w)
> -GEN_VEXT_LD_US(vlhu_v_d, uint16_t, uint64_t, ldhu_d)
> -GEN_VEXT_LD_US(vlwu_v_w, uint32_t, uint32_t, ldwu_w)
> -GEN_VEXT_LD_US(vlwu_v_d, uint32_t, uint64_t, ldwu_d)
> -
> -#define GEN_VEXT_ST_US(NAME, MTYPE, ETYPE, STORE_FN)                    =
\
> +                 sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);                =
\
> +}
> +
> +GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
> +GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
> +GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
> +GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
> +
> +#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           =
\
>  void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         =
\
>                           CPURISCVState *env, uint32_t desc)             =
\
>  {                                                                       =
\
> -    uint32_t stride =3D vext_nf(desc) * sizeof(MTYPE);                  =
  \
> +    uint32_t stride =3D vext_nf(desc) * sizeof(ETYPE);                  =
  \
>      vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  =
\
> -                     sizeof(ETYPE), sizeof(MTYPE),                      =
\
> -                     GETPC(), MMU_DATA_STORE);                          =
\
> +                     sizeof(ETYPE), GETPC(), MMU_DATA_STORE);           =
\
>  }                                                                       =
\
>                                                                          =
\
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
\
>                    CPURISCVState *env, uint32_t desc)                    =
\
>  {                                                                       =
\
>      vext_ldst_us(vd, base, env, desc, STORE_FN,                         =
\
> -                 sizeof(ETYPE), sizeof(MTYPE), GETPC(), MMU_DATA_STORE);=
\
> -}
> -
> -GEN_VEXT_ST_US(vsb_v_b, int8_t,  int8_t , stb_b)
> -GEN_VEXT_ST_US(vsb_v_h, int8_t,  int16_t, stb_h)
> -GEN_VEXT_ST_US(vsb_v_w, int8_t,  int32_t, stb_w)
> -GEN_VEXT_ST_US(vsb_v_d, int8_t,  int64_t, stb_d)
> -GEN_VEXT_ST_US(vsh_v_h, int16_t, int16_t, sth_h)
> -GEN_VEXT_ST_US(vsh_v_w, int16_t, int32_t, sth_w)
> -GEN_VEXT_ST_US(vsh_v_d, int16_t, int64_t, sth_d)
> -GEN_VEXT_ST_US(vsw_v_w, int32_t, int32_t, stw_w)
> -GEN_VEXT_ST_US(vsw_v_d, int32_t, int64_t, stw_d)
> -GEN_VEXT_ST_US(vse_v_b, int8_t,  int8_t , ste_b)
> -GEN_VEXT_ST_US(vse_v_h, int16_t, int16_t, ste_h)
> -GEN_VEXT_ST_US(vse_v_w, int32_t, int32_t, ste_w)
> -GEN_VEXT_ST_US(vse_v_d, int64_t, int64_t, ste_d)
> +                 sizeof(ETYPE), GETPC(), MMU_DATA_STORE);               =
\
> +}
> +
> +GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
> +GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
> +GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
> +GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
>
>  /*
>   *** index: access vector element from indexed memory
> --
> 2.17.1
>
>

