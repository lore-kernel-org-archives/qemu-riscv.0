Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4W7v-0005T2-0L
	for mharc-qemu-riscv@gnu.org; Mon, 03 Jan 2022 17:48:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4W7t-0005Kx-2O; Mon, 03 Jan 2022 17:48:25 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37675
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4W7r-0001IR-Ff; Mon, 03 Jan 2022 17:48:24 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so38912617pjj.2; 
 Mon, 03 Jan 2022 14:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWZzEiS5kAjMq93arrDLQMfuajuYgKjAkXInC/TbZNM=;
 b=fk/7guKOb6G9moETs6xDCXMVv8gIX4T4eHZwx9iQwDSFOrK7fV3uEzJgLzX4ri/sKz
 lssBzjXoEsUNvG1BxPLUJISa1wpLNTfnY8OOdzSixCKFXJY78vCOVrX8tE2PFwNgPsXW
 yYLBy2YVgT9B3oNXoC2Nj4atABgb/IsJLAdL/A5IOKxar4v3u9QGZy42FqiZrbDOI9ee
 dmB8CSxETC/sReRLQ5qIuc+PqXjKyg3Uc7THSN8qZfqEZ3v8HepSEqBLxbvJAxyZ3chg
 2JQigbWbLcebg3s2+VO8uBz6LxFDQ1mva4FQCbnix/ow6li/Ylr0YdNLU68mh5zxSwsL
 kq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWZzEiS5kAjMq93arrDLQMfuajuYgKjAkXInC/TbZNM=;
 b=5/ZOOwDOyng/d52I2gEmVCFYjrqd5iqD4ubzSZtUBL6xxnaUHP7vQCnGjNsmgBHAQr
 hhGSuc970+Iq8Rn02W6dhls26azBrDVtsCa3/tnB7W9BDIOkKCd2eAC3jXst+1ixcSZQ
 mLgnkvFL4IH+iPVrdiaDcm5IXCF23Bu3dmx0T8T7EqDEYmrhvqhW0xY+agvoAqWdFaWP
 2Rv/KhFQUhGl+ELY+LywVHVeSkQN5Awox6fTGCbp6pEenJlkiM7KqZGgFB+GoxcqKRia
 9jVjkmP6cLcyqAQVME6w5fSjWVlJOFMtoTmKW645sP+nUfP1U2WQPnGntWQ5MqqxfnRD
 Jv8w==
X-Gm-Message-State: AOAM532G6ZtSxG12GK+fOP4gkyZ2C71MsRUuPasFfT8N7/OAStGUQDty
 1uNkSiewKm39asAfehbfHkvlR2DLIHhi4IfC6Tk=
X-Google-Smtp-Source: ABdhPJwWMFkGtS5s6WxkatZdCstBaorcBsBN7wgBf/CU6mCKcCEb/5XV0j9cU2+OEWLlQlpuWNMpxEpPThR49FaJhDU=
X-Received: by 2002:a17:90a:c087:: with SMTP id
 o7mr56934605pjs.91.1641250100719; 
 Mon, 03 Jan 2022 14:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20211224034915.17204-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Jan 2022 08:47:54 +1000
Message-ID: <CAKmqyKM4iTcVEjrezZEXikObm5MuVpcUag+bKYdMaamDdFP6Pg@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/riscv: add cfg properties for zfinx,
 zdinx and zhinx{min}
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 03 Jan 2022 22:48:25 -0000

On Fri, Dec 24, 2021 at 1:51 PM liweiwei <liweiwei@iscas.ac.cn> wrote:
>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
> ---
>  roms/SLOF                |  2 +-
>  target/riscv/cpu.c       | 12 ++++++++++++
>  target/riscv/cpu.h       |  4 ++++
>  target/riscv/translate.c |  8 ++++++++
>  4 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/roms/SLOF b/roms/SLOF
> index a6906b024c..dd0dcaa1c1 160000
> --- a/roms/SLOF
> +++ b/roms/SLOF
> @@ -1 +1 @@
> -Subproject commit a6906b024c6cca5a86496f51eb4bfee3a0c36148
> +Subproject commit dd0dcaa1c1085c159ddab709c7f274b3917be8bd

It looks like you accidentally changed a submodule.

Alistair

