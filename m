Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5E5F-0003N5-5T
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:44:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5E5C-0003Eh-R7; Wed, 05 Jan 2022 16:44:34 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=36384
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5E5B-0004u0-9o; Wed, 05 Jan 2022 16:44:34 -0500
Received: by mail-io1-xd2e.google.com with SMTP id p65so789198iof.3;
 Wed, 05 Jan 2022 13:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jAm6YrytEGgOhkDv5p62cUpTUpERbqfLXhEAtgUpHl4=;
 b=abUErB65uFtVDD99jdtlujWQdbTbOQSkpXxU5NC0wZZYbXaYYAzsAZBJM0fV0qUlmE
 MsEmBBZy1zGhD3IPxQxgNI4lHg2nX3k7dIlDXSF2WCF9rBgQ1PLLJnO1hJnBVYPOBERz
 9OXqt25oXbjYj9Qva+4nwSB8GVA0iV/h1QCJ4j1KELGIvRln4he+OIXu3QKeogi8FRJb
 82SoiU2sF6VNvUKGCR045OIPqdKLP7yJommJ6qJrATBI4foIwUFNschefSHbRHeJ31KO
 bShxaPGjCov1g00s67u74Chcgk1YbAcg1J3GJ7PT1AuPt1sHiYebBzEfnxrbb7/gY9bH
 qzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jAm6YrytEGgOhkDv5p62cUpTUpERbqfLXhEAtgUpHl4=;
 b=QWVaYRp4tVv56UgsbBqZyL4DBi0zm4upV6Hn3JVHJQwWWgaovKGF2SLKOchssxdGBi
 RlfAFqV6YWbVdiVRP85ogxAexotrfeZn1/EsJyt/CeirjxR9Gg8Vxm487FqYKHNnVTNl
 q2PIExGCOJvwH8QlS0kN+ERrUffnG172PnI9NcgW/pqjGbOQV1eIwBLp1ZYdl/eTO52i
 8p0gkUOj/iDC/CqcjXTDnHbftXJN2qw/+5mOjE4c6Gpu7bDwuvrMdXfDfzVtspxiFHEo
 Esh3oxexYaNi4eoRG3oq4Q5qux3vudjHFaF2rsv3YF37uLhA8c0zBKRCPt8gnCgFxzX1
 PPtw==
X-Gm-Message-State: AOAM531CBW6ZjwRKv4JVKnK2/NzR3XpMQJfbPKeqo9T4k9M7sd+Xtr0I
 Rd+Xe/ltDtIoF8nubN3PRAvGGASHaTr9DaYh7Uk=
X-Google-Smtp-Source: ABdhPJyO6SS0Lve0pPWVGCqsEkrRRFVVJNwW8KpHoKqf1sGOLIoKT90BnKCejWmWLMlUdWnnDbRR0HUTzoccR4ibTZY=
X-Received: by 2002:a5d:8f88:: with SMTP id l8mr26677268iol.91.1641419070780; 
 Wed, 05 Jan 2022 13:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20220105022247.21131-1-frank.chang@sifive.com>
 <20220105022247.21131-2-frank.chang@sifive.com>
In-Reply-To: <20220105022247.21131-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 07:44:04 +1000
Message-ID: <CAKmqyKOefc0rtAZL10pQVGr-aMq0Ggz9igbh=20aBx6usxpm0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: rvv-1.0: Call the correct RVF/RVD
 check function for widening fp insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 21:44:35 -0000

On Wed, Jan 5, 2022 at 12:24 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector widening floating-point instructions should use
> require_scale_rvf() instead of require_rvf() to check whether RVF/RVD is
> enabled.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5e3f7fdb77..8d92243f2b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2254,7 +2254,8 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
>  static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
>  }
> @@ -2292,7 +2293,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
>  static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_ds(s, a->rd, a->rs2, a->vm);
>  }
> @@ -2321,7 +2323,8 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
>  static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
>  }
> @@ -2359,7 +2362,8 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
>  static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
>  {
>      return require_rvv(s) &&
> -           require_rvf(s) &&
> +           require_scale_rvf(s) &&
> +           (s->sew != MO_8) &&
>             vext_check_isa_ill(s) &&
>             vext_check_dd(s, a->rd, a->rs2, a->vm);
>  }
> --
> 2.31.1
>
>

