Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njtdO-00067c-UE
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 22:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njtdN-00067F-Hk; Wed, 27 Apr 2022 22:11:57 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njtdL-0008Md-Ip; Wed, 27 Apr 2022 22:11:57 -0400
Received: by mail-il1-x12d.google.com with SMTP id k12so1129446ilv.3;
 Wed, 27 Apr 2022 19:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBOSKXp9Nt4rDbBQzwStnw4OOgzf3ZMy9atNL4poQkQ=;
 b=BUeCrOn3+S+mqdIpYgtne/W7R3vFeYeYYIsJYXZJBiuoYczDMGA9V0jzSTj+Eg3g/s
 EbhDZIK5ViBQqK9xX6+W02ih178LaQcggNV7wE/I9DZPr+G1RWLynDEyQO1PzDowxXO2
 mh6JnRwHIPLMbfIMuyxjBmgRNrx5b8fAl+5RJij4ymYU8g2b7ANwIRjIc4bH6KP9cnLv
 0fmwypC4PjXu9VEvW29VFcI7JHsEzkfZ8M6Yw75oLfPx4lbSJeWIH75O1V+aUDdNhTq6
 TtJ1sTPs/wOLXWz+76oHuO9OMFQaOxqrrw0AfQGFIlUuxRtPiV7Uj8deZaktJVT+S+/F
 v8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBOSKXp9Nt4rDbBQzwStnw4OOgzf3ZMy9atNL4poQkQ=;
 b=VojEd5G3or2OOZCCstC3z2Tv2jADxC8yyMQlB5lSqd5e8RO/rvgJHTwoETeol75ink
 BnDoaLoPnFy+HEpW0MLdb0L5PK/1MjD2EPJ9lbidOFszfcN8Iv+cy/M48E5J3zeqg8TP
 D1lqhZVJ7q64WOo6qQZI03RBjKuJor8iG+BISfTsEU6e8z9mQAqU18Ao+kXWXNmSclRp
 cmxUmF5oIkim62Ef70HZL4S82fMTIgLvp4K4oHBbl1TdU2O0LTOgqsrBXYtD2PN1Ijql
 NKrH8+Xli69560Xp0lB2ZYmTQ9ukBlxeTAnD4+P1mtx0Ckk5UH6lxJD1tMaqAlbDGxr4
 Hhcw==
X-Gm-Message-State: AOAM5332ATy9wrx/Hp1ApJOdJtDoo26H8VoqdmZ2Kyn4805Vp4vcbhxJ
 TJ7hd6OsnTjnUMijxX5411keGc8zK5eoDYtc/JI=
X-Google-Smtp-Source: ABdhPJwkBsTWG4csUeoLOWu0ELl+pUbsnfB9FIfg+0fMw10nKk6xqn1MsAwByyNTMeh7R0mOIZ23/FS2jjsIXJ1nL5s=
X-Received: by 2002:a05:6e02:1e0a:b0:2cd:6f4d:ad5b with SMTP id
 g10-20020a056e021e0a00b002cd6f4dad5bmr12291063ila.113.1651111914146; Wed, 27
 Apr 2022 19:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 12:11:27 +1000
Message-ID: <CAKmqyKMTCtHFTZ2uXCZDfiV4qSLjmtdhuz_a_sruVqNj4wnm7Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add scalar crypto related extenstion
 strings to isa_string
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 28 Apr 2022 02:11:57 -0000

On Tue, Apr 26, 2022 at 8:14 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - add zbk* and zk* strings to isa_edata_arr
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dff4606585..ccacdee215 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1005,7 +1005,20 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zba, ext_zba),
>          ISA_EDATA_ENTRY(zbb, ext_zbb),
>          ISA_EDATA_ENTRY(zbc, ext_zbc),
> +        ISA_EDATA_ENTRY(zbkb, ext_zbkb),
> +        ISA_EDATA_ENTRY(zbkc, ext_zbkc),
> +        ISA_EDATA_ENTRY(zbkx, ext_zbkx),
>          ISA_EDATA_ENTRY(zbs, ext_zbs),
> +        ISA_EDATA_ENTRY(zk, ext_zk),
> +        ISA_EDATA_ENTRY(zkn, ext_zkn),
> +        ISA_EDATA_ENTRY(zknd, ext_zknd),
> +        ISA_EDATA_ENTRY(zkne, ext_zkne),
> +        ISA_EDATA_ENTRY(zknh, ext_zknh),
> +        ISA_EDATA_ENTRY(zkr, ext_zkr),
> +        ISA_EDATA_ENTRY(zks, ext_zks),
> +        ISA_EDATA_ENTRY(zksed, ext_zksed),
> +        ISA_EDATA_ENTRY(zksh, ext_zksh),
> +        ISA_EDATA_ENTRY(zkt, ext_zkt),
>          ISA_EDATA_ENTRY(zve32f, ext_zve32f),
>          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
>          ISA_EDATA_ENTRY(svinval, ext_svinval),
> --
> 2.17.1
>
>

