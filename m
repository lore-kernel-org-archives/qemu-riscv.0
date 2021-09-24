Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTf7i-0006NB-Ci
	for mharc-qemu-riscv@gnu.org; Fri, 24 Sep 2021 02:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTf7f-0006KK-RC; Fri, 24 Sep 2021 02:55:51 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mTf7e-0008Mv-4D; Fri, 24 Sep 2021 02:55:51 -0400
Received: by mail-io1-xd36.google.com with SMTP id e82so11187239iof.5;
 Thu, 23 Sep 2021 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n0z7tWmX2cAmyIR9DUCFPvcREoGqLRXzgAi++etgJXo=;
 b=kxLWf4sbNtYejGDdkvfNNO91+pd4kmQOxf+i/k3gl+2tP7QKNwCPYBgyOJdDqa+ll7
 GnrNDE4GHRLxQXT+U/EoZC4KKvEjSbNSn0+aGh2g2tMi6VJcmqsPdLS8CxeA7d/tYgB7
 fGBUZ2wWcDroq/g3UcuKlU0j28OEgyIU78uDJgmWlnNjyXuDBWlZjz+OsjpyafbYJPC1
 4wdmS5fwr8iGzu0a79GIP9bztw/hq/KazuarHibSjQOTBnRqjdD4tBWLSmKXjgyDlD5s
 MxWmZwpxdD6unfp5MGxBJ7TSxdkNMR1DrWj1owIAtaVwFUo31Al56bNBvnHoavd+A3Q9
 SJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0z7tWmX2cAmyIR9DUCFPvcREoGqLRXzgAi++etgJXo=;
 b=7/m57T75CzSb/Ef5n9tAE+B1cuK1Dkzk35J1uYy+PC0QNqaDCNbaBCpulb0kYLBjm1
 podvN8NBPh2qnetQFDJYs+dmuFQJtN7jt5I596B/8OHxV5i2MNTbhp4am/Kc1WnBVCD6
 3y0dvHrxyZiHo3pcUSJhlsklSs9WkXIzN8+WNTgJguBJco4tdELAPMlXAriD9IYZ2amA
 7pTdeV/zsdUrECvJ7pj9I9FToeNDgaOZD7xo0Kuem2IZbunJ9fTt4WI6Wzuk06KcWFVU
 jNMiPeM+Hy9MMrG+OyMI1XGLHufGFZ6qgwnTvB3bDtn9fhIWpRR6xniWaQLvbXgrU7BU
 EzjA==
X-Gm-Message-State: AOAM533RHDfBCf+Mq1YjNr87hVJgzc0X4sShrcjBQ0hU4sUM2mrGm9WT
 hEvB/ky5BYHfiTqLW2c2y0p7jUOUaiZRYRHyErM=
X-Google-Smtp-Source: ABdhPJzAEZzBmxYWcW5z6UXuATA6HjuRQSXoYzlvmA/ixlnt7agl8RQ5G7l1JQflEw7QS5mVM4QJn6MTJ7pdV5Z32Ac=
X-Received: by 2002:a05:6638:61c:: with SMTP id
 g28mr7688217jar.117.1632466548685; 
 Thu, 23 Sep 2021 23:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210921020234.123448-1-frank.chang@sifive.com>
In-Reply-To: <20210921020234.123448-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 24 Sep 2021 16:55:22 +1000
Message-ID: <CAKmqyKO0nt_KYD-qq-+90JBGk0Z=ffv1-7Fe2YFq2fW7XG0SFg@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and
 V=1 in mark_fs_dirty()
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Fri, 24 Sep 2021 06:55:52 -0000

On Tue, Sep 21, 2021 at 12:03 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
> Modifying the floating-point state when V=1 causes both fields to
> be set to 3 (Dirty).
>
> However, it's possible that HS-level sstatus.FS is Clean and VS-level
> vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
> We can't early return for this case because we still need to set
> sstatus.FS to Dirty according to spec.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> Tested-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

