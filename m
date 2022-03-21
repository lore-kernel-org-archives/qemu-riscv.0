Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nW5nd-0002bi-7w
	for mharc-qemu-riscv@gnu.org; Sun, 20 Mar 2022 20:21:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nW5nV-0002ZH-Ha; Sun, 20 Mar 2022 20:21:22 -0400
Received: from [2607:f8b0:4864:20::12f] (port=39482
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nW5nT-0006LE-Vw; Sun, 20 Mar 2022 20:21:21 -0400
Received: by mail-il1-x12f.google.com with SMTP id y7so2397942ilv.6;
 Sun, 20 Mar 2022 17:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i1ThPEmkMYxK1gTbRn8SRqAJAKq/gtMjb7SwTrDIymU=;
 b=Fji6ByDyLYnSdZWUhzh6z7gmrCU2B6PiuKiPd9nt+1hdiWwdEvruz8wPqGQSrtt3Gf
 9KiVXjHZgIrbeK4FFVwB3M6dQHAyOoEJlRH5Ydic61RSx7EB8sQ+4fJdtThB9oKg0lwB
 TIne/qZXH5D90uqJAqnL8+tqAYkbBbw4RZiI9ixprzRr81APLFCM7rlWMZLTFgkntVA4
 OkGbxlNIt83NW3i5q/08kKRMulahXnrcUTiB0KN4nklooZMUo8lqX1cJcIQ2VNLNyfq9
 QLc6d3RuElPnOlCbRXtQPIMfIGj4tuMmeby3vdGbYoCNOvE0ySDRKzkYd7/StahwAQC1
 AUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i1ThPEmkMYxK1gTbRn8SRqAJAKq/gtMjb7SwTrDIymU=;
 b=vo4UlcCm/XOizZFjXtszi8HibCwhF4/tjUi+UhFZkC9b8AKAM2mHPm36LcAfUw29M3
 LiZAclqq1Cl4bUxku1tFwVPb2jsa3QFsEYtaMX5tI2KfObnOAgtn8vLaPmiuPQFvQlB4
 PYycPgoHNBRRKx9NcB0fKtjYmLwmllvhCiTFhXdVQAJ2hUgJIbixL+K/5S9wbn8FU1ds
 DCz4+HE3qJurbSQS87eH++G9IxIaDhJZsigyFXbt6feUWJ7GvjeSxmU4i2xGnMcNWBwv
 Zqok6h/RoVX8EEpJUW1TVZPohhAHztXYOYHYVsPItREqCMAbdOUPlj5h3jkqggYJ7zGy
 hboQ==
X-Gm-Message-State: AOAM531i5GpznYKxc43WsonHa8QAq1w6FL6NHpyDYKWtVSV90ISy0InO
 ffwF1E8syF/4/+JnZt8sSCXYl9ErBuy4pa/iccQ=
X-Google-Smtp-Source: ABdhPJzKOvtIwXAZkgM9TAHWcnj6ZN8uRxsTeI7En8XMn7rCtb68ACI3lipZ5dMB6h2lwiCoDkheCASPIqT9n8PUYS0=
X-Received: by 2002:a05:6e02:218a:b0:2c8:1bf8:e15e with SMTP id
 j10-20020a056e02218a00b002c81bf8e15emr2767101ila.55.1647822077955; Sun, 20
 Mar 2022 17:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <164762720573.18409.3931931227997483525-0@git.sr.ht>
In-Reply-To: <164762720573.18409.3931931227997483525-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Mar 2022 10:20:52 +1000
Message-ID: <CAKmqyKPZUUJf7D56nFHosNeCUueeS4srV_TYGBepriz3xOGyDg@mail.gmail.com>
Subject: Re: [PATCH qemu] target/riscv: rvv: Add missing early exit condition
 for whole register load/store
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Mon, 21 Mar 2022 00:21:24 -0000

On Sat, Mar 19, 2022 at 6:59 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> According to v-spec (section 7.9):
> The instructions operate with an effective vector length, evl=3DNFIELDS*V=
LEN/EEW,
> regardless of current settings in vtype and vl. The usual property that n=
o
> elements are written if vstart =E2=89=A5 vl does not apply to these instr=
uctions.
> Instead, no elements are written if vstart =E2=89=A5 evl.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 275fded6e4..4ea7e41e1a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1121,6 +1121,10 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t=
 rs1, uint32_t nf,
>                               gen_helper_ldst_whole *fn, DisasContext *s,
>                               bool is_store)
>  {
> +    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / (1 << s->sew);
> +    TCGLabel *over =3D gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
> +
>      TCGv_ptr dest;
>      TCGv base;
>      TCGv_i32 desc;
> @@ -1140,6 +1144,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t =
rs1, uint32_t nf,
>      if (!is_store) {
>          mark_vs_dirty(s);
>      }
> +    gen_set_label(over);
>
>      return true;
>  }
> --
> 2.34.1
>

