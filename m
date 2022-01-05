Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EoP-0004b9-7a
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:31:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EoO-0004ZY-Dw; Wed, 05 Jan 2022 17:31:16 -0500
Received: from [2607:f8b0:4864:20::134] (port=33308
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5EoM-0007Mm-P2; Wed, 05 Jan 2022 17:31:16 -0500
Received: by mail-il1-x134.google.com with SMTP id m4so709843ilf.0;
 Wed, 05 Jan 2022 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Vl6EIzHYWmiidSR9E4dsa7fL5nlxN0PlcPxE2iYWdo=;
 b=SVx/UBehaT/Q9B82lFfIYSKgb7LBexxIfvzb6UOZIYreehvR8FtzZNI8tXnHHCGD/w
 mBBMKXVgdFam2Jh6V8hCgHvDeFiwKswVS/DbtNlvsd3kJNGqZW1Pgwutae5SbnCLlEUR
 Hn4i8Lk7Q8GYURVX1xMulbGYPj/3aebOVLanopBMuLCahgGCFQrW8BKpcJbPzvehbQSj
 ZC8ba3gIwEB3HhydlOQ29fcvzk75guVci+GQXRayyDRpUmkJpNh/w5xWel6qM8IqDq/a
 JCOWowiuBhmzqy8KqBmojgc74Q8BH5GIm9TfmlRU453x+d/4C8579Iz8lwDaRdYmA7G9
 xSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Vl6EIzHYWmiidSR9E4dsa7fL5nlxN0PlcPxE2iYWdo=;
 b=U9EovzILZfkrm6NX7ycWhQE3fD6lhx5wILiITMxC04Xayc/6Nn+/yR5MpCQ23v3i3b
 ZjnxH8lWGJXmzuk+iM9FzSJssZYYPkjCCOOm7o0b42RJO/6iF8+ovnLBvDNnffX7JKDP
 wALhiRl6/nAyBowIPGtyrLCE5cd7uLW2byw0DVH7hkufxHwueXM3KKeCiNMKVPmquUQ6
 FtZY0vP99bhik9sUOYtvZ01zmc2lHge97o3Jy/HT54Xtrh/BhFKn/YwfwolfjPPM1mbD
 1oOvgX2nlR4oqlUGFkEAKCnTzrMwVjnxZex2CQFM+41F5alNG2EzimItmGHBmMKrxen6
 eDqQ==
X-Gm-Message-State: AOAM5311cBcmPCtM6fuD/TGa1yahoR5XKiSzChlALIsG9xApHhaH6BKa
 kD837rUHZ6rwTzsl57zAGG2izxz72sTU4AtwVU+A48lJjvf+lpum
X-Google-Smtp-Source: ABdhPJyP5ZLA+P9vOWrXvU76ocyhpiBFAhxQWdPZcpwDFrBr++SXGO1v3W1IXUhTEd3cymGjwc8lZHsR+JGPtjs5h9s=
X-Received: by 2002:a05:6e02:1806:: with SMTP id
 a6mr23830522ilv.221.1641421873500; 
 Wed, 05 Jan 2022 14:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20220105022247.21131-1-frank.chang@sifive.com>
In-Reply-To: <20220105022247.21131-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 08:30:47 +1000
Message-ID: <CAKmqyKMrEw=XC_hM7L8qXC7og6QGaJDDo+GTo508HuHvk5VaxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix RVV calling incorrect RFV/RVD check functions
 bug
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 22:31:16 -0000

On Wed, Jan 5, 2022 at 12:23 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> For vector widening and narrowing floating-point instructions, we should
> use require_scale_rvf() instead of require_rvf() to check whether the
> correspond RVF/RVD is enabled if either source or destination
> floating-point operand is double-width of SEW. Otherwise, illegal
> instruction exception should be raised.
>
> e.g. For SEW=16, if the source/destination floating-point operand is
> double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
> instruction exception will be raised. Similarly, for SEW=32, RVD
> needs to be enabled.
>
> Changelog:
>
> v2:
>   * Fix patch title typos.
>   * Add missing Signed-off-by.
>
> Frank Chang (3):
>   target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
>     widening fp insns
>   target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
>     widening fp/int type-convert insns
>   target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
>     narrowing fp/int type-convert insns

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
>  1 file changed, 57 insertions(+), 21 deletions(-)
>
> --
> 2.31.1
>
>

