Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMJ4l-0003P6-EH
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 19:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMJ4j-0003O4-JT; Fri, 03 Sep 2021 19:58:25 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMJ4g-0007WM-PR; Fri, 03 Sep 2021 19:58:25 -0400
Received: by mail-yb1-xb32.google.com with SMTP id j195so1467704ybg.6;
 Fri, 03 Sep 2021 16:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmCBWAp4QzIxm5RsM+Qis2ZXEw+CdT9GOqHoXXlCgDo=;
 b=m3aJUMTz+BsYMhTuzo1vJX5pgBhXibmNIEG88tdtdimOpNgXRCwdRkwR1RqCwIjBUv
 koI2bzfYqvUwQ1eTjnyHrYPueJvdyNW64YnVcMwqfq/W67dMRpcF+lOHLZWHOa3+d0EA
 u1VPgmjwpZc3kXiKB5kwnQSvi8lyFdrKg7mF9i5f16ANvpDQZBahIt2E5wu3rIbbozGO
 B64Wh+CU4NhEy0o+FtT00Dg7ScBlsc+ZrzA5g9Eh6nUNcoitGPoi8CIw80O4F206JT/3
 Zva/3dn95F9rX5j7iue+93OzDYUCqLukdcoI0mkouJs5IiOrE2tYk8eMr9ogVtoSnXdl
 w2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmCBWAp4QzIxm5RsM+Qis2ZXEw+CdT9GOqHoXXlCgDo=;
 b=gmeBoaym5vO7B9VjYtNsC0C3m+DhJwNBf2PGzj6vn6ZT6NuMKHP0ETHqlza3RrqYSR
 JS14GidjcMRH/yOZNrojLYNDC9BNg75kxfz0u162pKJ9S1Wah/m8xgP9Alw1v1h03zBS
 v9YRRFo/LTmrfAlWUjFg+R74jcBIAWdWmfT/5yrS+vKt5HO2a+HBOsQeYp1obuiK3b7m
 lUB/qkkyDl7rUmBRZZ8jXXqhDrdmIsVaepEBRHsjKpKsA/9mO/SbuRd7CSFLtpM9hpDB
 ccFTvVOQvPMYyUKS+c25Qb5Z1Xx2HZ8fgOE54zbXwxi0llk5BoRbjWZLf290Xoxynxyj
 G72Q==
X-Gm-Message-State: AOAM5339emZdss4XZw677r2DsJwzNb7JMGlSBfwNh4VvgJ2vfGtIX7nH
 vUhONExL0siZ97z3AmIji2iIO3Q58pz42KWBbho=
X-Google-Smtp-Source: ABdhPJzrpMfBOhEbydAxo1QTyQWcR8/eRGuDS7lXaVvJhbGf704otDEVcDqvG5vN9wBquSVKkJ2NsfyEncEUWxGCqyk=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr1995747ybe.453.1630713501527; 
 Fri, 03 Sep 2021 16:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630624983.git.alistair.francis@wdc.com>
 <968ed1af9002f5f9f42f9efe8a5db5a1ed830a09.1630624983.git.alistair.francis@wdc.com>
 <c2a74b35-70ad-d41a-26f9-3af2a8ce775d@linaro.org>
In-Reply-To: <c2a74b35-70ad-d41a-26f9-3af2a8ce775d@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Sep 2021 07:58:10 +0800
Message-ID: <CAEUhbmXXftWOyUuzN69eHGT4+91Dfj3qGTewhnixue9HPveGWg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/riscv: Set mtval and stval support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 03 Sep 2021 23:58:25 -0000

On Sat, Sep 4, 2021 at 1:06 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/3/21 1:23 AM, Alistair Francis wrote:
> > +    DEFINE_PROP_BOOL("mtval_inst", RISCVCPU, cfg.mtval_inst, true),
>
> Dash not underscore for the prop name, I think.
>

But we also have "priv_spec" :)

The name "mtval_inst" sounds like only for M-mode. Maybe omitting 'm',
and just "tval"?

Regards,
Bin

