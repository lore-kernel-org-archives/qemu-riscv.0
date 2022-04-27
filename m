Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrFt-0002tP-FZ
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrFr-0002t6-Sj; Wed, 27 Apr 2022 19:39:31 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njrFq-00043y-FD; Wed, 27 Apr 2022 19:39:31 -0400
Received: by mail-il1-x131.google.com with SMTP id o5so969132ils.11;
 Wed, 27 Apr 2022 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBOSKXp9Nt4rDbBQzwStnw4OOgzf3ZMy9atNL4poQkQ=;
 b=O0mYkB3KUF+phioV4GqG54McY6QSO8el+tiY38VjIWT4876sP5AaGh+YcyEeVI/CKI
 kOax4cqfz6iV/2v80ECcRxKnENGzwqBLdi8lFufLosXfuhMoCBm+aTy5CPStt3b3b0df
 +LfM90VfKmdOXYQxxthA70VPxnlHGxUGqLJSXECcC5s3o46SME8xLRWLx0Gv+oZbEw3X
 huKDuKh8XHD7xe2AXUbSKiCiQ/r3z8DkUxAEeizWx0aFzpmNkoaKq+wpD8MgsyGJEhFu
 TAHkTDmv4PvbOQiBXfTwFT+u8ZT2e2zNaRqsPdX/vwi5VzhMfpGmUEwq9nqtowb6V+Bk
 RQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBOSKXp9Nt4rDbBQzwStnw4OOgzf3ZMy9atNL4poQkQ=;
 b=5maUAOwdLUIAwVtLNtk6vcmDX7f0qbQXMEJRIKHVgvNsGv+XXaYpNCHRJFlMp7KrO1
 zgmXY+kw+e0VarBJlV0SRJkVyLnJiRw4qH4yhKujtEY0tyYmfkx4cFs0BFAgJAGCemHg
 lQ7rHpQ57hCoGv8CnCth6nVuANa719a77iTzv62R/HkM6ao3VVrmg8fkxhdgNVI1F67x
 CSM65AoTGLcC3k9+WtlwBZ1OWeES6Yp5l8d76UQ/3s2IlfiDP7NxlfsBgZuPG55O8MDQ
 9RJwGS07nwHKymit5BHihdl4cRSsD4nuXz7dbqgJ3KPx2t5eVSHy+0r8b1ra+n4M33k+
 ttzA==
X-Gm-Message-State: AOAM532EQqW+NhJWX5zc64TwuiCd49oIgzjemw5bbP3Ha7BlBprT4Hvy
 TSWV9IlVsic8Qo5kpiqi3bskH7aNtTZLYqvS090=
X-Google-Smtp-Source: ABdhPJwyxpkGSNRLKJ25T+vaRxXq8blAVIIms5Hf2eTu+tOgAaks0OyLn8NNazhuuifkQDnLoIEr7E/KDPjmXB0WwnM=
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id
 b14-20020a92db0e000000b002cc2590767bmr12940389iln.260.1651102769132; Wed, 27
 Apr 2022 16:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 09:39:02 +1000
Message-ID: <CAKmqyKP-Yjxrsy4QgqDV5+cTurCZCKxQawOvm19_ojz=An6DJA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 23:39:32 -0000

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

