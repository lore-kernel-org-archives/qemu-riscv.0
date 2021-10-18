Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLbZ-0007iJ-Cp
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLbV-0007ff-Fx; Mon, 18 Oct 2021 01:54:33 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:34675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLbU-0006KB-0K; Mon, 18 Oct 2021 01:54:33 -0400
Received: by mail-il1-x12b.google.com with SMTP id g2so13709158ild.1;
 Sun, 17 Oct 2021 22:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NCCN++x/YMM2Blon7BI4jqU5UrlZ7C6rQ50uesfdPOU=;
 b=O+x6xm48LzhAF9pqocK3snJ5zyIG3cs6qAgaJopaZ0G/D10gnGKMNUNpZJBMjjr2qd
 b5WFZT5urEfd0Gk+52hSQQ/WaWgujHRKUrozz+lX0RoAGiqb0eRZ4xkfDPdyHhAPDXDJ
 kKrAKYJGqYEFeGfx2jqRgcPbTApmujE3a/xpnMiHgL0OWoe0EZkffzAgvVWXZc2q+vQg
 FhPnh0+j9w4L59stdRi3/ZnPHZJk/VyaN11MMayD6Oboit71q6vCI6uQBYAI9pJPzuU3
 CkwFzCdvtWMs84QvrP8h+JU9bdnnUXaNTTR72tk0tJVATAGh4qJJbSokO8IERVTgsL7u
 kWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NCCN++x/YMM2Blon7BI4jqU5UrlZ7C6rQ50uesfdPOU=;
 b=Kss+3ic0aVmFFiK0hR2msGIFKR25XIfVpzk850gTO6zDYS+zN03pVdXHiLPcKwGMk/
 L6FJYR7z1OHEnl1K4Gqz44Ak9v3t79+OqpbKrMjwDk2HXUzcikCAJNxtUd2jWX20O9s0
 b0DEnyC7rzroSf/Ch+uhvW4lyJ/rBSgXC0cai7s0P66rInN+EgYJ0tsv2Nl5wLlfSEdT
 JuiV/lEG5KtHyY7AyNpod8+jaVQmlxad4t0roMw5I/Fgfap30Bm4F4SFAPHKiPvCornY
 qxakU3hOGvLXx9owvuNZtBCL6O8fDbnkFNJmP3yq9yJUquFVeFPo4VYdbwiRFR3evupC
 vAyw==
X-Gm-Message-State: AOAM531l+gJaVOq45KAqgKV/HC4FfvaNH+gKt6BXrgObDWN4g1nS4HOL
 //piE6UqNlzw1fqueG3/Dm0981W4Ay0ooE2OclI=
X-Google-Smtp-Source: ABdhPJxEj5zrWCtI+iaLjCvyMOihka6m4Y2HO5v+DzRqo1Q0NuP5VO0B7gv+ylD77DGGV774iuwH9ICW0k7haP67JIY=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr13118713ilo.208.1634536470549; 
 Sun, 17 Oct 2021 22:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-41-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-41-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 15:54:04 +1000
Message-ID: <CAKmqyKM4YSyuEaBSNmbS+WHS0hFzbtNS8WjYkR61YOty87VEfg@mail.gmail.com>
Subject: Re: [PATCH v8 33/78] target/riscv: rvv-1.0: element index instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:54:33 -0000

On Fri, Oct 15, 2021 at 6:08 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3ac5162aeb7..ab274dcde12 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -633,7 +633,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
>  vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
>  vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
>  viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
> -vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
> +vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
>  vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
>  vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
>  vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
> --
> 2.25.1
>
>

