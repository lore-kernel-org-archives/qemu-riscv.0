Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9auT-00061s-G1
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9auH-00060B-0h; Mon, 17 Jan 2022 17:55:21 -0500
Received: from [2607:f8b0:4864:20::d34] (port=44796
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9auF-0001Le-K1; Mon, 17 Jan 2022 17:55:20 -0500
Received: by mail-io1-xd34.google.com with SMTP id h23so23241433iol.11;
 Mon, 17 Jan 2022 14:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9cZ1Gk6CIVfNZwXD7M0Uln0lOwWrxeL03Xan7AXcB9E=;
 b=kp1bdZDv77fOcTgbJ6sMrIa0GzD2IujoT2mqEyMgOvCJzflxjZVcvEukfVSFyE1q+M
 LgzDHRaQcodYWagaXummNW83bUoU+/mCwl4df45g1PDkPgD08VDlxAkONsAPgPMOAZxu
 7RS+P6uuoQ8VEJ9p1EMBU3oIRA+IS7tDNCHTBTyiTn7Y/s+Ypo9UoUVteXA8aazbUHMm
 JdSetldMTziqvpPyC980GyXeUXpPHK9wcgpa4drFZHdUX7IUwJW7m5e5J3y6AMbzL9SR
 QTtt9Rkm0SCHbuITUlfW6OylVqTpjCcPYzU7q1/S6MwddY7cfVnv6u6v1qoDGgG+dx7U
 43EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9cZ1Gk6CIVfNZwXD7M0Uln0lOwWrxeL03Xan7AXcB9E=;
 b=YKGgWusx0F69jnpzlPW8eu2TcoWcBnP8LPo7rm4F+3cYBJ/0McOfcE57l1GyQ1MNn4
 4pw0f07OvCEMQHqiOXQS5p08v31rPf9gvGSKlb8rJO+96gSscRUkRz8zwU9TaghNIhxU
 m1zGO2/EnWZ1zehIV/v8uf4Dv93qArgnrVzLFxOqksw0jQmPE+AX0LLXh3UnomLTChxi
 NZDBoLOEwqNH01HC1R1y1aklZAKz5Chha8ApMOUSaXnNxP2KkpWvDFHeeDQuJp1M8VUw
 yGxZnKCXd8sSsdRkOD1lXTKHC91XM8jjS527703tVLZzw9JkHbUGsA5du+EkwkGOnVh7
 wVmA==
X-Gm-Message-State: AOAM53085ImQ6j3rcdQnQi3Ofc4Kn+1rQltYPgcud0ZSWrKK6I3dTER3
 6+E5JYd6W7tR7qrqYMbNi5cLokviOFAKC+59CiM=
X-Google-Smtp-Source: ABdhPJyhhygOdCSEScpzVgxFJYPtxnUWoDvorTndUCe8IsSZRQ4WtYpqHU2FyxunAJqlEZFxLwiyWyfqwUpLdc9VEuw=
X-Received: by 2002:a05:6602:1548:: with SMTP id
 h8mr6399434iow.91.1642460118124; 
 Mon, 17 Jan 2022 14:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-13-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-13-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:54:52 +1000
Message-ID: <CAKmqyKOYxRSNfgU7WY2Tx8g-fb4wNhyjP1LORBPjSULEeOGFNQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] target/riscv: rvv-1.0: Add Zve32f support for
 configuration insns
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
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 22:55:28 -0000

On Wed, Dec 29, 2021 at 12:39 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> All Zve* extensions support the vector configuration instructions.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 230c475d6c..c6280c7b0b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -152,7 +152,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>      TCGv s1, dst;
>
>      if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->ext_zve64f)) {
> +        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
>          return false;
>      }
>
> @@ -188,7 +188,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>      TCGv dst;
>
>      if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->ext_zve64f)) {
> +        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
>          return false;
>      }
>
> --
> 2.31.1
>
>

