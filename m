Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7rlV-0000oT-HF
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 23:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n7rlO-0000mE-W2; Wed, 12 Jan 2022 23:31:03 -0500
Received: from [2607:f8b0:4864:20::12f] (port=44722
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n7rlL-0006OW-Jg; Wed, 12 Jan 2022 23:31:02 -0500
Received: by mail-il1-x12f.google.com with SMTP id i14so4516545ila.11;
 Wed, 12 Jan 2022 20:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0yH73VEziEUsOBvUvuDtXgMhHfRsF+1URQubdxH1oA=;
 b=pY7Mte0OzAcXW63BAUXaYTOdzsa1JGw3KPr011kvKGGHhoYVFXLOa8PxG97fl9D8d3
 Z/J9pyIkcULFcslXy4pGNDmUdORuDAEYewbw4AMPowfA1t/lkNho8sIcAnQ3KA1fwnwg
 ghwzsrNdWUcrcWCAA8tkM0fil0M5zrscmJKCBl74fWTg1g71dw5NAPYKna5ysfbKt2ag
 Q1IwAy+gCdN/AIz5uzWrEQT6IopSUszPG30RHgnruoXjUm9/HmCHIzj833BCs/0AYQRE
 BFrnEPW7cZRAFbzSeyZ8RalYnGR/irNgZxrJOphqRgFL0fMHSo7Ll9LGWxveJYuxlEvX
 u+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0yH73VEziEUsOBvUvuDtXgMhHfRsF+1URQubdxH1oA=;
 b=LgVOeZPDXNqY1/uIwtoMXSFehE/J2hFBgZcM/8r/51ENu4ii6JRQJMGCTsbd2/nWwx
 Zz496KsmW7DdhXQW9lHJVOcqGr86M4n668xJ76OzznAt1Kn2MBzyJjVXzinJAynXQK17
 /rtOykYoQctKRM+RuBmRTerESmMyyvZe4oCXmtcEfGmcZ7uymYAXoeMHth5+yupjeI3B
 7uivsit83pLGK/bg03YH42TatXRa1N84z7FP4wwgcPmXRA5hdNqeYeatW4z5ZD8xRVPE
 KlL3C9uSpIv7rmAYE1xhTAIPLFO455+4V0VOrfhD99OIya/pmnlQrWu5nkV1dn7eHN/M
 kYEw==
X-Gm-Message-State: AOAM531/9b9vf+bGghOIt71uHmL0UOvkrlfj3FrGkpDMSywDKagPnUr3
 T3KpCKD3vjfYUHjbv835GIfE1uUn5OFI3CA7P/E=
X-Google-Smtp-Source: ABdhPJzRxeFEUP4HrT7eJCBNuyEqpJJ4QtpElQXV0jCU0k4GUcEF7zHHStQ4XECaA/lfs2IQ9LXpPbAYVIUjhhpgC6U=
X-Received: by 2002:a92:c912:: with SMTP id t18mr1449305ilp.74.1642048253554; 
 Wed, 12 Jan 2022 20:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20220112081329.1835-1-jiangyifei@huawei.com>
 <20220112081329.1835-14-jiangyifei@huawei.com>
In-Reply-To: <20220112081329.1835-14-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Jan 2022 14:30:27 +1000
Message-ID: <CAKmqyKPsXeveeOH5-esui43xCpmn2WY0NhhhseL-BuLbzRBk-w@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] target/riscv: enable riscv kvm accel
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Thu, 13 Jan 2022 04:31:03 -0000

On Wed, Jan 12, 2022 at 6:25 PM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Add riscv kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..06a5476254 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -90,6 +90,8 @@ elif cpu in ['ppc', 'ppc64']
>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
>  elif cpu in ['mips', 'mips64']
>    kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
> +elif cpu in ['riscv']
> +  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
>  else
>    kvm_targets = []
>  endif
> --
> 2.19.1
>
>

