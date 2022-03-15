Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU1cS-0000xQ-Q4
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 03:29:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU1cM-0000ww-3w; Tue, 15 Mar 2022 03:29:18 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=33440
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU1cK-0007BH-QB; Tue, 15 Mar 2022 03:29:17 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id j2so35728804ybu.0;
 Tue, 15 Mar 2022 00:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pu8AAe4eOdDdT0OfjSWD8IYSzQS67K521bTaLxPKlMI=;
 b=TnEXZiEpCchA++5zMdhkyZTwPjBOCPxIvmXWw6f6z++4M13q8aF1dxfupZfcfvyte0
 vOKX72CL+waC7EIGotC1JDiWLE8CkPpBLTwksEm6uS1eutidSGlORBQUk1XZXrvVUieE
 1pgbmc9rP/0H78MyKV/jnjEd3XpkJ+SRyBXlsAyBPb8IRHaINxxPqrAagQMBqlklHEoq
 YCxzrwFmSKINs5ggv/zrBneKQ1x4CMcTGXPy/E0mE6d57ZxluFtDReTzXQvwfG3HUmEk
 lp+YZ99VFsfpTCEyBXjIK+FwWFmtQo9xiPPi3a8zkFgfQnFSPrN30IM9yg79jRFb/v8X
 nntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pu8AAe4eOdDdT0OfjSWD8IYSzQS67K521bTaLxPKlMI=;
 b=paWx3RT9bDwOVTmDQjf1lk8jMY3GMJfktwB3BIYmCAfKE4eNl5GneBw1vp+tyUoxF3
 Xwk6WVF33RzfHrLSMdpHiiJSgWDfWwoaWEW/UrWKVuIqOzd4miQOJvNLElqUDUAkW16w
 Br6Z9K8ofmQa0ahU7ZOGrn13HVdu+FNXLeO6qv70UA8E61IsirfN+qIdW0ryUtCmgKUe
 kK9JCgOMCptoD5lkb2djG+YzXGZQsQEPyBi+oY3W6nxaPjhAVmbnMeSW5G6ytEmH6fUO
 ztLozlyEx+nZ/jLuamBzli9khTAz+kuigGRbcqumDtkWU0pmDY8KhFKHqCuqcBojEHou
 tQVw==
X-Gm-Message-State: AOAM5315lZnCiuGNROOmpl5Re+D5onzBlfJvBI7Du5z5O5xKw6WxE5jw
 xi/qtvj2qgpZf3b/Eao9TXp9Kgw43YDj5b5yvos=
X-Google-Smtp-Source: ABdhPJzVT4HdCSk6odj9NxrYeG/6KRy5oNWf/k/aJHFs7f2xq0WC+BtfbaSJyW/cB2ed3pcjbRXvcUl73UqaQuAkuP8=
X-Received: by 2002:a25:bec7:0:b0:623:c838:2f4 with SMTP id
 k7-20020a25bec7000000b00623c83802f4mr20854289ybm.99.1647329355434; Tue, 15
 Mar 2022 00:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
 <20220315064007.3600746-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220315064007.3600746-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Mar 2022 15:29:04 +0800
Message-ID: <CAEUhbmVp-BPjomMnErLogz0dPJ5PpkJR2JUcrwkGP7mzCvO6HQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: cpu: Fixup indentation
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 07:29:20 -0000

On Tue, Mar 15, 2022 at 2:40 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

